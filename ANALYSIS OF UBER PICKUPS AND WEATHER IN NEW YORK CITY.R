rm(list=ls())

## Libraries ##
library('XML')
library('RCurl')
library(ggplot2)
library(ggmap)
library(dplyr)

#load raw data 
all_month<-read.csv("uber_all_data.csv",stringsAsFactors = FALSE)
anyNA(all_month)   #FALSE, no need to handle na

#separate date and time into two columns
str <- unlist(strsplit(all_month$ï..Date.Time, " "))
t <- seq(2, length(str),2)
all_month$Time <- str[t]
d <- seq(1, length(str),2)
all_month$Date <- str[d]
all_month$ï..Date.Time <- NULL
all_month$Date <- as.Date(all_month$Date, "%m/%d/%Y")

#add day of a week based on date 
all_month$Day<-weekdays(as.Date(all_month$Date,"%m/%d/%Y"))

#for simplicity, extract only hour from time
all_month$Time<-format(strptime(all_month$Time,"%H:%M"),'%H')
all_month$Time<-as.numeric(all_month$Time)



### WEB SCRAPPING PART 1 ###
##Note: you may need to run this part for multiple times, since this website has pop-ups
#create empty vectors for each month and add values into each
AprilTemp <- character(0)
MayTemp <- character(0)
JuneTemp <- character(0)
JulyTemp <- character(0)
AugustTemp <- character(0)
SeptTemp <- character(0)

#scrap average temperature from website
### April
for (d in 1:30) {
  Sys.sleep(1)
  if (d < 10) {
    page <- htmlParse(getURL(paste('https://www.almanac.com/weather/history/NY/New%20York/2014-04-0',d, sep = '')))
    April_m <- xpathSApply(page,"//table[@class='weatherhistory_results']/tr/td//span", xmlValue)
    AprilTemp[[d]] <- c(April_m[3]) }
  else {
    page <- htmlParse(getURL(paste('https://www.almanac.com/weather/history/NY/New%20York/2014-04-', d, sep = '')))
    April_m <- xpathSApply(page,"//table[@class='weatherhistory_results']/tr/td//span", xmlValue)
    AprilTemp[[d]] <- c(April_m[3]) }
}
print(AprilTemp)
AprilTemp<-as.data.frame(AprilTemp)
AprilTemp$Date<-seq(from = as.Date("2014-04-01"), to = as.Date("2014-04-30"), by = 'day')

### May
for (d in 1:31) {
  Sys.sleep(1)
  if (d < 10) {
    page <- htmlParse(getURL(paste('https://www.almanac.com/weather/history/NY/New%20York/2014-05-0',d, sep = '')))
    May_m <- xpathSApply(page,"//table[@class='weatherhistory_results']/tr/td//span", xmlValue)
    MayTemp[[d]] <- c(May_m[3]) }
  else {
    page <- htmlParse(getURL(paste('https://www.almanac.com/weather/history/NY/New%20York/2014-05-', d, sep = '')))
    May_m <- xpathSApply(page,"//table[@class='weatherhistory_results']/tr/td//span", xmlValue)
    MayTemp[[d]] <- c(May_m[3]) }
}
print(MayTemp)
MayTemp<-as.data.frame(MayTemp)
MayTemp$Date<-seq(from = as.Date("2014-05-01"), to = as.Date("2014-05-31"), by = 'day')

### June
for (d in 1:30) {
  Sys.sleep(1)
  if (d < 10) {
    page <- htmlParse(getURL(paste('https://www.almanac.com/weather/history/NY/New%20York/2014-06-0',d, sep = '')))
    June_m <- xpathSApply(page,"//table[@class='weatherhistory_results']/tr/td//span", xmlValue)
    JuneTemp[[d]] <- c(June_m[3]) }
  else {
    page <- htmlParse(getURL(paste('https://www.almanac.com/weather/history/NY/New%20York/2014-06-', d, sep = '')))
    June_m <- xpathSApply(page,"//table[@class='weatherhistory_results']/tr/td//span", xmlValue)
    JuneTemp[[d]] <- c(June_m[3]) }
}
print(JuneTemp)
JuneTemp<-as.data.frame(JuneTemp)
JuneTemp$Date<-seq(from = as.Date("2014-06-01"), to = as.Date("2014-06-30"), by = 'day')

