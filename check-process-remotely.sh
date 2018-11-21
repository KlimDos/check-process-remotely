#!/bin/bash

#provide the file with the server IP's/hostnames
SID_FILE="$1"
#password in case if we are using pass auth instead key-auth
PASSWORD="$2"
#command which we would like to execute
COMMAND_TO_EXECUTE='ps aux |grep [d]hclient | tr -s " " | cut -d" " -f9,16'
#adding current dir to PATH to be able to use sshpass tool
PATH=$PATH:${PWD}
# simple check for proper command usage
if ! [ -r "${SID_FILE}" -a -n "${PASSWORD}" ]; then
    echo -e "\nUsage:\n\t$0 <sid_file> <root user pwd>\n" 
    exit 1
fi
# check the ability of sshpass to be executed 
if ! which sshpass &>/dev/null; then
    echo "You should copy sshpass to your current or PATH directory"
    exit 1
fi
# the main loop
while read sid; do 
    echo "Running script on $sid..."
    sshpass -p "$PASSWORD" ssh sasha@$sid ${COMMAND_TO_EXECUTE} </dev/null \
    || echo "Unable execute the request on $sid"
done < $SID_FILE