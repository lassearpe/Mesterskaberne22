### Scalars

A <- 5
B <- 4

A + B

A*B

### Array
# one dimensional data structure
C <- 1:10 + 3
D <- letters[4:12]

D[1]

D[2:3]

C[C>8]

### Data.frame
# two dimensional data structure


#indexing two dimensions
mtcars[1:3]
mtcars[1,3]

# Functions

#objects in the environment
#r is very similar to bash
ls()

mean(mtcars[,"gear"])

### CSV format 
read.csv("Profits.RData")

## Exploring Data - Descriptives

# 1. take alook at the structure of the data

str(mtcars)

summary(mtcars)

#speciific column with $-sign
mean(mtcars$mpg)
min(mtcars$mpg)
max(mtcars$mpg)

nrow(mtcars)
ncol(mtcars)

## Visualizations
# base r
plot(mtcars)

## now with ggplot2
# uses grammar of visualization
# grammer, aestethics, geometric objects

ggplot(data = mpg, aes(x = hwy)) + geom_bar()

#is there an easier way? more crude, but gets the same job done
# Histogram
?qplot
qplot(data = mpg, x = hwy)

# what if we have a categorical value instead of a continous?

# Barchart
ggplot(data = mpg, aes(x = class)) + geom_bar()

#another categorical variable

qplot(data = mpg, x = manufacturer)

# what if we have more than one variable? Relationship between two varaibles e.g.

ggplot(data = mpg, aes(x = hwy, y = displ, color = class, shape = class)) + geom_point()

# communicating with visualizations
# use labs for title

ggplot(data = mpg, aes(x = hwy, y = displ, color = class, shape = class)) + 
  geom_point() + 
  labs(title = "Displacement and highway ful is inversely correlated.",
       subtitle = "Subcomponents are the best a HWY efficiency",
       x = "Highway gas mileage",
       y = "Displacement of the engine")

## Subsetting and filtering data
  # only using some part of the data
  
  # using index
  # using subset function (easier than the index)

# where can you rent for less than 1000?
# where can you rent in AZ?
# where can you rent in both AZ and under 1000?
# first, using indexing
zillowChaep <- zillow[zillow$Zri < 1000,]

zillowAZ <- zillow[zillow$State == "AZ",]

zillowCheapAZ <- zillow[zillow$Zri < 1000 & zillow$State == "AZ",]

# what abouth AZ or Colorado?
zillow[zillow$Zri < 1000 & zillow$State == "AZ" | zillow$State == "CO",]

#how do we exclude specific columns from the dataset?
names(zillow)

zillowFewerColumns <- zillow[, c(1:8, 12)]

# using an easier way - subset

?subset
subset(x = zillow, State == "AZ", RegionName:Zri)

