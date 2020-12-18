# define vector of sentences ("docs")
text <- c("this is the first     sentence!!", 
          "this is a second Sentence :)", 
          "the third sentence, is here", 
          "forth of all 4 sentences")
 install.packages("tm")
library(tm)
# convert documents into a corpus
corp <- Corpus(VectorSource(text))
inspect(corp)
# 1. Switch to lower case
corp <- tm_map(corp, tolower)
# inspect the corpus
inspect(corp)
# 2. Remove numbers 
corp <- tm_map(corp, removeNumbers)
# 3. Remove punctuation marks
corp <- tm_map(corp, removePunctuation) 
# 4. Remove stopwords
# These  include words such as articles (a, an, the), conjunctions (and, or but etc.), common verbs (is), qualifiers (yet, however etc) . The tm package includes  a standard list of such stop words 
# examine the list of stopwords by typing in:
# stopwords("english")
corp <- tm_map(corp, removeWords, stopwords("english"))
# the third argument is the list of stop words
inspect(corp)
# 5. Remove extra whitespaces
corp <- tm_map(corp, stripWhitespace) 
# inspect the corpus
inspect(corp)
# stemming
#install.packages("SnowballC")
library(SnowballC)
corp <- tm_map(corp, stemDocument) 
# inspect the corpus
inspect(corp)
# find out Term-Document matirx based on Term Frequency
dtm <- DocumentTermMatrix(corp)
inspect(dtm)
# find out tf-idf
tfidf <- weightTfIdf(dtm)
inspect(tfidf)

#in class practise--
reviews.df<-read.csv("reviews.csv",stringsAsFactors = TRUE)
str(reviews.df)
text2<-reviews.df[,4]

corp2 <- Corpus(VectorSource(text2))
inspect(corp2)
# 1. Switch to lower case
corp2 <- tm_map(corp2, tolower)
# inspect the corpus
inspect(corp2)
# 2. Remove numbers 
corp2 <- tm_map(corp2, removeNumbers)
# 3. Remove punctuation marks
corp2 <- tm_map(corp2, removePunctuation) 
# 4. Remove stopwords
# These  include words such as articles (a, an, the), conjunctions (and, or but etc.), common verbs (is), qualifiers (yet, however etc) . The tm package includes  a standard list of such stop words 
# examine the list of stopwords by typing in:
# stopwords("english")
corp2 <- tm_map(corp2, removeWords, stopwords("english"))
# the third argument is the list of stop words
inspect(corp2)
# 5. Remove extra whitespaces
corp2 <- tm_map(corp2, stripWhitespace) 
# inspect the corpus
inspect(corp2)
# stemming
#install.packages("SnowballC")
library(SnowballC)
corp2 <- tm_map(corp2, stemDocument) 
# inspect the corpus
inspect(corp2)
# find out Term-Document matirx based on Term Frequency
dtm2 <- DocumentTermMatrix(corp2)
inspect(dtm2)
# find out tf-idf
tfidf2 <- weightTfIdf(dtm2)
inspect(tfidf2)
View(tfidf2)
tfidf<-removeSparseTerms(tfidf2,0.93)
review.df<-data.frame(as.matrix(tfidf),Recommended=reviews.df$Recommended)
View(review.df)
#partition data
set.seed(1)
