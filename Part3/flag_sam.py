#!/usr/bin/env python
import re
in_file = "aligned/aligned_19_3F_Mus_musculus.GRCm39.107_star2.7.10a.Aligned.out.sam"

mapped = 0
unmapped = 0
count = 0
with open(in_file,"r") as fr:
    for line in fr:
        if not line.startswith('@'):
            count += 1
            if count % 1000000 == 0:
                print('Line Number: ', count)
            line = line.strip()
            header = line.split()[0]
            flag = line.split()[1]
            sec_seq = ((int(flag) & 256) !=256) 
            if((int(flag) & 4) != 4) and sec_seq:
                mapped += 1
            elif ((int(flag) & 4) == 4) and sec_seq:
                unmapped += 1

print(f"The number of reads that are properly mapped are: {mapped}")
print(f"The number of reads that aren't mapped are: {unmapped}")


#RESULTS
#The number of reads that are properly mapped are: 21851108
#The number of reads that aren't mapped are: 1645850
