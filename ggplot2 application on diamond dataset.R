View(diamonds)
?diamonds
str(diamonds)
#metric “carat” is defined as 200 milligrams.#
ggplot(data=diamonds)+geom_point(aes(x=carat,y=price),color="blue") +
                                   labs(y="Price($)")+ggtitle("Diamonds: Price vs. Carat")

#quality of the cut (Fair, Good, Very Good, Premium, Ideal) Cut grade is
#an objective measure of a diamond’s light
#performance, or, what we generally think of as sparkle.

ggplot(data=diamonds)+geom_point(aes(x=carat,y=price,color=cut)) +
  labs(y="Price($)")+ggtitle("Diamonds: Price vs. Carat")


#diamond colour, from D (best) to J (worst)
ggplot(data=diamonds)+geom_point(aes(x=carat,y=price,color=color)) +
  labs(y="Price($)")+ggtitle("Diamonds: Price vs. Carat")

#a measurement of how clear the diamond is (I1 (worst), SI2, SI1, VS2, VS1, VVS2, VVS1, IF (best))
ggplot(data=diamonds)+geom_point(aes(x=carat,y=price,color=clarity)) +
  labs(y="Price($)")+ggtitle("Diamonds: Price vs. Carat")

#Q4#Create a bar chart of average prices across different cuts.
ggplot(data=diamonds)+geom_bar(aes(x=cut,y=price,fill=cut),stat="summary",fun="mean")+labs(y="Average Price($)") +ggtitle("Diamonds: Avg Price by quality of cut")

#Q5Generate a bar chart, showing the total number of diamonds in the dataset, grouped by cut.
ggplot(data=diamonds)+geom_bar(aes(x=cut,fill=cut))+labs(y="Count of diamonds") +ggtitle("Diamonds count by quality of cut")


#Q6 6. Generate a bar chart with cut as the x-axis, and illustrate the average carat weights under different cuts.
ggplot(data=diamonds)+geom_bar(aes(x=cut,y=carat,fill=cut),stat="summary",fun="mean")+labs(y="Average carat") +ggtitle("Diamonds:Average Carat by quality of Cut")

#----trial--
ggplot(data=diamonds)+geom_bar(aes(x=cut,y=carat),stat="summary",fun="sum")
ggplot(data=diamonds)+geom_bar(aes(x=cf,y=carat),stat="summary",fun="sum")

