process FASTQC_TRIMMED {

    tag "${fastq.baseName}"

    input:
    path fastq

    output:
    path "*_fastqc.html"
    path "*_fastqc.zip"

    script:
    """
    fastqc $fastq
    """
}