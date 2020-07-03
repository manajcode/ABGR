# Michael Najarro
#02/01/2019 11:43:56 AM 
#################################################################
#     SOLUTIONS TO THE EXERCISES OF: A BEGINNER'S GUIDE TO R
#               CHAPTERS 1-7 (EXCLUDE 8)
################################################################

#~~~~ CHAPTER 1 EXERCISES~~~~~
# there are no problems in the first chapter.

#~~~~ CHAPTER 2 EXERCISES~~~~~
#Exercise 1): The use of the c and sum functions.
# This exercise uses epidemiological data. Vicente et al. (2006) analysed data from
# observations of wild boar and red deer reared on a number of estates in Spain.
# The dataset contains information on tuberculosis (Tb) in both species, and on
# the parasite Elaphostrongylus cervi, which only infects red deer.

# In Zuur et al. (2009), Tb was modelled as a function of the continuous
# explanatory variable, length of the animal, denoted by LengthCT (CT is an
# abbreviation of cabeza-tronco, which is Spanish for head-body). Tb and Ecervi
# are shown as a vector of zeros and ones representing absence or presence of Tb
# and E. cervi larvae. Below, the first seven rows of the spreadsheet containing the
# deer data are given.

# Using the c function, create a variable that contains the length values of the
# seven animals.
Pig.LengthCT = c(75, 85, 91.6, 95, NA, 105.5, 106)

# Also create a variable that contains the Tb values. Include the NAs.
Pig.TbStatus = c(0, 0 ,1, NA, 0, 0 ,0)

# What is the average length of the seven animals?
AvgLength = sum(Pig.LengthCT, na.rm = TRUE)/7


#Exercise 2): The use of the cbind function using epidemiological data.
# We continue with the deer from Exercise 1. First create variables Farm and
# Month that contain the relevant information. Note that Farm is a string of
# characters. Use the cbind command to combine month, length, and Tb data,
# and store the results in the variable, Boar. Make sure that you can extract rows,
# columns, and elements of Boar. Use the dim, nrow, and ncol functions to
# determine the number of animals and variables in Boar.
Farm = c("MO", "MO", "MO", "MO", "LN", "SE", "QM")
Month = c(11, 07, 07, NA, 09, 09, 11)

Boar = cbind(Month, Pig.LengthCT, Pig.TbStatus)
dim(Boar)
nrow(Boar)
ncol(Boar)

#Exercise 3): The use of the vector function using epidemiological data.
# We continue with the deer from Exercise 1. Instead of the cfunction that you
# used in Exercise 2 to combine the Tb data, can you do the same with the
# vectorfunction? Give the vector a different name, for example, Tb2.
TbStatus2 = vector(length = 7)
TbStatus2[1] = 0
TbStatus2[2] = 0
TbStatus2[3] = 1
TbStatus2[4] = NA
TbStatus2[5] = 0
TbStatus2[6] = 0
TbStatus2[7] = 0
TbStatus2

 
#Exercise 4): Working with a matrix.
# Create the following matrix in R and determine its transpose, its inverse, and
# multiple D with its inverse (the outcome should be the identity matrix).
# 	D =	 (1,2,3)
# 		 (4,2,1)
# 		 (2,3,0)
D = matrix(nrow = 3, ncol = 3)
D[,1] = c(1, 4, 2)
D[,2] = c(2, 2, 3)
D[,3] = c(3, 1, 0)

#transpose D:
t(D)

#inverse of D:
Inverse = solve(D)

#multiply D to its inverse
Inverse %*% D

 
#Exercise 5): The use of the data.frame and list functions using epidemiological data.
# We continue with the deer from Exercises 1 to 3. Make a data frame that
# contains all the data presented in the table in Exercise 1. Suppose that you decide
# to square root transform the length data. Add the square root trans-
#formed data to the data frame.
Disease = data.frame(Farm, Month, year = c(00, 00, 01, NA, 03, 03, 02),
                     Sex = c(1, 2, 2, 2, 1, 2, 2), Pig.LengthCT,
                     Pig.EciStatus = c(0, 0, 0, NA, 0, 0, 0),
                     TbStatus2, sqrt(Pig.LengthCT))
Disease

# Do the same exercise with a list instead of a data.frame.What are the differences?
Year = c(00, 00, 01, NA, 03, 03, 02)
sex = c(1, 2, 2, 2, 1, 2, 2)
Eci = c(0, 0, 0, NA, 0, 0, 0)
Pig.EciStatus = c(0, 0, 0, NA, 0, 0, 0)

DiseaseL = list( Farm, Month, Year, sex, Pig.LengthCT, Pig.EciStatus, TbStatus2, sqrt(Pig.LengthCT))

Disease
DiseaseL
# The two objects are completely different. The data frame provides a list of vectors of equal length,
# arranged in a table format so that the row corresponds to an observation with measured variables in
# the columns; the list provides a flexible, stored set of objects of unequal lengths and data types. 

 
#Exercise 6): The use of the read.table and scan functions using deep sea research data.
# The file ISIT.xls contains the bioluminescent data that were used to make Fig. 1.6.
# See the paragraph above this graph for a description. Prepare the spreadsheet (there
# are 4–5 problems you will need to solve) and export the data to an ascii file. Import
# the data into R using first the read.table function and then the scan function.
# Use two different names under which to store the data. What is the difference
# between them? Use the is.matrix and is.data.frame functions to answer
# this question.

#~ revised on 1/3/18: please find the original ISIT.xls file at:
#http://highstat.com/index.php/a-beginner-s-guide-to-r
# step 1: observing ISIT.xls problems
# - data has 6 variables: sample number, Sample Depth, Sources, Station, Latitude, Longitude
# - columns 1,2,4 are whole numbers the rest have decimal values
# - colummns  and 6 have greater than 3 decimal place values.
# - the first 2 rows are empty.
# - there is an excel graph embedded in the file.

# step 2: munge the excel file:
# - standardized the data type of all columns so that they all have decimal values up to 3 digits.
# - empty values are changed to 0.000.
# - remove the graph
# - move the column headers up to the first row; eliminate any empty rows.

# step 3: save the excel file as a txt file in the soruce file.

