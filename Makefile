
.PHONY:
	testsuite debug run test runsuite asm

make:
	gcc -O3 -march=native ./src/*.c ./src/natives/*.c -o ./dist/burrito -lm -lraylib

test:
	./dist/burritoTestSuite

debug:
	gcc -fsanitize=address -g3 -O0 ./src/*.c ./src/natives/*.c -o ./dist/burrito -lm -lraylib

asm_:
	for file in src/*.c; do \
		base=$$(basename $$file .c); \
		gcc -O3 -S -fverbose-asm -march=native -masm=intel $$file -o ./asm/$$base.S; \
	done

testsuite:
	g++ -O3 ./src/*.cpp -o ./dist/burritoTestSuite

run:
	./dist/burrito
