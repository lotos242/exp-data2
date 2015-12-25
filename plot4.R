library(dplyr)
setwd("C:/Users/solot/Downloads/exdata-data-NEI_data")
scc <- readRDS("summarySCC_PM25.rds")
scode <- readRDS("Source_Classification_Code.rds")
coalcomb <- filter(scode, grepl("coal", scode$Short.Name, ignore.case = TRUE) & 
                           grepl("comb", scode$Short.Name, ignore.case = TRUE))
codes <- coalcomb$SCC
sccfiltered <- filter(scc, SCC %in% codes)
byscc <- aggregate(Emissions ~ year, data = sccfiltered, FUN = sum)
png("plot4.png", width = 480, height = 480)
plot(byscc$year, byscc$Emissions, xlab = "Year", ylab = "Emissions",
     main = "Coal Combustible Emissions per Year", type = "l")
dev.off()
