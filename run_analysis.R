#getting and unzipping dataset
install.packages("downloader")
library(downloader)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download(url, dest="dataset.zip", mode="wb") 
unzip ("dataset.zip", exdir = "./")

