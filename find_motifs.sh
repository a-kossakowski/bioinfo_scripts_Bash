#!/bin/bash
# find_motifs.sh: identifies specified motifs in sequences

if [ $# -ne 2 ]; then
    echo "Usage: $0 <sequence_file> <motif>"
    exit 1
fi

sequence_file=$1
motif=$2

# search for motifs
echo "Searching for motifs: $motif"
awk -v motif="$motif" '
    /^>/ {
        if (seq && found_motif) {
            print seq_id ": " seq
        }
        seq_id = substr($0, 2)
        seq=""
        found_motif=0
    }
    !/^>/ {
        seq=seq""$0
        if ($0 ~ motif) {
            split($0, parts, motif);
            seq = parts[1] "__" motif "__" parts[2]
            found_motif=1
        }
    }
    END {
        if (seq && found_motif) {
            print seq_id ": " seq
        }
    }
' $sequence_file

