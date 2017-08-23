#!/bin/bash

fmt=$1

if [ ! -d $fmt ]; then
   mkdir $fmt
fi

cd $fmt

for dir in `ls -d ../articles/*/`; do
    echo "$dir"
    name=`basename "$dir"`
    
    if [ ! -d "$name" ]; then
       mkdir "$name"
    fi
   
    cd $name
    for file in "../$dir"/*doc*; do
        echo $file
        libreoffice --headless --convert-to $fmt "$file"
    done
    cd ..
  
done

cd ..
