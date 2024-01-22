#!/bin/bash

# author : GaloisField2718
# Description : This script uses `mint.sh` script and user input to mint MAX times into inscription.near contract.


export CONTRACT_NAME='inscription.near'
export FILE='inscriptions/mint_fuckneat.json'
export DEPOSIT='0'
export ADDRESS='YOUR_ADDRES'


if [ -z "$1" ]; then
	MAX=9
else
	MAX=$1
fi

export MAX

for ((i = 0; i <= $MAX; i++))
do 
	./mint.sh $CONTRACT_NAME $FILE $DEPOSIT $ADDRESS
done
