
# NGS Variant Calling Pipeline

This repository contains a **complete single-end NGS variant calling pipeline** implemented using standard bioinformatics tools.

---

## Input files
- fastq_test.fastq (single-end sequencing reads)

---

## Reference genome
- ref.fa (user-provided reference genome)

---

## Tools used
- FastQC
- Cutadapt
- BWA
- Samtools
- BCFtools

---

## Steps performed

1. Initial Quality Control 
   Quality assessment of raw sequencing reads using FastQC.

2. Adapter Trimming 
   Removal of adapter sequences and low-quality bases using Cutadapt.

3. Second Quality Control 
   Quality reassessment of trimmed reads using FastQC.

4. Alignment 
   Alignment of trimmed reads to the reference genome using BWA-MEM.

5. SAM to BAM Conversion 
   Conversion of SAM alignment file to compressed BAM format using Samtools.

6. BAM Sorting 
   Sorting of BAM file based on genomic coordinates.

7. Variant Calling 
   Identification of SNPs and small INDELs using BCFtools.

8. Variant Filtering 
   Filtering of low-quality variants based on quality score thresholds.

---

## Output files
- FastQC HTML and ZIP reports
- Trimmed FASTQ file
- Aligned SAM and BAM files
- Sorted BAM file
- Raw and filtered VCF files

---

## How to run

```bash
cd scripts
chmod +x pipeline.sh
./pipeline.sh
```
