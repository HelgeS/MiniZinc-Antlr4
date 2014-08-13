#!/bin/bash   
grun='java org.antlr.v4.runtime.misc.TestRig'
for file in *.mzn
do
echo processing $file
minizinc $file >r1
java -jar minizincu.jar $file >trans_trans.mzn
minizinc trans_trans.mzn >r2
diff r1 r2
done

