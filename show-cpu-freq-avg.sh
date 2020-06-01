#!/bin/bash
SUM=""
NUMS=$(cat /proc/cpuinfo | awk '/MHz/ {print $4}' | awk -F '.' '{print $1}')
for n in $NUMS; do 
    SUM=$(($SUM+$n))
    done
SUM=$(($SUM/8))
printf "%04d" "$SUM"
