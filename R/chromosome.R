#' chromosome
#'
#' @param bamfile path to bam file
#'


chromosome <- function(bamfile){

  p_chrom <- ScanBamParam(what=c("rname","pos"))
  chromosome = scanBam(bamfile, param=p_chrom)[[1]]
  return(chromosome)
}
