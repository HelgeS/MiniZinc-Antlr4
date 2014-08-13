#!/bin/bash   
grun='java org.antlr.v4.runtime.misc.TestRig'
for file in *.mzn
do
echo processing $file
$grun MiniZincGrammar model < $file
done

