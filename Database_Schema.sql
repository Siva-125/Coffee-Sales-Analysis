
-- Database: Coffee_Sales

CREATE DATABASE "Coffee_Sales"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_India.1252'
    LC_CTYPE = 'English_India.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

-- Creating Table to store Sales Data
CREATE TABLE IF NOT EXISTS Sales(
	purchase_Date date,
	time time,
	cash_Type varchar(4),
	money_Paid real,
	coffee_Name varchar
);


SELECT * FROM Sales;