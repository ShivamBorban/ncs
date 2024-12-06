#!/bin/bash
echo " "

name=$1

greet_user() {
    echo "Hello, ${name}! Welcome to the world of Bash scripting."
}

greet_user "${name}"

echo " "
