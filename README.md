# NGS Variant Calling Pipeline (Nextflow)

This repository contains a **modular single-end NGS variant calling pipeline**
implemented using **Nextflow DSL2**.
The pipeline performs quality control, adapter trimming, alignment, and variant
calling using standard bioinformatics tools.

This repository is designed to **track pipeline logic only**.
Large input data and reference files are intentionally excluded from version
control.

---

## Pipeline Overview

**Input**
- Single-end FASTQ files
- Reference genome directory

**Workflow Steps**
1. Quality control of raw reads (FastQC)
2. Adapter trimming (Cutadapt)
3. Alignment to reference genome (BWA-MEM)
4. BAM sorting and indexing (Samtools)
5. Variant calling (BCFtools)

---

## Tools Used

- Nextflow (DSL2)
- FastQC
- Cutadapt
- BWA
- Samtools
- BCFtools

---

## Repository Structure

```text
NGS-Pipeline2026/
├── modules/
│   ├── fastqc_raw.nf
│   ├── cutadapt.nf
│   ├── bwa_align.nf
│   └── bcftools_call.nf
├── main.nf
├── workflow.nf
├── nextflow.config
├── README.md
└── .gitignore
