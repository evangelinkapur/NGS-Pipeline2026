process BCFTOOLS_CALL {
    publishDir "results/variants", mode: 'copy'
    
    tag "${bcf.baseName}"
    
    input:
        path bcf
    
    output:
        path "${bcf.baseName}.vcf"
    
    script:
    """
    ${params.bcftools} call \
        -m \
        -A \
        -Ov \
        -o ${bcf.baseName}.vcf \
        $bcf
    """
}
