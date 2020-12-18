setwd("/Users/deepthi/Desktop/Documents")

#read in spotify dataset

data <- read.csv("Spotify_Data.csv")

library(ggplot2)
library(ggpubr)


#extract most popular songs
top25_most <-data[data$popularity %in% 90:100,]
#filter to only include songs with two or more artists
d <-top25_most[grep(",",  top25_most$artists), ]
#limit to songs in the past decade
decade <- d[d$year %in% 2000:2020,]
#clean up data
collabs <- decade[c(2,13)]
# remove song repeats
n_collabs <-collabs[!duplicated(collabs[,c(1)]),]
unique(decade$artists)
## scatter plot
ggplot(data=decade, aes(y=artists, x= danceability)) +
  # geom_line()+
  geom_point() +labs(title = "Collabs") +ylab("Artists") +xlab("Key") 

numn_decade <- decade[c(1,3:6,)]
#look at avg values 
mean(decade$valence)
mean(decade$accousticness)
mean(decade$tempo)
mean(decade$energy)

#pca of factors in collabs
dpca <- prcomp(decade[,c(1,3:6,8:12,16:18)], center = TRUE,scale. = TRUE)
summary(dpca) 

ggbiplot(dpca, labels.size= 1)

pca_scores=as.data.frame(dpca$x)


 
