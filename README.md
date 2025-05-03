
# 🌍 Climate Analysis with R (2013–2025)

This project analyzes over 10 years of daily climate data (2013–2025) for
 **Kochi, Bangalore, and Chennai** using **R programming**. 
It visualizes temperature trends, heatwaves, precipitation, and climate changes over time 
to provide insights into the effects of climate variability in southern Indian cities.

---

## 📌 Objective

- Analyze maximum & minimum temperature and precipitation patterns
- Compare annual climate trends across Kochi, Bangalore, and Chennai
- Detect heatwave trends (days > 35°C)
- Fit linear trendlines to understand long-term temperature changes
- Visualize key patterns using clean and professional charts

---

## 📊 Dataset

- **Source**: [Open-Meteo Archive API](https://open-meteo.com/)
- **Variables**: 
  - Daily Maximum Temperature (`temperature_2m_max`)
  - Daily Minimum Temperature (`temperature_2m_min`)
  - Daily Precipitation (`precipitation_sum`)
- **Date Range**: `2013-01-01` to `2025-05-02`
- **Cities**:
  - Kochi (Lat: 9.9312, Lon: 76.2673)
  - Bangalore (Lat: 12.9716, Lon: 77.5946)
  - Chennai (Lat: 13.0827, Lon: 80.2707)

---

## 🧠 Key Insights

1. **Warming Trend**: All three cities show rising average maximum temperatures from 2013 to 2025.
2. **Heatwave Days**: The number of days with max temperatures >35°C is increasing, especially in Chennai and Bangalore.
3. **Kochi’s Climate**:
   - More stable temperatures
   - High and consistent precipitation throughout the year
4. **Chennai’s Extremes**:
   - Most heatwave days
   - Lowest precipitation among the three cities
5. **Bangalore**:
   - Moderate temperatures, but warming trends are evident
   - Precipitation varies more significantly year to year

---

## 📈 Visualizations

The following plots were generated in R using `ggplot2`:

- **📌 Kochi Daily Max Temp (2013–2025)** 
  ![Max Temperature In Kochi](https://github.com/user-attachments/assets/8d111894-ceee-4edd-b34d-3974297c8023)
- **📌 Kochi Precipitation Over Time**
  ![Precipitation in Kochi](https://github.com/user-attachments/assets/273c97c2-672a-4db7-b675-742da9962ec0)
- **📌 Average Max Temp per Year (Kochi)**
  ![Average Max temperature per year in Kochi](https://github.com/user-attachments/assets/0459bf53-8e6a-498d-8d58-ee61bb57ee11)
- **📌 Yearly Avg Max Temp: Kochi vs Bangalore vs Chennai**
  ![Yearly avg max temperature](https://github.com/user-attachments/assets/26a1df56-6805-493e-bb2f-42587f56c9af)
- **📌 Max Temp Trend Comparison (All Cities)**
  ![Max temperature over time](https://github.com/user-attachments/assets/ce938937-c249-488d-a893-e89042481b32)
- **📌 Heatwave Days Trend (>35°C)**
  ![Heatwave trend](https://github.com/user-attachments/assets/f0587561-7390-4c01-acf5-017c70beaa62)
- **📌 Linear Regression Trendlines**
  ![temperature trendlines using linear regression](https://github.com/user-attachments/assets/9ae4c51a-97ff-4328-be87-b839b3ee5bb9)

*(Visuals included in GitHub repo in `/plots/` folder)*

---

## ⚙️ Technologies Used

- **R Language**
- `tidyverse`, `httr`, `jsonlite`, `lubridate`, `ggplot2`
- Open-Meteo API
- Data cleaning, transformation, and visualization using R

---



## 📁 Files

| File Name                  | Description                                 |
|---------------------------|---------------------------------------------|
| `climate_analysis_script.R` | Main R script with API calls and plots      |
| `weather_data_2013_2025.csv` | Raw weather data extracted via API         |
| `README.md`                | Project documentation and summary           |
| `/plots/`                  | Folder containing exported graphs |
|`LICENSE`		    | 	MIT License file allowing reuse and modification |
---


## 🙌 Acknowledgements

- Data by [Open-Meteo](https://open-meteo.com/)
- Analysis & Report by **[Abhijith VS](https://www.linkedin.com/in/vsabhijith)**

---

## 📢 Let’s Connect

If you liked this project or want to collaborate, feel free to connect with me on [LinkedIn](https://www.linkedin.com/in/vsabhijith) or follow me on GitHub ⭐
