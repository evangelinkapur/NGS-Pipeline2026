params.fastq = "data/*.fastq"
params.ref_dir = "reference"

include { WORKFLOW_MAIN } from './workflows/workflow'
workflow {

    fastq_ch = channel.fromPath(params.fastq)
    ref_ch   = channel.value(file(params.ref_dir))

    WORKFLOW_MAIN(
         fastq_ch,
           ref_ch
    )
}