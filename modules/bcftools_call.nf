process VARIANTS {
    tag "${bam.baseName}"

    input: 
    path bam
    path ref

    output:
    path "${bam.baseName}.vcf"

    script:
    """
    bcftools mpileup -f $ref $bam | bcftools call -mv -o ${bam.baseName}.vcf
   """
}