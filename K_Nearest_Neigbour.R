#K NEAREST NEIGBOURS

# load data
mower.df <- read.csv("RidingMowers.csv", stringsAsFactors = TRUE)
set.seed(11) 
# partition data
train.index <- sample(1:nrow(mower.df), 0.6*nrow(mower.df))
train.df <- mower.df[train.index, ]
valid.df <- mower.df[-train.index,]
train.norm.df <- train.df
valid.norm.df <- valid.df
# normalize data
library(caret)
# compute mean and standard deviation of each column
norm.values <- preProcess(train.df[, 1:2], method=c("center", "scale"))
train.norm.df[, 1:2] <- predict(norm.values, train.df[, 1:2])
valid.norm.df[, 1:2] <- predict(norm.values, valid.df[, 1:2])
#install.packages("FNN")
library(FNN)
# use ?knn to find out more information
# It worth noting that the input argument cl must be a factor!
knn.pred <- knn(train.norm.df[, 1:2], valid.norm.df[, 1:2], 
                cl = train.norm.df[, 3], k = 5)
confusionMatrix(knn.pred, valid.norm.df[, 3])
