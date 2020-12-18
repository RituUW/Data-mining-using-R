daily<-read.csv("/Users/dailykos.csv",stringsAsFactors = TRUE)
View(daily)
library(caret)
set.seed(1000)
daily_km<-kmeans(daily,7)
daily_km$cluster
daily_km$centers

#q1
daily_km$size
#q2
center<-daily_km$centers

View(center)
cluster1<-center[1,]
cluster1_s<-sort(cluster1,decreasing = TRUE)
#cluster1_st<-t(cluster1_s)
View(cluster1_s)
cluster2<-center[2,]
cluster2_s<-sort(cluster2,decreasing = TRUE)
View(cluster2_s)
cluster3<-center[3,]
cluster3_s<-sort(cluster3,decreasing = TRUE)
View(cluster3_s)
cluster4<-center[4,]
cluster4_s<-sort(cluster4,decreasing = TRUE)
View(cluster4_s)
cluster5<-center[5,]
cluster5_s<-sort(cluster5,decreasing = TRUE)
View(cluster5_s)
cluster6<-center[6,]
cluster6_s<-sort(cluster6,decreasing = TRUE)
View(cluster6_s)
cluster7<-center[7,]
cluster7_s<-sort(cluster7,decreasing = TRUE)
View(cluster7_s)



