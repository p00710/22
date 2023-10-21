import csv
import random

def get_random_songs(csv_file, num_songs):
  with open(csv_file, 'r') as file:
    reader = csv.DictReader(file)
    all_songs = list(reader)
    random.shuffle(all_songs)
    random_songs = all_songs[:num_songs]
    return random_songs

csv_file = 'songs.csv'
num_songs = 8
random_songs = get_random_songs(csv_file, num_songs)
print("RANDOMLY SELECTED SONGS:")
for song in random_songs: print(f"{song['title']}")
