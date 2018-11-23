#!/bin/bash

#provide the file with the server IP's/hostnames
SID_FILE="$1"
#password in case if we are using pass auth instead key-auth
PASSWORD="$2"
# specify the command to execute
MODE="$3"
#adding current dir to PATH to be able to use sshpass tool
PATH=$PATH:${PWD}
NEW_LINE='echo -e "\n" >> /etc/motd'

# simple check for proper command usage
if ! [ -r "${SID_FILE}" -a -n "${PASSWORD}" -a -n "${MODE}" ]; then
    echo -e "\nUsage:\n\t$0 <sid_file> <root user pwd> <mode option> could be 1/2 \n" 
    exit 1
fi

# check the ability of sshpass to be executed 
if ! which sshpass &>/dev/null; then
    echo "You should copy sshpass to your current or PATH directory"
    exit 1
fi

#command which we would like to execute
if [ ${MODE} -eq 1 ]; then
    COMMAND_TO_EXECUTE='ps aux |grep [d]hclient | tr -s " " | cut -d" " -f5,16'
elif [ ${MODE} -eq 2 ]; then
    COMMAND_TO_EXECUTE=" > /etc/motd && ${NEW_LINE} && cat /proc/version >> /etc/motd && ${NEW_LINE} && cat /proc/cmdline >> /etc/motd && ${NEW_LINE}"
else
    echo -e "\nUsage:\n\t$0 <sid_file> <root user pwd> <mode option> could be 1/2 \n" 
    exit 1
fi


# the main loop
while read sid; do 
    echo -e "Running \e[100m$COMMAND_TO_EXECUTE\033[m on $sid..."
    sshpass -p "$PASSWORD" ssh root@$sid ${COMMAND_TO_EXECUTE} </dev/null \
    || echo "Unable execute the request on $sid"
done < $SID_FILE