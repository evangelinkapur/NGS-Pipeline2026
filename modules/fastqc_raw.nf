process FASTQC_RAW {

    tag "${fastq.baseName}"

    input:
    path fastq

    output:
    path "*.html"
    path "*.zip"

    script:
    """
    ${params.fastqc} $fastq
    """
}