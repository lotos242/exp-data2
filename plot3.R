library(dplyr)
library(ggplot2)
setwd("/Users/Maria/Documents/rcode/exdata-data-NEI_data")
scc <- readRDS("summarySCC_PM25.rds")
balt <- filter(scc, fips == 24510)
remove(scc)
## Use the aggregate function but this time include both type and year in the resulting data frame
bytype <- aggregate(Emissions ~ type + year, data = balt, FUN = sum)
bytype$type <- factor(bytype$type)
png("plot3.png", width = 480, height = 480)
qplot(year, Emissions, data = bytype, facets = . ~ type, geom = "line", 
      main = "Total Emissions by Type for Baltimore City")
dev.off()
