drop database if exists Shopping_Management;
create database Shopping_Management;
use Shopping_Management;
create table customers(
        Customer_id Int Primary Key Auto_increment,
        Customer_Name Varchar(100) Not Null,
        Email Varchar(100) Unique,
        Phone_Number char(10) Not Null,
        Age Tinyint Unsigned Check(Age>0),
        Gender Enum('Male', 'Female', 'Other'),
        Country Varchar(50) Default 'India',
        City Varchar(50) Not Null,
        Pincode Char(6) Default '201301',
        Registration_Date Date Default(Current_date),
        Registration_Time Time Default(current_time),
        Created_At Timestamp Default(current_timestamp),
        Address Varchar(250),
        Customer_Status Enum('Active', 'Inactive', 'Blocked') Default 'Active',
        Customer_Notes Tinytext
        );
 Select * from customers;
 describe customers;
        
create table orders(
       Order_id Int Primary Key Auto_increment,
       Customer_id Int,
       Order_Date Date Default(current_date),
       Order_Amount Decimal(10,2) Not Null,
       Order_Status Enum('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled') Default 'Pending',
	   Payment_Method Enum('Cash', 'Card', 'UPI', 'Netbanking'),
       Payment_Status Enum('Pending', 'Paid', 'Failed') Default 'Pending',
       Shipping_Address Varchar(250) Not Null,
       Delivery_Pincode char(6),
       Quantity Int Not Null Check(Quantity>0),
       Discount_Amount Decimal(10,2) Default '0',
       Delivery_Date Date,
       Created_At Timestamp Default(current_timestamp),
       Tracking_Number Varchar(30) Unique,
       Delivery_Status Enum('Not Dispatched', 'Transit', 'Delivered', 'Returned') Default 'Not Dispatched',
       Order_Notes Tinytext,
       Foreign Key (Customer_id) References customers(customer_id) On Delete cascade,
       Foreign Key (Customer_id) References customers(customer_id) On Update cascade
);
  
  SELECT * from orders;
  describe orders;