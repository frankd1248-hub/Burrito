#include <filesystem>
#include <iostream>
#include <fstream>
#include <sstream>
#include <cstdlib>
#include <cstdio>
#include <vector>
#include <algorithm>
#include <string>

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
            // trim leading space
            size_t start = text.find_first_not_of(' ');
            comments.push_back(start == string::npos ? "" : text.substr(start));
        } else {
            break;
        }
    }
    return comments;
}

// A relative label shown to the user, e.g. "bitwise/basic.bur"
static string relativeLabel(const fs::path& test, const fs::path& root) {
    return fs::relative(test, root).string();
}

// ─── Single test ─────────────────────────────────────────────────────────────

struct TestResult {
    fs::path path;
    int      exitCode;
    bool     passed() const { return exitCode == 0; }
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

    string cmd = "./dist/burrito_linuxx86_64 " + path.string() + " 2>&1";
    FILE* pipe = popen(cmd.c_str(), "r");
    if (!pipe) {
        printf(CLR_RED "  ERROR (could not launch)\n" CLR_RESET);
        return {path, -1};
    }

    ostringstream output;
    char buf[256];
    while (fgets(buf, sizeof(buf), pipe))
        output << buf;

    int status = pclose(pipe);
    int exitCode = WEXITSTATUS(status);

    if (exitCode == 0) {
        printf(CLR_GREEN "PASS\n" CLR_RESET);
    } else {
        printf(CLR_RED "FAIL (exit %d)\n" CLR_RESET, exitCode);
    }

    // Always print program output in verbose mode; only on failure otherwise.
    string out = output.str();
    if (!out.empty() && (verbose || exitCode != 0)) {
        istringstream ss(out);
        string line;
        while (getline(ss, line))
            printf(CLR_GREY "    %s\n" CLR_RESET, line.c_str());
    }

    return {path, exitCode};
}

// ─── Run a list of tests and print a summary ──────────────────────────────────

static void runTests(const vector<fs::path>& batch,
                     const fs::path& root,
                     bool verbose) {
    if (batch.empty()) { printf("  (no tests)\n"); return; }

    // Group by immediate subdirectory under root so we print section headers.
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

    // Summary
    int passed = 0;
    for (const TestResult& r : results) if (r.passed()) passed++;
    int total  = (int)results.size();
    int failed = total - passed;

    printf("\n" CLR_BOLD "Results: ");
    if (failed == 0)
        printf(CLR_GREEN "%d/%d passed\n" CLR_RESET, passed, total);
    else
        printf(CLR_RED "%d/%d passed, %d failed\n" CLR_RESET, passed, total, failed);

    if (failed > 0) {
        printf(CLR_RED CLR_BOLD "Failed tests:\n" CLR_RESET);
        for (const TestResult& r : results)
            if (!r.passed())
                printf(CLR_RED "  - %s\n" CLR_RESET,
                       relativeLabel(r.path, root).c_str());
    }
}

// ─── Parse a selection string into a list of tests ───────────────────────────
//
// Supported formats:
//   all          → every test
//   N            → test number N (1-based)
//   N-M          → tests N through M inclusive
//   <name>       → tests whose path contains <name> (substring, e.g. "bitwise")

static vector<fs::path> parseSelection(const string& input,
                                       const vector<fs::path>& tests,
                                       const fs::path& root) {
    if (input == "all") return tests;

    // Numeric single
    if (isNumeric(input)) {
        int n = stoi(input);
        if (n < 1 || n > (int)tests.size()) {
            fprintf(stderr, "  Test %d out of range (1-%zu).\n", n, tests.size());
            return {};
        }
        return { tests[n - 1] };
    }

    // Numeric range  N-M
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

    // Substring filter (folder name, file name, etc.)
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

        // Print test list grouped by subdirectory
        string currentGroup;
        for (int i = 0; i < (int)tests.size(); i++) {
            fs::path rel = fs::relative(tests[i], root);
            string group = rel.has_parent_path()
                           ? rel.parent_path().string() : ".";
            if (group != currentGroup) {
                currentGroup = group;
                printf(CLR_CYAN "\n  [%s]\n" CLR_RESET, group.c_str());
            }
            printf("  %3d: %s\n", i + 1,
                   tests[i].filename().c_str());
        }

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