#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
source_dir=$1
dest_dir=$2
days=${3:-14}

usage (){
    echo "${R}USAGE ([source_dir]) ([dest_dir])${N}"
    exit 1
}

if [ -z "$source_dir" ] || [ -z "$dest_dir" ]; then
   echo "Either source or destination directorey missing"
   usage
fi