### July
for (d in 1:31) {
  Sys.sleep(1)
  if (d < 10) {
    page <- htmlParse(getURL(paste('https://www.almanac.com/weather/history/NY/New%20York/2014-07-0',d, sep = '')))
    July_m <- xpathSApply(page,"//table[@class='weatherhistory_results']/tr/td//span", xmlValue)
    JulyTemp[[d]] <- c(July_m[3]) }
  else {
    page <- htmlParse(getURL(paste('https://www.almanac.com/weather/history/NY/New%20York/2014-07-', d, sep = '')))
    July_m <- xpathSApply(page,"//table[@class='weatherhistory_results']/tr/td//span", xmlValue)
    JulyTemp[[d]] <- c(July_m[3]) }
}
print(JulyTemp)
JulyTemp<-as.data.frame(JulyTemp)
JulyTemp$Date<-seq(from = as.Date("2014-07-01"), to = as.Date("2014-07-31"), by = 'day')

### August
for (d in 1:31) {
  Sys.sleep(1)
  if (d < 10) {
    page <- htmlParse(getURL(paste('https://www.almanac.com/weather/history/NY/New%20York/2014-08-0',d, sep = '')))
    August_m <- xpathSApply(page,"//table[@class='weatherhistory_results']/tr/td//span", xmlValue)
    AugustTemp[[d]] <- c(August_m[3]) }
  else {
    page <- htmlParse(getURL(paste('https://www.almanac.com/weather/history/NY/New%20York/2014-08-', d, sep = '')))
    August_m <- xpathSApply(page,"//table[@class='weatherhistory_results']/tr/td//span", xmlValue)
    AugustTemp[[d]] <- c(August_m[3]) }
}
print(AugustTemp)
AugustTemp<-as.data.frame(AugustTemp)
AugustTemp$Date<-seq(from = as.Date("2014-08-01"), to = as.Date("2014-08-31"), by = 'day')

### Sept
for (d in 1:30) {
  Sys.sleep(1)
  if (d < 10) {
    page <- htmlParse(getURL(paste('https://www.almanac.com/weather/history/NY/New%20York/2014-09-0',d, sep = '')))
    Sept_m <- xpathSApply(page,"//table[@class='weatherhistory_results']/tr/td//span", xmlValue)
    SeptTemp[[d]] <- c(Sept_m[3]) }
  else {
    page <- htmlParse(getURL(paste('https://www.almanac.com/weather/history/NY/New%20York/2014-09-', d, sep = '')))
    Sept_m <- xpathSApply(page,"//table[@class='weatherhistory_results']/tr/td//span", xmlValue)
    SeptTemp[[d]] <- c(Sept_m[3]) }
}
print(SeptTemp)
SeptTemp<-as.data.frame(SeptTemp)
SeptTemp$Date<-seq(from = as.Date("2014-09-01"), to = as.Date("2014-09-30"), by = 'day')


### WEB SCRAPPING PART 2 ###
#scrap rainfall from website
url<-getURL("http://www.cnyweather.com/wxraindetail.php?year=2014")
page<-htmlParse(url) 

#April
AprilRainfall <- xpathSApply(page,
                             "//div[@id='report']/table/tr/td[5]", 
                             xmlValue)
AprilRainfall<-AprilRainfall[1:30]
AprilRainfall<-as.data.frame(AprilRainfall)
AprilRainfall$Date<-seq(from = as.Date("2014-04-01"), to = as.Date("2014-04-30"), by = 'day')

#May
MayRainfall <- xpathSApply(page,
                           "//div[@id='report']/table/tr/td[6]", 
                           xmlValue)
MayRainfall<-MayRainfall[1:31]
MayRainfall<-as.data.frame(MayRainfall)
MayRainfall$Date<-seq(from = as.Date("2014-05-01"), to = as.Date("2014-05-31"), by = 'day')

#June
JuneRainfall <- xpathSApply(page,
                            "//div[@id='report']/table/tr/td[7]", 
                            xmlValue)
JuneRainfall<-JuneRainfall[1:30]
JuneRainfall<-gsub("---","0.00",JuneRainfall)
JuneRainfall<-as.data.frame(JuneRainfall)
JuneRainfall$Date<-seq(from = as.Date("2014-06-01"), to = as.Date("2014-06-30"), by = 'day')

#July
JulyRainfall <- xpathSApply(page,
                            "//div[@id='report']/table/tr/td[8]", 
                            xmlValue)
JulyRainfall<-JulyRainfall[1:31]
JulyRainfall<-as.data.frame(JulyRainfall)
JulyRainfall$Date<-seq(from = as.Date("2014-07-01"), to = as.Date("2014-07-31"), by = 'day')

#August
AugustRainfall <- xpathSApply(page,
                              "//div[@id='report']/table/tr/td[9]", 
                              xmlValue)
AugustRainfall<-AugustRainfall[1:31]
AugustRainfall<-as.data.frame(AugustRainfall)
AugustRainfall$Date<-seq(from = as.Date("2014-08-01"), to = as.Date("2014-08-31"), by = 'day')

