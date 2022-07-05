#!/bin/bash

#Random Password Generator

echo "!! STRONG RANDOM PASSWORD GENERATOR !!"


read -p "Please enter the length of the desired password:" PASS_LENGTH


for p in $(seq 1 5);
do
        openssl rand -base64 48 | cut -c1-$PASS_LENGTH
done

