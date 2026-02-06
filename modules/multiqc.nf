process MULTIQC {
    publishDir "results/multiqc", mode: 'copy'
    
    script:
    """
    ${params.multiqc} .
    """
}