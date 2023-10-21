# Install and load necessary libraries
install.packages("tm")
install.packages("NLP")
install.packages("syuzhet")
install.packages("ggplot2")
install.packages("dplyr")
library(tm)
library(NLP)
library(syuzhet)
library(ggplot2)
library(dplyr)

# Read the CSV file
x <- read.csv("Data1.csv", header = TRUE)

# Check the structure of the data
str(x)

# Convert tweets to ASCII
tweets <- iconv(x$text, from = "UTF-8", to = "ASCII//TRANSLIT")

# Check the structure of tweets
str(tweets)

# Preprocess the text data
corpus <- Corpus(VectorSource(tweets))

# Convert to lowercase
corpus <- tm_map(corpus, content_transformer(tolower))

# Remove numbers
corpus <- tm_map(corpus, removeNumbers)

# Remove English stopwords
corpus <- tm_map(corpus, removeWords, stopwords("english"))

# Remove punctuation
corpus <- tm_map(corpus, removePunctuation)

# Create a term-document matrix
tdm <- TermDocumentMatrix(corpus)

# Convert the term-document matrix to a matrix
tdm <- as.matrix(tdm)

# Filter terms with a minimum frequency (adjust the value as needed)
min_term_frequency <- 45
tdm_filtered <- tdm[rowSums(tdm) >= min_term_frequency, ]

# Create a barplot to visualize the term frequency
barplot(rowSums(tdm_filtered), col = rainbow(50))

# Perform sentiment analysis
sentiments <- get_nrc_sentiment(tweets)

# Summarize sentiment scores
sentiment_summary <- colSums(sentiments)

# Create a barplot to visualize sentiment scores
barplot(sentiment_summary, las = 2, col = rainbow(10), ylab = 'Count', main = 'Sentiment Scores of Tweets')
