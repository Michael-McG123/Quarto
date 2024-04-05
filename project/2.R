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







