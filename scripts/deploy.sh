#!/bin/sh

if [ $# -eq 3 ]; then
    echo deploying configuration for $1...
else
    echo "specify build directory, script directory and target path" 1>&2
    exit 1
fi

build_dir=$1
script_dir=$2
target_path=$3

for target in `ls -A $build_dir`; do
    if [ -e $target_path/$target ]; then
        echo $target file already exists, renaming to $target`date +"%Y-%m-%dT%H:%M:%S"`.bak for backup
        mv $target_path/$target $target_path/$target`date +"%Y-%m-%dT%H:%M:%S"`.bak
    fi
    ln -sfnv $build_dir/$target $target_path/$target
done
