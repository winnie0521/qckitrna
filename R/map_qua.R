#' mapping quality
#'
#' @param bamfile path to bam file
#' @export

map_qua <- function(bamfile){

  p_mapq <- ScanBamParam(what=scanBamWhat(),flag=scanBamFlag(isUnmappedQuery = FALSE))
  mapq = scanBam(bamfile, param=p_mapq)[[1]]$mapq
  return(mapq)
}
