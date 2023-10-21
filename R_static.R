pick_bill_songs<-function(songs,num_songs){
  shuffle_songs<-sample(songs)
  bill_songs<-head(shuffle_songs,num_songs) 
  return (bill_songs)}
all_songs<-c("song1","song2","song3","song4","song5","song6","song7","song8","song9","song10")
num_bill_song<-7
bill_songs<-pick_bill_songs(all_songs,num_bill_song)
cat("BILLBOARD SONGS ARE:\n")
for(song in bill_songs){cat(song,"\n")}
