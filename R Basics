#----Vector----
xNum<-c(1,3.14159,5,7)
xNum  
xLog<-c(TRUE,FALSE,TRUE)
xLog
xChar<-c("foo","bar","boo","far")
xChar
z<-c(xNum,100,200)
z
x<-c(2,4,6,8)
x+1
x*pi
x+x
x*x
length(x)

1:30 # generates all number from 1 to 30
a[ 2:5 ]


xSeq<-1:10
xSeq

10:1

xNum
xNum[2:4]
xNum[c(1,3)]
myStart<-2
xNum[myStart]
xSeq
xSeq[-5] # this will omit 5th element from a vector
xSeq[-5:-7] # this will omit 5th,6th and 7th element from a vector
xNum
xNum[c(TRUE,TRUE,FALSE,FALSE)] # WORks as a mask on values
xNum>3
xNum[xNum>3]
xNum==1
xNum!=1
names<-c('A','B','C')
length(names)
names[1:2]
names[c(1,2)]
names[-3]
names[2:3]
names[-1]
x.df<-read.csv("toy_example.csv")
x.df
x.df[2,1]
x.df[-3,1]
x.df[2,] # grab all columns and 2nd rowx
x.df[,1]
x.df[2:3,]
# indexing using column names
x.df[,1]
x.df[,"xNum"]
x.df[2:3,c("xNum","xLog")]
x.df$xNum
names(x.df)


View(x.df)
head(x.df)
tail(x.df)
dim(x.df)
nrow(x.df)
ncol(x.df)
str(x.df)
summary(x.df)

View(iris)
head(iris)
tail(iris)
dim(iris)
nrow(iris)
ncol(iris)
str(iris)
summary(iris)
names(iris)


#arithmetic functions

a<-c(1,2,3,4)
min(a)
max(x.df$xNum)
sum(a)
mean(a)

#exercise
nrow(iris)
ncol(iris)
iris[149:150,4:5]
numRow<-nrow(iris)
numCol<-ncol(iris)
iris[(numRow-1):numRow,(numCol-1):numCol]
mean(iris$Petal.Length)
iris[iris$Species=="versicolor",]
 # factor represents categorical data

sex_vector<-c("Male","Female","Female","Male","Male")
str(sex_vector)
summary(sex_vector)
factor_sex_worker<-factor(sex_vector)
factor_sex_worker
levels(factor_sex_worker)
str(factor_sex_worker)
summary(factor_sex_worker)
x.df<-read.csv("toy_example.csv",stringsAsFactors = TRUE)
str(x.df)
help(mean)
?mean
example(mean)
