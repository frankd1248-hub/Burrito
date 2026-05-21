#include <filesystem>
#include <iostream>
#include <fstream>
#include <sstream>
#include <cstdlib>
#include <cstdio>
#include <vector>
#include <algorithm>
#include <string>

#ifndef _WIN32
#include <sys/ioctl.h>
#include <unistd.h>
#endif

using namespace std;
namespace fs = filesystem;

// ─── ANSI colours ────────────────────────────────────────────────────────────
#define CLR_RESET  "\033[0m"
#define CLR_BOLD   "\033[1m"
#define CLR_RED    "\033[31m"
#define CLR_GREEN  "\033[32m"
#define CLR_YELLOW "\033[33m"
#define CLR_CYAN   "\033[36m"
#define CLR_GREY   "\033[90m"

// ─── Helpers ─────────────────────────────────────────────────────────────────

static bool isNumeric(const string& s) {
    if (s.empty()) return false;
    for (char c : s) if (c < '0' || c > '9') return false;
    return true;
}

// Collect all .bur files under root, recursively, sorted by full path.
static vector<fs::path> collectTests(const fs::path& root) {
    vector<fs::path> tests;
    if (!fs::exists(root)) {
        fprintf(stderr, "Tests directory '%s' not found.\n", root.c_str());
        return tests;
    }
    for (const fs::directory_entry& e : fs::recursive_directory_iterator(root)) {
        if (e.path().extension() == ".bur")
            tests.push_back(e.path());
    }
    sort(tests.begin(), tests.end());
    return tests;
}

// Extract leading // comment lines from a .bur file as description strings.
static vector<string> extractComments(const fs::path& path) {
    ifstream f(path);
    vector<string> comments;
    string line;
    while (getline(f, line)) {
        if (line.size() >= 2 && line[0] == '/' && line[1] == '/') {
            string text = line.substr(2);
            size_t start = text.find_first_not_of(' ');
            comments.push_back(start == string::npos ? "" : text.substr(start));
        } else {
            break;
        }
    }
    return comments;
}

// Read the entire contents of a file into a string. Returns false if not found.
static bool readFile(const fs::path& path, string& out) {
    ifstream f(path);
    if (!f.is_open()) return false;
    ostringstream ss;
    ss << f.rdbuf();
    out = ss.str();
    return true;
}

// A relative label shown to the user, e.g. "bitwise/basic.bur"
static string relativeLabel(const fs::path& test, const fs::path& root) {
    return fs::relative(test, root).string();
}

// ─── Terminal width ───────────────────────────────────────────────────────────

static int terminalWidth() {
#ifdef _WIN32
    return 100;
#else
    struct winsize w;
    if (ioctl(STDOUT_FILENO, TIOCGWINSZ, &w) == 0 && w.ws_col > 0)
        return w.ws_col;
    return 100;
#endif
}

// ─── Multi-column test list ───────────────────────────────────────────────────

struct TestEntry {
    int    number;
    string group;
    string filename;
    bool   hasExpected;  // whether a .bur.expected file exists
};

static int entryDisplayWidth(const TestEntry& e) {
    // "  NNN: filename [!]"  — the [!] marker is 4 chars if no expected file
    return 2 + 3 + 2 + (int)e.filename.size() + (e.hasExpected ? 0 : 4);
}

