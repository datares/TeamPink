# :notes: Analyzing Spotify data :notes:

Contributors: Deepthi Gangiredla, Deana Moghaddas, Trina Nguyen, Ovie Soman, Zoeb Jamal

# Data
We used the [160k tracks](https://www.kaggle.com/yamaerenay/spotify-dataset-19212020-160k-tracks) dataset from Kaggle. This dataset was created on March 23rd, 2020, after a Kaggle user used the search query on the Spotify web API. This dataset was last updated on October 12th, 2020 and this is the version we used (version 7). It contains track data from Spotify from 1921 up to 2020 and inludes a wide range of columns

Variable | Data Type | Description
---------|-----------|------------
id | string | The Spotify ID for the track.
acousticness | float | A confidence measure from 0.0 to 1.0 of whether the track is acoustic. 1.0 represents high confidence the track is acoustic.
danceability | float | Danceability describes how suitable a track is for dancing based on a combination of musical elements including tempo, rhythm stability, beat strength, and overall regularity. A value of 0.0 is least danceable and 1.0 is most danceable.
energy | float | Energy is a measure from 0.0 to 1.0 and represents a perceptual measure of intensity and activity.
duration_ms | int | The duration of the track in milliseconds.
instrumentalness | float | Predicts whether a track contains no vocals. “Ooh” and “aah” sounds are treated as instrumental in this context. Rap or spoken word tracks are clearly “vocal”. The closer the instrumentalness value is to 1.0, the greater likelihood the track contains no vocal content. Values above 0.5 are intended to represent instrumental tracks, but confidence is higher as the value approaches 1.0.
valence | float | A measure from 0.0 to 1.0 describing the musical positiveness conveyed by a track. Tracks with high valence sound more positive (e.g. happy, cheerful, euphoric), while tracks with low valence sound more negative (e.g. sad, depressed, angry).
popularity | int | The popularity of a track is a value between 0 and 100, with 100 being the most popular. The popularity is calculated by algorithm and is based, in the most part, on the total number of plays the track has had and how recent those plays are.
tempo | float | The overall estimated tempo of a track in beats per minute (BPM).
liveness | float | Detects the presence of an audience in the recording. Higher liveness values represent an increased probability that the track was performed live. A value above 0.8 provides strong likelihood that the track is live.
loudness | float | The overall loudness of a track in decibels (dB). Loudness values are averaged across the entire track and are useful for comparing relative loudness of tracks. Loudness is the quality of a sound that is the primary psychological correlate of physical strength (amplitude). Values typical range between -60 and 0 db. 
speechiness | float | Speechiness detects the presence of spoken words in a track. The more exclusively speech-like the recording (e.g. talk show, audio book, poetry), the closer to 1.0 the attribute value. Values above 0.66 describe tracks that are probably made entirely of spoken words. Values between 0.33 and 0.66 describe tracks that may contain both music and speech, either in sections or layered, including such cases as rap music. Values below 0.33 most likely represent music and other non-speech-like tracks.
year | int | Ranges from 1921 to 2020
mode | int | Mode indicates the modality (major or minor) of a track, the type of scale from which its melodic content is derived. Major is represented by 1 and minor is 0.
explicit | int | Whether or not the track has explicit lyrics (0 = No explicit content, 1 = Explicit content).
key | int | The estimated overall key of the track. Integers map to pitches using standard Pitch Class notation . E.g. 0 = C, 1 = C♯/D♭, 2 = D, and so on. If no key was detected, the value is -1.
artists | an array of simplified artist objects | The artists who performed the track.
release_date |  | Date of release mostly in yyyy-mm-dd format, however precision of date may vary
name | string | Name of the track.

# Data Processing
We didn't really have to clean up the dataset per se, since the dataset didn't contain any NaN values, nor any irregularities. However, in order to look at more specific relationships, we created subsets of the main datasets. These csvs can all be found at [```data/cleandata/```](https://github.com/datares/TeamPink/tree/main/data/cleandata). 

# Analysis and Code
We used python and Jupyter notebooks almost exclusively, along with a little bit of microsoft excel to merge data in the event that we couldn't use ```pd.merge```. All of the Jupyter notebooks and other scripts can be found at [```analysis/```](https://github.com/datares/TeamPink/tree/main/analysis).

# Sources used
For PCA, we followed [this](https://github.com/mGalarnyk/Python_Tutorials/blob/master/Sklearn/PCA/PCA_Data_Visualization_Iris_Dataset_Blog.ipynb) example from Michael Galarnyk
