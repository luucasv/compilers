#!/bin/sh
mkdir -p bin
javac -classpath lib/antlr-runtime-4.5.3.jar src/*/*.java -d bin