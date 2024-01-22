#!/bin/bash

# Command ./mint.sh CONTRACT_NAME FILE DEPOSIT SIGNER

export CONTRACT_NAME="$1"
export FILE="$2"

if [ -z "$3" ]; then
	DEPOSIT="$3"
else
	DEPOSIT=0
fi

export DEPOSIT

export ADDRESS="$4"

if [ "$#" -ne 4 ]; then
	echo 'Error not all arguments provided'
	echo 'Usage: '$0' CONTRACT_NAME FILE DEPOSIT SIGNER'
	echo 'Take care to not inverse elements!'
else
	./near-cli-rs contract call-function as-transaction $CONTRACT_NAME inscribe file-args $FILE prepaid-gas '100.0 Tgas' attached-deposit "$DEPOSIT NEAR" sign-as $ADDRESS network-config mainnet sign-with-legacy-keychain send

fi
