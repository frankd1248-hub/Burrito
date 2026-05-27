#include "bjson.h"

#include "../vm.h"
#include "../memory.h"

#include <yyjson.h>

static void ensureCapacity(ObjArray* array) {
    if (array->size == array->capacity) {
        int oldCap = array->capacity;
        array->capacity = GROW_CAPACITY(array->capacity);
        array->values = GROW_ARRAY(Value, array->values, oldCap, array->capacity);
    }
}

// Recursively convert a yyjson_val into a Burrito Value.
// The yyjson_doc must stay alive for the duration of this call.
static Value yyvalToValue(yyjson_val* val) {
    if (yyjson_is_null(val))  return NULL_VAL;
    if (yyjson_is_bool(val))  return BOOL_VAL(yyjson_get_bool(val));
    if (yyjson_is_num(val))   return NUMBER_VAL(yyjson_get_num(val));

    if (yyjson_is_str(val)) {
        return OBJ_VAL(copyString(yyjson_get_str(val), yyjson_get_len(val)));
    }

    if (yyjson_is_arr(val)) {
        ObjArray* arr = newArray(0);
        push(OBJ_VAL(arr));   // root against GC

        yyjson_val* item;
        yyjson_arr_iter iter = yyjson_arr_iter_with(val);
        while ((item = yyjson_arr_iter_next(&iter))) {
            Value v = yyvalToValue(item);
            push(v);                      // root while ensureCapacity may GC
            arr = AS_ARRAY(peek(1));      // re-read after any realloc
            ensureCapacity(arr);
            arr = AS_ARRAY(peek(1));
            arr->values[arr->size++] = pop();
        }

        Value result = pop();
        return result;
    }

    if (yyjson_is_obj(val)) {
        // Map JSON objects to ObjMap (or whatever your map type is)
        ObjMap* map = newMap();
        push(OBJ_VAL(map));

        yyjson_val *k, *v;
        yyjson_obj_iter iter = yyjson_obj_iter_with(val);
        while ((k = yyjson_obj_iter_next(&iter))) {
            v = yyjson_obj_iter_get_val(k);
            ObjString* key = copyString(yyjson_get_str(k), yyjson_get_len(k));
            push(OBJ_VAL(key));
            Value value = yyvalToValue(v);
            push(value);
            map = AS_MAP(peek(2));        // re-read: GC may have moved it
            tableSet(&map->table, key, value);
            pop(); pop();
        }

        Value result = pop();
        return result;
    }

    return NULL_VAL;  // unreachable for valid JSON
}

static bool loadsNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1 || !IS_STRING(args[0])) {
        *result = OBJ_VAL(copyString("json.parse() expects one string argument.", 41));
        return false;
    }
#endif

    ObjString* src = AS_STRING(args[0]);
    yyjson_doc* doc = yyjson_read(src->chars, src->length, 0);

    if (!doc) {
        *result = OBJ_VAL(copyString("json.parse() failed: invalid JSON.", 34));
        return false;
    }

    *result = yyvalToValue(yyjson_doc_get_root(doc));
    yyjson_doc_free(doc);
    return true;
}

static yyjson_mut_val* valueToYY(yyjson_mut_doc* doc, Value val) {
    if (IS_NULL(val))    return yyjson_mut_null(doc);
    if (IS_BOOL(val))   return yyjson_mut_bool(doc, AS_BOOL(val));
    if (IS_NUMBER(val)) return yyjson_mut_real(doc, AS_NUMBER(val));

    if (IS_STRING(val)) {
        ObjString* s = AS_STRING(val);
        // strcpy variant: doc takes a copy, so Burrito's GC can move s freely
        return yyjson_mut_strncpy(doc, s->chars, s->length);
    }

    if (IS_ARRAY(val)) {
        yyjson_mut_val* arr = yyjson_mut_arr(doc);
        ObjArray* src = AS_ARRAY(val);
        for (int i = 0; i < src->size; i++)
            yyjson_mut_arr_append(arr, valueToYY(doc, src->values[i]));
        return arr;
    }

    if (IS_MAP(val)) {
        yyjson_mut_val* obj = yyjson_mut_obj(doc);
        // iterate your map entries and add each key/value pair
        ObjMap* map = AS_MAP(val);
        for (int i = 0; i < map->table.capacity; i++) {
            Entry* entry = &map->table.entries[i];
            if (entry->key == NULL) continue;
            yyjson_mut_val* k = yyjson_mut_strncpy(doc, entry->key->chars, entry->key->length);
            yyjson_mut_val* v = valueToYY(doc, entry->value);
            yyjson_mut_obj_add(obj, k, v);
        }
        return obj;
    }

    return yyjson_mut_null(doc);  // functions, etc. stringify as null
}

static bool dumpsNative(int argCount, Value* args, Value* result) {
#ifdef STRICT_NATIVES
    if (argCount != 1) {
        *result = OBJ_VAL(copyString("json.stringify() expects one argument.", 38));
        return false;
    }
#endif

    yyjson_mut_doc* doc = yyjson_mut_doc_new(NULL);
    yyjson_mut_val* root = valueToYY(doc, args[0]);
    yyjson_mut_doc_set_root(doc, root);

    size_t len;
    char* json = yyjson_mut_write(
        doc, YYJSON_WRITE_PRETTY | YYJSON_WRITE_ESCAPE_UNICODE, &len);
    yyjson_mut_doc_free(doc);

    if (!json) {
        *result = OBJ_VAL(copyString("json.stringify() failed.", 24));
        return false;
    }

    *result = OBJ_VAL(copyString(json, (int)len));
    free(json);   // yyjson_mut_write allocates with malloc; we've copied it out
    return true;
}

static void addNative(ObjModule* module, const char* name, int length, NativeFn fn) {
    push(OBJ_VAL(newNative(fn)));
    tableSet(&module->table, copyString(name, length), peek(0));
    pop();
}

ObjModule* buildJSONModule() {
    ObjModule* module = newModule();
    push(OBJ_VAL(module));

    addNative(module, "loads", 5, loadsNative);
    addNative(module, "dumps", 5, dumpsNative);

    pop();
    return module;
}