static void printTestList(const vector<fs::path>& tests, const fs::path& root) {
    vector<TestEntry> entries;
    vector<string>    groupOrder;
    string            prevGroup;

    for (int i = 0; i < (int)tests.size(); i++) {
        fs::path rel = fs::relative(tests[i], root);
        string   grp = rel.has_parent_path() ? rel.parent_path().string() : ".";
        if (grp != prevGroup) {
            groupOrder.push_back(grp);
            prevGroup = grp;
        }
        fs::path expectedPath = tests[i];
        expectedPath += ".expected";
        entries.push_back({ i + 1, grp, tests[i].filename().string(),
                            fs::exists(expectedPath) });
    }

    const int GAP = 3;
    int maxEntry = 0;
    for (const TestEntry& e : entries)
        maxEntry = max(maxEntry, entryDisplayWidth(e));
    int colWidth = maxEntry + GAP;

    int tw      = terminalWidth();
    int numCols = max(1, tw / colWidth);

    for (const string& grp : groupOrder) {
        vector<const TestEntry*> grpEntries;
        for (const TestEntry& e : entries)
            if (e.group == grp) grpEntries.push_back(&e);

        printf(CLR_CYAN "\n  [%s]\n" CLR_RESET, grp.c_str());

        int rows = ((int)grpEntries.size() + numCols - 1) / numCols;

        for (int row = 0; row < rows; row++) {
            for (int col = 0; col < numCols; col++) {
                int idx = col * rows + row;
                if (idx >= (int)grpEntries.size()) break;

                const TestEntry* e = grpEntries[idx];

                char buf[256];
                int written;
                if (e->hasExpected) {
                    written = snprintf(buf, sizeof(buf),
                        "  %3d: %s", e->number, e->filename.c_str());
                } else {
                    written = snprintf(buf, sizeof(buf),
                        "  %3d: " CLR_YELLOW "%s [?]" CLR_RESET,
                        e->number, e->filename.c_str());
                    // ANSI codes inflate the byte count; adjust written to
                    // the visible character width for padding purposes.
                    written = 2 + 3 + 2 + (int)e->filename.size() + 4;
                }

                if (col + 1 < numCols) {
                    int pad = colWidth - written;
                    if (e->hasExpected)
                        printf("%s%*s", buf, pad > 0 ? pad : 0, "");
                    else
                        printf("  %3d: " CLR_YELLOW "%s [?]" CLR_RESET "%*s",
                               e->number, e->filename.c_str(),
                               pad > 0 ? pad : 0, "");
                } else {
                    if (e->hasExpected)
                        printf("%s", buf);
                    else
                        printf("  %3d: " CLR_YELLOW "%s [?]" CLR_RESET,
                               e->number, e->filename.c_str());
                }
            }
            printf("\n");
        }
    }
}

// ─── Diff helpers ─────────────────────────────────────────────────────────────

// Split a string into lines (keeping empty trailing line if string ends with \n).
static vector<string> splitLines(const string& s) {
    vector<string> lines;
    istringstream ss(s);
    string line;
    while (getline(ss, line))
        lines.push_back(line);
    return lines;
}

// Print a simple unified-style diff between expected and actual output.
static void printDiff(const string& expected, const string& actual) {
    vector<string> exp = splitLines(expected);
    vector<string> act = splitLines(actual);

    int maxLines = max((int)exp.size(), (int)act.size());
    bool anyDiff = false;

    for (int i = 0; i < maxLines; i++) {
        bool hasExp = i < (int)exp.size();
        bool hasAct = i < (int)act.size();

        if (hasExp && hasAct && exp[i] == act[i]) {
            printf(CLR_GREY "    %3d   %s\n" CLR_RESET, i + 1, exp[i].c_str());
        } else {
            anyDiff = true;
            if (hasExp)
                printf(CLR_RED "    %3d - %s\n" CLR_RESET, i + 1, exp[i].c_str());
            if (hasAct)
                printf(CLR_GREEN "    %3d + %s\n" CLR_RESET, i + 1, act[i].c_str());
        }
    }

    if (!anyDiff)
        printf(CLR_GREY "    (outputs match line-by-line but differ in trailing whitespace)\n" CLR_RESET);
}

// ─── Single test ─────────────────────────────────────────────────────────────

enum class TestStatus {
    PASS,         // output matched expected
    FAIL_OUTPUT,  // ran OK but output differed
    FAIL_EXIT,    // non-zero exit code
    NO_EXPECTED,  // no .bur.expected file — exit-code-only check
    ERROR,        // could not launch
};

struct TestResult {
    fs::path   path;
    TestStatus status;
    string     actual;
    string     expected;
    int        exitCode;

    bool passed() const {
        return status == TestStatus::PASS || status == TestStatus::NO_EXPECTED;
    }
};

