#!/bin/bash

######################################################################
##
##   Random Password Generator
##   Written By: Ankit Ojha
##   URL: ankitojha.com.np
##   Update on: July 5, 2022
##
######################################################################

echo "!! STRONG RANDOM PASSWORD GENERATOR !!"


read -p "Please enter the length of the desired password:" PASS_LENGTH


for p in $(seq 1 5);
do
        openssl rand -base64 48 | cut -c1-$PASS_LENGTH
done

