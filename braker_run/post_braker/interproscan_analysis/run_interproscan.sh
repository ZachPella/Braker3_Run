def run_interproscan_analysis():
    """
    Run InterProScan to annotate protein sequences with domain and functional information.

    This function sets up the necessary input and output directories, loads the InterProScan module,
    and runs InterProScan on the protein sequence file `braker.aa`. The results are saved in the 
    specified output directory in TSV format.

    Parameters
    ----------
    INPUT_DIR : str
        Directory where the input protein sequences (in FASTA format) are located.
    
    OUTPUT_DIR : str
        Directory where the results of the InterProScan analysis will be saved.
    
    INPUT_FILE : str
        Name of the input file containing protein sequences (assumed to be in FASTA format).
    
    OUTPUT_FILE : str
        Name of the output file to save the InterProScan results in TSV format.

    Notes
    -----
    - The input file `braker.aa` is assumed to be located in the `INPUT_DIR` directory.
    - The output file `interproscan_results.tsv` will be written to the `OUTPUT_DIR` directory.
    - The function uses the `module load interproscan` command to load the InterProScan module.
    - The InterProScan tool will annotate the protein sequences in `braker.aa` and save the results in the specified format.
    
    Example
    -------
    >>> run_interproscan_analysis()
    InterProScan analysis completed. Results are in /braker_run/post_braker/interproscan_analysis/interproscan_results.tsv
    """
    
    # Set up the input and output directories
    INPUT_DIR="/braker_run/proteins"
    OUTPUT_DIR="/braker_run/post_braker/interproscan_analysis"
    INPUT_FILE="/braker_run/proteins/braker.aa"
    OUTPUT_FILE="interproscan_results.tsv"

    # Load the InterProScan module (if applicable)
    module load interproscan

    # Create output directory if it doesn't exist
    mkdir -p $OUTPUT_DIR

    # Run InterProScan
    interproscan.sh -i $INPUT_DIR/$INPUT_FILE -o $OUTPUT_DIR/$OUTPUT_FILE -f tsv

    echo "InterProScan analysis completed. Results are in $OUTPUT_DIR/$OUTPUT_FILE"
