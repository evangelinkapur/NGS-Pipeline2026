process BWA_ALIGN {
    tag "${fastq.baseName}"
    
    input:
        path fastq
        path ref
        path ref_index  // Add this to capture index files
    
    output:
        path "${fastq.baseName}.bam"
    
    script:
    """
    ${params.bwa} mem ${ref} ${fastq} |
    ${params.samtools} sort -o ${fastq.baseName}.bam
    """
}
