#!/bin/sh

if [ $# -eq 4 ]; then
    echo removing configuration for $1...
else
    echo "specify build directory, script directory, target path and current directory" 1>&2
    exit 1
fi

build_dir=$1
script_dir=$2
target_path=$3
current_dir=$4

cd $build_dir
for target in `ls -A`; do
    for target_file in `find $target -type f`; do
        if [ -e $target_path/$target_file ]; then
            rm -v $target_path/$target_file
        fi
    done
done
cd $current_dir

