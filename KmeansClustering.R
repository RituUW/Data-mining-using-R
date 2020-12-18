#KMEANS
utilities<-read.csv("/Users/Utilities.csv",stringsAsFactors = TRUE)
#normalize data

View(utilities)
install.packages("caret",dependencies=TRUE)
library(caret)

# calculating mean and std deviation for each column
norm.values<-preProcess(utilities,method=c("center","scale"))

# using predict function to apply norm.value on data
utilities_norm<-predict(norm.values,utilities)
utilities_norm

# use kmeans clustering
set.seed(1234)
km<-kmeans(utilities_norm,6)
km$cluster
km$centers
km$withinss
km$tot.withinss
km$size


#plotting clusters
plot(c(0), xaxt = 'n', ylab = "", type = "l", 
     ylim = c(min(km$centers), max(km$centers)), xlim = c(0, 8))

# label x-axes
axis(1, at = c(1:8), labels = names(utilities))

# plot centroids
for (i in c(1:6))
  lines(km$centers[i,], lty = i, lwd = 2, col = ifelse(i %in% c(1, 3,5),
                                                       "black", "dark grey"))

# name clusters
text(x = 0.5, y = km$centers[, 1], labels = paste("Cluster", c(1:6)))
