#' Data standardization
#'
#' @param set Data set. (Required)
#' @param type standardization type (Not required. Default value: "punctual". Valid values: "punctual" - "scale")
#'
#' @return standardized set.
#'
#' @examples
#' library(apnnClassifier)
#' data(testData)
#' Basic usage
#' testData <- standardize(testData)
#' For classification by minimum and maximum
#' testData <- standardize(testData, type = "scale")
#' View(testData)
#' @export
# It is responsible for standardizing a set of data.

standardize <- function(set, type = "punctual") {
  if(missing(set))
    stop("The set parameter shouldn't be empty or null.")
  else if(type != "punctual" && type != "scale")
    stop("Type parameter isn't valid.")

  if (type == "punctual"){
    for (index in 1:length(set)) {
      set[[index]] = (set[[index]] - mean(set[[index]])) / sd(set[[index]])
    }
    return(set)
  }
  else return ((set - min(set)) / (max(set) - min(set)))
}
