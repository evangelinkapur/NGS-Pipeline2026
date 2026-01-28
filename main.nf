params.fastq = "data/*.fastq"
params.ref_dir = "reference"
params.samtools = "/home/evangelin17/ENTER/envs/bnf/bin/samtools"
params.bwa = "/home/evangelin17/ENTER/envs/bnf/bin/bwa"
params.fastqc ="/home/evangelin17/ENTER/envs/bnf/bin/fastqc"

include { WORKFLOW_MAIN } from './workflow'

workflow {

    fastq_ch = channel.fromPath(params.fastq)
    ref_ch   = channel.value(file(params.ref_dir))

    WORKFLOW_MAIN(
        fastq_ch,
        ref_ch
    )
}