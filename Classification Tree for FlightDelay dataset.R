



library(rpart)
library(rpart.plot)


library(caret)

delays.df<-read.csv("FlightDelay.csv",stringsAsFactors = TRUE)
View(delays.df)
#delays.df<-flight.df[,-3]
View(delays.df)
#Question1

load("TrainIndex.rda") # which stores the variable train.index
train.df <- delays.df[train.index, ]
valid.df <- delays.df[-train.index, ]



nrow(train.df)
nrow(valid.df)
# Question2
# Default classification tree, optimized by pruning


# select predictors 
selected.train.df <- train.df[, c(1,2,4,5,6,7,8,9)]

default.ct <- rpart(Flight.Status ~ ., data = selected.train.df, method = "class")

prp(default.ct, type=1, extra = 1)


#Question3
# confusion matrix for validation
default.ct.point.pred <- predict(default.ct, valid.df, type = "class")

# generate confusion matrix for validation data
confusionMatrix(default.ct.point.pred, valid.df$Flight.Status)




# Question4
# No, close price is not available at the time of decision.

# 5
# select predictors 
#selected.train.df <- train.df[, c(1, 2, 3, 4, 6, 7)]
#tr <- rpart(Competitive ~ ., data = selected.train.df, method = "class")

#prp(tr,type=1, extra = 1)


# 5

# You can go down the tree to manually find the predicition for the new data
# Or you can use the following codes
# In order to make sure that the columns names are exactly the same as those in our
# training data, you can first use names(train.df) before creating the following dataframee
names(selected.train.df)
#new.df <- data.frame(Category = "Books", currency = "US", sellerRating = 3211,
                    # Duration = 7, OpenPrice = 3.99)
#pred <- predict(tr, new.df, type = "class")
#pred


CRS_DEP_TIME CARRIER DEP_TIME DEST DISTANCE ORIGIN Weather DAY_WEEK
17_18 CO 14_15 EWR 199 DCA No Tue
#Question5
new.df<-data.frame(CRS_DEP_TIME="17_18",CARRIER="CO",DEST="EWR",DISTANCE=199,
                   ORIGIN="DCA",Weather="No",DAY_WEEK="Tue")
new.pred<-predict(default.ct, new.df,type = "class")
new.pred
# the prediction will be ontime

#Question6
selected.train.df <- train.df[, c(1,2,4,5,6,8,9)]
default.ct <- rpart(Flight.Status ~ ., data = selected.train.df, method = "class")

prp(default.ct, type=1, extra = 1)
?rpart
default.ct.point.pred <- predict(default.ct, valid.df, type = "class")
confusionMatrix(default.ct.point.pred, valid.df$Flight.Status)
