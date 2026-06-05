
.PHONY:
	testsuite debug run test runsuite asm

CC_w := "C:/raylib/w64devkit/bin/gcc.exe"
CPP_w := "C:/raylib/w64devkit/bin/g++.exe"
CC := gcc

make:
	$(CC) -O3 -march=x86-64-v2 -mtune=generic -flto=3 -fno-plt -fvisibility=hidden -Wno-discarded-qualifiers \
	./src/*.c ./src/natives/*.c -o ./dist/burrito_linuxx86_64 -lm -lraylib -lyyjson

make_win:
	$(CC_w) -B C:/raylib/w64devkit/bin/ -O3 -march=x86-64 -mtune=generic -fno-plt -fvisibility=hidden -Wno-discarded-qualifiers \
	./src/*.c ./src/natives/*.c -o ./dist/burrito_winx86_64 -lm -I"C:/raylib/w64devkit/include" -L"C:/raylib/w64devkit/lib" \
	-lraylib -lyyjson -lopengl32 -lgdi32 -lwinmm -luser32 -lshell32

genprof:
	$(CC) -O3 -march=x86-64-v2 -mtune=generic -flto=3 -fprofile-generate -Wno-discarded-qualifiers \
    -o dist/burrito-prof src/*.c src/natives/*.c -lm -lraylib -lyyjson

useprof:
	$(CC) -O3 -march=x86-64-v2 -mtune=generic -flto=3 -fprofile-use -fno-plt -fvisibility=hidden -Wno-discarded-qualifiers \
    -o dist/burrito-prof src/*.c src/natives/*.c -lm -lraylib -lyyjson

test:
	./dist/burritoTestSuite

test_win:
	./dist/burritoTestSuitew

debug:
	$(CC) -fsanitize=address -g3 -O0 ./src/*.c ./src/natives/*.c -o ./dist/burrito -lm -lraylib -lyyjson

asm_:
	for file in src/*.c src/natives/*.c; do \
		base=$$(basename $$file .c); \
		gcc -O3 -march=x86-64-v2 -mtune=generic -S -masm=intel -fverbose-asm -Wno-discarded-qualifiers $$file -o ./asm/$$base.S -lm -lraylib -lyyjson; \
	done

testsuite:
	g++ -O3 ./src/*.cpp -o ./dist/burritoTestSuite

testsuite_win:
	$(CPP_w) -B C:/raylib/w64devkit/bin/ -O3 ./src/*.cpp -o ./dist/burritoTestSuitew

run:
	./dist/burrito_linuxx86_64
