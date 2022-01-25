# Pre exercise instructions:
    # 1. Download the data file from the following link: http://courses.edx.org/c4x/HarvardX/PH525.1x/asset/skew.RData
        
        library(downloader) 
        url <- "http://courses.edx.org/c4x/HarvardX/PH525.1x/asset/skew.RData"
        filename <- "skew.RData"
        destfile <- "C:/Users/klusk/Projects/R-studies/HarvardX_PH525_1x/Data_HarvardX/skew.RData"
        download(url, destfile)

    # 2. Load the data file into R using the following command: dat <- load("C:/Users/klusk/Projects/R-studies/HarvardX_PH525_1x/Data_HarvardX/skew.RData")
        
        load("C:/Users/klusk/Projects/R-studies/HarvardX_PH525_1x/Data_HarvardX/skew.RData")
        dim(dat) -> Data_Base
        par(mfrow = c(3,3)) -> Data_Base_1
        for (i in 1:9) {qqnorm(dat[i])} -> Data
        par(mfrow=c(1,1))

print(Data_Base)
print(Data_Base_1)
