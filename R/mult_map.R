#' multiple mapping
#'
#' @param bamfile the path to bam file
#' @param quality set default of mapping quality standard to 30


mult_map <- function(bamfile,quality=30,option){
p_mm <- ScanBamParam(what=scanBamWhat(),flag=scanBamFlag(isUnmappedQuery = FALSE))
mult_map_r = scanBam(bamfile, param=p_mm)[[1]]

mult_map  <- lapply(mult_map_r, function(x)x[mult_map_r$mapq<=quality])

length <- bam_length(bamfile)

if (option == "count") return(length(mult_map$qname))
if (option == "rate") return(length(mult_map$qname)/length)

}

