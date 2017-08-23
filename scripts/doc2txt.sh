#!/bin/bash

echo "converting $file ... "
for file in *.docx; do 
    echo "$file"
    name=`basename "$file"`
    echo "${name/docx/txt}"
    echo docx2txt < "$file" > "${name/docx/txt}"
done 

echo "converting $file ... "
for file in *.doc; do 
    echo "$file"
    name=`basename "$file"`
    echo cattxt "$file" > "${name/doc/txt}"
done 

