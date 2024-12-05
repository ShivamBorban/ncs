#!/bin/bash

num1=$1
num2=$2
num3=$3
num4=$4
#############################################################

echo " "
echo "1st Number is = ${num1}"
echo "2nd Number is = ${num2}"

echo " "
echo "Addition = $((num1+num2))"
echo "Subtraction = $((num1-num2))"
echo "Multiplication = $((num1*num2))"
echo "Quotient = $((num1/num2))"
echo "Reminder = $((num1%num2))"
##############################################################

echo " "
echo "Check ${num3} is EVEN or ODD ? "

echo " "
if [ $((num3 % 2)) -eq 0 ]; then
    echo "${num3} is a EVEN NUMBER"
else
    echo "${num3} is a ODD NUMBER"
fi

################################################################

echo " "
echo "Multiplication Table for ${num4} :"
for i in {1..10}
do
    echo "${num4} x $i = $((num4 * i))"
done



echo " "

























#name="Shivam"
#age="24"

#read -p "Enter ur Name " name 
#read -p "Enter ur Age " age 
#read -p "Enter ur passward " passward 
#echo ${0}
#echo ${1}
#echo ${2}
#echo ${#}


#echo "my name is ${name} and my Age is ${age}  and passward is ${passward}"



#read -p "Enter 1st number : " num1
#read -p "Enter 2st number : " num2