# step 4: now import the text file into R as a data frame using read.table.
isit1 = read.table(file = "/home/mike/R/ABGR.summer2017/ISIT.txt", header = TRUE)
is.data.frame(isit1)
is.matrix(isit1)
str(isit1)


#Exercise 7): The use of the read.table or scan function using epidemiological data.
# The file Deer.xls contains the deer data discussed in Exercise 1, but includes
# all animals. Export the data in the Excel file to an ascii file, and import it into R.
Dear = read.table(file = "/home/mike/R/ABGR.summer2017/Deer.txt", header = TRUE)

 
# #~~~~ CHAPTER 3 EXERCISES ~~~~~
#Exercise 1): Using the read.table function and accessing variables from a data frame with
# epidemiological data.
# The file BirdFlu.xls contains the annual number of confirmed cases of human
# Avian Influenza A/(H5N1) for several countries reported to the World Health
# Organization (WHO). The data were taken from the WHO website
# (www.who.int/en/) and reproduced for educational purposes. Prepare the
# spreadsheet and import these data into R. If you are a non-Windows user,
# start with the file BirdFlu.txt. Note that you will need to adjust the column
# names and some of the country names.
# Use the names and str command in R to view the data. Print the number of
# bird flu cases in 2003. What is the total number of bird flu cases in 2003 and in
# 2005? Which country has had the most cases? Which country has had the least
# bird flu deaths?
# Using methods from Chapter 2, what is the totalnumber of bird flu cases per
# country? What is the total number of cases per year?
#note:I 1st manipulated text files by removing all commas, then replace  w/ tabs(4spaces).
Cases = read.table(file = "BirdFluCases.txt", header = TRUE)
names(Cases)
str(Cases)

#cases of flu for 03 and 05
Cases[1,]
Cases[3,]

#total number of cases for 03 and 05
sum(Cases[1,2:8])
sum(Cases[3,2:8])

#country with most cases: Indonesia
Cases
sum(Cases$Indonesia)
sum(Cases[,8])

#country with least cases: Bangladesh, Djibouti, Myanmar, Nigeria
Cases
print(colnames(Cases))
sum(Cases[,3])
sum(Cases[,6])
sum(Cases[,11])
sum(Cases[,12])

#total number of bird cases per country: see df CasesPerCountry
country = c(colnames(Cases))
country
country = country[-1]
country
totalcases = c(sum(Cases[,2]), sum(Cases[,3]), sum(Cases[,4]), sum(Cases[,5]) ,sum(Cases[,6])
               ,sum(Cases[,7]), sum(Cases[,8]) ,sum(Cases[,9]), sum(Cases[,10]) ,sum(Cases[,11])
               ,sum(Cases[,12]), sum(Cases[,13]), sum(Cases[,14]), sum(Cases[,15]), sum(Cases[,16]))
CasesPerCountry = data.frame(totalcases, country)
CasesPerCountry

#total number of cases per year: see df CasesPerYear
year = c(Cases[,1])
year

#Exercise 2): Using the read.table function and accessing subsets of a data
# frame with deep sea research data.
# If you have not completed Exercise 6 in Chapter 2, do so and import the data
# from the ISIT.xls file.
# In R, extract the data from station 1. How many observations were made at
# this station? What are the minimum, median, mean, and maximum sampled
# depth at station 1? What are the minimum, median, mean, and maximum
# sampled depth at station 2? At station 3?
# Identify any stations with considerably fewer observations. Create a new
# data frame omitting these stations.
# Extract the data from 2002. Extract the data from April (of all years). Extract
# the data that were measured at depths greater than 2000 meters (from all years
# and months). Show the data according to increasing depth values.
# Show the data that were measured at depths greater than 2000 meters in
# April.

#2.
# step 1: import data from isit file, using read.table on the txt file.
isit1 = read.table(file = "/home/mike/R/ABGR.summer2017/ISIT.txt", header = TRUE)

#step 2: extract data from station 1. var station is the 3rd station/column
#2.a: order the data by station #.
station1 = order(isit1$Station)

#2.b: create a df that stores the newly arranged df.
New.isit = isit1[station1, ]
str(New.isit)

#2.c: now extract rows from new.isit for when the the station column = 1.
SD1 = New.isit[New.isit$Station == 1, ]
str(SD1)

#2.d.: get the number of observations of sample depth for when station =1.
nrow(SD1) #38

#step 3: find the minimum, median, mean, and maximum sampled depth at station 1.
min(SD1$SampleDepth) # 517
median(SD1$SampleDepth) # 2520
mean(SD1$SampleDepth) # 2548.763
max(SD1$SampleDepth) # 3939

#step 4: extract data from station 2. var station is the 3rd station/column
# 4.a: now extract rows from new.isit for when the the station column = 2.
SD2 = New.isit[New.isit$Station == 2, ]
str(SD2)

#4.b: get the number of observations of sample depth for when station = 2.
nrow(SD2) #44

#4.c: find the minimum, median, mean, and maximum sampled depth at station 1.
min(SD2$SampleDepth) # 501
median(SD2$SampleDepth) # 3290
mean(SD2$SampleDepth) # 2759.523
max(SD2$SampleDepth) # 3916

#step 5: extract data from station 3. var station is the 3rd station/column
#5.a extract rows from new.isit for when the the station column = 3.
SD3 = New.isit[New.isit$Station == 3, ]
str(SD3)

#5.b: get the number of observations of sample depth for when station = 2.
nrow(SD3) #27

#5.c: find the minimum, median, mean, and maximum sampled depth at station 1.
min(SD3$SampleDepth) # 516
median(SD3$SampleDepth) # 2169
mean(SD3$SampleDepth) # 2310.815
max(SD3$SampleDepth) # 3965

#step 6: identify any stations with considerably fewer observations. create a new data frame
#        that omits these stations.
#6.a: first figure out how many other stations there are using unique on new.isit
unique(New.isit$Station) #19 total, covered 1-3. 

#6.b now, create a new isit file to work with (full data set) and another one that has statiosn 1- 3.
#Copy.isit = New.isit
new.isit2 = Reduce(function(x, y) merge(x, y, all=TRUE), list(SD1, SD2, SD3))
station.ar = order(new.isit2$Station)
new.isit2 = new.isit2[station.ar, ]
str(new.isit2)
nrow(new.isit2)

