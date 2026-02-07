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

### Input
- Single-end FASTQ files (Illumina short reads)
- Reference genome (FASTA format)

### Workflow Steps
1. Quality control of raw reads (**FastQC**)
2. Adapter trimming (**Cutadapt**)
3. Quality control of trimmed reads (**FastQC**)
4. Alignment to reference genome (**BWA-MEM**)
5. BAM indexing (**Samtools**)
6. Variant calling (**BCFtools mpileup** and **BCFtools call**)
7. Variant filtering (**BCFtools filter**)
8. Multi-sample QC report generation (**MultiQC**)

### Output
- Quality control reports (HTML)
- Trimmed FASTQ files
- Aligned BAM files with indices
- VCF files (raw and filtered variants)
- MultiQC aggregated report
- Execution reports (timeline, trace, report)

---

## Clone the Repository

Clone the GitHub repository and move into the project directory:

```bash
git clone https://github.com/evangelinkapur/NGS-Pipeline2026.git
cd NGS-Pipeline2026
````

---

## Setup Environment

### Option 1: Using Conda (Recommended)

Create and activate the Conda environment using the provided `environment.yml` file:
```bash
conda env create -f environment.yml
conda activate nextflow_pipeline
```
### Option 2: Manual Installation

Install the required tools individually:
```bash
conda create -n nextflow_pipeline -c bioconda -c conda-forge \
    nextflow fastqc cutadapt bwa samtools bcftools multiqc
conda activate nextflow_pipeline
```

---

## Prepare Your Data

### 1. Create Required Directories
```bash
mkdir -p data reference results
```

### 2. Add Your Input Files (not tracked in Git)

Place your files in the appropriate directories:

- **Raw reads**: `data/fastq_test.fastq` 
- **Reference genome**: `reference/ref.fa` 

### 3. Index the Reference Genome

Before running the pipeline, index your reference:
```bash
bwa index reference/ref.fa
```

---

## How to Run

This pipeline runs using **Nextflow (DSL2)** and **locally installed tools**.

### Input (not tracked in Git)

* Raw reads: `data/fastq_test.fastq`
* Reference genome: `reference/ref.fa`

### Run the pipeline

```bash
nextflow run main.nf
```

### Resume a stopped run

```bash
nextflow run main.nf -resume
```

---

## Tools Used

* Nextflow (DSL2)
* FastQC
* Cutadapt
* BWA
* Samtools
* BCFtools
* MultiQC

---

## Repository Structure

```text
NGS-Pipeline2026/
│
├── main.nf
├── nextflow.config
├── environment.yml
│
├── modules/                
│   ├── fastqc_raw.nf
│   ├── cutadapt.nf
│   ├── fastqc_trimmed.nf
│   ├── bwa_align.nf
│   ├── bam_index.nf
│   ├── bcftools_mpileup.nf
│   ├── bcftools_call.nf
│   ├── vcf_filter.nf
│   └── multiqc.nf
│
│── workflows/             
│   └── workflow.nf
│
├── data/                   # Input FASTQ files (not tracked)
├── reference/              # Reference genome (not tracked)
├── results/                # Pipeline outputs (not tracked)
└── work/                   # Nextflow work directory (not tracked)
```