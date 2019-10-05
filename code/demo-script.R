#Title: NBA Scores 2018
#Descritpion: 
#	This script computes descriptive statisitcs about NBA 2018. 
#	There are data visualiation examples as well. 
#Input(s): data file 'nba2018-players.csv'
#Output(s): summary data files and plots
#Author: Jasdeep Hundal
#Date: 10-3-2019

#packages
library(dplyr)
library(ggplot2)

read.csv(file="../data/nba2018-players.csv",header=TRUE,sep=",", 
         col.names=c("player","team","position","height","weight","age","experience","college","salary","games","minutes","points","points3","points2","points1"),
         colClasses = c(rep("character",3), rep("numeric",4), "character", rep("numeric",7)))

warriors <- dat %>% filter(team=="GSW") %>% arrange(salary)
warriors

path_out = '../data/'
fileName = paste(path_out, 'warriors.csv')
write.csv(warriors,fileName)

#With row.names
path_out = '../data/'
fileName = paste(path_out, 'warriors.csv')
write.csv(warriors,fileName, row.names=FALSE)

#Exporting some R 

sink(file = "../output/data-structure.txt")
str(dat)
sink()

sink(file= "../output/summary-warriors.txt")
summary(warriors)
sink()


LAL <- dat %>% filter(team=="LAL")
LAL

sink(file="../output/summary-lakers.txt")
summary(LAL)
sink()

#8: Exporting Graphs

jpeg(filename = "../images/histogram-age.jpeg", width=400, height=600)
hist(dat$age, xlab="Age")
dev.off()

png(filename = "../images/scatterplot2-height-weight.png")
plot(dat$height, dat$weight, pch = 10, 
     xlab = 'Height', ylab = 'Weight')
dev.off()

ggplot(dat, aes(dat$height, dat$weight)) +geom_point(size=2, shape=23 ) +facet_grid(dat$position ~.)

ggsave("../images/height_weight_by_position.pdf", plot = last_plot())

