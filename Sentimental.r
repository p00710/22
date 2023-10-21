# Install and load necessary libraries
install.packages("rlang")
install.packages("syuzhet")
install.packages("lubridate")
install.packages("ggplot2")
install.packages("scales")
install.packages("reshape2")
install.packages("dplyr")
install.packages("tm")  # Add this line to install the tm package
library(rlang)
library(syuzhet)
library(lubridate)
library(ggplot2)
library(scales)
library(reshape2)
library(dplyr)
library(tm)  # Load the tm package

# Read the CSV file
x <- read.csv("Data1.csv", header = TRUE)
str(x)

# Convert tweets to ASCII
tweets <- iconv(x$text, from = "UTF-8", to = "ASCII//TRANSLIT")
str(tweets)
head(tweets)

# Create a corpus
corpus <- Corpus(VectorSource(tweets))
inspect(corpus[1:5])

# Preprocess the text data
corpus <- tm_map(corpus, content_transformer(tolower))
inspect(corpus[1:5])

corpus <- tm_map(corpus, removeNumbers)
inspect(corpus[1:5])

corpus <- tm_map(corpus, removeWords, stopwords("english"))
inspect(corpus[1:5])

corpus <- tm_map(corpus, removePunctuation)
inspect(corpus[1:5])

# Create a term-document matrix
tdm <- TermDocumentMatrix(corpus)
tdm <- as.matrix(tdm)
tdm[1:10, 1:20]
print(tdm)

# Calculate and plot term frequencies
term_freq <- rowSums(tdm)
term_freq_filtered <- subset(term_freq, term_freq >= 45)
barplot(term_freq_filtered, col = rainbow(50))
