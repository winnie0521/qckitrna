#' unique mapping
#'
#' @param bamfile the path to bam file


unq_map <- function(bamfile){

  p_um <- ScanBamParam(what=scanBamWhat(),flag=scanBamFlag(isUnmappedQuery = FALSE))
  uniq_map_r = scanBam(bamfile, param=p_um)[[1]]

  uniq_map  <- lapply(uniq_map_r, function(x)x[uniq_map_r$mapq>30])
  return(uniq_map)
}