#6.c Determine, for each station, how many samples (rows of data) exist.
SD.4 = New.isit[New.isit$Station == 4, ]
SD.5 = New.isit[New.isit$Station == 5, ]
SD.6 = New.isit[New.isit$Station == 6, ]
SD.7 = New.isit[New.isit$Station == 7, ]
SD.8 = New.isit[New.isit$Station == 8, ]
SD.9 = New.isit[New.isit$Station == 9, ]
SD.10 = New.isit[New.isit$Station == 10, ]
SD.11 = New.isit[New.isit$Station == 11, ]
SD.12 = New.isit[New.isit$Station == 12, ]
SD.13 = New.isit[New.isit$Station == 13, ]
SD.14 = New.isit[New.isit$Station == 14, ]
SD.15 = New.isit[New.isit$Station == 15, ]
SD.16 = New.isit[New.isit$Station == 16, ]
SD.17 = New.isit[New.isit$Station == 17, ]
SD.18 = New.isit[New.isit$Station == 18, ]
SD.19 = New.isit[New.isit$Station == 19, ]

nrow(SD.4) #5
nrow(SD.5) #12
nrow(SD.6) #27
nrow(SD.7) #35
nrow(SD.8) #34
nrow(SD.9) #54
nrow(SD.10) #55
nrow(SD.11) #53
nrow(SD.12) #40
nrow(SD.13) #56
nrow(SD.14) #58
nrow(SD.15) #56
nrow(SD.16) #51
nrow(SD.17) #47
nrow(SD.18) #48
nrow(SD.19) #49

#6.d For the stations with observations greater than 27 (lowest #of sampels from stations 1-3)
#   , merge the data into 1 new data frame using rbind, and save it to d.f. "big.data"
Big.Data = data.frame(rbind(new.isit2, SD.8, SD.9, SD.10, SD.11, SD.12, SD.12, SD.13, SD.14,
                            SD.15, SD.16, SD.17, SD.18, SD.19))

unique(Big.Data$Station)

#step 7: extract all data for year 2002.
#7.a: year options in data set:
unique(New.isit$Year) #01 or 02

#7.b: extract the new.isit data (original data set) by variable year.
twotwo = New.isit[New.isit$Year == 2002, ]
str(twotwo)
unique(twotwo$Year)

#Step 8: extract the data for the month of April from all years.
#8.a extract april only data
unique(New.isit$Month) #months are integers; the 4th month is april.
April = New.isit[New.isit$Month == 4, ]
str(April)
unique(April$Month)

#8.b show the data is across all years
unique(April$Year) #it only exists for 2001 because that is the only year in which samples came from april.

#Step 9: Show the data according to increasing depth values- use function order!
depth = order(April$SampleDepth, decreasing = FALSE)
depth.value = April[depth, ]
str(depth.value)
 
#Exercise 3): Using the write.table function with deep sea research data.
# In the final step of the previous exercise, data measured at depths greater than
# 2000 meters in April were extracted. Export these data to a new ascii file.

# For the oceanic data set where the sample depths are > 2000 for the month of april, export
#  the data into a text file.
write.table(depth.value, file = "AprilDeepSamples.txt", sep = ",", quote = TRUE, append = FALSE, na = "NA")
 
#Exercise 4): Using the factor function and accessing subsets of a data frame with
# deep sea research data.
# Stations 1 through 5 were sampled in April 2001, stations 6 through 11 in
# August 2001, stations 12 through 15 in March 2002, and stations 16 through
# 19 in October 2002. Create two new variables in R to identify the month and the
# year. Note that these are factors. Do this by adding the new variables inside the
# data frame.

#Stations 1 through 5 were sampled in April 2001.
# stations 6 through 11 in August 2001.
# stations 12 through 15 in March 2002.
# and stations 16 through 19 in October 2002.

# Create two new variables in R to identify the month and the year.
#  Note: that these are factors.
# Do this by adding the new variables inside the data frame.

#4.a create the factor column for months. use a nominal ranking system of months.
New.isit$fMonth = factor(New.isit$Month, levels = c(3, 4, 8, 10),
                         labels = c("Mar", "Apr", "Aug", "Oct"))

#4.b create the factor column for year. in this case, make it a numerical ranking system 1 = 01 and 2 = 02.
unique(New.isit$Year)
New.isit$fYear = factor(New.isit$Year, levels = c(2001, 2002), labels = c("1", "2"))

str(New.isit)
unique(New.isit$fMonth)
New.isit$fMonth


# #~~~~ CHAPTER 4 EXERCISES ~~~~~
#Exercise 1): The use of the tapply, sapply, and lapply functions to calculate
# mean temperature per month.
# The file temperature.xls contains temperature observations made at 31 loca-
# tions along the Dutch coastline. The data were collected and provided by the
# Dutch institute RIKZ (under the monitoring program MWTL; Monitoring
# Waterstaatkundige Toestand des Lands). Sampling began in 1990, and the final
# measurements in the spreadsheet were taken in December 2005, a period of
# 16 years. Sampling frequency was 0–4 times per month, depending on the season.
# Calculate a one-time series of monthly averages using data from all stations.
# The end result should be a variable of dimension 16 x 12. Also calculate the
# standard deviation and number of observations per month.
# step 1. set working directory
setwd("/home/mike/R/ABGR.summer2017")

# step 2. convert the temperature.xls file from xls, to csv, to txt. do this in linux mint.

# step 3. upload temperature.txt to R and evaluate the data
Degrees = read.table(file = "Temperature.txt", header = TRUE)
names(Degrees)
str(Degrees)

# step 4. split the Date column into 3 seperate cols for year, month, day,
#         then add those back to Degrees df. 
#         Do this because the months in degrees$DateNR aren't recorded consistently; day 
#         and month flip positions, for 1-5.

splitted = t(sapply(Degrees$Date, function(x) substring(x, first=c(1,5,7), last=c(4,6,8))))
Degrees = data.frame(cbind(Degrees, splitted))

names(Degrees)[17] = "Year2"
names(Degrees)[18] = "Month2"
names(Degrees)[19] = "Day"

