process VARIANTS {

    tag "${bam.baseName}"

    input:
        tuple path(bam), path(bai)
        path ref_dir

    output:
        path "${bam.baseName}.vcf"

    script:
    """
    ${params.bcftools} mpileup -Ou -f ${ref_dir}/ref.fa $bam | \
    ${params.bcftools} call -mv -Ov -o ${bam.baseName}.vcf
    """
}