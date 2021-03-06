#' @title visRoleChanges
#' @description This function requires two vectors representing
#' the titles of employees from two different time periods. This function is useful
#' for visualizing "before-and-after" role changes.
#'
#' @param before A vector representing the job titles BEFORE a change.
#' @param after A vector representing the job titles AFTER a change. This must be paired with the BEFORE job titles and must be of the same length.
#' @import visNetwork
#' @export
#' @return visNetwork
#' @examples
#' before = c("builder","recruiter","manager","builder","builder")
#' after = c("builder","recruiter","manager","manager","builder")
#' visRoleChanges(before,after)

visRoleChanges = function(before,after){

  # Handling errors ---------------------------------------------------------
  if(length(before)!=length(after)){
    stop("'before' and 'after' vectors are not of the same length.")
  }
  if(!(is.character(before) | is.factor(before))){
    stop("'before' vector needs to contain strings or factors.")
  }
  if(!(is.character(after) | is.factor(after))){
    stop("'after' vector needs to contain strings or factors.")
  }

  # Processing the visualization --------------------------------------------
  edges = data.frame(before=as.character(before),
                     after=as.character(after),
                     stringsAsFactors=F)
  edges = with(edges,aggregate(after,by=list(before,after),length))
  colnames(edges) = c("from","to","label")
  edges$arrows = "to"
  nodes = unique(c(edges$from,edges$to))
  nodes = data.frame(id=nodes,label=nodes,stringsAsFactors=F)
  total = with(edges,aggregate(label,by=list(to),sum))
  colnames(total) = c("after","value")
  nodes = merge(nodes,total,by.x="id",by.y="after")
  visNetwork(nodes,edges) %>% visOptions(highlightNearest=T)
}


