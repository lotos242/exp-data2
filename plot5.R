library(dplyr)
setwd("/Users/Maria/Documents/rcode/exdata-data-NEI_data")
scc <- readRDS("summarySCC_PM25.rds")
## Use the wikipedian definition of "motor vehicles" and pull out all the On-Road entries
scode <- readRDS("Source_Classification_Code.rds")
onroad <- filter(scode, grepl("On-Road", EI.Sector, ignore.case = FALSE))
balt <- filter(scc, fips == 24510)
codes <- onroad$SCC
baltroad <- filter(balt, SCC %in% codes)
## Use aggregate again
final <- aggregate(Emissions ~ year, data = baltroad, FUN = sum)
png("plot5.png", width = 480, height = 480)
plot(final$year, final$Emissions, xlab = "Year", ylab = "Emissions",
     main = "Baltimore Motor Vehicle Emissions per Year", type = "l")
dev.off()
