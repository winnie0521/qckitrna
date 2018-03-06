#' return name of unmapped reads
#'
#' @param bamfile the path to the bam file


unmapped_reads <- function(bamfile){

  p2 <- ScanBamParam(what=scanBamWhat(),flag=scanBamFlag(isUnmappedQuery = TRUE))
  unmap = scanBam(bamfile, param=p2)[[1]]$qname
  return(unmap)

}
