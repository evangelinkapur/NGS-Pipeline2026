process CUTADAPT {
     publishDir "results/cutadapt", mode: 'copy'
    tag "${fastq.baseName}"

    input:
    path fastq

    output:
    path "${fastq.baseName}_trimmed.fastq"

    script:
    """
    ${params.cutadapt} -a ${params.adapter} -o ${fastq.baseName}_trimmed.fastq $fastq
    """
}