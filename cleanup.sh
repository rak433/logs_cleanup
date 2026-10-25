#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
source_dir=$1
days={2:-14}#if user is not passing the days script will take default 14 days

usage(){
    echo -e "${R}usage::[(source_dir) (days to clean)]${N}"
    exit 1
}

if [ -z "$source_dir" ]; then
   echo "ERROR : missing perameters"
   usage
fi