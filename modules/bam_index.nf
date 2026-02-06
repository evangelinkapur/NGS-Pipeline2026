process BAM_INDEX {

    tag "${bam.baseName}"

    input:
        path bam

    output:
        tuple path(bam),
              path("${bam}.bai")

    script:
    """
    ${params.samtools} index $bam
    """
}
