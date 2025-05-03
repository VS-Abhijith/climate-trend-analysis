
# Load necessary libraries
library(tidyverse)
library(httr)
library(jsonlite)
library(lubridate)

# Define cities with coordinates
cities <- tibble::tibble(
  name = c("Kochi", "Bangalore", "Chennai"),
  lat = c(9.9312, 12.9716, 13.0827),
  lon = c(76.2673, 77.5946, 80.2707)
)

# Function to fetch weather data
get_weather_data <- function(city, latitude, longitude) {
  api_url <- paste0("https://archive-api.open-meteo.com/v1/archive?",
                    "latitude=", latitude,
                    "&longitude=", longitude,
                    "&start_date=2013-01-01",
                    "&end_date=2025-05-02",
                    "&daily=temperature_2m_max,temperature_2m_min,precipitation_sum",
                    "&timezone=auto")
  
  response <- httr::GET(api_url)
  weather_data <- jsonlite::fromJSON(rawToChar(response$content))
  df <- as_tibble(weather_data$daily)
  df$city <- city
  return(df)
}

# Fetch data for all cities
all_data <- purrr::map2_dfr(
  cities$name,
  1:nrow(cities),
  ~ get_weather_data(cities$name[.y], cities$lat[.y], cities$lon[.y])
)

# Clean and prepare data
all_data <- all_data %>%
  mutate(time = as.Date(time)) %>%
  drop_na()

start_year <- year(min(all_data$time))
end_year <- year(max(all_data$time))

# Kochi Daily Max Temperature Line Chart
ggplot(filter(all_data, city == "Kochi"), aes(x = time, y = temperature_2m_max)) +
  geom_line(color = "tomato") +
  labs(title = paste("Max Temperature in Kochi (", start_year, "–", end_year, ")", sep = ""),
       x = "Date", y = "Max Temperature (°C)") +
  theme_minimal()

# Kochi Precipitation Line Chart
ggplot(filter(all_data, city == "Kochi"), aes(x = time, y = precipitation_sum)) +
  geom_line(color = "blue") +
  labs(title = paste("Precipitation in Kochi (", start_year, "–", end_year, ")", sep = ""),
       x = "Date", y = "Precipitation (mm)") +
  theme_minimal()

# Average Yearly Max Temperature in Kochi
all_data %>%
  filter(city == "Kochi") %>%
  mutate(year = year(time)) %>%
  group_by(year) %>%
  summarise(avg_max_temp = mean(temperature_2m_max)) %>%
  ggplot(aes(x = factor(year), y = avg_max_temp)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(title = "Average Max Temperature per Year in Kochi", x = "Year", y = "Avg Max Temperature (°C)") +
  theme_minimal()

# Yearly Avg Max Temp for All Cities
all_data %>%
  mutate(year = year(time)) %>%
  group_by(city, year) %>%
  summarise(avg_max_temp = mean(temperature_2m_max)) %>%
  ggplot(aes(x = factor(year), y = avg_max_temp, fill = city)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = paste("Yearly Avg Max Temperature (", start_year, "–", end_year, ")", sep = ""),
       x = "Year", y = "Avg Max Temp (°C)") +
  theme_minimal()

# Max Temperature Over Time (All Cities)
ggplot(all_data, aes(x = time, y = temperature_2m_max, color = city)) +
  geom_line(alpha = 0.5) +
  labs(title = paste("Max Temperature Comparison (", start_year, "–", end_year, ")", sep = ""),
       x = "Date", y = "Max Temperature (°C)") +
  theme_minimal()

# Heatwave Days (Temp > 35°C)
all_data %>%
  filter(temperature_2m_max > 35) %>%
  mutate(year = year(time)) %>%
  group_by(city, year) %>%
  summarise(heatwave_days = n()) %>%
  ggplot(aes(x = year, y = heatwave_days, color = city)) +
  geom_line(size = 1.2) +
  labs(title = "Heatwave Trend (Days > 35°C)", x = "Year", y = "Number of Heatwave Days") +
  theme_minimal()

# Temperature Trendlines Using Linear Regression
all_data %>%
  mutate(year = year(time)) %>%
  group_by(city, year) %>%
  summarise(avg_max_temp = mean(temperature_2m_max)) %>%
  ggplot(aes(x = year, y = avg_max_temp, color = city)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, linetype = "dashed") +
  labs(title = "Temperature Trendlines Using Linear Regression", x = "Year", y = "Average Max Temperature (°C)") +
  theme_minimal()



# Create the directory path (just in case it doesn't exist)
dir_path <- "C:/Users/ABHIJITH VS/OneDrive/Desktop/Linkedin/Projects/Climate Analysis with R"

# Set working directory
setwd(dir_path)

# Save the weather data as CSV file in the specified folder
readr::write_csv(all_data, "weather_data_2013_2025.csv")