#step 5. reorder the data first by year then by month:
Dutch = order(Degrees$Year2, Degrees$Month2)
DutchTemps = Degrees[Dutch, ]

#step 6. use tapply to average temps across months, irrespective of year and station:
avg.month.temp = tapply(X = DutchTemps$Temperature, INDEX = DutchTemps$Month2,
                        FUN = mean, na.rm = TRUE)
avg.month.temp

# not rteally helpful, need an avg monthly temp of a given year to create the 16 (years) x
# 12 (stations) variable, like so:
#       1    2     3     4
#year1 12.1  13.4 14.4  14.3
#year2 ...........

#6.a) extract out the individual month's data across years and stations.
month.jan = DutchTemps[DutchTemps$Month == 1, ]
month.feb = DutchTemps[DutchTemps$Month == 2, ]
month.mar = DutchTemps[DutchTemps$Month == 3, ]
month.apr = DutchTemps[DutchTemps$Month == 4, ]
month.may = DutchTemps[DutchTemps$Month == 5, ]
month.jun = DutchTemps[DutchTemps$Month == 6, ]
month.jul = DutchTemps[DutchTemps$Month == 7, ]
month.aug = DutchTemps[DutchTemps$Month == 8, ]
month.sep = DutchTemps[DutchTemps$Month == 9, ]
month.oct = DutchTemps[DutchTemps$Month == 10, ]
month.nov = DutchTemps[DutchTemps$Month == 11, ]
month.dec = DutchTemps[DutchTemps$Month == 12, ]

# 6b) use tapply on the extracted data to get avg month temps of each year for given month.  
jan = tapply(X = month.jan$Temperature, INDEX = month.jan$Year,
             FUN = mean, na.rm = TRUE)
feb = tapply(X = month.feb$Temperature, INDEX = month.feb$Year,
             FUN = mean, na.rm = TRUE)
mar = tapply(X = month.mar$Temperature, INDEX = month.mar$Year,
             FUN = mean, na.rm = TRUE)
apr = tapply(X = month.apr$Temperature, INDEX = month.apr$Year,
             FUN = mean, na.rm = TRUE)
may = tapply(X = month.may$Temperature, INDEX = month.may$Year,
             FUN = mean, na.rm = TRUE)
jun = tapply(X = month.jun$Temperature, INDEX = month.jun$Year,
             FUN = mean, na.rm = TRUE)
jul = tapply(X = month.jul$Temperature, INDEX = month.jul$Year,
             FUN = mean, na.rm = TRUE)
aug = tapply(X = month.aug$Temperature, INDEX = month.aug$Year,
             FUN = mean, na.rm = TRUE)
sep = tapply(X = month.sep$Temperature, INDEX = month.sep$Year,
             FUN = mean, na.rm = TRUE)
oct = tapply(X = month.oct$Temperature, INDEX = month.oct$Year,
             FUN = mean, na.rm = TRUE)
nov = tapply(X = month.nov$Temperature, INDEX = month.nov$Year,
             FUN = mean, na.rm = TRUE)
dec = tapply(X = month.dec$Temperature, INDEX = month.dec$Year,
             FUN = mean, na.rm = TRUE)

twelve.by.16 = cbind(jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec)
twelve.by.16

# step 7. calculate the standard deviation per month (not avg month, need full data) 
tapply(X = DutchTemps$Temperature, INDEX = DutchTemps$Month, FUN = sd, na.rm = TRUE)

# or stadnard deviation for the avg month temps across years(probably not what is wanted)
twelve.by.16 = data.frame(cbind(jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec))
lapply(twelve.by.16, FUN = sd)

#step 8. calculate the number of observations per month.
nrow(month.jan)
nrow(month.feb)
nrow(month.mar)
nrow(month.apr)
nrow(month.may)
nrow(month.jun)
nrow(month.jul)
nrow(month.aug)
nrow(month.sep)
nrow(month.oct)
nrow(month.nov)
nrow(month.dec)

# or using the table function:
table(DutchTemps$Month2)

#Exercise 2): The use of the table function for the temperature data.
# Using the data in Exercise 1, determine the number of observations per
# station. How many observations were made per year? How many observations
# were made at each station per year?

# a) Using the data in Exercise 1, determine the number of observations per station.
table(DutchTemps$Station)

# b) How many observations were made per year?
table(DutchTemps$Year2)

# c) How many observations were made at each station per year?
table(DutchTemps$Station, DutchTemps$Year2)
 

#~~~~ CHAPTER 5 EXERCISES ~~~~~
#Exercise 1): Use of the plot function using terrestrial ecology data. In Chapter
# 16 of Zuur et al. (2009), a study is presented analysing numbers of amphibians
# killed along a road in Portugal using generalised additive mixed modelling
# techniques. In this exercise, we use the plot command to visualise a segment
# of the data. Open the file Amphibian_road_Kills.xls, prepare a spreadsheet, and
# import the data into R.
# The variable, TOT_N, is the number of dead animals at a sampling site,
# OLIVE is the number of olive groves at a sampling site, and D Park is the
# distance from each sampling point to the nearby natural park. Create a plot of
# TOT_N versus D_park. Use appropriate labels. Add a smoothing curve. Make
# the same plot again, but use points that are proportional to the value of OLIVE
# (this may show whether there is an OLIVE effect).

# A) Open the file Amphibian_road_Kills.xls, prepare a spreadsheet, import the data into R.
# note:
# - for txt files,  tabs need to be used to delineate columns.
# - create text files from csv files made from xls files.

setwd("/home/mike/R/ABGR.summer2017")
Portugal = read.table(file = "Amphibian_road_Kills.txt", header = TRUE)
max(Portugal$TOT.N)
# - TOT_N, is the number of dead animals at a sampling site.
# - OLIVE is the number of olive groves at a sampling site.
# - D Park is the distance from each sampling point to the nearby natural park.

# B) Create a plot of TOT_N versus D_park. Use appropriate labels.
unique(Portugal$TOT.N)
unique(Portugal$D.PARK)
max.n = max(Portugal$TOT.N)
max.d= max(Portugal$D.PARK)

