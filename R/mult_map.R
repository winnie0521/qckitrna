#' multiple mapping
#'
#' @param bamfile the path to bam file


mult_map <- function(bamfile){
p_mm <- ScanBamParam(what=scanBamWhat(),flag=scanBamFlag(isUnmappedQuery = FALSE))
mult_map_r = scanBam(bamfile, param=p_mm)[[1]]

mult_map  <- lapply(mult_map_r, function(x)x[mult_map_r$mapq<=30])
return(mult_map)
}
