#include <stdlib.h>
#include <string.h>

#include "memory.h"
#include "object.h"
#include "table.h"
#include "value.h"

// Maximum fraction of "buckets" filled before the table grows
#define TABLE_MAX_LOAD 0.65

/**
 * Initialize a hash table
 * Zeros all fields.
 */
void initTable(Table* table) {
    table->count = 0;
    table->capacity = 0;
    table->tombstones = 0;
    table->entries = NULL;
}

/**
 * Frees the entries array and then re-initializes the table
 */
void freeTable(Table* table) {
    FREE_ARRAY(Entry, table->entries, table->capacity);
    initTable(table);
}

/**
 * Returns a pointer to an entry with the given key.
 */
static Entry* findEntry(Entry* entries, int capacity, ObjString* key) {
    uint32_t index = key->hash & (capacity - 1);
    Entry* tombstone = NULL;

    for (;;) {
        Entry* entry = &entries[index];
        if (entry->key == NULL) {
            if (IS_NULL(entry->value)) {
                return tombstone != NULL ? tombstone : entry;
            } else {
                if (tombstone == NULL) tombstone = entry;
            }
        } else if (entry->key == key) {
            return entry;
        }

        index = (index + 1) & (capacity - 1);
    }
}

/**
 * Gets an entry from a has table.
 * @return If the entry was found
 */
bool tableGet(Table* table, ObjString* key, Value* value) {
    if (table->count == 0) return false;

    uint32_t index = key->hash & (table->capacity - 1);
    for (;;) {
        Entry* entry = &table->entries[index];
        if (entry->key == key) { *value = entry->value; return true; }
        if (entry->key == NULL && IS_NULL(entry->value)) return false;
        index = (index + 1) & (table->capacity - 1);
    }
}

/**
 * Reallocate the table to a given number of "buckets"
 */
static void adjustCapacity(Table* table, int capacity) {
    Entry* entries = ALLOCATE(Entry, capacity);
    for (int i = 0; i < capacity; i++) {
        entries[i].key = NULL;
        entries[i].value = NULL_VAL;
    }

    table->count = 0;
    table->tombstones = 0;
    for (int i = 0; i < table->capacity; i++) {
        Entry* entry = &table->entries[i];
        if (entry->key == NULL) continue;

        Entry* dest = findEntry(entries, capacity, entry->key);
        dest->key = entry->key;
        dest->value = entry->value;
        table->count++;
    }

    FREE_ARRAY(Entry, table->entries, table->capacity);
    table->entries = entries;
    table->capacity = capacity;
}

/**
 * Sets or adds an entry in a hash table.
 * @return If a new entry was created
 */
bool tableSet(Table* table, ObjString* key, Value value) {
    if (table->count + 1 > table->capacity * TABLE_MAX_LOAD) {
        int capacity = (table->tombstones > table->count / 4)
            ? table->capacity   // lots of tombstones — rehash at same size to clear them
            : GROW_CAPACITY(table->capacity);
        adjustCapacity(table, capacity);
    }

    Entry* entry = findEntry(table->entries, table->capacity, key);
    bool isNewKey = entry->key == NULL;
    if (isNewKey && IS_NULL(entry->value)) table->count++;
    else if (isNewKey) table->tombstones--;

    entry->key = key;
    entry->value = value;
    return isNewKey;
}

/**
 * Tries to replace an entry with a tombstone
 * @return If an entry was removed
 */
bool tableDelete(Table* table, ObjString* key) {
    if (table->count == 0) return false;

    uint32_t index = key->hash & (table->capacity - 1);
    for (;;) {
        Entry* entry = &table->entries[index];
        if (entry->key == key) {
            entry->key = NULL;
            entry->value = BOOL_VAL(true);
            table->tombstones++;
            table->count--;
            return true;
        }
        if (entry->key == NULL && IS_NULL(entry->value)) return false;
        index = (index + 1) & (table->capacity - 1);
    }
}

void tableAddAll(Table* from, Table* to) {
    for (int i = 0; i < from->capacity; i++) {
        Entry* entry = &from->entries[i];
        if (entry->key != NULL) {
            tableSet(to, entry->key, entry->value);
        }
    }
}

/**
 * Used in VM string interning to find a given string in the strings table
 */
ObjString* tableFindString(Table* table, const char* chars, int length, uint32_t hash) {
    if (table->count == 0) return NULL;

    uint32_t index = hash & (table->capacity - 1);
    for (;;) {
        Entry* entry = &table->entries[index];
        if (entry->key == NULL) {
            if (IS_NULL(entry->value)) return NULL;
        } else if (entry->key->length == length && entry->key->hash == hash &&
                   memcmp(entry->key->chars, chars, length) == 0) {
            return entry->key;
        }

        index = (index + 1) & (table->capacity - 1);
    }
}

/**
 * Removes (replaces with a tombstone) every un-marked entry in a table.
 */
void tableRemoveWhite(Table* table) {
    for (int i = 0; i < table->capacity; i++) {
        Entry* entry = &table->entries[i];
        if (entry->key != NULL && !entry->key->obj.isMarked) {
            entry->key = NULL;
            entry->value = BOOL_VAL(true);
            table->tombstones++;
            table->count--;
        }
    }
}

/**
 * Marks every key and value in a table.
 */
void markTable(Table* table) {
    for (int i = 0; i < table->capacity; i++) {
        Entry* entry = &table->entries[i];
        if (entry->key == NULL) continue;
        markObject((Obj*) entry->key);
        markValue(entry->value);
    }
}