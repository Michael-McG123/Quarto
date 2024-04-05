ibrary(plotly)

# Create a data frame with country names and inflation levels
data <- data.frame(country = c("Yemen", "Afghanistan", "Czech Republic", "Slovenia", "Estonia", "Niger"),
                   inflation_new = c(1, 2, 3, 4, 5, 6))  # Replace with actual inflation data

# Create a choropleth map using plotly
p <- plot_geo(data, locationmode = "country names") %>%
  add_trace(
    z = ~inflation_new,
    locations = ~country,
    color = ~inflation_new,
    colors = c("lightblue", "darkblue"),
    marker = list(line = list(color = "black", width = 1)),
    colorbar = list(title = "Inflation")
  ) %>%
  layout(
    title = "Inflation Levels in Six Countries for the Year 2022"
  )




fig <- plot_ly(data = df, type = 'scattergeo', lat = ~latitude, lon = ~longitude, text = ~paste(country, "<br>Value:", values), mode = 'markers', marker = list(size = 10, color = ~values, colorscale = 'Blues')) %>%
  layout(
    title = "World Map",
    geo = list(
      projection = list(type = "natural earth"),
      showland = TRUE,
      landcolor = "lightgray",
      showocean = TRUE,
      oceancolor = "lightblue"
    ),
    margin = list(l = 0, r = 0, t = 40, b = 0)
  )

# Show the map
fig

# Display the interactive plot
p



```{r echo=FALSE, message=FALSE, warning=FALSE}

install.packages("tidyverse")

library(tidyverse)
library(ggplot2)
library(readxl)
library(dplyr)
library(conflicted)

#data prep
data1 <- read.csv("unicef_indicator_1.csv")
data2 <- read.csv("unicef_indicator_2.csv")
metadata <- read.csv("unicef_metadata.csv")

#Indicator 1
# Read data from CSV files
unicef_indicator_1 <- read.csv("unicef_indicator_1.csv")
#remove column named country
unicef_indicator_1$empty <- NULL
# Convert to numeric
unicef_indicator_1$time_period <- as.numeric(unicef_indicator_1$time_period)

#filter for males
library(dplyr)
males_data <- unicef_indicator_1 %>%
  dplyr::filter(sex == "Male" & country %in% c("Afghanistan", "Slovenia", "Czech Republic", "Estonia", "Niger", "Slovenia", "Yemen"))

#filter for females
females_data <- dplyr::filter(unicef_indicator_1, sex == "Female" & country %in% c("Afghanistan", "Slovenia", "Czech Republic", "Estonia", "Niger", "Slovenia", "Yemen"))
#Bind both
combined_data <- rbind(males_data, females_data)
#BARCHAR OFFICIAL
filtered_metadata <- dplyr::filter(metadata, country %in% c("Afghanistan", "Slovenia", "Czech Republic", "Estonia", "Niger", "Slovenia", "Yemen") & 
                                     year >= 2014 & year <= 2022)
#plotly
library(plotly)
p <- ggplot(data = combined_data, aes(x = obs_value, y = country, color = sex)) +
  geom_col(position = "dodge") +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Percentage of People Unemployed (etc.) in Countries According to Sex",
       x = "Percentage of Unemployed People",
       y = "Country")
p <- ggplotly(p)




library(ggplot2)
library(dplyr)
library(maps)
library(plotly)

# Assuming your filtered dataset is named "filtered_data_map"
# Assuming your dataset contains columns "country", "year", and "inflation"

# Rename the inflation column
filtered_data_map <- filtered_data_map %>%
  rename(inflation_real = inflation_new)

# Filter data for the year 2022 and the six specified countries
filtered_data <- filtered_data_map %>%
  filter(country %in% c("Yemen", "Afghanistan", "Czech Republic", "Slovenia", "Estonia", "Niger") & year == 2022)

# Get world map data
world_map <- map_data("world")

# Join inflation data with world map data
map_data_with_inflation <- left_join(world_map, filtered_data, by = c("region" = "country"))

# Create world map plot with inflation levels
print(sum(is.na(map_data_with_inflation$inflation_real))) 

# Create world map plot with inflation levels
p <-ggplot(data = map_data_with_inflation, aes(x = long, y = lat, group = group, fill = inflation_real)) +
  geom_polygon(color = "black") +
  scale_fill_gradient(name = "Inflation",
                      low = "lightblue", high = "darkblue", na.value = "grey") +
  labs(title = "Inflation Levels in Six Countries for the Year 2022")
p <- ggplotly(p)
p




library(plotly)
library(dplyr)

# Read the data
metadata <- read.csv("unicef_metadata.csv")

# Convert year to character type
metadata$year <- as.character(metadata$year)

# List of countries
countries <- c("Afghanistan", "Yemen", "Niger", "Slovenia", "Czech Republic", "Estonia")

# Filter data for the selected years and countries
metadata_countries <- metadata %>%
  filter(as.numeric(year) >= 2016 & as.numeric(year) <= 2022 & country %in% countries)

# Rename the population column
metadata_countries <- metadata_countries %>%
  rename(population = Population..total)

# Create a time series chart
time_series_chart <- plot_ly(metadata_countries, x = ~year, y = ~population, color = ~country, type = 'scatter', mode = 'lines+markers') %>%
  layout(
    title = 'Population Over Time for Selected Countries (2016-2022)',
    xaxis = list(title = 'Year'),
    yaxis = list(title = 'Population')
  )

# Print the time series chart
time_series_chart

