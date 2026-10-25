#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
source_dir=$1
days=${2:-14}

usage(){
    echo -e "${R}([source_dir][days])${N}"
    exit 1
}

if [ -z "$source_dir" ]; then
   echo "ERROR::missing perameters"
   usage
fi

if [ ! -d "$source_dir" ]; then
   echo "ERROR::Directorey not exist"
fi

echo "scaning the files older than $days under $source_dir"
files_to_delete=$(find $source_dir -name "*.log" -type f -mtime +$days)

if [ -z "$files_to_delete" ]; then
   echo "No files found older than $days to delete"
   exit 0
fi

while IFS= read -r line
do
   echo "File is going to be deleted $line"
   rm -f $line
   echo "deleted files $line"
done <<< "$files_to_delete"