process ALIGN {
     publishDir "results/trimmed", mode: 'copy'
     
     tag "${fastq.baseName}"

    input:
        path fastq
        val ref

    output:
        path "${fastq.baseName}.bam"

    script:
    """
    ${params.bwa} mem $ref $fastq | ${params.samtools} sort -o ${fastq.baseName}.bam
    ${params.samtools} index ${fastq.baseName}.bam
    """
}