#September
SeptemberRainfall <- xpathSApply(page,
                                 "//div[@id='report']/table/tr/td[10]", 
                                 xmlValue)
SeptemberRainfall<-SeptemberRainfall[1:30]
SeptemberRainfall<-as.data.frame(SeptemberRainfall)
SeptemberRainfall$Date<-seq(from = as.Date("2014-09-01"), to = as.Date("2014-09-30"), by = 'day')

### Data Integration ###
# Merge all the web sracpping data in one data frame
# merge all the temp data into one data frame, and then merge all_temp with all_month
length(names(AprilTemp)) == length(names(MayTemp))
setdiff(names(AprilTemp), names(MayTemp))
setdiff(names(MayTemp), names(AprilTemp))
names(AprilTemp)[which(names(AprilTemp) == 'AprilTemp')] <-'Temp'
names(MayTemp)[which(names(MayTemp) == 'MayTemp')] <-'Temp'

length(names(JuneTemp)) == length(names(JulyTemp))
setdiff(names(JuneTemp), names(JulyTemp))
setdiff(names(JulyTemp), names(JuneTemp))
names(JuneTemp)[which(names(JuneTemp) == 'JuneTemp')] <-'Temp'
names(JulyTemp)[which(names(JulyTemp) == 'JulyTemp')] <-'Temp'

length(names(AugustTemp)) == length(names(SeptTemp))
setdiff(names(AugustTemp), names(SeptTemp))
setdiff(names(SeptTemp), names(AugustTemp))
names(AugustTemp)[which(names(AugustTemp) == 'AugustTemp')] <-'Temp'
names(SeptTemp)[which(names(SeptTemp) == 'SeptTemp')] <-'Temp'

all_temp <- rbind(AprilTemp, MayTemp, JuneTemp, JulyTemp, AugustTemp, SeptTemp)
all_month <- merge(all_month,all_temp, all = TRUE)

# merge all the rainfall data into one data frame, and then merge all_temp with all_rain
length(names(AprilRainfall)) == length(names(MayRainfall))
setdiff(names(AprilRainfall), names(MayRainfall))
setdiff(names(MayRainfall), names(AprilRainfall))
names(AprilRainfall)[which(names(AprilRainfall) == 'AprilRainfall')] <-'Rainfall'
names(MayRainfall)[which(names(MayRainfall) == 'MayRainfall')] <-'Rainfall'

length(names(JuneRainfall)) == length(names(JuneRainfall))
setdiff(names(JuneRainfall), names(JulyRainfall))
setdiff(names(JulyRainfall), names(JuneRainfall))
names(JuneRainfall)[which(names(JuneRainfall) == 'JuneRainfall')] <-'Rainfall'
names(JulyRainfall)[which(names(JulyRainfall) == 'JulyRainfall')] <-'Rainfall'

length(names(AugustRainfall)) == length(names(SeptemberRainfall))
setdiff(names(AugustRainfall), names(SeptemberRainfall))
setdiff(names(SeptemberRainfall), names(AugustRainfall))
names(AugustRainfall)[which(names(AugustRainfall) == 'AugustRainfall')] <-'Rainfall'
names(SeptemberRainfall)[which(names(SeptemberRainfall) == 'SeptemberRainfall')] <-'Rainfall'

all_rain <- rbind(AprilRainfall, MayRainfall, JuneRainfall, JulyRainfall, AugustRainfall, SeptemberRainfall)
all_month <- merge(all_month,all_rain, by.x = 'Date', all = TRUE)


#remove useless column
all_month$Base<-NULL

# Transform Temp and Rainfall columns to numeric data type
str(all_month)
all_month$Temp <- as.numeric(levels(all_month$Temp))[all_month$Temp]
all_month$Rainfall <- as.numeric(levels(all_month$Rainfall))[all_month$Rainfall]
str(all_month)
# Final merged data frame
View(all_month)




### ANALYSIS PART ###
## Highest Frequency by Day
freq_df<-as.data.frame(table(all_month$Day))
names(freq_df)=c("Day","Freq")
freq_df$Day <- factor(freq_df$Day, levels=c("Monday", "Tuesday", "Wednesday", "Thursday", 
                                            "Friday", "Saturday", "Sunday"))
freq_df[order(freq_df$Day),]

# Visualize Highest Frequency by Day
p1<-ggplot(data=freq_df, aes(x= Day, y= Freq,fill= Day))+
  geom_bar(stat = "identity")+
  scale_fill_brewer(palette="Set2")+
  geom_text(aes(label=Freq),vjust=1.6, color="white", size=8.5)+
  theme_minimal()
p1+ ggtitle("Pickup Frequency by Day")


