#!/bin/bash
# Complete NGS Variant Calling Pipeline

# Paths
DATA_DIR="/mnt/e/NGS/data"
REF_DIR="/mnt/e/NGS/reference"
RESULTS_DIR="/mnt/e/NGS/results"

# Files
RAW_FASTQ="fastq_test.fastq"
TRIMMED_FASTQ="fastq_test_trimmed.fastq"
REFERENCE="ref.fa"

# Create output folders
mkdir -p ${RESULTS_DIR}/fastqc_raw
mkdir -p ${RESULTS_DIR}/fastqc_trimmed
mkdir -p ${RESULTS_DIR}/alignment
mkdir -p ${RESULTS_DIR}/variants

# Step 1: Initial Quality Control
echo "Step 1: Initial Quality Control (FastQC)"
fastqc ${DATA_DIR}/${RAW_FASTQ} -o ${RESULTS_DIR}/fastqc_raw

# Step 2: Adapter Trimming
echo "Step 2: Adapter Trimming (Cutadapt)"
cutadapt -a AGATCGGAAGAGC \
-o ${DATA_DIR}/${TRIMMED_FASTQ} \
${DATA_DIR}/${RAW_FASTQ}

# Step 3: Second Quality Control
echo "Step 3: Quality Control after Trimming"
fastqc ${DATA_DIR}/${TRIMMED_FASTQ} -o ${RESULTS_DIR}/fastqc_trimmed

# Step 4: Alignment
echo "Step 4: Alignment using BWA"
bwa index ${REF_DIR}/${REFERENCE}
bwa mem ${REF_DIR}/${REFERENCE} ${DATA_DIR}/${TRIMMED_FASTQ} > ${RESULTS_DIR}/alignment/aligned.sam

# Step 5: SAM to BAM
echo "Step 5: Converting SAM to BAM"
samtools view -Sb ${RESULTS_DIR}/alignment/aligned.sam > ${RESULTS_DIR}/alignment/aligned.bam

# Step 6: Sorting BAM
echo "Step 6: Sorting BAM file"
samtools sort ${RESULTS_DIR}/alignment/aligned.bam -o ${RESULTS_DIR}/alignment/aligned_sorted.bam

# Step 7: Variant Calling
echo "Step 7: Variant Calling (BCFtools)"
bcftools mpileup -f ${REF_DIR}/${REFERENCE} \
${RESULTS_DIR}/alignment/aligned_sorted.bam > ${RESULTS_DIR}/variants/variants.bcf

bcftools call -mv -Ov \
${RESULTS_DIR}/variants/variants.bcf > ${RESULTS_DIR}/variants/variants.vcf

# Step 8: Filtering Variants
echo "Step 8: Filtering Variants"
bcftools filter -i 'QUAL>20' \
${RESULTS_DIR}/variants/variants.vcf > ${RESULTS_DIR}/variants/filtered_variants.vcf

echo "Pipeline completed successfully!"
