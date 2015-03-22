source('./loadData.R')
coal <- grep("coal", SCC$Short.Name, ignore.case = T)
coal <- SCC[coal, ]
coal <- NEI[NEI$SCC %in% coal$SCC, ]
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./figure/plot4.png", 
    width = 480, height = 480, 
    units = "px")
coalEmissions <- aggregate(coal$Emissions, list(coal$year), FUN = "sum")
plot(coalEmissions, type = "l", xlab = "Year", 
     main = "Total Emissions From Coal Combustion-related\n Sources from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()
