include { FASTQC_RAW }        from '../modules/fastqc_raw'
include { CUTADAPT }          from '../modules/cutadapt'
include { FASTQC_TRIMMED }    from '../modules/fastqc_trimmed'
include { BWA_ALIGN }         from '../modules/bwa_align'
include { BAM_INDEX }         from '../modules/bam_index'
include { BCFTOOLS_MPILEUP }  from '../modules/bcftools_mpileup'
include { BCFTOOLS_CALL }     from '../modules/bcftools_call'
include { VCF_FILTER }        from '../modules/vcf_filter'
include { MULTIQC }           from '../modules/multiqc'

workflow WORKFLOW_MAIN {
    take:
        fastq
        ref_ch
        ref_index
    
    main:
        FASTQC_RAW(fastq)

        trimmed_ch = CUTADAPT(fastq)

        FASTQC_TRIMMED(trimmed_ch)

        bam = BWA_ALIGN(trimmed_ch, ref_ch, ref_index)
 
        indexed_bam_ch = BAM_INDEX(bam)

        bcf_ch = BCFTOOLS_MPILEUP(indexed_bam_ch, ref_ch)
        vcf_ch = BCFTOOLS_CALL(bcf_ch)

        filtered_vcf = VCF_FILTER(vcf_ch)

        MULTIQC()
    
    emit:
        filtered_vcf
}