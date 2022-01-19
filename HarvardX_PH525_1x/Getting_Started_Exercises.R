# Getting Started: Exercises
#--------------------------------
# Open R using radian (only for those who use radian)

# Get Data - Using downloader package - delete teh "#" to use the code :)

    #install.packages("downloader")
    #library(downloader) 
    #url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
    #filename <- "femaleMiceWeights.csv" 
    #download(url, destfile=filename)

# Getting Started Exercises #1
    #Read in the file femaleMiceWeights.csv and report the exact name of the column containing the weights.

    dat <- read.csv("R-studies/HarvardX_PH525_1x/femaleMiceWeights.csv")

print(dat)

# Getting Started Exercises #2
    #The [ and ] symbols can be used to extract specific rows and specific columns of the table. What is the entry in the 12th row and second column?

    answer_2 <- dat[12,2]

print(answer_2)