plot(x = Portugal$D.PARK, y = Portugal$TOT.N, xlab = "Distance from Park", ylab = "Dead Animal Count",
     main = "Frequency of road kills", xlim = c(0, max(Portugal$D.PARK, na.rm = TRUE)), ylim = c(0, max(Portugal$TOT.N, na.rm = TRUE)))

# C) Add a smoothing curve.
L = loess(TOT.N ~ D.PARK, data = Portugal)
L
P.Fit = fitted(L)
Orda = order(Portugal$D.PARK)
lines(Portugal$D.PARK[Orda], Fit[Orda], lwd = 3, lty = 2)

# D) Make the same plot again, but use points that are proportional to the value of OLIVE
#    (this may show whether there is an OLIVE effect).

#update on 7/17: by proportional, the question is askiing to change the diameter of the points
#                  to be  "proportional" to the value of Olive at that point!

# a first attempt graph of # roadkills vs distance and setting each data point to have
# a width of its olive value is given by the output below:
plot(x = Portugal$D.PARK, y = Portugal$TOT.N, xlab = "Distance from Park",
     ylab = "Dead Animal Count", main = "Frequency of road kills",
     xlim = c(0, max(Portugal$D.PARK, na.rm = TRUE)),
     ylim = c(0, max(Portugal$TOT.N, na.rm = TRUE)),
     cex = Portugal$OLIVE)

# problem: many of the points have an olive value of 0, or have really big values, so the 
#         the graph shows no pattern, with many points missing or having radi beyond the 
#         graph's boundries.

# solution: categorize the olive values into, small or large # of olive groves 
#           and use this new vector of data for the cex value in the plot function.

# D.1: first, order the data by olives. save the olive data as a vector.
unique(Portugal$OLIVE)
olives = order(Portugal$OLIVE)
Portugal = Portugal[olives, ]

# D.2 then, save make a copy of the organized olive column in a new column called cex2:
Portugal$cex2 = Portugal$OLIVE

#D.3 now, modify cex2 into categories of small or large using conditional statement:
Portugal$cex2[Portugal$OLIVE >= 20] = 2
Portugal$cex2[Portugal$OLIVE < 20] = 1

#D.4 now plot the data of graph of # roadkills vs distance with radi of points as vector
#   of cex2 binary values (big or small).
plot(x = Portugal$D.PARK, y = Portugal$TOT.N, xlab = "Distance from Park",
     ylab = "Dead Animal Count", main = "Frequency of road kills",
     xlim = c(0, max(Portugal$D.PARK, na.rm = TRUE)),
     ylim = c(0, max(Portugal$TOT.N, na.rm = TRUE)),
     cex = Portugal$cex2)

# SO does the nubmer of olive trees (Olive column data) affect the # of roadkills w/
# respect to distance from park?

# answer: NO!!!
#         only at the most extreme distances from the park, that is very close
#         or very far, do we see lots of olive trees, but no distinct relationship of lots
#         of roadkill either.

#         onyl the most extreme distances (23,000 to 250,000) do we see low # of roadkill,
#         BUT, large number of olive trees!


#~~~~ CHAPTER 6 EXERCISES~~~~~
#Exercise 1): Using a loop to plot temperature per location.
# In Section 6.2, sibling negotiation behaviour was plotted versus arrival
# time for each nest in the owl data. A graph for each nest was created and
# saved as a jpg file. Do the same for the temperature data; see Exercise 4.1 for
# details. The file temperature.xls contains temperature observations made at
# 31 locations (denoted as stations in the spreadsheet) along the Dutch coast-
# line. Plot the temperature data versus time for each station, and save the
# graph as a jpg file.

# step 1. set working directory and upload raw data
getwd()
setwd("/home/mike/R/ABGR.summer2017")

Degrees = read.table(file = "Temperature.txt", header = TRUE)
names(Degrees)
str(Degrees)

unique(Degrees$Year)

# step 2: review the data, its issues and create plan on how to solve problem.
# noticable issues:
# 1. the problem wants you to plot the temperature with respect to time, but time is measured
#    as month,day,year in 2 different columns; 1 has all 3 merged as digits the other is stored
#    as someone would record time; month/day/year.
# 2. not all stations were sampled for every year in interval 1990 to 2005; r50 and r03 missing
#    year 1990.
#   not all stations were sampled fo every month!
# 3. There is a serious recording issue in column degrees$dateNR; months and dates arbitrarily flip
#    its not clear what the recording pattern of date is.

# solutions:
# 1. all stations usually have between 1 to 12 months, so use months as ur measure of time.
# 2. not all months have equal number of measurements on same days, so you will have to use
#    average monthly temperatures; for each station, avg the temperature based on month.
# 3. column degrees$date consistently records time as "year-month-day"

# GOAL: FOR EACH STATION, CREATE A PLOT, WHERE X = MONTH, Y = AVG. MONTHLY TEMP.

# PLAN OF ATTACK: make 1 loop containing all 3 functions like book as follows:
#  1. upload raw data
#  2. split the dateNr column into 3 seperate values
#  3. sort the data by stations, then save the rows of datya for 1 station to an object.
#  4. for the new object, use tapply to apply mean on temperature with respect to the month.
#  5. save the tapply output to a vector.
#  6. then graph monthly avg temp the vector as the y against a list of months, 
#      unique(newobject$month) = x, for each station. 
#  7. then save it as a jpg..

# step 3. split the degree$Date column into 3 seperate cols for year, month, day.
splitted = t(sapply(Degrees$Date, function(x) substring(x, first=c(1,5,7), last=c(4,6,8))))
Degrees = data.frame(cbind(Degrees, splitted))

names(Degrees)[17] = "Year2"
names(Degrees)[18] = "Month2"
names(Degrees)[19] = "Day"

#step 4. reorder the data first by station then by month:
a = order(Degrees$Station, Degrees$Month2)
DutchStations = Degrees[a, ]

# Final CODE: ONE LOOP WITH THREE FUNCTIONS
  unique(DutchStations$Station) # 30 stations 

