process CUTADAPT {

    tag "$fastq.baseName"

    input:
    path fastq

    output:
    path "trimmed_*.fastq"

    script:
    """
    cutadapt -a AGATCGGAAGAGC \
    -o trimmed_${fastq.baseName}.fastq \
    $fastq
    """
}
