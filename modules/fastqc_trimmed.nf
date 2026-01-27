process FASTQC_TRIMMED {
    
    tag "${fastq.baseName}"

    input: 
    path fastq
    
    output:
    path "*.html"
    path "*.zip"

    script:
    """
    fastqc $fastq
    """
}