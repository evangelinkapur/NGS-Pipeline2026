process ALIGN {

    tag "${fastq.baseName}"

    input: 
    path fastq
    path ref

    output:
    path "${fastq.baseName}.bam"

    script:
    """
    bwa men $ref $fastq | samtools sort -o ${fastq.baseName}.bam
    samtools index ${fastq.baseName}.bam
    """
}