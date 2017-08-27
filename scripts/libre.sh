#!/bin/bash

# run under qq/
# sh ../scripts/libre.sh html
# sh ../scripts/libre.sh txt 

fmt=$1

if [ ! -d $fmt ]; then
   mkdir $fmt
fi

cd $fmt

for dir in `ls -d ../articles/*/`; do
    echo "$dir"
    dirname=`basename "$dir"`
    
    if [ ! -d "$dirname" ]; then
       mkdir "$dirname"
    fi
   
    cd "$dirname"
    for file in "../$dir"/*doc*; do
        filename=`basename $file`
        if [ ! -d "$filename" ]; then
           echo "$filename"
           if [[ $fmt =~ 'txt' ]]; then
              libreoffice --headless --convert-to $fmt:Text "$file"
           else
              libreoffice --headless --convert-to $fmt "$file"
           fi
        fi
    done
    cd ..
  
done

cd ..