AllStations <- unique(DutchStations$Station) 
for (i in 1:30) {
  Station.i <- AllStations [i]
  DutchStations.i <-DutchStations[DutchStations$Station == Station.i, ]
  temp.i = tapply(X = DutchStations.i$Temperature, INDEX = DutchStations.i$Month2,
                  FUN = mean, na.rm = TRUE)
  yourfilename <- paste(Station.i, ".jpg", sep = "")
  jpeg(file = yourfilename)
  plot(y =temp.i,
       x = c(1:12),
       xlab = "months",
       ylab = "Avg. monthly temp (C)",
       main = Station.i)
  dev.off()
}

#Exercise 2): Using the ifelse command for the owl data.
# The owl data were sampled on two consecutive nights. If you select the data
# from one nest, the observations will cover both nights. The two nights differed
# as to the feeding regime (satiated or deprived). To see observations from a single
# night, select all observations from a particular nest and food treatment. Use the
# ifelse and paste functions to make a new categorical variable that defines
# the observations from a single night at a particular nest. Try rerunning the code
# from Exercise 1 to make a graph of sibling negotiation versus arrival time for
# observations of the same nest and night.
#
#The owl data were sampled on two consecutive nights.
# If you select the data from one nest, the observations will cover both nights.
# The two nights differed as to the feeding regime (satiated or deprived).
# To see observations from a single night, select all observations from a particular nest and food
# treatment. Use the ifelse and paste functions to make a new categorical variable that defines
# the observations from a single night at a particular nest.
# Try rerunning the code from Exercise 1 to make a graph of sibling negotiation versus arrival
# time for observations of the same nest and night.

# INITIAL STEPS TO PERFORM:
# steps:
#  1. upload raw data
#  2. create a new blank column, call it "day"
#  3. if the value of the column food treatment = deprived, paste 1 into day column, else
#      past 2 into day column.
#  4. sort the data by nest site
#  5. extract the rows for a given nest site, store in an object.
#  6. for extracted info, plot day column against neg per chick
#  7. now save it as a jpg.

#step 1: upload raw data (already did this)
setwd("/home/mike/R/ABGR.summer2017")
Owls = read.table(file = "Owls.txt", header = TRUE) 
names(Owls)
str(Owls)

#step 2. create a new blank column, call it "day"
Owls$day <- c(as.integer(0))

#step 3. use ifelse function to fill in the "day" column:
day.treatments <- paste(unique(Owls$FoodTreatment))
Owls$day <- ifelse(Owls$FoodTreatment == day.treatments[1],  Owls$day <- 1,  Owls$day <- 2)

#step 4. sort data by net site:
b <- order(Owls$Nest, Owls$FoodTreatment)
Owls2 <- Owls[b, ]

# FOR-LOOP THAT WILL PERFORM 2 FUNCTIONS FOR ALL NEST SITES:
#   1.plot neggingby arrival time based on diet treatment (deprived or satiated) on same plot
#   2. save the plot as a jpg.

unique(Owls2$Nest) # 27 sites in total
totalnests <- unique(Owls2$Nest)

for (i in 1:27) {
  nest.i <- totalnests [i]
  nestsite.i <-Owls2[Owls2$Nest == nest.i, ]
  yourfilename <- paste(nest.i, ".jpg", sep = "")
  jpeg(file = yourfilename)
  plot(x = nestsite.i$ArrivalTime, y = nestsite.i$SiblingNegotiation, col=c("blue","red")[nestsite.i$day],
       xlab = "Arrival time", ylab = "Sibling Negotiation", main = nest.i)
  legend(x = "right", c("Deprived","Satiated"), pch=1, col= c("blue","red"), title=("legend"))
  dev.off()
}

#Exercise 3): Using the function and if commands with the benthic dataset.
# A) In this exercise we provide the steps for the function that was presented in
# Section 6.4: the calculation of diversity indices. Read the introductory text in
# Section 6.4 on diversity indices. Import the benthic data and extract columns
# 2–76; these are the species.
# 
# B) Calculate total abundance at sites 1, 2, 3, 45; Find a function that can do this in one
# step (sum per row). Brute force may work as well (loop), but is less elegant.
# 
# C) Calculate the total number of different species in site 1 (akaspecies richness), 2, 3, and 45;
# Find a function that can do this (all of the sites) in one step.
# 
# D) Create a function using the code for all the diversity indices. Make sure that
# the user can choose which index is calculated. Ensure that the code can deal with
# missing values. If you are brave, add the Shannon index.
# 
# E) Apply the same function to the vegetation data.

# step 1(A). Import the benthic data and extract columns 2–76; assess the data. these are the species:
Benthic <- read.table(file = "RIKZ.txt", header = TRUE)
str(Benthic)
names(Benthic)

Species <- Benthic[ ,2:76]
names(Species)
n <- dim(Species)
n # 45 rows and 75 columns; is actual species data!

# Step 2(B). Calculate total abundance at sites 1 to 45 by summing across each row (or site).
#         this gives you the total frequency of all organisms observed at a survey location.
rowSums(Species, na.rm = TRUE)

# step 3(C). Calculate total number of diff. species (species richness), across sites 1 to 45.
#         this is a logical count; counting the total number of species who were present at each
#         survey location.
rowSums(Species > 0, na.rm = TRUE)

# step 4(D). Create a function using the code for all the diversity indices. Make sure that
#    the user can choose which index is calculated. Ensure that the code can deal with
#    missing values.

diversity = function(X, Choice) {
  if (Choice == "Richness")
  {
    index <-rowSums(X > 0, na.rm = TRUE)
  } 
  else if (Choice == "Total Abundance")
  {
    index <- rowSums(X, na.rm = TRUE)
  }
  else if (Choice == "Shannon")
  {
    RS <- rowSums(X, na.rm = TRUE) # this gives # animals counted per site.
    Prop <- X/RS # this gives the % of a given species relative to total species per site.
    H <- -rowSums(Prop * log10(Prop), na.rm = TRUE)
    index <- H
  }
  else
  {
    print("incorrect value, please enter new choice")
    index <- NA
  }
  list(index = index, MyChoice = Choice)
}

diversity(Species, "Total Abundance")

# step 5(E). Apply the function you made to the vegetation data.
# step 5.a import vegetation data:
veg <- read.table(file = "Vegetation2.txt", header = TRUE)

# step 5.b evaluate the data:
str(veg)
names(veg)

