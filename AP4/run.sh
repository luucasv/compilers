#!/bin/sh
cd bin
cp ../input.cym .
java application.CodeGenerationApplicationVisitor
rm ./input.cym
cd ..
mv bin/output.il .