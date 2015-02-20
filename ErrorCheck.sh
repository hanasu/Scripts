#!/bin/bash
#Brendan O'Dowd 2/20/15
#CS 282 Version 1.0
#Runs an error check on a log file using grep in order to figure out the root
#cause of the issue.

#find all the lines beginning with [ERROR] and output them to a temp file
grep -i -F "[ERROR]" stacktrace.log > temp.txt
echo "The total number of error messages is: " > errors.txt
#read the contents of the temp file, and use wc to print number of appearances of the string and output to file
cat temp.txt | wc -l >> errors.txt
echo "" >> errors.txt
echo "The root cause of the error is: " >> errors.txt
#read contents of temp, use sed to find target string
#^ indicates beginning of line, .*  is a wildcard, /p prints
cat temp.txt | sed -n -e 's/^.*Failure caused by: //p' >> errors.txt
echo "" >> errors.txt
echo "The error messages are as follows:" >> errors.txt
#copy the error messages from the temp file to the output file at the end
cat temp.txt >> errors.txt
#delete the temp file
rm temp.txt
