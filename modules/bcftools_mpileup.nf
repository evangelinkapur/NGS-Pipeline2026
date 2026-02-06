process BCFTOOLS_MPILEUP {

    tag "${bam.baseName}"

    input:
        tuple path(bam), path(bai)
        path ref

    output:
        path "${bam.baseName}.bcf"

    script:
    """
    ${params.bcftools} mpileup \
        -Ou \
        -f $ref \
        $bam \
        > ${bam.baseName}.bcf
    """
}
