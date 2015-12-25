library(dplyr)
setwd("/Users/Maria/Documents/rcode/exdata-data-NEI_data")
scc <- readRDS("summarySCC_PM25.rds")
mydf <- aggregate(Emissions ~ year, data = scc, sum)
png("plot1.png", width = 480, height = 480)
plot(mydf$year, mydf$Emissions, type = "l")
plot(mydf$year, mydf$Emissions, type = "l", xlab = "Year", 
     ylab = "Emissions", main = "Total Emissions by Year")
dev.off()
