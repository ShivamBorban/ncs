#!/bin/bash
echo " "

num=$1
range=$2
echo "Multiplication Table for ${num} :"
for ((i=1; i<=range; i++))
do
    echo "${num} x $i = $((num * i))"
done

echo " "
