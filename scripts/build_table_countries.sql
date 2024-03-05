
-- Check if the schema "import_data" exinsts, and if not: create the schema
CREATE SCHEMA IF NOT EXISTS import_data; 

-- Remove the "countires" table in the "import_data" if it exists, effectively resetting the table.
DROP TABLE IF EXISTS import_data.countries;

-- Create the "counties" table
CREATE TABLE import_data.countries (

    country_id INT GENERATED ALWAYS AS IDENTITY,
    -- Above we create a column of increasing integeres to be used as the identity for the table.
    -- "GENERATED ALWAYS" ensures that th DBMS raises an errror if we insert an value to the "countries_id". 
    country_name TEXT,
    country_code_2 TEXT,
    country_code_3 TEXT,
    region TEXT,
    sub_region TEXT,
    intermediate_region TEXT,
    created_on DATE,
    PRIMARY KEY (country_id)

);

-- Copy the data for our data folder into the countries table

COPY import_data.countries (
    country_name,
    country_code_2,
    country_code_3,
    region,
    sub_region,
    intermediate_region
)

-- From the binded folder
FROM '/var/lib/postgresql/source_data/csv_data/countries.csv'

WITH DELIMITER ',' -- Comma separated values
HEADER CSV; -- Removes the header row with column names from the import.