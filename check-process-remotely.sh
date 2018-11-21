#!/bin/bash

SID_FILE="$1"
PASSWORD="$2"
COMMAND_TO_EXECUTE='ps aux |grep [d]hclient | tr -s " " | cut -d" " -f9,16'
PATH=$PATH:${PWD}

if ! [ -r "${SID_FILE}" -a -n "${PASSWORD}" ]; then
    echo -e "\nUsage:\n\t$0 <sid_file> <root user pwd>\n" 
    exit 1
fi

if ! which sshpass &>/dev/null; then
    echo "You should copy sshpass to your current or PATH directory"
    exit 1
fi

while read sid; do 
    echo "Running script on $sid..."
    sshpass -p "$PASSWORD" ssh sasha@$sid ${COMMAND_TO_EXECUTE} </dev/null \
    || echo "Unable execute the request on $sid"
done < $SID_FILE