#!/bin/bash
echo " "

num=$1

echo "Check ${num} is EVEN or ODD ? "

echo " "
if [ $((num % 2)) -eq 0 ]; then
    echo "${num} is a EVEN NUMBER"
else
    echo "${num} is a ODD NUMBER"
fi

echo " "