#!/bin/bash   
# Shell script for checking the transformation over the MiniZinc example files.
# The only examples that don't work are:
#  -  partition, which anyway causes a warining to MiniZinc 
#  -  warehouses : the last statement does not end in ';'. This seems to 
#  be allowed in MiniZinc but not in our setting

# to save files that need an special treatment
mkdir temp
#move those examples that require a different solver or a parameter file
mv domino.mzn temp
mv latin_squares_fdlp.mzn temp
mv min_cost_flow.mzn temp
mv product.mzn temp
mv tiny_tsp.mzn temp
rm foo.mzn
rm trans_trans.mzn

# now check finite domain solver examples
for file in *.mzn
do
echo processing $file
minizinc $file >r1
java -jar minizincu.jar $file >trans_trans.mzn
minizinc trans_trans.mzn >r2
diff r1 r2
done
# special examples
echo processing domino
cp temp/* .
minizinc domino.mzn domino.1.dzn > r1
java -jar minizincu.jar domino.mzn > trans_trans.mzn
java -jar minizincu.jar domino.1.dzn > trans_trans.dzn
minizinc trans_trans.mzn trans_trans.dzn >r2
diff r1 r2

echo processing min_cost_flow.mzn
mzn-g12mip min_cost_flow.mzn>r1
java -jar minizincu.jar min_cost_flow.mzn > trans_trans.mzn
mzn-g12mip trans_trans.mzn>r2
diff r1 r2

echo processing product.mzn
mzn-g12mip product.mzn>r1
java -jar minizincu.jar product.mzn > trans_trans.mzn
mzn-g12mip trans_trans.mzn>r2
diff r1 r2

echo processing tiny_tsp.mzn
mzn-g12mip tiny_tsp.mzn>r1
java -jar minizincu.jar tiny_tsp.mzn > trans_trans.mzn
mzn-g12mip trans_trans.mzn>r2
diff r1 r2


