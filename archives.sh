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
   echo "ERROR::directorey not exist"
   exit 1
fi

if [ ! -d "$dest_dir" ]; then
   echo "ERROR::directorey does not exist"
   exit 1
fi