### Busiest Period
all_month$Time<-as.numeric(all_month$Time)
breaks<-c(-Inf,6,12,18,Inf)
labels<-c("Midnight","Morning","Afternoon","Evening")
all_month$TimePeriod<-cut(all_month$Time,breaks,labels)
tb1<-table(all_month$TimePeriod)
tb1

tb2<-round(prop.table(tb1)*100,2)
tb2


# Visualize Busiest Priod
percentage_mid<-round(sum(all_month$TimePeriod=="Midnight")/sum(table(all_month$TimePeriod))*100)
percentage_mid<-paste(percentage_mid,"%")
percentage_mor<-round(sum(all_month$TimePeriod=="Morning")/sum(table(all_month$TimePeriod))*100)
percentage_mor<-paste(percentage_mor,"%")
percentage_aft<-round(sum(all_month$TimePeriod=="Afternoon")/sum(table(all_month$TimePeriod))*100)
percentage_aft<-paste(percentage_aft,"%")
percentage_eve<-round(sum(all_month$TimePeriod=="Evening")/sum(table(all_month$TimePeriod))*100)
percentage_eve<-paste(percentage_eve,"%")
Midnight<-paste("Midnight",percentage_mid)
Morning<-paste("Morning",percentage_mor)
Afternoon<-paste("Afternoon",percentage_aft)
Evening<-paste("Evening",percentage_eve)
labels<-c(Midnight,Morning,Afternoon,Evening)
all_month$TimePeriod<-cut(all_month$Time,breaks,labels)
pie(table(all_month$TimePeriod), main = "Uber Pickup Percentage in All Periods")


### Relationship between Uber pickup and temperature
temp_df<-as.data.frame(all_month$Temp)
colnames(temp_df)<-"Temp"
temp_summary<-temp_df%>%
  group_by(Temp)%>%
  count(sort = T)

kruskal.test(temp_summary$n~temp_summary$Temp)
#Based on result of kruskal test, the p-value is 0.4836, 
#which suggests that there is NOT a significant difference 
#in number of Uber pickups in different temperature 



# Visualize Uber pickup and temperature
#to find which temperature condition has highest frequency
qplot(Temp,
      data = all_month,
      geom = "histogram",
      bins=floor(sqrt(nrow(all_temp))),
      colour=I("white"),
      fill=I("pink"),
      ylab = "Frequency",
      xlab = "Temperature (°F)",
      main = "Relationship Between Temp & Pickup Count")+
  scale_x_continuous(breaks = seq(35, 90, 5),limits=c(35, 90))



### Relationship between Uber pickup and rainfall
df_rainfall<-group_by(all_month, Rainfall)
df_rainfall<- subset(df_rainfall, df_rainfall$Rainfall>0)

rainfall_summary<-summarize(df_rainfall,
                            Total=n()) %>% arrange(desc(Total))
rainfall_summary

#check linear relationship between Uber pickup and rainfall
linearMod<-lm(Total~Rainfall, data=rainfall_summary)
cor(rainfall_summary$Rainfall,rainfall_summary$Total)
#correlation is -0.2536957 which means the number of pickup and rainfall have negative relationship

#visualize the negative linear relation
plot(Total~Rainfall, data=rainfall_summary)+title(main = "Relationship Between Uber Pickup Amount and Rainfall")
abline(linearMod,col='red')

#visualize the Uber order varies in different rainfall condition
qplot(Rainfall,
      data = rain,
      geom = "histogram",
      bins=floor(sqrt(nrow(rain))),
      colour=I("white"),
      fill=I("pink"),
      xlab="Rainfall(inch)",
      ylab = "Frequency",
      main = "Relationship Between Rainfall & Pickup Count")

### Hottest Pickup Location in NYC
#round longitude and latitude to three decimal places
geo<-round(all_month[2:3],digits = 3)

#group by longitude and latitude and count for each location
geo<- geo %>%
  group_by(Lat,Lon) %>% 
  count(sort = T)

#for simplicity, extract top 100 location
geo_100<-head(geo,100)

#to extract the top 10 popular locations
geo_10<-head(geo,10)


#Visualize top 100 and top 10 location for Uber Pickups
ggmap::register_google(key = "AIzaSyD1GayBePwiY1A_Vd_kendGUUbrk6uJhIs")
p <- ggmap(get_googlemap(center = c(lon = mean(all_month$Lon), lat = mean(all_month$Lat)),
                         zoom = 11, scale = 2,
                         maptype ='terrain',
                         color = 'color'))
p   
p + geom_point(aes(x = Lon, y = Lat),colour='red', data = geo_100, size = 5) + 
  theme(legend.position="bottom")

p + geom_point(aes(x = Lon, y = Lat),colour='red', data = geo_10, size = 5) + 
  theme(legend.position="bottom")



