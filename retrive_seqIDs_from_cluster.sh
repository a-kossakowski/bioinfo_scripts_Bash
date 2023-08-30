#!/bin/bash

# Define the path to the clusters.tsv file
clusters_file="/path/to/clusters.tsv"

# Define the path to the BLAST_ref_vs_EDF file
blast_results_file="/path/to/BLASTp_res"

# Read each line from clusters.tsv
while IFS=$'\t' read -r id num; do
  # Initialize an empty file for each ID
  output_file="${id}.txt"
  echo -n > "${output_file}"

  # Use grep to find lines in the BLASTp results file that contain the ID,
  # take 'num' lines of them, and extract the 4th field (assuming '|' as the field separator)
  grep "${id}" "${blast_results_file}" | head -n "${num}" | awk -F'|' '{print $4}' >> "${output_file}"
done < "${clusters_file}"  # Predefined number of sequences in each cluster of proteins for each group
