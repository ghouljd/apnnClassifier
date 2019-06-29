#' Evaluation of the classification of the probabilistic neural network.
#'
#' @param pnn Trained probabilistic neural network.(Required)
#'
#' @return pnn \code{list} with evaluated input and analysis charts
#'
#' @examples
#' library(apnnClassifier)
#' data(trainData, testData)
#' testData <- as.matrix(testData)
#' pnn <- trainNeuralNet(train_set = trainData, test_set = testData, sigma = 0.5)
#' pnn <- evaluate(pnn)
#' View(pnn)
#' @export
# Responsible of analyze the classification of the probabilistic neural network and generating the corresponding analysis graphs.

evaluate <- function(pnn) {
  if(missing(pnn))
    stop("The pnn parameter is required.")
  else if(is.null(pnn$output))
    stop("The pnn parameter should be a neural net trained.")
  else if (!requireNamespace("pROC", quietly = TRUE))
    stop("Package \"pROC\" needed for this function to work. Please install it.", call. = FALSE)
  else if (!requireNamespace("dplyr", quietly = TRUE))
    stop("Package \"dplyr\" needed for this function to work. Please install it.", call. = FALSE)

  plot(dplyr::select(pnn$set, -pnn$category.column))

  roc.multi <- pROC::multiclass.roc(pnn$output$category, pnn$output$propability, percent=TRUE)
  rs <-roc.multi$rocs
  for (index in 1:length(rs)) {
    pROC::plot.roc(rs[[index]])
  }
  sapply(1:length(rs),function(i) pROC::lines.roc(rs[[i]],col=i))

  pnn$evaluation = roc.multi

  return(pnn)
}
