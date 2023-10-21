import random
def billboard_songs(songs,num_songs):
  random.shuffle(songs)
  bill_songs=songs[:num_songs]
  return bill_songs
all_songs=["song1","song2","song3","song4","song5"]
num_bill_song=3
bill_songs=billboard_songs(all_songs,num_bill_song)
print("Billboard songs are: ")
for song in bill_songs: print(song)
