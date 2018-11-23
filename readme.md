# Task 1

A simple script to check for how long the Java process is running on the remote server and what it's port

_based on sshpass - the tool which helps of being authorized using emulation of keyboard password input_

**Files**

- `run-remotely.sh` - Script to apply in the first and the second task
- `inventory` - the file with the list of servers to check (fill in using \n for each entry)
- `sshpass` - a binary to pass the keyboard input

### Usage:
                  `run-remotely.sh <sid_file> <root user pwd> <mode option> use option 1`

=========
# Task 2

Re-creates and push a raw input about Kernel and launch parameters into "Message of the day" file;  (capable with deb & rpm based distros)

### Usage:
                  `run-remotely.sh <sid_file> <root user pwd> <mode option> use option 2`

=========
# Task 3

A parsing script to fetch the user’s friend’s name those “id” equals “2” and has ‘laborum’ tag for the given JSON file

**Files**

- `parser.py` - Main script 
  - **requirements** - python 2.5 - JSON lib
- `data.json` - File contains JSON payload

### Usage:
           >>> python parser.py

***
link to the full task description - [secret gist](https://gist.github.com/KlimDos/348fd5d2e7d05f7cd0cc287ef42616e1)