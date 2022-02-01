#!/bin/bash
# run-tests.sh
# Executes the demo applications and writes results to a CSV file
# Usage:
# ./run-tests.sh [result file path]
# [result file path] defaults to "python-c-integrations.csv" in the current directory
#
# The result file is a CSV file with the following headers:
# app_name: The application name
# iterations: The number of iterations executed
# elapsed_time: The elapsed time as [seconds].[milliseconds]

######## declarations
# CSV file path
RESULT_FILE_PATH=${1:-"./python-c-integrations.csv"}

# iteration list
ITERATIONS=(10 100 1000 10000 100000 1000000)

# applications to run
APPS=(standalone-c extension cffi ctypes pure-python)

# C shared object file used for ctypes testing
SHARED_OBJECT_PATH="library-c/awesome-lib.so"

PYTHON3_PATH="venv/bin/python3"
EXTENSION_INTERPRETER="extension/$PYTHON3_PATH"
CFFI_INTERPRETER="cffi/$PYTHON3_PATH"
INTERPRETERS=($EXTENSION_INTERPRETER $CFFI_INTERPRETER)

# validates that the script is ready to run
function check_list ()
{
  if [ ! -f "$SHARED_OBJECT_PATH" ]; then
    echo "$SHARED_OBJECT_PATH was not found."
    echo "Did you build library-c?"
    echo "Please run build-apps.sh or review library-c/README.md for additional build instructions."
    exit 1;
  fi

  for i in "${INTERPRETERS[@]}"; do
    if [ ! -f "$i" ]; then
      echo "$i was not found."
      echo "Did you run build.apps.sh?"
      exit 1;
    fi
  done
}

# creates the output CSV file and associated header record
function initialize_file ()
{
  cat /dev/null > "$RESULT_FILE_PATH"
  echo "app_name, iterations, elapsed_time" >> "$RESULT_FILE_PATH"
}

# executes a demo application
# arguments include:
# $1 - the name of the application directory
# $2 - the number of iterations to run
function execute_app ()
{
  if [ "$1" == "standalone-c" ]; then
    time ./"$a"/app "$2"
  elif [ "$1" == "pure-python" ] || [ "$1" == "ctypes" ]; then
    time python3 "$a"/main.py "$2"
  else
    time "$a"/venv/bin/python3 "$a"/main.py "$2"
  fi
}

############# execution

# set time format
TIMEFORMAT=%R

check_list

initialize_file

for i in "${ITERATIONS[@]}"; do
  for a in "${APPS[@]}"; do
    # redirect "time" output from stderr and capture
    elapsed_time=$(execute_app "$a" "$i" 2>&1)
    echo "$a, $i, $elapsed_time" >> "$RESULT_FILE_PATH"
  done
done

# restore default time setting
unset TIMEFORMAT