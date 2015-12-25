library(dplyr)
library(ggplot2)
setwd("C:/Users/solot/Downloads/exdata-data-NEI_data")
scc <- readRDS("summarySCC_PM25.rds")
scode <- readRDS("Source_Classification_Code.rds")
onroad <- filter(scode, grepl("On-Road", EI.Sector, ignore.case = FALSE))
balt_la <- filter(scc, fips == "24510" | fips == "06037")
codes <- onroad$SCC
balt_laroad <- filter(balt_la, SCC %in% codes)
final <- aggregate(Emissions ~ fips + year, data = balt_laroad, FUN = sum)
png("plot6.png", width = 480, height = 480)
qplot(year, Emissions, data = final, facets = . ~ fips, geom = "line",
      main = "Los Angeles vs Baltimore Motor Vehicle Emissions")
dev.off()