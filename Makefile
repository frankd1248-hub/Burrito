
.PHONY:
	testsuite debug run test runsuite asm

make:
	gcc -O3 -march=x86-64-v2 -mtune=generic -flto=3 -fno-plt -fvisibility=hidden -Wno-discarded-qualifiers \
	./src/*.c ./src/natives/*.c -o ./dist/burrito_linuxx86_64 -lm -lraylib -lyyjson

genprof:
	gcc -O3 -march=x86-64-v2 -mtune=generic -flto=3 -fprofile-generate -Wno-discarded-qualifiers \
    -o dist/burrito-prof src/*.c src/natives/*.c -lm -lraylib -lyyjson

useprof:
	gcc -O3 -march=x86-64-v2 -mtune=generic -flto=3 -fprofile-use -fno-plt -fvisibility=hidden -Wno-discarded-qualifiers \
    -o dist/burrito-prof src/*.c src/natives/*.c -lm -lraylib -lyyjson

test:
	./dist/burritoTestSuite

debug:
	gcc -fsanitize=address -g3 -O0 ./src/*.c ./src/natives/*.c -o ./dist/burrito -lm -lraylib -lyyjson

asm_:
	for file in src/*.c src/natives/*.c; do \
		base=$$(basename $$file .c); \
		gcc -O3 -march=x86-64-v2 -mtune=generic -S -masm=intel -fverbose-asm -Wno-discarded-qualifiers $$file -o ./asm/$$base.S -lm -lraylib -lyyjson; \
	done

testsuite:
	g++ -O3 ./src/*.cpp -o ./dist/burritoTestSuite

run:
	./dist/burrito_linuxx86_64
