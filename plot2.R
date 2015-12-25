setwd("/Users/Maria/Documents/rcode/exdata-data-NEI_data")
library(dplyr)
scc <- readRDS("summarySCC_PM25.rds")
## Create a new data frame with just Baltimore data
balt <- filter(scc, fips == 24510)
## Use the aggregate function as in plot1.R
baltagg <- aggregate(Emissions ~ year, data = balt, sum)
png("plot2.png")
plot(baltagg$year, baltagg$Emissions, xlab = "Year", 
     ylab = "Emissions", main = "Baltimore Emissions by Year", 
     type = "l")
dev.off()
