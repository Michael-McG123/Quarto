#install
install.packages("tidyverse")

#load libraries
library(tidyverse)
library(ggplot2)
library(readxl)

#data prep
setwd("C:\\Users\\Home\\Desktop\\R")
data1 <- read.csv("unicef_indicator_1.csv")
data2 <- read.csv("unicef_indicator_2.csv")
metadata <- read.csv("unicef_metadata.csv")

#remove column named country
metadata$empty <- NULL

# Convert to numeric
metadata$year <- as.numeric(metadata$year)

# Remove rows with missing values
cleaned_metadata <- na.omit(metadata)

# Filter for countries
cleaned_metadata$year <- as.numeric(cleaned_metadata$year)

  filtered_metadata <- cleaned_metadata %>%
  filter(country %in% c("Afghanistan", "Slovenia", "Czech Republic", "Estonia", "Niger", "Slovenia", "Yemen") &
           year == 2014)

  
  #Scattter plot
  filtered_metadata2 <- metadata %>%
    filter(country %in% c("Afghanistan", "Slovenia", "Czech Republic", "Estonia", "Niger", "Slovenia", "Yemen") & 
             year >= 2014 & year <= 2022)
  filtered_metadata2 <- filtered_metadata2 %>%
    rename(GDP_per_capita = GDP.per.capita..constant.2015.US..)
  filtered_metadata2 <- filtered_metadata2 %>%
    rename(life_expectancy = Life.expectancy.at.birth..total..years.)
  ggplot(data = filtered_metadata2, aes(x = GDP_per_capita, y = life_expectancy, color = country)) +
    geom_point() +
    labs(title = "Scatter Plot of GDP per Capita vs Life Expectancy",
         x = "GDP per Capita",
         y = "Life Expectancy")
  
  
  filtered_metadata <- filtered_metadata %>%
    rename(GDP_per_capita = GDP.per.capita..constant.2015.US..)
  filtered_metadata <- filtered_metadata %>%
  rename(life_expectancy = Life.expectancy.at.birth..total..years.)
   
  ggplot(data =filtered_metadata, aes(x = GDP_per_capita, y = life_expectancy)) +
    geom_point(aes(color = "GDP_per_capita"), show.legend = none) +
    geom_point(aes(color = "life_expectancy"), show.legend = none) +
    scale_color_manual(values = c("GDP_per_capita" = "blue", "life_expectancy" = "red")) +
    labs(title = "Scatter Plot of GDP per Capita vs Life Expectancy (Year 2014)",
         x = "GDP per Capita",
         y = "Life Expectancy")
  
  
  
  #BarChart
  filtered_metadata <- filtered_metadata %>%
    rename(GDP = GDP_per_capita_)
  
  ggplot(filtered_metadata, aes(x = country, y = GDP)) +
    geom_bar(stat = "identity", fill = "skyblue") +
    labs(x = "Country", y = "GDP per Capita", title = "GDP per Capita of Six Countries")
  
  #Indicator 1
  #remove column named country
  unicef_indicator_1$empty <- NULL
  # Convert to numeric
  unicef_indicator_1$time_period <- as.numeric(unicef_indicator_1$time_period)
  
  #filter for males
  males_data <- unicef_indicator_1 %>%
    filter(sex == "Male" & country %in% c("Afghanistan", "Slovenia", "Czech Republic", "Estonia", "Niger", "Slovenia", "Yemen"))
  #filter for females
  females_data <- unicef_indicator_1 %>%
    filter(sex == "Female" & country %in% c("Afghanistan", "Slovenia", "Czech Republic", "Estonia", "Niger", "Slovenia", "Yemen"))
#Bind both
  combined_data <- rbind(males_data, females_data)
#BARCHAR OFFICIAL
  filtered_metadata <- metadata %>%
    filter(country %in% c("Afghanistan", "Slovenia", "Czech Republic", "Estonia", "Niger", "Slovenia", "Yemen") & 
             year >= 2014 & year <= 2022)
  
  
  ggplot(data = combined_data, aes(x = obs_value, y = country, color = sex)) +
    geom_col(position = "dodge")  +
    geom_smooth(method = "lm", se = FALSE) 
    labs(title = "Scatter Plot of Percentage of People Unemployed in Countries According to Sex",
         x = "Percentage of Unemployed People",
         y = "Country")
    
    
    #World Map
  