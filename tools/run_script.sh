#!/bin/bash

PROJECT_HOME_DIR=/home/jb/Documents/research/projects/fas/code
export CACHEIR_LOGS=1
export IONFLAGS=logs,scripts,mir,bl-all,aborts
#export ION_SPEW_FILENAME=/tmp/ion_log.txt
#export ION_SPEW_BY_PID=
export ION_DEP_GRAPH_BY_PID=

ION=1
THREADS=1
FILE=""

if [ $# -eq 0 ]
then
   set -- "--help"
fi

while [ $# -gt 0 ]
do
   if [ $1 == "--help" ]
   then
      echo "Usage :"
      echo ""
      echo "\"./test_exec.sh [--no-ion] [--single-threaded-ion] <js_file>\""
      exit 0
   elif [ $1 == "--no-ion" ]
   then
      ION=0
   elif [ $1 == "--single-threaded-ion" ]
   then
      THREADS=0
   else
      FILE=$1
   fi
   shift
done

if [ -z "$FILE" ]
then
   echo "Error : no JS file path argument. You must specify the path to the JS file you want to run as an argument. Try \"./run_script.sh --help\" for information on program usage."
   exit 1
fi

if [ $THREADS -eq 0 ] && [ $ION -eq 0 ]
then
   echo "Error : --single-threaded-ion and --no-ion options are mutually exclusive. The Ion compiler needs to be enabled in order to disable multi-threading during compilation."
   exit 1
fi

cd "${PROJECT_HOME_DIR}/spidermonkey-last/mozilla-unified/obj-x86_64-pc-linux-gnu/dist/bin"

CMD="./js"

if [ $ION -eq 0 ]
then
   CMD="${CMD} --no-ion"
fi

if [ $THREADS -eq 0 ]
then
   CMD="${CMD} --ion-offthread-compile=off"
fi

if [[ "$FILE" = /* ]]
then
   JS_FILE=$FILE
else
   JS_FILE="${PROJECT_HOME_DIR}/${FILE}"
fi

CMD="${CMD} ${JS_FILE}"
echo $CMD
$CMD

cd $PROJECT_HOME_DIR

