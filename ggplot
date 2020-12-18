# data visualization#




install.packages("ggplot2")
library(ggplot2) # to use ggplot2 from computer into R
#generate scatterplot # data used is mpg data frame
names(mpg)
ggplot(data=mpg)+geom_point(aes(x=displ,y=hwy))
ggplot(data=mpg)+
  geom_point(aes(x=displ,y=hwy,color=class))+
  labs(y="highway miles per gallon")
mower.df<-read.csv("RidingMowers.csv",stringsAsFactors = TRUE)
head(mower.df)
names(mower.df)
ggplot(data=mower.df)+geom_point(aes(x=Income,y=Lot_Size))
ggplot(data=mower.df)+geom_point(aes(x=Income,y=Lot_Size,color=Ownership))
#---bar charts
ggplot(data=mpg)+geom_bar(aes(x=class))

#height of bar corresponds to mean of highway efficiency for each bar
ggplot(data=mpg)+geom_bar(aes(x=class,y=hwy),stat="summary",fun="mean")
#exercise
ggplot(data=mower.df)+geom_bar(aes(x=Ownership,y=Income),stat="summary",fun="mean")
library(ggplot2)
ggplot(data=mpg)+geom_boxplot(aes(x=class,y=hwy))


#Q1-1.5(Q3-Q1) points below this will be outliers.
#histogram
#divide numerical attribute into equal size bucket
ggplot(data=mpg)+geom_histogram(aes(x=cty),bins=5)

boston<-read.csv("BostonHousing.csv",stringsAsFactors = TRUE)
View(boston)


#practise a ques
ggplot(data=boston)+geom_histogram(aes(x=MEDV),bins=10)+labs(x="Median Value")

#B
head(boston)
str(boston)
ggplot(data=boston)+geom_boxplot(aes(x=CHAS,y=MEDV))
#boston$CHAS<-factor(boston$CHAS)
#str(boston)
ggplot(data=boston)+geom_boxplot(aes(x=factor(CHAS),y=MEDV))


#C
ggplot(data=boston)+geom_boxplot(aes(x=CAT..MEDV,y=NOX))
ggplot(data=boston)+geom_boxplot(aes(x=CAT..MEDV,y=PTRATIO))
