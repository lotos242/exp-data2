library(dplyr)
setwd("/Users/Maria/Documents/rcode/exdata-data-NEI_data")
scc <- readRDS("summarySCC_PM25.rds")
scode <- readRDS("Source_Classification_Code.rds")
## Filter out just those entries with coal and combust in the short name
coalcomb <- filter(scode, grepl("coal", scode$Short.Name, ignore.case = TRUE) & 
                           grepl("comb", scode$Short.Name, ignore.case = TRUE))
## Put the SCC codes in a convenience vector (Not really necessary but done for clarity
codes <- coalcomb$SCC
## Filter out just the observations with those codes from the data set
sccfiltered <- filter(scc, SCC %in% codes)
## Use the aggregate function (notice a pattern?) to create a new data frame with the Emissions sums
byscc <- aggregate(Emissions ~ year, data = sccfiltered, FUN = sum)
png("plot4.png", width = 480, height = 480)
plot(byscc$year, byscc$Emissions, xlab = "Year", ylab = "Emissions",
     main = "Coal Combustible Emissions per Year", type = "l")
dev.off()
