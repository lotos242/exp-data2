setwd("/Users/Maria/Documents/rcode/exdata-data-NEI_data")
library(dplyr)
scc <- readRDS("summarySCC_PM25.rds")
balt <- filter(scc, fips == 24510)
baltagg <- aggregate(Emissions ~ year, data = balt, sum)
png("plot2.png")
plot(baltagg$year, baltagg$Emissions, xlab = "Year", 
     ylab = "Emissions", main = "Baltimore Emissions by Year", 
     type = "l")
dev.off()
