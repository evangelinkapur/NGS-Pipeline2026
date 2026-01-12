process VARIANTS {

    tag "variant_calling"

    input:
    path bam
    path ref

    output:
    path "variants.vcf"

    script:
    """
    bcftools mpileup -f $ref $bam | \
    bcftools call -mv -Ov -o variants.vcf
    """
}
