#!/usr/bin/env python

"""
make_compatible_fpga_links.py make softlinks for all compatible payload combos for a personality.


ACQ2106_TOP_A5_ff_ff_ff_ff_ff -> ACQ2106_TOP_A5_A5_A5_A5_A5_A5
ACQ2106_TOP_A5_A5_ff_ff_ff_ff -> ACQ2106_TOP_A5_A5_A5_A5_A5_A5
ACQ2106_TOP_A5_A5_A5_ff_ff_ff -> ACQ2106_TOP_A5_A5_A5_A5_A5_A5
ACQ2106_TOP_A5_A5_A5_A5_ff_ff -> ACQ2106_TOP_A5_A5_A5_A5_A5_A5
ACQ2106_TOP_A5_A5_A5_A5_A5_ff -> ACQ2106_TOP_A5_A5_A5_A5_A5_A5


"""

import os

FPGAD="./MNT/fpga.d"

SITE1 = 2

def get_nsites(fields):
    carrier = fields[0]
    if carrier == 'ACQ2106':
        return 6
    elif carrier == 'ACQ1001':
        return 2
    elif carrier.startswith("KMCU"):
        return 2
    else:
        print("# WARNING: ignoring CARRIER {}".format(carrier))
        return -1

verbose = False
#verbose = True

files = os.listdir(FPGAD)

print("#!/bin/bash")
print("cd {}".format(FPGAD))

for name in files:
    if verbose:
        print(name)
    fields = name.split('.')[0].split('_')
    nsites = get_nsites(fields)
    if nsites > 0:
        m1 = fields[SITE1]
        ndup = 0
        for f in fields[SITE1+1:]:
            if verbose:
                print("ndup {} f0:{} m1:{} f:{}".format(ndup, fields[0], m1, f))
            if f == m1:
                ndup += 1
            else:
                break

        if verbose:
            print("ndup={} f0:{} range({}, {})".format(ndup, fields[0], SITE1+1,SITE1+1+ndup) )
            print("ndup={} f0:{} range {}".format(ndup, fields[0], range(SITE1+1,SITE1+1+ndup) ))

        for id in range(SITE1+1,SITE1+1+ndup):
            fields2 = fields.copy()
            for ff in range(id,SITE1+1+ndup):
                fields2[ff] = 'ff'
            print("ln -s {} {}.bit.gz".format(name, '_'.join(fields2)))
