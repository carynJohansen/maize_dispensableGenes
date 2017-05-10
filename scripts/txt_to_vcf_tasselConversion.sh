#!/bin/bash -l
#SBATCH -D /home/caryn89/Projects/dispensableGenes/data/processed
#SBATCH -J convert_Txt_to_VCF
#SBATCH -o /home/caryn89/slurm_logs/txt_to_vcf_%j.out
#SBATCH -e /home/caryn89/slurm_logs/txt_to_vcf_%j.err
#SBATCH -t 1:00:00
#SBATCH --mail-type=FAIL
#SBATCH --mail-type=END
#SBATCH --mail-user=cjohansen@ucdavis.edu
#SBATCH --mem 20000

set -e
set -u

############
# MODULES  #

module load jdk/1.8
module load tassel

############
#   DATA   #

txtfile="/home/caryn89/Projects/dispensableGenes/data/processed/maize_414genotypes_485179SNPs_working_SNP_set.txt"

vcf="/home/caryn89/Projects/dispensableGenes/data/processed/maize_414genotypes_workingSNPs.vcf"

############
#   MAIN   #

run_pipeline.pl -Xmx20g -fork1 -importGuess $txtfile -export $vcf -exportType VCF -runfork1

