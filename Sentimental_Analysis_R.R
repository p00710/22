# Install and load necessary libraries
install.packages('sentimentr') 
install.packages('tidyverse') 
install.packages('wordcloud') 
install.packages('tokenizers') 
install.packages('tm') 
library(tidyverse)
library(sentimentr) 
library(wordcloud) 
library(tokenizers) 
library(tm)

# Read the CSV file
reviews <- read.csv("hotels.csv") 
head(reviews)

# Tokenize the text data
tokens <- unlist(tokenize_words(reviews$Text))
print(tokens)

# Create a word cloud
wordcloud(words = tokens, min.freq = 10, max.words = 50, colors = "black") 

# Create a corpus
Corpus <- Corpus(VectorSource(reviews$Text))

# Preprocess the text in the corpus
Corpus <- tm_map(Corpus, content_transformer(tolower))
Corpus <- tm_map(Corpus, removePunctuation)
Corpus <- tm_map(Corpus, removeNumbers)

# Create a Document-Term Matrix
dtm <- DocumentTermMatrix(Corpus)

# Analyze sentiment using sentimentr
sentiments <- sentimentr_data(dtm) 

# Print reviews and their corresponding sentiment scores
for (i in 1:length(sentiments)) {
  cat(paste("Review:", reviews$Text[i], "\n"))
  cat(paste("Sentiment:", sentiments[i], "\n\n"))
}
