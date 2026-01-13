params.fastq = "data/*.fastq"
params.ref   = "reference/ref.fa"
params.outdir = "results"

include { FASTQC_RAW }     from './modules/qc/fastqc_raw'
include { CUTADAPT }       from './modules/trimming/cutadapt'
include { FASTQC_TRIMMED } from './modules/qc/fastqc_trimmed'
include { ALIGN }          from './modules/alignment/bwa_align'
include { VARIANTS }       from './modules/variants/bcftools_call'

workflow {
    fastq_ch = channel.fromPath(params.fastq)

    FASTQC_RAW(fastq_ch)

    trimmed_ch = CUTADAPT(fastq_ch)

    FASTQC_TRIMMED(trimmed_ch)

    bam_ch = ALIGN(trimmed_ch, params.ref)

    VARIANTS(bam_ch, params.ref)
}
