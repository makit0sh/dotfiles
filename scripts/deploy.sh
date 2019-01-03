#!/bin/sh

if [ $# -eq 4 ]; then
    echo deploying configuration for $1...
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
    for target_subdir in `find $target -type d`; do
        mkdir -p $target_path/$target_subdir
    done
    for target_file in `find $target -type f`; do
        if [ -e $target_path/$target_file ]; then
            echo $target_file file already exists, renaming to $target_file`date +"%Y-%m-%dT%H:%M:%S"`.bak for backup
            mv $target_path/$target_file $target_path/$target_file`date +"%Y-%m-%dT%H:%M:%S"`.bak
        fi
        ln -sfnv $build_dir/$target_file $target_path/$target_file
    done
done
cd $current_dir

