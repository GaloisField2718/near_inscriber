#!/bin/bash

# Replace YOUR_ADDRESS with your near id.
export ADDRESS=YOUR_ADDRESS

# Define main call on near with some logs informations.
# The BALANCE is not the real one because if run fails the BALANCE will be updated. It's not linked to an indexer!
call_near_contract() {
    local DEPOSIT="$1"
    echo "Calling contract with DEPOSIT: $DEPOSIT"
    echo "Actual fees are : $FEES"
    echo "Actual Balance is : $BALANCE"
    ./mint.sh unifat.near inscriptions/mint_unifat_example.json $DEPOSIT $ADDRESS
}

# This function display a countdown until duration is reached.
# It's mainly used to avoid bot behaviour, spamming the contract and be remarked easily. 
wait_function() {
	export duration=$1  # specify the sleep duration in seconds
	counter=0
	echo "Countdown started for $duration seconds:"
	for ((i = 0; i < duration; i++)); do
	    echo -ne "  $((duration - i)) seconds remaining\r"
	    sleep 1
	done
	echo -e "\nCountdown complete!"
}


if [ -z "$1" ]; then
	echo "Please provide your token current balance (can be 0)"
	read BALANCE
else
	BALANCE=$1
fi

export BALANCE

# The mint amount is fixed into inscriptions/mint_unifat_example.json. If you update this file update MINT variable.
export MINT=19

for i in {0..7}; do
    # Take the next balance to avoid `LESS_FEES` error. Not work every time...
    export TOTAL=$((BALANCE + MINT))
    if [ "$TOTAL" -ge 21 ] && [ "$TOTAL" -lt 42 ]; then
        export FEES=0.012
        export NEAR=$((MINT * FEES))
    elif [ "$TOTAL" -ge 42 ] && [ "$TOTAL" -lt 63 ]; then
        export FEES=0.015
        export NEAR=$((MINT * FEES))
    elif [ "$TOTAL" -ge 63 ] && [ "$TOTAL" -lt 84 ]; then
        export FEES=0.018
        export NEAR=$((MINT * FEES))
    elif [ "$TOTAL" -ge 84 ] && [ "$TOTAL" -lt 105 ]; then
        export FEES=0.024
        export NEAR=$((MINT * FEES))
    elif [ "$TOTAL" -ge 105 ] && [ "$TOTAL" -lt 147 ]; then
        export FEES=0.036
        export NEAR=$((MINT * FEES + 0.01))
    elif [ "$TOTAL" -ge 147 ]; then
        export FEES=0.024
        export NEAR=$((MINT * FEES))
    fi

    call_near_contract "$NEAR NEAR"
    # Export the new balance but doesn't check if previous command fails! 
    # TODO: Update balance ONLY if call_near_contract succeded!
    export BALANCE=$TOTAL
    # Wait 120 seconds before each mint. 
    # If you want update this change 120 for an another integer. 
    # You can provide other durations in minutes, hours, ...
    wait_function 120
done
