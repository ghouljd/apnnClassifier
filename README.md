# R package - apnnClassifier

R package that classifies using probabilistic neural networks and evaluate the results.

# Functions 

## 1. standardize

It is responsible for standardizing a set of data.

### Params
⋅⋅⋅ **set:** Data set. (Required).
⋅⋅⋅ **type:** standardization type (Not required. Default value: "punctual". Valid values: "punctual" - "scale").

### Return 
⋅⋅⋅ standardized set.

### Example
```
library(apnnClassifier)
data(testData)
Basic usage
testData <- standardize(testData)
For classification by minimum and maximum
testData <- standardize(testData, type = "scale")
View(testData)
```
***
## 2. trainNeuralNet

It is responsible for executing the prediction of the probabilistic neural network.

### Params
⋅⋅⋅ **train_set:** Training set. (Required).
⋅⋅⋅ **test_set:** Testing set. (Required).
⋅⋅⋅ **category_column:** Category column (Not required. Default value: 1).
⋅⋅⋅ **sigma:** Optimum value for the activation function of the neural network. (Not required).

### Return 
⋅⋅⋅ pnn trained with the classified testing set and network performance statistics.

### Example
```
library(apnnClassifier)
data(trainData, testData)
# Basic usage.
pnn <- trainNeuralNet(train_set = trainData, test_set = testData)
# If you know the approximate optimal value and the sorter column is not in the first position of the set.
pnn <- trainNeuralNet(train_set = trainData, test_set = testData, category_column =  *sorter column*, sigma = *sigma value*)
View(pnn)
```
***

## 3. evaluate

Responsible of analyze the classification of the probabilistic neural network and generating the corresponding analysis graphs.

### Params
⋅⋅⋅ **pnn:** Trained probabilistic neural network.(Required)

### Return 
⋅⋅⋅ pnn with evaluated input and analysis charts.

### Example
```
library(apnnClassifier)
data(trainData, testData)
pnn <- trainNeuralNet(train_set = trainData, test_set = testData, sigma = 0.5)
pnn <- evaluate(pnn)
View(pnn)
```
