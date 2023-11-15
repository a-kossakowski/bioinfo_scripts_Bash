#!/bin/bash

# Read each ID (\n separated) from the file
while read id; do
    # Use awk to extract the sequence from FASTA file
    awk -v id="$id" '
    BEGIN {RS=">"; FS="\n"}
    $0 ~ id {
        print ">"$1
        for(i=2;i<=NF;i++) print $i
    }
    ' abc
done < ID_file > FASTA_file
