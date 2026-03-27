--Average Fare per Year
SELECT year, round(avg(avg_fare),2) as average_fare from US_DOT_Airfare_Historical_2008_2025
GROUP BY year
ORDER BY  year


--Average Fare per Airline
SELECT largest_carrier, round(avg(avg_fare),2) as average_fare from US_DOT_Airfare_Historical_2008_2025
GROUP BY largest_carrier
ORDER BY  average_fare ASC

--Top 10 Cheapest Routes
SELECT TOP 10 origin_city, destination_city, round(avg(avg_fare),2) as average_fare from US_DOT_Airfare_Historical_2008_2025
GROUP BY origin_city, destination_city
ORDER BY  average_fare ASC

--Top 10 Expensive Routes
SELECT TOP 10 origin_city, destination_city, round(avg(avg_fare),2) as average_fare from US_DOT_Airfare_Historical_2008_2025
GROUP BY origin_city, destination_city
ORDER BY  average_fare DESC

--Distance vs. Average Fare
SELECT distance_miles, round(avg(avg_fare),2) as average_fare from US_DOT_Airfare_Historical_2008_2025
GROUP BY distance_miles
ORDER BY distance_miles ASC

--Creating a View for the Yearly Average Fare
CREATE VIEW yearly_avg_fare AS
SELECT year, round(avg(avg_fare), 2) as average_fare from US_DOT_Airfare_Historical_2008_2025
GROUP BY year

--Case Statement to categorize the average fares into three tiers: Cheap, Medium, Expensive
SELECT round(avg_fare, 2) as average_fare, CASE
	WHEN avg_fare < 150 THEN 'Cheap'
	WHEN avg_fare > 300 THEN 'Medium'
	Else 'Expensive'
END AS Price_Category from US_DOT_Airfare_Historical_2008_2025