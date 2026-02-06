process FASTQC_TRIMMED {
    publishDir "results/fastqc_trimmed", mode: 'copy'
    
    tag "${fastq.baseName}"
    
    input:
        path fastq
    
    output:
        path "*.html"
        path "*.zip"
    
    script:
    """
    ${params.fastqc} ${fastq}
    """
}