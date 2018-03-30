#!/bin/bash

function showUsage {
cat << EOF
Usage: $0 [OPTIONS] GRAMMAR_NAME START_VARIABLE INPUT_FILE
       $0 -h

OPTIONS:
  -c --compile    if you want to compile before running
EOF
}

function compile {
  java org.antlr.v4.Tool $1.g4
  javac $1*.java
  mkdir -p ${1}_output
  mv $1*.class $1*.java $1*.tokens ${1}_output
}

function run {
  if [ ! -d "${1}_output" ]; then
    echo "Output dir desn't exist, try \"$0 -h\" for help"
  else
    cd ${1}_output
    java org.antlr.v4.runtime.misc.TestRig $1 $2 -gui ../$3
  fi
}

function main {
  will_compile=false
  while getopts ":ch" opt; do
    case $opt in
      c)
        will_compile=true
        ;;
      h)
        showUsage
        exit 0
        ;;
      \?)
        echo "$0: invalid option: -$OPTARG" >&2
        echo "Try $0 -h" >&2
        exit 1
    esac
  done

  shift "$((OPTIND-1))"

  if [ $# -le 2 ]; then
    echo "Missing arguments"
    echo "Try $0 -h"
    exit
  fi

  if $will_compile; then
    compile $1
  fi

  run $1 $2 $3
}

main $@