# step5.c: create a plan on how to analyze the data.
# -objective: to calculate the 3 diversity indices for the transect data.
# - no raw data available, only given the species richness measures.

# 1. total abundance:
# - total abundance is the total number of organisms across all species observed.
# - sum column r for a subset of data of a given transect; use tapply or subset.

# 2. species richness:
# - species richness is the count of different species observed.
# - since we don't have exact counts of all possible species, 
# - IT IS NOT CLEAR THAT THE NUMBER OF SPECIES SEEN ON DIFFERENT OBSERVATIONS OF A TRANSECT ARE THE
# - SAME OR DIFFERENT SPECIES; THAT IS ITS NOT CLEAR IF EACH R-COUNT HAS THE SAME OR DIFF. SPECIES
# - ACROSS DIFFERENT OBSERVATIONS, WHICH ARE MEASURED AT DIFFERENT TIME INTERVALS.
# - therefore, it is NOT POSSIBLE to calculate species richness.
# - 2 possible estimators:
#   1.
# - a liberal estimation of the species richness is to consider species richness = max observed 
# - r-value; it may be likely that some species are seen more frequently than others, so the max
# - r-value covers common, uncommon, and rarely observed species.
#   or
#   2.
# - find the average r-value for each transact; not clear how well this estimates r.

# 3.shannon index: 
# - shannon index = sum(proportion of the number count of a species observed relative
#   to the total abundance of all species at the site) * log(of that prop).
# - in benthic set, each row = a location; here, the trasect column values are the locations,
# - and there are multiple obsevations across time for each location.
# - PROBLEM: DON'T HAVE INFO ON EXACT SPECIES COUNTS SO YOU CANNOT CALCULATE THE SUM OF THE
# - PROPORTIONS OF EACH SPECIES COUNT RELATIVE TO THE TOTAL SPECIES COUNT OF EACH AREA.
# - THEREFORE CANNOT CALCULATE THE SHANNON INDEX.

# step 5.c: Calculate total abundance for trasects 1 to 8:
tapply(veg$R, veg$Transect, FUN = sum, na.rm = TRUE)

# step 5.d Calculate species richness (avg amount of new species) for transects 1 to 8 using 
# the two methods of estimation for r:
tapply(veg$R, veg$Transect, FUN=max, na.rm = TRUE)
tapply(veg$R, veg$Transect, FUN=mean, na.rm = TRUE)

# ste 5.e construct a function that calculates the 2 indexes and both methods for the 2nd index:
veggies <- function(y, choice){
  if(choice == "total abundance")
  {
    index <- tapply(y$R, y$Transect, FUN = sum, na.rm = TRUE)
  }
  else if(choice == "richness")
  {
    a <- tapply(y$R, y$Transect, FUN = max, na.rm = TRUE)
    b <- tapply(y$R, y$Transect, FUN=mean, na.rm = TRUE)
    index <- list(a,b)
  }
  #else if(choice1 == "shannon")
  #{
  #abundance <- tapply(dat$R, dat$Tran, FUN = sum, na.rm = TRUE)
  #Richness <- tapply(dat$R, dat$Tran, fun = mean, na.rm = TRUE)
  #prop <- Richness/abundance
  #h <- -sum(prop * log10(prop))
  #index <- h
  #}
  else
  {
    print("please enter a different choice")
    index <- NA
  }  
  list(index = index, selection = choice)
}

veggies(veg, "richness")
veggies(veg, "total abundance")


#~~~~~~ CHAPTER 7 EXERCISES ~~~~~~~
#Exercise 1): The use of the pie function using the avian influenza data.
# In Section 7.1, we used the total number of bird flu cases per year.
# A) Make a pie chart to illustrate the totals by country. Place the labels such that they are
# readable.

# step 1: bfcases has years as rows and the countries as column, so need to transpose labels.
prob7.1 <- t(BFcases, headers = TRUE)
colnames(prob7.1) <- prob7.1[1,]
prob7.1
prob7.1 <- prob7.1[-1,]
prob7.1

# step 2: sum the cases by row, or each country.
death <- rowSums(prob7.1, na.rm = TRUE)
death

#~~ WORK IN PROGRESS IN STEP 3~~ 
# step 3: make a pie chart of the case totals by country. make sure lables are readable.
par(mar = c(0,1,1,0), cex.lab = 0.5, adj.lab = .2, mex = 1)
pie(death, main = "Avian Flu Deaths by country", clockwise = FALSE, col = rainbow(16), edges=100,
    radius = .75)

# B) Make a pie chart showing total avian flu cases per year and one showing cases per country.
op <- par(mfrow = c(2,1))
pie(death, main = "Avian Flu Cases by country", clockwise = FALSE, col = rainbow(16), edges=100,
    radius = .75)
pie(cases, col = rainbow(6), clockwise = TRUE, main = "Avain flu cases by year")
par(op)


#Exercise 2): The use of the barchart and stripchart functions using a vegetation data set
# A) In Section 4.1, we calculated species richness, as well as its mean values and
# standard deviations, in eight transects. Make a bar chart for the eight mean
# values and add a vertical line for the standard error.

# step 1: first uplad the vegetation data set.
plants <- read.table(file = "Vegetation2.txt", header = TRUE)

# step 2: calcualte the means and standard devs of each transect's R using t-apply.
plant.m <- tapply(plants$R, INDEX = plants$Transect, FUN = mean)
plant.sd <- tapply(plants$R, INDEX = plants$Transect, FUN = sd)

# step 3: calcualte the length or # values per transect.
plant.n <- tapply(plants$R, INDEX = plants$Transect, FUN = length)

# step 4: calcualte the standard error of the species richness by taking stand devs/sqrt(step 3)
plant.se <- plant.sd/sqrt(plant.n)
plant.se

# step 5: now create the bar plot with error bars using arrow function.
xdd <- barplot(plant.m, ylab = "avg. species richness", xlab = "transect", col = rainbow(8), ylim = c(0,15))
arrows(xdd, plant.m, xdd, plant.m + plant.se, lwd = 1.5, angle = 90, length = 0.1)
arrows(xdd, plant.m, xdd, plant.m - plant.se, lwd = 1.5, angle = 90, length = 0.1)

