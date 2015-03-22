source("loadData.R")
subset <- NEI[NEI$fips == "24510"|NEI$fips == "06037", ]

library(ggplot2)
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./figure/plot6.png", 
    width = 480, height = 480, 
    units = "px", bg = "transparent")
motor <- grep("motor", SCC$Short.Name, ignore.case = T)
motor <- SCC[motor, ]
motor <- subset[subset$SCC %in% motor$SCC, ]


g <- ggplot(motor, aes(year, Emissions, color = fips))
g + geom_line(stat = "summary", fun.y = "sum") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle("Comparison of Total Emissions From Motor\n Vehicle Sources in Baltimore City\n and Los Angeles County from 1999 to 2008") +
  scale_colour_discrete(name = "Group", label = c("Los Angeles","Baltimore"))
dev.off()
