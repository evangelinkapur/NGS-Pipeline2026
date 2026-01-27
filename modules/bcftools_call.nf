process VARIANTS {
    tag "bcftools"

    input: 
    path bam
    path bai
    path ref

    output:
    path "variants.vcf"
    path "filtered_variants.vcf"

    script:
    """
    bcftools mpileup -f $ref $bam > variants.bcf
    bcftools call -mv variants.bcf > variants.vcf
    bcftools filter -i 'QUAL>20' variants.vcf > filtered_variants.vcf
    """
}