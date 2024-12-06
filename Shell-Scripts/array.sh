echo " "

arr=("$@")  
echo "Array elements are:"
for element in "${arr[@]}"
do
    echo "- $element"
done


echo " "
