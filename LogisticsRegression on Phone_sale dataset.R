phone.df<-read.csv("phone_sale.csv",stringsAsFactors = TRUE)
str(phone.df)
View(phone.df)

# transform to a factor
phone.df$Any_cc_miles_12mo <- factor(phone.df$Any_cc_miles_12mo)
levels(phone.df$Any_cc_miles_12mo)
# rename the levels in order
levels(phone.df$Any_cc_miles_12mo) <- c("N", "Y")
levels(phone.df$Any_cc_miles_12mo)
# create reference category or base level
phone.df$Any_cc_miles_12mo <- relevel(phone.df$Any_cc_miles_12mo, ref = "Y")
phone.df$Phone_sale <- as.numeric(phone.df$Phone_sale == "Yes")

# create training and validation sets


load("a4_TrainIndex.rda") # which stores the variable train.index 
#set.seed(111)

# select variables/predictors randomly
selected.var <- c(5,9,10)
selected.df <- phone.df[, selected.var]
View(selected.df)
# partition the data

#train.index <- sample(1:nrow(phone.df), nrow(phone.df)*0.6)  
train.df <- selected.df[train.index, ]
View(train.df)
valid.df <- selected.df[-train.index, ]
View(valid.df)
# run logistic model, and show coefficients 
logit.reg <- glm(Phone_sale ~ ., data = train.df, family = "binomial")
View(logit.reg)
summary(logit.reg)

new.df<-data.frame(Bonus_trans = 50,Any_cc_miles_12mo="Y")
View(new.df)
new.pred<-predict(logit.reg, new.df,type = "response")
new.pred
# use predict() with type = "response" to compute predicted probabilities
# if type not specified, log-odds will be returned
logit.reg.pred <- predict(logit.reg, valid.df,  type = "response")
#logit.reg.pred <- predict(logit.reg, train.df,  type = "response")

logit.reg.pred
# Choose cutoff value and evaluate classification performance
pred <- ifelse(logit.reg.pred > 0.5, 1, 0)
## generate the confusion matrix based on the prediction
library(caret)
confusionMatrix(factor(pred), factor(valid.df$Phone_sale), positive = "1")
#confusionMatrix(factor(pred), factor(train.df$Phone_sale), positive = "1")
# set the cutoff to be 0.1 and evaluate the model
pred <- ifelse(logit.reg.pred > 0.1, 1, 0)
pred
confusionMatrix(factor(pred), factor(valid.df$Phone_sale), positive = "1")
install.packages("pROC")
library(pROC)
r <- roc(valid.df$Phone_sale, logit.reg.pred)
plot.roc(r)
?coords
coords(r,x="best",transpose=FALSE)
coords(r,x=c(.1,.2,.5))
