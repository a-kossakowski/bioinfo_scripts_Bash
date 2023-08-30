#!/bin/bash

# Define the path to the directory containing the .fasta files
fasta_dir="/path/to/fasta/files/"

# Define the path to the WoLFPSort tool
wolfpsort_path="/path/to/WoLFPSort/bin/runWolfPsortSummary"

# Loop through each .fasta file in the directory
for file in "${fasta_dir}"*.fasta; do
    # Run WoLFPSort on the .fasta file and save the output to a .wolfp file
    "${wolfpsort_path}" fungi < "${file}" > "${file%%.*}.wolfp"
done

# Loop through each .wolfp file in the current directory
for file in *.wolfp; do
    # List of cellular locations to search for
    locations=("cyto" "cysk" "nucl" "mito" "plas" "pero" "vacu" "E.R." "extr" "golg" "lyso")

    # Loop through each cellular location and calculate the average score
    for loc in "${locations[@]}"; do
        grep -oP "${loc}\s+\K\w+" "${file}" | awk -v location="${loc}" 'BEGIN{i=0;sum=0;} /^[0-9]/{sum += $1; i+=1;} END{ if (i > 0) print location " " sum/i;}' >> "${file}.loc"
    done
done
