spotifyproject
================

``` r
library(readr)
spotifydata <- read_csv("spotifydata.csv")
```

    ## Parsed with column specification:
    ## cols(
    ##   acousticness = col_double(),
    ##   artists = col_character(),
    ##   danceability = col_double(),
    ##   duration_ms = col_double(),
    ##   energy = col_double(),
    ##   explicit = col_double(),
    ##   id = col_character(),
    ##   instrumentalness = col_double(),
    ##   key = col_double(),
    ##   liveness = col_double(),
    ##   loudness = col_double(),
    ##   mode = col_double(),
    ##   name = col_character(),
    ##   popularity = col_double(),
    ##   release_date = col_character(),
    ##   speechiness = col_double(),
    ##   tempo = col_double(),
    ##   valence = col_double(),
    ##   year = col_double()
    ## )

``` r
genredata <- read_csv("data_by_genres.csv")
```

    ## Parsed with column specification:
    ## cols(
    ##   genres = col_character(),
    ##   acousticness = col_double(),
    ##   danceability = col_double(),
    ##   duration_ms = col_double(),
    ##   energy = col_double(),
    ##   instrumentalness = col_double(),
    ##   liveness = col_double(),
    ##   loudness = col_double(),
    ##   speechiness = col_double(),
    ##   tempo = col_double(),
    ##   valence = col_double(),
    ##   popularity = col_double(),
    ##   key = col_double(),
    ##   mode = col_double()
    ## )

``` r
#sort all data by increasing popularity, 100 = most popular
spotifydata <- spotifydata[order(-spotifydata$popularity),]
genredata <- genredata[order(-genredata$popularity),]
```

``` r
library(ggplot2)

spotify2020 <- spotifydata[spotifydata$year == 2020,]

# acousticness, more acousticness = a little less popular
ggplot(spotify2020, aes(x = acousticness, y = popularity)) +
  geom_point(position = "jitter") +
  geom_smooth(method = "lm") +
  theme_bw() +
  ggtitle("Popularity of Music According to Acousticness in 2020")
```

    ## `geom_smooth()` using formula 'y ~ x'

![](dataresviz_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

``` r
# speechiness, more speechiness = a little more popular however more songs are less speechy
ggplot(spotify2020, aes(x = speechiness, y = popularity)) +
  geom_point(position = "jitter") +
  geom_smooth(method = "lm") +
  theme_bw() +
  ggtitle("Popularity of Music According to Speechiness in 2020")
```

    ## `geom_smooth()` using formula 'y ~ x'

![](dataresviz_files/figure-gfm/unnamed-chunk-3-2.png)<!-- -->

``` r
samplespotify <- spotifydata[sample(nrow(spotifydata), size = 1000, replace = FALSE),]
decades <- spotifydata[spotifydata$year > 1970,]
decadesample <- decades[sample(nrow(decades), size = 1000, replace = FALSE),]
#change x axis from 1950-now

#speechiness over time, higher production technologies has lead to less speechiness in music
ggplot(samplespotify, aes(x = year, y = speechiness)) +
  geom_line() +
  theme_bw() +
  ggtitle("Speechiness in Music Over Time")
```

![](dataresviz_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->

``` r
ggplot(decadesample, aes(x = year, y = loudness)) +
  geom_line() +
  theme_bw() +
  ggtitle("Loudness in Music Over Time")
```

![](dataresviz_files/figure-gfm/unnamed-chunk-4-2.png)<!-- -->

``` r
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(gridExtra)
```

    ## Warning: package 'gridExtra' was built under R version 4.0.2

    ## 
    ## Attaching package: 'gridExtra'

    ## The following object is masked from 'package:dplyr':
    ## 
    ##     combine

``` r
#defining characteristics within each genre
popgenres <- genredata %>% filter(genres == "indie pop" | genres == "r&b" | genres == "rap" | genres == "edm" | genres == "alternative rock")

popgraph <- ggplot(popgenres, aes(x = genres, y = popularity, fill = genres)) +
  geom_col() +
  theme_bw()

#high energy = more intensity and activity.
energygraph <- ggplot(popgenres, aes(x = genres, y = energy, fill = genres)) +
  geom_col() +
  theme_bw() +
  ggtitle("Average Energy and Popularity According to Genre")

#high valence = cheerful, euphoric, positive: low valence = sad, depressed, negative
valencegraph <- ggplot(popgenres, aes(x = genres, y = valence, fill = genres)) +
  geom_col() +
  theme_bw() +
  ggtitle("Average Valence and Popularity According to Genre")

#high danceability = suitable track for dancing based on a combination of musical elements
dancegraph <- ggplot(popgenres, aes(x = genres, y = danceability, fill = genres)) +
  geom_col() +
  theme_bw() +
  ggtitle("Average Danceability and Popularity According to Genre")

#high tempo = faster
tempograph <- ggplot(popgenres, aes(x = genres, y = tempo, fill = genres)) +
  geom_col() +
  theme_bw() +
  ggtitle("Average Tempo and Popularity According to Genre")

grid.arrange(energygraph, popgraph)
```

![](dataresviz_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

``` r
grid.arrange(valencegraph, popgraph)
```

![](dataresviz_files/figure-gfm/unnamed-chunk-5-2.png)<!-- -->

``` r
grid.arrange(dancegraph, popgraph)
```

![](dataresviz_files/figure-gfm/unnamed-chunk-5-3.png)<!-- -->

``` r
grid.arrange(tempograph, popgraph)
```

![](dataresviz_files/figure-gfm/unnamed-chunk-5-4.png)<!-- -->
