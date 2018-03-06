#' unique mapping
#'
#' @param bamfile the path to bam file
#' @param quality set default to 30


unq_map <- function(bamfile,quality=30,option){

  p_um <- ScanBamParam(what=scanBamWhat(),flag=scanBamFlag(isUnmappedQuery = FALSE))
  uniq_map_r = scanBam(bamfile, param=p_um)[[1]]

  uniq_map  <- lapply(uniq_map_r, function(x)x[uniq_map_r$mapq>quality])

  length <- bam_length(bamfile)
  if (option == "count") return(length(uniq_map$qname))
  if (option == "rate") return(length(uniq_map$qname)/length)
}
