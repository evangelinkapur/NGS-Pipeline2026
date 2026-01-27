process FASTQC_TRIMMED {

    //tag "${fastq.baseName}"

    input:
        path trimmed

    output:
         path "*_fastqc.*"
        //path "${fastq.baseName}_fastqc.html"
        //path "${fastq.baseName}_fastqc.zip"
        //path "${fastq.baseName}_fastqc"

    script:
    """
    ${params.fastqc} -o . $trimmed
    """
}