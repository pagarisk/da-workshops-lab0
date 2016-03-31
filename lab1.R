# part 1
# load the first dataset 
source("http://www.openintro.org/stat/data/arbuthnot.R")

# exercise 1 - get the count of just the girls baptized
arbuthnot$girls

# exercise 2 - number of girls baptized trend
plot(girls ~ year, data = arbuthnot)

# exercise 3 - proportion of boys over time
png(file = "arbuthnot_boys_proportion.png", width = 800, height = 600, units = "px")
plot((boys / (boys + girls)) ~ year, data = arbuthnot, ylab = "proportion of boys, arbuthnot")
dev.off()


# part 2
# load the second dataset
source("http://www.openintro.org/stat/data/present.R")

# question 1 - years, dimensions, col names
present$year   #  list all years in the dataset
dim(present)   #  show dataset's dimensions
names(present) #  show the column names (variables)

# question 2 - how do both datasets compare?
str(arbuthnot) #  look at the first dataset's structure
str(present) #  look at the second dataset's structure
# it is obvious that second dataset contains much bigger nubers than the first one

# on average, the values in second dataset are larger by a factor of...
mean(c(mean(present$boys), mean(present$girls))) / mean(c(mean(arbuthnot$boys), mean(arbuthnot$girls)))


# question 3 - boy-to-girl ratio in present dataset
png(file = "present_boys_proportion.png", width = 800, height = 600, units = "px")
plot((boys / (boys + girls)) ~ year, data = present, ylab = "proportion of boys, present")
dev.off()

# question 4 - most births in the US
present$total = present$boys + present$girls   #  calculate the total for every year
present[present$total == max(present$total), ] #  show the row with most total births

