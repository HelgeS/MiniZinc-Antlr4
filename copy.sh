#!/bin/bash   
for file in *.java
do
echo copying  $file
echo "package minizinc.antlr4;">temp.txt
cat $file>>temp.txt
cp temp.txt ~/repos/git/MiniZincU/src/minizinc/antlr4/$file
done
