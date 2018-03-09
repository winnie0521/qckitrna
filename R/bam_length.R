#’ length of entire bam file


bam_length <- function(bamfile){
  p_total <- ScanBamParam(what=scanBamWhat(),flag=scanBamFlag())
  bam_total <- scanBam(bamfile, param=p_total)[[1]]
  return(length(bam_total$qname))
}
