-- You are a data scientist at an agency. You are given a dataset that has details of consumer complaints 
-- that were received by financial institutions in 2013-2015.

-- You have to upload the data into a database and perform a preliminary analysis.

CREATE TABLE consumer_complaints (
    date_received varchar,
    product_name varchar,
    sub_product varchar,
    issue varchar,
    sub_issue varchar,
    consumer_complaint_narrative varchar,
    company_public_response varchar,
    company varchar,
    state_name varchar,
    zip_code varchar,
    tags varchar,
    consumer_consent_provided varchar,
    submitted_via varchar,
    date_sent varchar,
    company_response_to_consumer varchar,
    timely_response varchar,
    consumer_disputed varchar,
    complaint_id integer
);

SELECT * FROM consumer_complaints;

-- Create the table having the same columns as in the dataset.

COPY consumer_complaints 
FROM 'F:\GreyCampus-Datascience\DS5\SQL\ConsumerComplaints.csv' DELIMITER ',' CSV HEADER;

-- Load all the data from the csv file.

-- 1. Check the number of complaints that were received and sent on the same day.

SELECT COUNT(*) FROM consumer_complaints
WHERE date_received = date_sent

-- 28737 complaints were received and sent on the same day.

-- 2. Extract the complaints received in the New York states.

SELECT * FROM consumer_complaints
WHERE state_name ILIKE 'ny';

-- Returns 4413 records of complaints received in the New York states.

-- 3. Extract the complaints received in  New York and California.

SELECT * FROM consumer_complaints
WHERE state_name ILIKE 'ny' OR state_name ILIKE 'ca'
ORDER BY state_name;

-- Returns 13668 records of complaints received in the New York and California.

-- 4. Extract all rows with the word ‘Late’ in the issue column.

SELECT * FROM consumer_complaints
WHERE issue ILIKE '%late%';

-- Returns 312 records with the word ‘Late’ in the issue column.

-- 5. Pull out all the rows with the word ‘Credit’ in their product column.

SELECT * FROM consumer_complaints
WHERE product_name ILIKE '%credit%'
ORDER BY product_name;

-- Returns 18564 records with the word ‘Credit’ in their product name column.
