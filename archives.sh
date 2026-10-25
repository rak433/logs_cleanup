#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
source_dir=$1
dest_dir=$2
days=${3:-14}

usage (){
    echo -e "${R}USAGE ([source_dir]) ([dest_dir])${N}"
    exit 1
}

if [ -z "$source_dir" ] || [ -z "$dest_dir" ]; then
   echo "Either source or destination directorey missing"
   usage
fi

if [ ! -d "$source_dir" ]; then
   echo "ERROR::Source directorey not exist"
   exit 1
fi

if [ ! -d "$dest_dir" ]; then
   echo "ERROR::Destination directorey does not exist"
   exit 1
fi

echo "scaning files older than $days days in $source_dir"

files_to_archive=$(find $source_dir -name "*.log" -type f -mtime +$days)

if [ -z $"files_to_archive" ]; then
   echo -e "No log files found older than $days days in $source_dir"
   exit 0
fi

timestamp=$(date +%Y-%m-%d-%H-%M-%S)

file_name="$dest_dir/logs-$timestamp.tar.gz"

tar -czf $file_name $files_to_archive

if [ $? -ne 0 ]; then
   echo "logs archival is failed"
   exit 1
else
    echo "logs are archived $file_name"
    while IFS= read -r line
    do
        echo "files to be deleted $line"
        rm -f $line
        echo "deleted files $line"
    done <<< "$files_to_archive"
fi




