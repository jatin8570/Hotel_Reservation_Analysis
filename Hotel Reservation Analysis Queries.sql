--Hotel Reservation Analysis Queries with SQL

--Queries:

--1. What is the total number of reservations in the dataset?

SELECT COUNT(Booking_ID) AS Total_Reservation
FROM Hotel_Reservation;
 
--Insights: - Understanding the total number of reservations provides an overview of the dataset's size and the hotel's overall booking volume.

--2. Which meal plan is the most popular among guests? 

SELECT TOP 1 type_of_meal_plan, COUNT(type_of_meal_plan) AS Reservation_Count
FROM Hotel_Reservation
GROUP BY type_of_meal_plan
ORDER BY Reservation_Count DESC;
 
-- Insights: - Identifying the most popular meal plan among guests helps the hotel understand guest preferences and tailor their offerings accordingly.

-- 3. What is the average price per room for reservations involving children?

SELECT AVG(avg_price_per_room) AS Average_Price_For_Reservations_With_Children
FROM Hotel_Reservation
WHERE no_of_children>0
 
-- Insights: - Calculating the average price per room for reservations involving children can help the hotel set pricing strategies and package deals for families.

-- 4. How many reservations were made for the year 20XX (replace XX with the desired year)? 

SELECT COUNT(Booking_ID) AS Total_Reservations_For_2018
FROM Hotel_Reservation
WHERE YEAR(arrival_date) = '2018';

 

-- Insights: - Analyzing reservations made for a particular year helps in understanding booking trends over time and aids in forecasting future demand.

-- 5. What is the most commonly booked room type? 

SELECT TOP 1 room_type_reserved, COUNT(room_type_reserved) AS Reservation_counts
FROM Hotel_Reservation
GROUP BY room_type_reserved
ORDER BY Reservation_counts DESC;
 
-- Insights: - Knowing the most commonly booked room type allows the hotel to optimize room allocation and potentially adjust room rates based on demand.

-- 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)? 

SELECT COUNT(Booking_ID) AS Total_Weedkend_Reservations
FROM Hotel_Reservation
WHERE no_of_weekend_nights>0;
 
-- Insights: - Identifying the number of reservations that fall on weekends provides insights into peak booking periods,
-- allowing the hotel to plan staffing and resources accordingly.

-- 7. What is the highest and lowest lead time for reservations? 

SELECT MAX(lead_time) AS Highest_lead_time,
MIN(lead_time) AS Lowest_Lead_Time
FROM Hotel_Reservation;

 
-- Insights: - Understanding the highest and lowest lead times for reservations helps the hotel manage inventory and optimize revenue management strategies.

-- 8. What is the most common market segment type for reservations? 

SELECT TOP 1 market_segment_type, COUNT(market_segment_type) AS Segment_Count
FROM Hotel_Reservation
GROUP BY market_segment_type
ORDER BY Segment_Count DESC;
 
-- Insights: - Knowing the most common market segment type for reservations enables the hotel to tailor marketing efforts and services to specific customer segments.

-- 9. How many reservations have a booking status of "Confirmed"? 

SELECT COUNT(Booking_ID) AS Confirmed_Reservations
FROM Hotel_Reservation
WHERE booking_status = 'Not_Canceled';
 
-- Insights: - Tracking the number of confirmed reservations helps in assessing booking conversion rates and forecasting revenue more accurately.

-- 10. What is the total number of adults and children across all reservations? 

SELECT SUM(no_of_adults) AS Total_Adults,
SUM(no_of_children) AS Total_Children
FROM Hotel_Reservation;
 
-- Insights: - Understanding the total number of adults and children across all reservations provides insights into the hotels guest 
-- demographics and helps in resource planning.

-- 11. What is the average number of weekend nights for reservations involving children?

SELECT AVG(no_of_weekend_nights) AS Average_Weekend_Nights_For_Reservation_With_Children
FROM Hotel_Reservation
WHERE no_of_children > 0;
 
-- Insights: - Calculating the average number of weekend nights for reservations involving children helps the hotel understand family travel patterns 
-- and tailor offerings accordingly.

-- 12. How many reservations were made in each month of the year? 

SELECT COUNT(Booking_ID) AS Reservation_by_each_Month,
MONTH(arrival_date) AS MonthNumber,
DATENAME(MONTH, arrival_date) AS MonthName
FROM Hotel_Reservation
GROUP BY MONTH(arrival_date), DATENAME(MONTH, arrival_date)
ORDER BY MonthNumber;

 
-- Insights: - Analyzing reservations made in each month of the year reveals seasonal booking patterns, which can inform pricing strategies and marketing campaigns.

-- 13. What is the average number of nights (both weekend and weekday) spent by guests for each room type? 

SELECT room_type_reserved, AVG(no_of_weekend_nights) AS Average_Weekend_Nights,
AVG(no_of_week_nights) AS Average_Weekday_Nights,
AVG(no_of_weekend_nights + no_of_week_nights) AS AvgNightsPerRoomType
FROM Hotel_Reservation
GROUP BY room_type_reserved;
 
-- Insights: - Understanding the average number of nights spent by guests for each room type helps in optimizing room inventory and pricing strategies.

-- 14. For reservations involving children, what is the most common room type, and what is the average price for that room type? 

SELECT TOP 1 room_type_reserved, AVG(avg_price_per_room) AS Average_Price
FROM Hotel_Reservation
WHERE no_of_children > 0
GROUP BY room_type_reserved
ORDER BY COUNT(room_type_reserved) DESC;
 
-- Insights: - Identifying the most common room type for reservations involving children helps the hotel allocate rooms effectively and potentially 
-- adjust room rates for family-friendly accommodations.

-- 15. Find the market segment type that generates the highest average price per room.

SELECT TOP 1 market_segment_type, AVG(avg_price_per_room) AS AvgPricePerRoom
FROM Hotel_Reservation
GROUP BY market_segment_type
ORDER BY AvgPricePerRoom DESC;
 
-- Insights: - Finding the market segment type that generates the highest average price per room allows the hotel to focus on high-value customer segments
-- and tailor services to meet their needs.

