#!/bin/sh

if [ $# -eq 5 ]; then
    echo running initialization scripts for $1...
else
    echo "specify desired platform name, build directory, config directory, resource directory and script directory" 1>&2
    exit 1
fi

build_dir=$2
config_dir=$3/$1/init
resource_dir=$4/init
script_dir=$5

echo using configuration in $config_dir

for filename in `ls $config_dir`
do
    echo running initialization step: $filename
    for script in `cat $config_dir/$filename | awk '! /^#/' | awk '/./' | sed -e "s#^#$resource_dir/#"`
    do
        sh $script
    done
done

exit 0
