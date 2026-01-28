include { FASTQC_RAW }     from './modules/fastqc_raw'
include { CUTADAPT }       from './modules/cutadapt'
include { ALIGN }          from './modules/bwa_align'
include { VARIANTS }       from './modules/bcftools_call'
workflow WORKFLOW_MAIN {
    take:
    fastq
    ref

    main:
    FASTQC_RAW(fastq)

    trimmed = CUTADAPT(fastq)

    bam = ALIGN(trimmed, ref)
    
    VARIANTS(bam, ref)
}