# B) Make a graph in which the means are plotted as black points, the standard
# errors as lines around the mean, and the observed data as open dots.
stripchart(plants$R ~ plants$Transect, vert = TRUE, pch = 1, method = "jitter",
           jit = 0.1, xlab = "Transect", ylab = "Richness")
points(1:8, plant.m, pch = 16, cex = 1.5)
arrows(1:8, plant.m, 1:8, plant.m + plant.se, lwd = 1.5, angle = 90, length = 0.1)
arrows(1:8, plant.m, 1:8, plant.m - plant.se, lwd = 1.5, angle = 90, length = 0.1)


#Exercise 3): The use of the boxplot function using a vegetation dataset.
# Using the vegetation data in Exercise 2, make a boxplot showing the richness values.

# step 1: import the data
veggies <- read.table(file = "Vegetation2.txt", header = TRUE)

# problem: each transect has only a few observations..consider using varwidth to identify
#         small sample sizes.

# step 2: create boxplots of richness by transect.
boxplot(R~Transect, data = veggies, col = "grey", xlab="transect", ylab="species richness", varwidth = TRUE,
        main = "species richness boxplots for each transect")

#the var width doesnt help much so use the number printout method:
bp <- boxplot(R~Transect, data = veggies, col = "grey", xlab="transect", ylab="species richness", varwidth = TRUE,
              main = "species richness boxplots for each transect")
mp <- bp$stats[2,]+(bp$stats[4,]-bp$stats[2,])/2
mp

n <- tapply(veggies$R, INDEX = veggies$Transect, FUN=length)

# now place numerical text of sample size into the boxplot:
boxplot(R~Transect, data = veggies, col = "grey", xlab="transect", ylab="species richness", varwidth = TRUE,
        main = "species richness boxplots for each transect")
text(1:9, mp, n, col="blue", font = 2)


#Exercise 4): The use of the boxplot function using a parasite dataset.
# In Section 6.3.3, a cod parasite dataset was used. Make a boxplot of the
# number of parasites (Intensity) conditional on area, sex, stage, or year. Try
# combinations to detect interactions.

#step 1: import the data
cod <- read.table(file = "CodParasite.txt", header = TRUE)
str(cod)
unique(cod$Year)

# step 2: boxplots of number of parasites (Intensity) conditional on area, sex, stage, or year.
#par(mfrow = c(2,2), mar = c(2,2,2,3))
boxplot(Intensity~Area, data = cod, xlab="area", ylab="intensity")
boxplot(Intensity~Sex, data = cod, xlab="sex", ylab= "intensity")
boxplot(Intensity~Stage, data = cod, xlab="stage", ylab= "intensity")
boxplot(Intensity~Year, data = cod, xlab="year", ylab= "intensity")

a<- boxplot(Intensity~Area, data = cod, xlab="area", ylab="intensity")
b<- boxplot(Intensity~Sex, data = cod)
c<- boxplot(Intensity~Stage, data = cod)
d<- boxplot(Intensity~Year, data = cod)
list(a)

lebs <- c("1-juv", "2-juv", "3-juv", "4-juv", "1M", "2M", "3M","4M","1F","2F","3F","4F")
boxplot(Intensity~Area*Sex, data = cod, axes = FALSE, ylim=c(-100,300), xlab="area & sex",
        ylab="intensity")
axis(2, at = c(0,100,200,300))
text(x = 1:12, y = -50, labels = lebs, cex = 0.75, srt  = 65)

# seems that in area 4, the females are getting hit the hardest with parasites..


#Exercise 5): The use of the dotchart function using the owl data.
# A) In Section 7.3, we used the owl data. Make two Cleveland dotplots of nestling negotiation
#  and arrival time.
# step 1: read in the owl data.
owls <- read.table(file="Owls.txt", header= TRUE)

#step 2: make a clevland dopt plot for nestling negotiation:
dotchart(owls$SiblingNegotiation, xlab = "chick negging", ylab = "obersvation number")

#step 3: make a cleavland dot plot for arrival time
dotchart(owls$ArrivalTime , xlab = "arrival time of parent", ylab = "observation number")

# B) Make a Cleveland dotplot showing arrival time per night.
# - The nest and food treatment variables show which observations were made on the same night.
# - See also Exercise 2 in Section 6.6.

# this seems to work ok, but can't read the y-axis label well; change the grouping labels
# by adding a new column in dataframe as "d" or "s".
dotchart(owls$ArrivalTime , group = factor(owls$FoodTreatment), xlab = "arrival time of parent", ylab = "obs. #")

# step 1: create the new short hand column of food treatment using ifelse statments
a <- unique(owls$FoodTreatment)
owls$shorthand <- ifelse(owls$FoodTreatment == a[1], owls$shorthand <- "d", owls$shorthand <- "s" )

#step 2: now create the clevland plot..works better.
dotchart(owls$ArrivalTime, group = factor(owls$shorthand), xlab = "arrival time of parent", ylab = "obs. #")

#Exercise 6): The use of the dotchart function using the parasite data.
# A) Make a Cleveland dotplot for the parasite data that were used in Exercise 4.
# Use the number of parasites (Intensity), and group the observations by area,
# sex, stage, or by year. 
#step 1: import the parasite data
cod <- read.table(file = "CodParasite.txt", header = TRUE)

# step 2: make clevland dotplots grouped by area, sex, stage or year. 
# note: check for nas for all groups first...all or ok.
unique(cod$Area)
unique(cod$Sex)
unique(cod$Year)
unique(cod$Stage)

# intensity by area
dotchart(cod$Intensity, group = factor(cod$Area), xlab = "parasite load", ylab = "obsv. #")
# intensity by sex
dotchart(cod$Intensity, group = factor(cod$Sex), xlab = "parasite load", ylab = "obsv. #")
# intesity by year
dotchart(cod$Intensity, group = factor(cod$Year), xlab = "parasite load", ylab = "obsv. #")
# intesity by stage
dotchart(cod$Intensity, group = factor(cod$Stage), xlab = "parasite load", ylab = "obsv. #")


# B) Make a Cleveland dotplot showing depth, and group the observations by prevalence.
dotchart(cod$Depth, group = factor(cod$Prevalence), xlab = "Depth", ylab = "obsv. #")

