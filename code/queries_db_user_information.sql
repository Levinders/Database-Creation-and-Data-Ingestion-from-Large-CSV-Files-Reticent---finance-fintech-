-----------------------------------------------------------------------------------------------------


-- COMPANY: Reticent (fintech/finance)

-- ABOUT: This project contains the SQL queries for the development of database and tables 
-- to handle OLTP operations. The scope includes modeling new table relationships, 
-- and ingestion of new tables with data from csv files using the command line (check READ.ME for more).

-- DETAILS: *DB: PostgreSQL *DB_Name: user_information *DB_structure: Star schema 


------------------------------------------------------------------------------------------------------

-- Creation of databse
DROP DATABASE IF EXISTS user_information;
CREATE DATABASE user_information;


-- Creation of users_data table
DROP TABLE IF EXISTS users_data;
CREATE TABLE users_data(
                            client_id	INT NOT NULL,        -- PK
                            current_age	INT,
                            retirement_age INT,
                            birth_year INT,
                            birth_month	INT,
                            gender	VARCHAR(10),
                            address	TEXT,
                            latitude DECIMAL,
                            longitude DECIMAL,
                            per_capita_income TEXT,
                            yearly_income TEXT,
                            total_debt	TEXT, 
                            credit_score INT,
                            num_credit_cards INT
);
SELECT * FROM users_data;


-- Creation of cards_data table
DROP TABLE IF EXISTS cards_data;
CREATE TABLE cards_data(
                            card_id	INT NOT NULL,             -- PK
                            client_id	INT NOT NULL,         -- FK
                            card_brand	VARCHAR(15),
                            card_type VARCHAR(20),	
                            card_number	TEXT,
                            expires	VARCHAR(10),
                            cvv INT,
                            has_chip	BOOLEAN,
                            num_cards_issued INT,
                            credit_limit	TEXT,
                            acct_open_date	VARCHAR(10),
                            year_pin_last_changed	INT,
                            card_on_dark_web BOOLEAN
);
SELECT * FROM cards_data;


-- Creation of transactions_data table
DROP TABLE IF EXISTS transactions_data;
CREATE TABLE transactions_data (
    transaction_id	INT NOT NULL,     -- PK
    date TIMESTAMP,
    client_id INT,           -- FK
    card_id	INT,             -- FK
    amount	TEXT,
    use_chip VARCHAR(20),
    merchant_id	INT,
    merchant_city VARCHAR(30),
    merchant_state	VARCHAR(40),
    zip	VARCHAR(7),
    mcc	INT,
    errors TEXT
);
SELECT * FROM transactions_data;

------------- 

-- used '\copy' in the command line to bulk ingest all data from 3 csv files 
-- to their appropriate database tables above ^

-------------

SELECT * FROM users_data;  
SELECT * FROM cards_data;
SELECT * FROM transactions_data;


-- Drop this column in order to implement star schema design
ALTER TABLE cards_data 
    DROP COLUMN client_id;


-- Modeling table relationships/CONSTRAINTS
ALTER TABLE users_data
    ADD CONSTRAINT users_data_pkey PRIMARY KEY (client_id);

ALTER TABLE cards_data
    ADD CONSTRAINT cards_data_pkey PRIMARY KEY (card_id);

ALTER TABLE transactions_data
    ADD CONSTRAINT transactions_data_pkey PRIMARY KEY (transaction_id),
        ADD CONSTRAINT users_data_fkey FOREIGN KEY (client_id)
        REFERENCES users_data(client_id)
        ON DELETE SET NULL,
    ADD CONSTRAINT cards_data_fkey FOREIGN KEY (card_id)
        REFERENCES cards_data(card_id)
        ON DELETE SET NULL;



-- END


