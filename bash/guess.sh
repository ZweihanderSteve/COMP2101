#!/bin/bash

# Implements 3rd guessing game of 3rd lesson

# get random number from 1 to 10
mynumber=$(( RANDOM % 10 +1 ))

while true; do
  # ask user to guess
  # validate number
    while [[ -z "$usernumber" || (! "$usernumber" =~ ^[1-9]0?$) || "$usernumber" -gt 10 ]]; do
      read -p "Pick a numero from 1 t0 10, inclusive: " usernumber
    done

  # if correct, exit
    if [ $mynumber -eq "$usernumber" ]; then
      echo "Correcto Mundo!"
      exit
    else
      if [ $mynumber -gt $usernumber ]; then
        echo "HIGHER!"
    else
        echo "LOWER!"
      fi
    fi
  # ask again until answer is correct
  usernumber=
done
