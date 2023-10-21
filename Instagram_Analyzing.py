import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

import warnings
warnings.filterwarnings('ignore')

df = pd.read_csv('threads_reviews.csv')

print(df.head())

print(df.tail())
print(df.shape)
print(df.columns)
df = df.drop_duplicates()
print(df.isnull().sum())
print(df.info())
print(df.describe())
print(df.nunique())

df["review_date"].unique()
plt.figure(figsize=(20,20))

sns.countplot(x='rating', data=df)
plt.show()

category_counts = df['rating'].value_counts()

labels = category_counts.index
counts = category_counts.values
plt.pie(counts, labels=labels, autopct='%1.1f%%', startangle=90)
plt.axis('equal')  # Equal aspect ratio ensures that pie is drawn as a circle.

plt.title('Pie Chart of Category Distribution')
plt.show()
