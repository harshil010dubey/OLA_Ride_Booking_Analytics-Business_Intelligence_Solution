create Database ola;
use ola;

#1. Retrive all sucessful bookings:
Create view sucessful_bookings As
SELECT * FROM bookings 
WHERE Booking_Status = "Success";

Select * from sucessful_bookings;

#2. Find the average ride distance for each vehicle type:
Create View ride_distance_for_each_vehicle as
select vehicle_type, AVG(ride_distance)
as avg_distance FROM Bookings 
group by Vehicle_Type;

Select * from ride_distance_for_each_vehicle;

#3 Get the total number of canceled rides by customers:
create view canceled_rides_by_customers as
SELECT count(*) FROM Bookings
WHERE Booking_status = "canceled by customer";
SELECT * from canceled_rides_by_customers;

#4 List the top 5 customers who booked the highest number of rides:
Create View Top_5_Customers as
select Customer_ID, COUNT(Booking_ID) as
total_rides from bookings 
group by Customer_ID 
ORDER BY total_rides DESC LIMIT 5;

SELECT * from Top_5_Customers;

#5 Get the number of rides canceled by drivers due to personal and car-related issue:
create view rides_canceled_by_drivers_p_c_issues as
select count(*) from bookings where Canceled_rides_by_driver = "Personal & Car related issue";

 #6 Find the maximum and minimum driver rating for Prime Sedan bookings:
 CREATE view Max_Min_Driver_Rating as
 SELECT MAX(Driver_Ratings) as max_rating,
 MIN(Driver_Ratings) as min_rating 
 FROM Bookings where Vehicle_Type = "Prime Sedan";
 
 
 #7 Retrive all rides where payment was made using UPI:
  Create view UPI_Payment as
  SELECT * from Bookings
  where Payment_Method =  "UPI";

#8 Find the average customer rating per vehicle type:
  create view AVG_CUST_RATING as
  select Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating 
  from Bookings
  group by Vehicle_Type;

#9 Calculate the total booking value of rides completed sucessfully:
 create view total_successful_ride_value as
 select SUM(Booking_Value) as total_successful_value
 from bookings
 where Booking_Status = "success";
 
#10 List all incomplete rides along with the reason:
create view Incomplete_Rides_Reason as
select Booking_ID, Incomplete_Rides_Reason
from Bookings
WHERE Incomplete_Rides = "Yes";