#!/bin/sh

if [ ! -d build ]; then
mkdir build
fi

cd src
find . -type f -name "*.java" -exec sh -c 'echo "$PWD/${0%/*}/${0##*/}"' {} \; > ../build/srcfiles.txt
cd ..
javac -source 1.8 -target 1.8 -d ./build "@build/srcfiles.txt"
