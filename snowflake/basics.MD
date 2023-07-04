```sql
-- Creating a database
CREATE DATABASE my_database;

-- Selecting a database to use
USE DATABASE my_database;

-- Creating a schema
CREATE SCHEMA my_schema;

-- Selecting a schema to use
USE SCHEMA my_schema;

-- Creating a table
CREATE TABLE my_table (
    column1 INT,
    column2 STRING
);

-- Inserting data into a table
INSERT INTO my_table (column1, column2)
VALUES (1, 'data');

-- Selecting data from a table
SELECT * FROM my_table;

-- Creating a user
CREATE USER my_user
PASSWORD = 'my_password'
DEFAULT_ROLE = my_role;

-- Creating a role
CREATE ROLE my_role;

-- Granting a role to a user
GRANT ROLE my_role TO USER my_user;

-- Granting privileges to a role
GRANT USAGE ON DATABASE my_database TO ROLE my_role;
GRANT USAGE ON SCHEMA my_schema TO ROLE my_role;
GRANT SELECT ON TABLE my_table TO ROLE my_role;

-- Creating a stage
CREATE STAGE my_stage
URL = 's3://my_bucket/my_path'
CREDENTIALS = (AWS_KEY_ID = 'my_access_key' AWS_SECRET_KEY = 'my_secret_key');

-- Loading data into a stage
PUT file://my_local_path/my_file.csv @my_stage;

-- Loading data from a stage into a table
COPY INTO my_table
FROM @my_stage/my_file.csv
FILE_FORMAT = (FORMAT_NAME = 'my_format');

-- Viewing data in a stage
SELECT * FROM @my_stage;

```sql
-- Creating a stage for Amazon S3
CREATE STAGE my_s3_stage
URL = 's3://my_bucket/my_path'
CREDENTIALS = (AWS_KEY_ID = 'my_access_key' AWS_SECRET_KEY = 'my_secret_key');

-- Creating a stage for Google Cloud Storage
CREATE STAGE my_gcs_stage
URL = 'gcs://my_bucket/my_path'
STORAGE_INTEGRATION = my_gcs_integration;

-- Creating a stage for Microsoft Azure Blob Storage
CREATE STAGE my_azure_stage
URL = 'azure://my_container/my_path'
CREDENTIALS = (AZURE_SAS_TOKEN = 'my_sas_token');


