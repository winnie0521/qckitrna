#' coverage rate: mean, median and sd
#'
#' @param bamfile the path to the bam file
#' @return coverage rate mean, median and sd matrix



coverage <- function(bamfile){


  p_cover <- ScanBamParam(what=scanBamWhat(),flag=scanBamFlag(isUnmappedQuery = FALSE))
  bam = scanBam(bamfile, param=p_cover)[[1]]


  I_ranges <- IRanges(start=bam$pos, width=bam$qwidth, names=make.names(bam$qname, unique=TRUE))
  G_ranges <- GRanges(seqnames=Rle(bam$rname), ranges=I_ranges, strand=Rle(bam$strand), flag=bam$flag, readid=bam$rname)

  coverage <- rbind(mean(coverage(G_ranges)),median(coverage(G_ranges)),sd(coverage(G_ranges)))
  rownames(coverage) <- c("mean","median","sd")

  return(coverage)


}
