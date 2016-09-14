# Week 1 quiz, question 5.

library("data.table")

load <- function()
{
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", "idaho2.csv")
    fread("idaho2.csv")
}

bench <- function(expr, times=10000) {
    system.time(
        for (i in 1:times) {
            expr
        }
    )
}

benchall <- function()
{
    n=1000000
    
    # Very weird. Only the first bench is executed?
    
    bench(mean(DT$pwgtp15,by=DT$SEX), times=n)
    
    bench({mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)}, times=n)
    
    bench(tapply(DT$pwgtp15,DT$SEX,mean), times=n)
    
    # The rowMeans() fails because of non-numeric data in the table:
    # > rowMeans(DT)
    # Error in rowMeans(DT) : 'x' must be numeric 
    #bench({rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]}, times=n)
    
    bench(sapply(split(DT$pwgtp15,DT$SEX),mean), times=n)
    
    # This is much faster ...
    bench(DT[,mean(pwgtp15),by=SEX], times=n)
}