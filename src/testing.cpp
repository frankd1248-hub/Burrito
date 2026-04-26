#include <filesystem>
#include <iostream>
#include <fstream>
#include <cstdlib>
#include <cstdio>
#include <vector>
#include <algorithm>

using namespace std;

static bool isNumeric(string str) {
    for (char c : str) {
        if (c < '0' || c > '9') return false;
    }
    return true;
}

static vector<string> splitString(string str, char c) {
    vector<string> result = {};
    string temp = "";
    for (char ch : str) {
        if (ch == c) {
            result.push_back(temp);
            temp = "";
        } else {
            temp += ch;
        }
    }

    return result;
}

static void runTest(filesystem::path path) {
    printf("\nTest: %s\n", path.filename().c_str());

    ifstream input = ifstream(path.string());

    ostringstream command;
    command << "./dist/burrito " << path.string();
    printf("Command: %s\n\n", command.str().c_str());

    ostringstream str;
    str << input.rdbuf();
    string fileContents = str.str();

    // Parse comments at the beginning of the file to extract information
    vector<string> lines = splitString(fileContents, '\n');
    for (int i = 0; i < lines.size(); i++) {
        if (lines.at(i).substr(0, 2) == "//") {
            printf(" # %s\n", lines.at(i).substr(2).c_str());
            continue;
        } break;
    }
    cout << endl;

    system(command.str().c_str());
    cout << endl;
}

int main(int argc, char** argv) {

    if (argc != 1) {
        cerr << "The burrito test suite does not take console arguments.\n";
        return 1; 
    }

    vector<filesystem::path> tests;
    for (filesystem::directory_entry entry : filesystem::directory_iterator("./tests")) {
        if (entry.path().extension().string() == ".bur")
            tests.push_back(entry.path());
    }

    sort(tests.begin(), tests.end(), [] (filesystem::path a, filesystem::path b) {
        string _a = a.stem().string();
        string _b = b.stem().string();
        int length = min(_a.length(), _b.length());
        for (int i = 0; i < length; i++) {
            if (_a.at(i) < _b.at(i))
                return true;
            else if (_a.at(i) > _b.at(i))
                return false;
            else if (i == length - 1)
                return _a.length() < _b.length();
        }
        return false;
    });

    for (;;) {
        
        cout << "List of tests available to run: \n";
        for (int i = 0; i < tests.size(); i++) {
            printf(" %02d: %s\n", i + 1, tests.at(i).filename().c_str());
        }
        cout << endl;

        cout << "What test(s) do you want to run? ";

        string input;
        getline(cin, input);

        if (input == "quit" || input == "q")
            return 0;

        if (isNumeric(input)) {
            int test = stoi(input);
            printf("Running test: %02d\n", test);
            runTest(tests.at(test-1));
        } else {
            // Either range or just invalid

            int pos;
            if ((pos = input.find('-')) == string::npos) {
                fprintf(stderr, "Invalid range: %s", input.c_str());
            }

            int start = stoi(input.substr(0, pos));
            int end = stoi(input.substr(pos+1, input.size() - pos - 1));

            printf("Running tests: %02d - %02d (inclusive-exclusive)\n", start, end);

            for (int i = start; i < end; i++) {
                runTest(tests.at(i-1));
            }
        }

        cout << "Press anything to continue...\n";
        getchar();
    }
}