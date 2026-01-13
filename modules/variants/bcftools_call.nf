process VARIANTS {
    tag "$bam.baseName"

    input: 
    path bam
    path ref

    output:
    path "*.vcf"

    script:
    """
    bcftools mpileup -f $ref $bam | 
    bcftools call -mv -Ov -o ${bam.baseName}.vcf
    """"
}