static TestResult runTest(const fs::path& path, const fs::path& root, bool verbose) {
    string label = relativeLabel(path, root);

    printf(CLR_BOLD "  %-50s" CLR_RESET, label.c_str());
    fflush(stdout);

    vector<string> comments = extractComments(path);
    if (verbose && !comments.empty()) {
        printf("\n");
        for (const string& c : comments)
            printf(CLR_GREY "    # %s\n" CLR_RESET, c.c_str());
        printf("  ");
    }

    // Check for expected-output file.
    fs::path expectedPath = path;
    expectedPath += ".expected";
    string expectedOutput;
    bool hasExpected = readFile(expectedPath, expectedOutput);

    // Run the test.
    string cmd = "./dist/burrito_linuxx86_64 " + path.string() + " 2>&1";
    FILE* pipe = popen(cmd.c_str(), "r");
    if (!pipe) {
        printf(CLR_RED "  ERROR (could not launch)\n" CLR_RESET);
        return { path, TestStatus::ERROR, "", "", -1 };
    }

    ostringstream output;
    char buf[256];
    while (fgets(buf, sizeof(buf), pipe))
        output << buf;

    int status   = pclose(pipe);
    int exitCode = WEXITSTATUS(status);
    string actual = output.str();

    // Evaluate result.
    TestResult result;
    result.path     = path;
    result.actual   = actual;
    result.expected = expectedOutput;
    result.exitCode = exitCode;

    if (exitCode != 0) {
        result.status = TestStatus::FAIL_EXIT;
        printf(CLR_RED "FAIL (exit %d)\n" CLR_RESET, exitCode);
    } else if (!hasExpected) {
        result.status = TestStatus::NO_EXPECTED;
        printf(CLR_YELLOW "PASS (no expected file)\n" CLR_RESET);
    } else if (actual == expectedOutput) {
        result.status = TestStatus::PASS;
        printf(CLR_GREEN "PASS\n" CLR_RESET);
    } else {
        result.status = TestStatus::FAIL_OUTPUT;
        printf(CLR_RED "FAIL (output mismatch)\n" CLR_RESET);
    }

    // Show output on failure, or always in verbose mode.
    bool showOutput = (result.status == TestStatus::FAIL_EXIT) ||
                      (result.status == TestStatus::FAIL_OUTPUT) ||
                      (verbose && !actual.empty());

    if (result.status == TestStatus::FAIL_OUTPUT) {
        printf(CLR_GREY "    expected (-) / actual (+):\n" CLR_RESET);
        printDiff(expectedOutput, actual);
    } else if (showOutput) {
        istringstream ss(actual);
        string line;
        while (getline(ss, line))
            printf(CLR_GREY "    %s\n" CLR_RESET, line.c_str());
    }

    return result;
}

// ─── Run a list of tests and print a summary ─────────────────────────────────

static void runTests(const vector<fs::path>& batch,
                     const fs::path& root,
                     bool verbose) {
    if (batch.empty()) { printf("  (no tests)\n"); return; }

    string currentGroup;
    vector<TestResult> results;

    for (const fs::path& p : batch) {
        fs::path rel = fs::relative(p, root);
        string group = (rel.has_parent_path() ? rel.parent_path().string() : ".");

        if (group != currentGroup) {
            currentGroup = group;
            printf(CLR_CYAN CLR_BOLD "\n[%s]\n" CLR_RESET, group.c_str());
        }

        results.push_back(runTest(p, root, verbose));
    }

    // Tally results.
    int passed    = 0, failed = 0, noExpected = 0;
    for (const TestResult& r : results) {
        if (r.status == TestStatus::PASS)        passed++;
        else if (r.status == TestStatus::NO_EXPECTED) { passed++; noExpected++; }
        else failed++;
    }
    int total = (int)results.size();

    printf("\n" CLR_BOLD "Results: ");
    if (failed == 0) {
        printf(CLR_GREEN "%d/%d passed" CLR_RESET, passed, total);
        if (noExpected > 0)
            printf(CLR_YELLOW " (%d without expected file)" CLR_RESET, noExpected);
        printf("\n");
    } else {
        printf(CLR_RED "%d/%d passed, %d failed\n" CLR_RESET, passed, total, failed);
    }

    if (failed > 0) {
        printf(CLR_RED CLR_BOLD "Failed tests:\n" CLR_RESET);
        for (const TestResult& r : results) {
            if (r.passed()) continue;
            const char* reason = (r.status == TestStatus::FAIL_EXIT)   ? "exit code" :
                                 (r.status == TestStatus::FAIL_OUTPUT)  ? "output mismatch" :
                                                                          "error";
            printf(CLR_RED "  - %s (%s)\n" CLR_RESET,
                   relativeLabel(r.path, root).c_str(), reason);
        }
    }

    // Offer to generate missing expected files after a run.
    int missing = 0;
    for (const TestResult& r : results)
        if (r.status == TestStatus::NO_EXPECTED) missing++;

    if (missing > 0) {
        printf(CLR_YELLOW "\n%d test(s) have no expected file. "
               "Generate them from current output? [y/N] " CLR_RESET, missing);
        fflush(stdout);
        string ans;
        if (getline(cin, ans) && (ans == "y" || ans == "Y")) {
            int generated = 0;
            for (const TestResult& r : results) {
                if (r.status != TestStatus::NO_EXPECTED) continue;
                fs::path ep = r.path;
                ep += ".expected";
                ofstream f(ep);
                if (f.is_open()) {
                    f << r.actual;
                    printf(CLR_GREEN "  wrote %s\n" CLR_RESET,
                           relativeLabel(ep, root).c_str());
                    generated++;
                } else {
                    printf(CLR_RED "  failed to write %s\n" CLR_RESET,
                           relativeLabel(ep, root).c_str());
                }
            }
            printf("Generated %d expected file(s).\n", generated);
        }
    }
}

