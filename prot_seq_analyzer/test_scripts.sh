#!/bin/bash

# examples for testing purposes
echo "Test for seq_stats.sh:"
bash ./seq_stats.sh protein_sequences.fasta
echo "----------------------------------------"
echo "Test for find_motifs.sh:"
bash ./find_motifs.sh protein_sequences.fasta GLKNVF
echo "----------------------------------------"
echo "Test for eq_manipulate.sh:"
bash ./seq_manipulate.sh protein_sequences.fasta to_low

