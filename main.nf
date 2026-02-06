params.fastq = "data/fastq_test.fastq"  // Specify exact file
params.ref   = "reference/ref.fa"

include { WORKFLOW_MAIN } from './workflows/workflow'

workflow {
    fastq_ch = channel.fromPath(params.fastq, checkIfExists: true)
    ref_ch   = channel.value(file(params.ref))
    ref_index = channel.fromPath("${params.ref}.*").collect()
    
    WORKFLOW_MAIN(
        fastq_ch,
        ref_ch,
        ref_index
    )
}