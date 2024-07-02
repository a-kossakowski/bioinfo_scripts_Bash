#!/bin/bash
# seq_manipulate.sh: performs basic manipulations on protein sequences

if [ $# -lt 2 ]; then
    echo "Usage: $0 <sequence_file> <action>"
    echo "Actions: to_low"
    exit 1
fi

sequence_file=$1
action=$2

case $action in
    to_low)
        # convert seqs to lowercase
        awk '/^>/ {if (seq) print tolower(seq); print; seq=""} !/^>/ {seq=seq""$0} END {print tolower(seq)}' $sequence_file
        ;;
    *)
        echo "Invalid action: $action"
        exit 1
        ;;
esac

