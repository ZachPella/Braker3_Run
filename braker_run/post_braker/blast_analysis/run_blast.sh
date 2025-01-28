def run_blast_analysis():
    """
    Perform BLAST analysis to compare protein and nucleotide sequences against a protein database.

    This function runs two types of BLAST searches: BLASTP and BLASTX. BLASTP is used to compare 
    protein sequences against a protein database, while BLASTX translates nucleotide sequences into 
    protein sequences and compares those against the same protein database.

    Steps:
    1. Creates a BLAST database using a specified protein FASTA file 'c_elegans_proteins.fasta'. 
    2. Runs a BLASTP search to compare the protein sequences (`braker.aa`) against the protein database.
    3. Runs a BLASTX search to compare the nucleotide sequences (`braker.codingseq`) against the protein database.

    Parameters
    ----------
    None

    Returns
    -------
    None

    Notes
    -----
    - The protein database is created from the FASTA file 'c_elegans_proteins.fasta'.
    - The BLASTP search compares protein sequences from the file `braker.aa` to the protein database.
    - The BLASTX search compares nucleotide sequences from the file `braker.codingseq` to the same protein database.
    - Output is saved in tabular format (`-outfmt 6`) to `blastp_results.txt` and `blastx_results.txt`.

    Example
    -------
    >>> run_blast_analysis()
    (This runs the BLASTP and BLASTX searches and saves the results to corresponding output files.)

    """
    # Load necessary modules
    module load blast

    # Define the path to the proteins directory
    PROTEINS_DIR="/braker_run/proteins"

    # Create BLAST database
    makeblastdb -in $PROTEINS_DIR/c_elegans_proteins.fasta -dbtype prot -out $PROTEINS_DIR/C_elegans_proteome_db

    # Run BLASTP
    blastp -query $PROTEINS_DIR/braker.aa -db $PROTEINS_DIR/C_elegans_proteome_db -out $PROTEINS_DIR/blastp_results.txt -evalue 1e-10 -outfmt 6

    # Run BLASTX
    blastx -query $PROTEINS_DIR/braker.codingseq -db $PROTEINS_DIR/C_elegans_proteome_db -out $PROTEINS_DIR/blastx_results.txt -evalue 1e-10 -outfmt 6
