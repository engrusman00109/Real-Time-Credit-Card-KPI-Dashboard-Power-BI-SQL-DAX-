-- 0. (Optional) Create a new database if not already created
-- Run this separately if needed
-- CREATE DATABASE ccdb;

-- Connect to the database before running the following

-- 1. Drop tables if they already exist (for clean reruns)
DROP TABLE IF EXISTS cc_detail;
DROP TABLE IF EXISTS cust_detail;

-- 2. Create cc_detail table
CREATE TABLE cc_detail (
    Client_Num BIGINT,
    Card_Category VARCHAR(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date DATE,
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(10),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc VARCHAR(5)
);

-- 3. Create cust_detail table
CREATE TABLE cust_detail (
    Client_Num BIGINT,
    Customer_Age INT,
    Gender VARCHAR(10),
    Dependent_Count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    State_cd VARCHAR(50),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_Loan VARCHAR(5),
    Contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
);

-- 4. Load data into cc_detail from CSV
-- Set datestyle for current session only
SET datestyle = 'ISO, DMY';
COPY cc_detail
FROM 'E:\Data Analysis\Power Bi\Credit_Card_Report\credit_card.csv'
WITH (
    FORMAT csv,
    DELIMITER E'\t',
    HEADER true
);

-- 5. Load data into cust_detail from CSV
COPY cust_detail
FROM 'E:\Data Analysis\Power Bi\Credit_Card_Report\customer.csv'
WITH (
    FORMAT csv,
    DELIMITER ',',
    HEADER true
);

-- select * from cust_detail
-- select * from cc_detail

-- 4. Insert additional data into SQL, using same COPY function

-- copy additional data (week-53) in cc_detail table

COPY cc_detail
FROM 'E:\Data Analysis\Power Bi\Credit_Card_Report\cc_add.csv' 
DELIMITER ',' 
CSV HEADER;


-- copy additional data (week-53) in cust_detail table (remember to update the file name and file location in below query)

COPY cust_detail
FROM 'E:\Data Analysis\Power Bi\Credit_Card_Report\cust_add.csv' 
DELIMITER ',' 
CSV HEADER;