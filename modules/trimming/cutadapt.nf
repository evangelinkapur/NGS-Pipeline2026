process CUTADAPT {

    tag "${fastq.baseName}"

    input:
    path fastq

    output:
    path "${fastq.baseName}_trimmed.fastq"

    script:
    """
    cutadapt -q 20 -o ${fastq.baseName}_trimmed.fastq $fastq
    """
}