bank.df<-read.csv("UniversalBank.csv",stringsAsFactors = TRUE)
set.seed(11)  # set seed for reproducing the partition
# Random sample indexes
train.index <- sample(1:nrow(bank.df), nrow(bank.df)*0.6) 
# Build training and validation set by indexing
train.df <- bank.df[train.index, ]
valid.df <- bank.df[-train.index, ]
View(train.df)
# if not installed, run:
#install.packages("rpart")
library(rpart)
# if not installed, run:
#install.packages("rpart.plot")
library(rpart.plot)
#build a tree
default.ct <- rpart(Personal.Loan ~ ., data = train.df, method = "class")
#plot tree       
prp(default.ct)
# to add extra details
 prp(default.ct, type=1, extra = 1)
 # grow full tree
 full.ct <- rpart(Personal.Loan ~ ., data = train.df, method = "class", 
                  control = rpart.control(cp = -1, minsplit = 1)) 
 my.ct <- rpart(Personal.Loan ~ ., data = train.df, method = "class", 
                control = rpart.control(maxdepth =  3, minbucket =  30))
 prp(my.ct,  type=1, extra = 1)
 # classify records in the validation data.
 # set argument type = "class" in predict() to generate predicted class membership.
 # Otherwise, a probablity of belonging to each class
 default.ct.point.pred <- predict(default.ct, valid.df, type = "class")
 
 library(caret)
 # generate confusion matrix for validation data
 confusionMatrix(default.ct.point.pred, factor(valid.df$Personal.Loan))
