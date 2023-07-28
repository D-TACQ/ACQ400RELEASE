#!/usr/bin/env python

import os
import re

DIR = './ACQ400_FPGA'

NEWFILES = {}
OLDFILES = {}

for file in os.listdir(DIR):
    if file.endswith(".bit.gz"):
        fields = re.split('[_\-\.]', file)
#        print(fields)
        if '64B' in fields:
#            print(f'{file} 64B found')
            NEWFILES[file] = fields
        elif '32B' in fields:
#            print(f'{file} 32B found')
            NEWFILES[file] = fields
        else:
            OLDFILES[file] = fields
                


#print(FILES)
#print(NOAXI)

nomatch = 0
matches = 0

for oldfile, oldfields in OLDFILES.items():
    if oldfields[0] == 'ACQ1001':
        exact_match = 4
    elif oldfields[0] == 'ACQ2106':
        exact_match = 8
    else:
        exact_match = 3
    for newfile, newfields in NEWFILES.items():

        try:
            for fn, of in enumerate(oldfields):
                if fn < exact_match and of != newfields[fn]:
                    raise Exception("no exact match")
                elif not of in newfields:
                    raise Exception("no match")
            print(f"{oldfile}")
            print(f"XXX {oldfile} is replaced by {newfile}")
            matches += 1
            break
        except:
            nomatch += 1


print(f"Total nomatch {nomatch} Total match {matches} out of {len(OLDFILES)}")









