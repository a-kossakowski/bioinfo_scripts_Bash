# Protein Sequence Analyzer Project

This GitHub project is a collection of Bash scripts designed for intermediate level bioinformatics analysis, specifically in the field of proteomics. These scripts facilitate various tasks such as motif identification, sequence manipulation, and statistical analysis of protein sequences.

## Scripts Description

### 1. find_motifs.sh
- **Purpose**: Identifies specified motifs within protein sequences.
- **Usage**: `bash find_motifs.sh <sequence_file> <motif>`

### 2. seq_manipulate.sh
- **Purpose**: Performs basic manipulations on protein sequences, such as converting sequences to lowercase.
- **Usage**: `bash seq_manipulate.sh <sequence_file> <action>`
- **Supported Actions**: `to_low` for converting sequences to lowercase.

### 3. seq_stats.sh
- **Purpose**: Calculates statistics for protein sequences, including sequence length and average length.
- **Usage**: `bash seq_stats.sh <sequence_file>`

### 4. setup.sh
- **Purpose**: Checks for the presence of required software (awk, sed, grep) and prepares the environment for analysis.
- **Usage**: `bash setup.sh`

### 5. test_scripts.sh
- **Purpose**: Provides a simple way to test the functionality of the scripts using example data.
- **Usage**: `bash test_scripts.sh`

## Getting Started

To use these scripts, clone this repository to your local machine and ensure you have the necessary permissions to execute the scripts. Run the `setup.sh` script first to check for required dependencies.

```bash
chmod +x *.sh
./setup.sh

