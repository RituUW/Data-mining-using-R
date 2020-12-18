delays.df<-read.csv("FlightDelays.csv",stringsAsFactors = TRUE)
str(delays.df)

# transform to a factor
delays.df$DAY_WEEK <- factor(delays.df$DAY_WEEK)
levels(delays.df$DAY_WEEK)
# rename the levels in order
levels(delays.df$DAY_WEEK) <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")
delays.df$CRS_DEP_TIME <- factor(round(delays.df$CRS_DEP_TIME/100))
# create reference category or base level
delays.df$ORIGIN <- relevel(delays.df$ORIGIN, ref = "IAD")
delays.df$DEST <- relevel(delays.df$DEST, ref = "LGA")
delays.df$CARRIER <- relevel(delays.df$CARRIER, ref = "US")
delays.df$DAY_WEEK <- relevel(delays.df$DAY_WEEK, ref = "Mon")
delays.df$Flight.Status <- as.numeric(delays.df$Flight.Status == "delayed")
# create training and validation sets
set.seed(5)
# select variables/predictors randomly
selected.var <- c(10, 1, 8, 4, 2, 9, 13)
selected.df <- delays.df[, selected.var]
View(selected.df)
# partition the data
train.index <- sample(1:nrow(delays.df), nrow(delays.df)*0.6)  
train.df <- selected.df[train.index, ]
valid.df <- selected.df[-train.index, ]
# run logistic model, and show coefficients 
logit.reg <- glm(Flight.Status ~ ., data = train.df, family = "binomial")
summary(logit.reg)
# use predict() with type = "response" to compute predicted probabilities
# if type not specified, log-odds will be returned
logit.reg.pred <- predict(logit.reg, valid.df,  type = "response")
logit.reg.pred
# Choose cutoff value and evaluate classification performance
pred <- ifelse(logit.reg.pred > 0.5, 1, 0)
## generate the confusion matrix based on the prediction
library(caret)
confusionMatrix(factor(pred), factor(valid.df$Flight.Status), positive = "1")

# set the cutoff to be 0.2 and evaluate the model
pred <- ifelse(logit.reg.pred > 0.2, 1, 0)
pred
confusionMatrix(factor(pred), factor(valid.df$Flight.Status), positive = "1")
install.packages("pROC")
library(pROC)
r <- roc(valid.df$Flight.Status, logit.reg.pred)
plot.roc(r)
?coords
coords(r,x="best",transpose=FALSE)
coords(r,x=c(.1,.2,.5))
