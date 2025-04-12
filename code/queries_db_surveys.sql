-----------------------------------------------------------------------------------------------------


-- COMPANY: Reticent (fintech/finance)

-- ABOUT: This project contains the SQL queries for development of database and tables 
-- to store all OLAP data. The scope includes ingestion of new tables with data from csv files 
-- using the command line (check READ.ME file).

-- DETAILS: *DB: PostgreSQL *DB_Name: surveys *DB_structure: Flat schema 


------------------------------------------------------------------------------------------------------

-- Creation of dadabase
DROP DATABASE IF EXISTS surveys;
CREATE DATABASE surveys;


-- Creation of investment table
DROP TABLE IF EXISTS investments;
CREATE TABLE investments(
                            GENDER	VARCHAR(10), 
                            AGE INT,
                            "Do you invest in Investment Avenues?"	BOOLEAN,
                            "investing your money?_(Rank in order of preference)_[Mutual Funds]"	INT,
                            "investing your money?_(Rank in order of preference)_[Equity Market]"	INT,
                            "investing your money?_(Rank in order of preference)_[Debentures]"	INT,
                            "investing your money?_(Rank in order of preference)_[Government Bonds]"	INT,
                            "investing your money?_(Rank in order of preference)_[Fixed Deposits]" INT,
                            "investing your money?_(Rank in order of preference)_[Public Provident Fund]"	INT,
                            "investing your money?_(Rank in order of preference)_[Gold]"	INT,
                            "Do you invest in Stock Market?"	BOOLEAN,
                            "What are the factors considered by you while investing in any instrument?"	VARCHAR(25),
                            "What is your investment objective?"	VARCHAR(25),
                            "What is your purpose behind investment?"	VARCHAR(25),
                            "How long do you prefer to keep your money in any investment instrument?"	VARCHAR(25),
                            "How often do you monitor your investment?"	VARCHAR(25),
                            "How much return do you expect from any investment instrument?"	VARCHAR(25),
                            "Which investment avenue do you mostly invest in?"	VARCHAR(25),
                            "What are your savings objectives?"	VARCHAR(25),
                            "Reasons for investing in Equity Market"	VARCHAR(25),
                            "Reasons for investing in Mutual Funds"	VARCHAR(25),
                            "Reasons for investing in Government Bonds"	VARCHAR(25),
                            "Reasons for investing in Fixed Deposits" 	VARCHAR(25),
                            "Your sources of information for investments is" VARCHAR(25)
);


-- Creation of app_reviews table
DROP TABLE IF EXISTS app_reviews;
CREATE TABLE app_reviews(
                            reviewId VARCHAR(45),
                            author_name TEXT,
                            author_name_guid TEXT,
                            review_text	 TEXT,
                            review_rating INT,
                            review_likes INT,
                            app_id TEXT,	
                            author_app_version VARCHAR(25),
                            review_datetime_utc TIMESTAMP
);



------------- 

-- used '\copy' in the command line to bulk ingest all data from 2 csv files 
-- to their appropriate database tables above ^

-------------


SELECT * FROM investments;

SELECT * FROM app_reviews;

-- END
