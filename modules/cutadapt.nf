process CUTADAPT {
     publishDir "results/cutadapt", mode: 'copy'
    tag "${fastq.baseName}"

    input:
    path fastq

    output:
    path "${fastq.baseName}_trimmed.fastq"

    script:
    """
    cutadapt -a AGATCGGAAGAGC -o ${fastq.baseName}_trimmed.fastq $fastq
    """
}