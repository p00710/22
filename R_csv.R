pick_bill_songs<-function(songs,num_songs)
{ shuffle_songs<-sample(songs)
bill_songs<-head(shuffle_songs,num_songs) 
return (bill_songs)}
all_songs<- read.csv("songs.csv", header = TRUE)
print(all_songs) 
num_bill_song<-7
bill_songs<-pick_bill_songs(all_songs,num_bill_song) 
cat("BILLBOARD SONGS ARE:\n")
for(song in bill_songs){ cat(song,"\n")}
