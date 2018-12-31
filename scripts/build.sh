#!/bin/sh

if [ $# -eq 5 ]; then
    echo deploying configuration for $1...
else
    echo "specify desired platform name, build directory, config directory, resource directory and script directory" 1>&2
    exit 1
fi

build_dir=$2
config_dir=$3/$1/deploy
resource_dir=$4/deploy
script_dir=$5

echo using configuration in $config_dir

if [ ! -d build ]; then
    echo build directory does not exist, creating...
    mkdir $build_dir
fi
echo building dotfiles into $build_dir

for filename in `ls $config_dir`
do
    echo building $filename
    target=`cat $config_dir/$filename | awk '$1 == "target" && $2 == "=" { print $3 }'`
    subdirectory=`cat $config_dir/$filename | awk '$1 == "subdirectory" && $2 == "=" { print $3 }'`
    if [ -z $subdirectory ]; then
        targetdirectory=$build_dir/$target
    else
        mkdir -p $build_dir/$subdirectory
        targetdirectory=$build_dir/$subdirectory/$target
    fi
    cat `cat $config_dir/$filename | awk '! /^#/' | awk '/./' | awk '! /=/' | sed -e "s#^#$resource_dir/$filename/#"` > $targetdirectory
done

exit 0
