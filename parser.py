
import json
# initialize a list
dataitem = []
# read payload
with open('data.json', 'r') as data:
    dataitem = json.load(data)
# the main loop   
for num in range(len(dataitem)):
    if "laborum" in dataitem[num]['tags']:
        for friends in dataitem[num]['friends']:
            if "id" in friends and friends["id"] == 2:
                print(friends['name'])