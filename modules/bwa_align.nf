process ALIGN {

    tag "${fastq.baseName}"

    input:
        path fastq
        path ref_dir

    output:
        tuple path("${fastq.baseName}.bam"),
              path("${fastq.baseName}.bam.bai")

    script:
    """
    ${params.bwa} mem ${ref_dir}/ref.fa $fastq \
        | ${params.samtools} sort -o ${fastq.baseName}.bam

    ${params.samtools} index ${fastq.baseName}.bam
    """
}
