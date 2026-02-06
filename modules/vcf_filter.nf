process VCF_FILTER {
    publishDir "results/variants_filtered", mode: 'copy'
    
    tag "${vcf.baseName}"
    
    input:
        path vcf
    
    output:
        path "${vcf.baseName}_filtered.vcf"
    
    script:
    """
    ${params.bcftools} filter \
        -i 'QUAL>20 && DP>10' \
        -o ${vcf.baseName}_filtered.vcf \
        ${vcf}
    """
}