// ─── Parse a selection string into a list of tests ───────────────────────────

static vector<fs::path> parseSelection(const string& input,
                                       const vector<fs::path>& tests,
                                       const fs::path& root) {
    if (input == "all") return tests;

    if (isNumeric(input)) {
        int n = stoi(input);
        if (n < 1 || n > (int)tests.size()) {
            fprintf(stderr, "  Test %d out of range (1-%zu).\n", n, tests.size());
            return {};
        }
        return { tests[n - 1] };
    }

    size_t dash = input.find('-');
    if (dash != string::npos &&
        isNumeric(input.substr(0, dash)) &&
        isNumeric(input.substr(dash + 1))) {

        int start = stoi(input.substr(0, dash));
        int end   = stoi(input.substr(dash + 1));
        if (start < 1 || end > (int)tests.size() || start > end) {
            fprintf(stderr, "  Invalid range %d-%d (1-%zu).\n",
                    start, end, tests.size());
            return {};
        }
        return vector<fs::path>(tests.begin() + start - 1,
                                tests.begin() + end);
    }

    vector<fs::path> matches;
    for (const fs::path& p : tests) {
        string label = relativeLabel(p, root);
        if (label.find(input) != string::npos)
            matches.push_back(p);
    }
    if (matches.empty())
        fprintf(stderr, "  No tests match '%s'.\n", input.c_str());
    return matches;
}

// ─── Main ─────────────────────────────────────────────────────────────────────

int main(int argc, char** argv) {

    if (argc > 1) {
        fprintf(stderr, "The burrito test suite does not take arguments.\n");
        return 1;
    }

    const fs::path root = "./tests";
    vector<fs::path> tests = collectTests(root);

    if (tests.empty()) {
        fprintf(stderr, "No .bur test files found under %s\n", root.c_str());
        return 1;
    }

    bool verbose = false;

    for (;;) {
        printf(CLR_BOLD CLR_CYAN
               "\n══════════════════════════════════════\n"
               " Burrito Test Suite\n"
               "══════════════════════════════════════\n"
               CLR_RESET);

        printTestList(tests, root);

        printf(CLR_GREY
               "\nEnter a number, range (e.g. 3-7), folder/substring, or 'all'.\n"
               "  'v' toggles verbose mode (currently %s).\n"
               "  'q' to quit.\n" CLR_RESET,
               verbose ? "ON" : "OFF");

        printf("\n> ");
        fflush(stdout);

        string input;
        if (!getline(cin, input)) break;
        if (input == "q" || input == "quit") break;

        if (input == "v") {
            verbose = !verbose;
            printf("Verbose mode %s.\n", verbose ? "enabled" : "disabled");
            continue;
        }

        if (input.empty()) continue;

        vector<fs::path> batch = parseSelection(input, tests, root);
        if (!batch.empty())
            runTests(batch, root, verbose);

        getchar();
    }

    return 0;
}