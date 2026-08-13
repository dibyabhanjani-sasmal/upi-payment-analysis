CREATE DATABASE upi_payment_analysis;
USE upi_payment_analysis;
CREATE TABLE upi_transiction(
  transaction_id VARCHAR (20) PRIMARY KEY,
  transaction_date DATE,
  city VARCHAR (50),
  age_group VARCHAR(50),
  merchant_category VARCHAR(50),
  payment_method VARCHAR(10),
  amount DECIMAL,
  status VARCHAR(50)
   );
SHOW TABLES;

INSERT INTO upi_transiction
(transaction_id,transaction_date,city,age_group,merchant_category,payment_method,amount,status)
VALUES
('UPI1001','2026-01-02','Bhubneswar','18-25','Grocery','UPI',850,'Sucess'),
('UPI1002','2026-01-02','Cuttack','26-35','Food','UPI',420,'Sucess'),
('UPI1003','2026-01-03','Berhampur','18-25','Shopping','UPI',2500,'Failed'),
('UPI1004','2026-01-03','Bhubneswar','36-45','Utilities','UPI',1200,'Sucess'),
('UPI1005','2026-01-04','Puri','26-35','Travel','UPI',3500,'Sucess');
SELECT * FROM upi_transiction;

SELECT COUNT(*) AS total_transictions
FROM upi_transiction;

SELECT SUM(amount) AS total_transition_value
FROM upi_transiction;

SELECT ROUND(AVG(amount),2)AS avg_amount
FROM upi_transiction;
SELECT COUNT(*) AS transiction_status
FROM upi_transiction
GROUP BY status;  

SELECT *
FROM upi_transiction
WHERE amount>10000; 

SELECT DATE_FORMAT('date','%Y-%m') AS month,
SUM(amount)AS total_value
FROM upi_transiction
GROUP BY DATE_FORMAT ('date','%Y-%m')
ORDER BY month; 

SELECT city,
        ROUND(
        100.0*SUM(CASE WHEN status= 'sucess'THEN 1 ELSE 0 END)/ COUNT(*),2)AS sucess_rate
        
        FROM upi_transiction
        GROUP BY city
        ORDER BY sucess_rate DESC;