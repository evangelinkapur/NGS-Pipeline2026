params.fastq = "data/*.fastq"
params.ref   = "reference"
params.outdir = "results"

include {WORKFLOW_MAIN} from './workflow'

workflow {    
    fastq_ch = channel.fromPath(params.fastq)
    ref_ch   = channel.fromPath(params.ref)
    WORKFLOW_MAIN(fastq_ch, ref_ch)
}