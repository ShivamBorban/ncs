#!/bin/bash
echo " "

num1=$1
num2=$2 

echo "1st Number is = ${num1}"
echo "2nd Number is = ${num2}"

echo " "
echo "Addition = $((num1+num2))"
echo "Subtraction = $((num1-num2))"
echo "Multiplication = $((num1*num2))"
echo "Quotient = $((num1/num2))"
echo "Reminder = $((num1%num2))"
echo "Increment = $((++num1))"
echo "Decrement = $((--num1))"

echo " "