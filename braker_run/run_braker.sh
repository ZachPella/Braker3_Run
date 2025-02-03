#!/bin/bash
#SBATCH --time=7-00:00:00
#SBATCH --mem-per-cpu=20G
#SBATCH --job-name=braker_rerun
#SBATCH --output=braker_re.%j.out
#SBATCH --error=braker_re.%j.err
#SBATCH --cpus-per-task=8
#SBATCH --partition=batch

# Directory setup
WORK_DIR="/user/main"  # Updated to reflect the GitHub structure
FAKE_HOME="$WORK_DIR/braker_run/fake_home"
FAKE_AUGUSTUS="$FAKE_HOME/.augustus"  # Corrected path for .augustus

# Create directories if they don't exist (instead of removing)
echo "🏗️ Setting up directories..."
mkdir -p $FAKE_HOME

echo "🏗️ Setting up Augustus..."
singularity exec -B $WORK_DIR:$WORK_DIR $WORK_DIR/braker3.sif \
cp -R /opt/Augustus/config $FAKE_AUGUSTUS

echo "🔑 Setting up permissions..."
chmod -R 777 $FAKE_HOME

echo "🚀 Starting BRAKER..."
HOME=$FAKE_HOME singularity exec \
--home $FAKE_HOME \
-B $WORK_DIR:$WORK_DIR \
-B $FAKE_HOME:$FAKE_HOME \
$WORK_DIR/braker3.sif \
braker.pl \
--genome=$WORK_DIR/braker_run/genomes/reference_genome.masked \
--prot_seq=$WORK_DIR/braker_run/proteins/proteins.fa \
--rnaseq_sets_ids=SRR609857,SRR609878,SRR609884,SRR609893,SRR609894,SRR609951 \
--species=namericanus \
--workingdir=$WORK_DIR/braker_run \
--AUGUSTUS_CONFIG_PATH=$FAKE_AUGUSTUS \
--verbosity=3 \
--threads=8
