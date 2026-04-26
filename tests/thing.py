f = open("local_bench_2.bur", 'w')

f.write("// Begin local benchmark 2\n")
f.write("// End local benchmark 2\n")

f.write("print(\"Begin local benchmark 2\");\n\n")

f.write("{\n")

for i in range(50000):
    f.write("\tdecl a" + str(i) + " = " + str(i) + ";\n");
    
f.write("}\n")

f.write("print(\"End local benchmark 2\");\n")