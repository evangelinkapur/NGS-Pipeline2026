include { FASTQC_RAW }     from './modules/fastqc_raw'
include { CUTADAPT }       from './modules/cutadapt'
include { FASTQC_TRIMMED } from './modules/fastqc_trimmed'
include { ALIGN }          from './modules/bwa_align'
include { VARIANTS }       from './modules/bcftools_call'
workflow WORKFLOW_MAIN {

    take:
        fastq_input
        ref_input

    main:
        raw_qc      = FASTQC_RAW(fastq_input)

        trimmed_fq  = CUTADAPT(fastq_input)

        trimmed_qc  = FASTQC_TRIMMED(trimmed_fq)

        bam         = ALIGN(trimmed_fq, ref_input)

        variants    = VARIANTS(bam, ref_input)

    emit:
        raw_qc
        trimmed_qc
        bam
        variants
}