library(plotly)

# Sample data
df <- data.frame(metadata_countries)

  country_code = c("AFG", "YEM", "EST","CZE","NER","SVN","YEM")
  values = c(2.3, 6.7, 2.3, 2.8, -2.5, 1.63)


# Create map chart
fig <- plot_ly(data = df, type = 'choropleth', locations = ~country_code, locationmode = "ISO-3", z = ~values)

# Customize the map
fig <- fig %>% layout(title = "World Map", geo = list(projection = list(type = "natural earth")))

# Show the map
fig




library(plotly)

# Sample data
df <- data.frame(
  country_code = c("AFG", "YEM", "EST", "CZE", "NER", "SVN"),
  values = c(2.3, 6.7, 2.3, 2.8, -2.5, 1.63)
)

# Create map chart
fig <- plot_ly(data = df, type = 'choropleth', locations = ~country_code, locationmode = "ISO-3", z = ~values) %>%
  add_trace(z= ~values, text= ~values, colors = 'Blues')

# Customize the map
fig <- fig %>% layout(
  title = "World Map",
  geo = list(
    projection = list(type = "natural earth"),
    showframe = TRUE, # Show frame around map
    showcoastlines = TRUE, # Show coastlines
    showland = TRUE, # Show land
    landcolor = "green", # Color of land
    coastlinecolor = "white" # Color of coastlines
  ),
  margin = list(l = 0, r = 0, t = 40, b = 0) # Adjust margins
)

# Show the map
fig
