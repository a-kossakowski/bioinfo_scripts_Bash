#!/bin/bash
# seq_stats.sh: calculates statistics for protein sequences

if [ $# -ne 1 ]; then
    echo "Usage: $0 <sequence_file>"
    exit 1
fi

sequence_file=$1

# calculate sequence length and average length
echo "Sequence Statistics:"
awk '/^>/ {
        if (seq) {
            print seq_id " - Length: " length(seq)
            total_length += length(seq)
            sequence_count++
        }
        seq_id = substr($0, 2)
        seq=""
    }
    !/^>/ {
        seq=seq""$0
    }
    END {
        print seq_id " - Length: " length(seq)
        total_length += length(seq)
        sequence_count++
        printf "Average Length: %d\n", total_length / sequence_count
    }' $sequence_file

# count number of sequences
seq_count=$(grep -c "^>" $sequence_file)
echo "Sequence count: $seq_count"



