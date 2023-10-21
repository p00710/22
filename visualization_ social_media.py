import pandas as pd
import wordcloud
from wordcloud import WordCloud
import matplotlib.pyplot as plt

df = pd.read_csv("threads_reviews.csv")
df_new = df[['review_description', 'rating']]
print(df_new)

def clean_text(text):
    text = text.lower()
    return text.strip()

df_new['review_description'] = df_new['review_description'].apply(lambda x: clean_text(x))
print(df_new['review_description'])

data = df_new['review_description']

plt.figure(figsize=(20, 20))
wc = WordCloud(max_words=900, width=1600, height=800, collocations=False)
wc.generate(" ".join(data))
plt.imshow(wc)
plt.axis('off')
plt.show()
