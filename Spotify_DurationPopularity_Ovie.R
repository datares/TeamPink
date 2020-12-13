#DATARES FALL 2020 
library(ggplot2)
library(dplyr)
library(readxl)

top2019 <- read.csv("C:/Users/soman/Desktop/College Stuff/Datares/top50.csv")
View(top2019)
names(top2019)
ggplot(top2019, aes(x = Length., y = Popularity)) + geom_point() +
 labs(title = "Relationship between Song Duration and Popularity for the Top 50 Songs of 2019", y = "Popularity", x = "Duration (sec)") +
  theme(plot.title = element_text(hjust = 0.5)) + theme_bw()

top2018 <- read.csv("C:/Users/soman/Desktop/College Stuff/Datares/top2018.csv")
names(top2018)

bigdata <- read.csv("C:/Users/soman/Desktop/College Stuff/Datares/data.csv")
names(bigdata)
bigdata$lengthinsec <- bigdata$duration_ms/1000

ggplot(bigdata, aes(x = lengthinsec, y = popularity)) + geom_point() +
  labs(title = "Relationship between Song Duration and Popularity from 1921 to 2020", y = "Popularity", x = "Duration (sec)") +
 theme_bw() + theme(plot.title = element_text(hjust = 0.5))

bigdata2 <- read.csv("C:/Users/soman/Desktop/College Stuff/Datares/data_w_genres.csv")
names(bigdata2)
bigdata2$lengthinsec <- bigdata2$duration_ms/1000
ggplot(bigdata2, aes(x = lengthinsec, y = popularity)) + geom_point(shape = 1) + facet_grid(genres ~ .)

data1930 <- bigdata %>%
  filter(year == 1930)
ggplot(data1930, aes(x = lengthinsec, y = popularity)) + geom_point() +
  labs(title = "Relationship between Song Duration and Popularity from 1930", y = "Popularity", x = "Duration (sec)") +
  theme_bw() + theme(plot.title = element_text(hjust = 0.5))

data1950 <- bigdata %>%
  filter(year == 1950)
ggplot(data1950, aes(x = lengthinsec, y = popularity)) + geom_point() +
  labs(title = "Relationship between Song Duration and Popularity from 1950", y = "Popularity", x = "Duration (sec)") +
  theme_bw() + theme(plot.title = element_text(hjust = 0.5))

data1970 <- bigdata %>%
  filter(year == 1970)
ggplot(data1970, aes(x = lengthinsec, y = popularity)) + geom_point() +
  labs(title = "Relationship between Song Duration and Popularity in 1970", y = "Popularity", x = "Duration (sec)") +
  theme_bw() + theme(plot.title = element_text(hjust = 0.5))

data1990 <- bigdata %>%
  filter(year == 1990)
ggplot(data1990, aes(x = lengthinsec, y = popularity)) + geom_point() +
  labs(title = "Relationship between Song Duration and Popularity in 1990", y = "Popularity", x = "Duration (sec)") +
  theme_bw() + theme(plot.title = element_text(hjust = 0.5))

data2010 <- bigdata %>%
  filter(year == 2010)
ggplot(data2010, aes(x = lengthinsec, y = popularity)) + geom_point() +
  labs(title = "Relationship between Song Duration and Popularity in 2010", y = "Popularity", x = "Duration (sec)") +
  theme_bw() + theme(plot.title = element_text(hjust = 0.5))
     
data2020 <- bigdata %>%
  filter(year == 2020)
ggplot(data2020, aes(x = lengthinsec, y = popularity)) + geom_point() +
  labs(title = "Relationship between Song Duration and Popularity in 2020", y = "Popularity", x = "Duration (sec)") +
  theme_bw() + theme(plot.title = element_text(hjust = 0.5))   
library(ggthemes)
decadedata <- rbind(data1930, data1950, data1970, data1990, data2010, data2020)
ggplot(decadedata, aes(x = lengthinsec, y = popularity), height = 6) + geom_point(color = 2) + facet_grid(year ~ .) +
  labs(title = "Relationship between Song Duration and Popularity through the Decades", y = "Popularity", x = "Duration (sec)") +
  theme_bw() + theme(plot.title = element_text(hjust = 0.5))

View(decadedata)

mean1930 <- mean(data1930$popularity)
mean1930

a <- trunc(mean(data1930$lengthinsec))
b <- trunc(mean(data1950$lengthinsec))
c <- trunc(mean(data1970$lengthinsec))
d <- trunc(mean(data1990$lengthinsec))
e <- trunc(mean(data2010$lengthinsec))
f <- trunc(mean(data2020$lengthinsec))

meantime <- data.frame(name=c("1930", "1950", "1970", "1990", "2010", "2020"), value = c(a,b,c,d,e,f))
ggplot(meantime, aes(x = name, y = value, label = value)) + geom_bar(stat = "identity", aes(fill = name)) + coord_cartesian(ylim = c(150,300)) + theme_bw() +
  labs(title = "Mean Song Duration through the Decades", y = "Song Duration (sec)", x = "Decade") + 
  theme(plot.title = element_text(hjust = 0.5), legend.position = "none", axis.title.y = element_text(size = 10)) + geom_label() + geom_text(check_overlap = TRUE)
