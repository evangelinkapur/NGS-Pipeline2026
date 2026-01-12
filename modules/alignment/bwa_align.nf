process ALIGN {

    tag "$fastq.baseName"

    input:
    path fastq
    path ref

    output:
    path "aligned_sorted.bam"

    script:
    """
    bwa index $ref
    bwa mem $ref $fastq | \
    samtools view -Sb | \
    samtools sort -o aligned_sorted.bam
    """
}
