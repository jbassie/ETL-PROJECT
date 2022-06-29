# ETL PROJECT 
_______________________________________________________________
## OVERVIEW
- This is a simple ETL project. Firstly I scrapped and liquor store website to extract data about its various category of wines converting it to a csv file. Using the faker library from python, I created different customer names, employee names, city, country etc. 
- Using the data generated I created a local postgres database to store the data using pgcli with a star schema format to hold the data. After loading the data into postgres, I used dbt to transform the data into the solve  I wanted to solve with data, using postgres connection from dbt and visual studio code for the transformation. 
- With the transformed data data, I created a connection with from Power BI with Postgres as my Data Source to extract only transformed table for data analysis and visualization.

## USAGE
 - Python:
    Python was used to for webscraping the data and creating the fake data from faker and names
    ##### Libraries
    - Pandas
    - Beautiful Soup
    - Faker
    - pandasql
    - Names
 - Postgres:
    Used Postgres as the Database for the data
 - Power Bi
 - dbt 
    Used dbt as a transformation tool for the data and to determine some data quality
___________________________________________________________________
___________________________________________________________________

## PROCESS

 - EXTRACT
    - The Whiskey Exchange The [whiskey exchange](https://www.thewhiskyexchange.com/) is online retail store that specializes in the sales of whiskey drink. For this project, we will be scrapping different whiskey name, price, alcohol amount, alcohol percent as well as category of the whiskey. 
    Using the faker and names libraries I will create a fake customer name, employee name, country, city, email, CARD ISSUER and saving the result into different dataframe
     - customer_df
     - countries_df
     - departments_df
     - employees_df
     - payments_df
     - products_df
    This is all carried in a jupyter notebok file here
___________________________________________________________________
 - LOAD
    - The dataframe are converted into different csv files in the same folder> Using Postgres PSQL COMMAND LINE PROMPT, I created the different tables to a `whiskey_exchange` database according the name of the of the exported csv file. Added foreign and Unique keys to the tables and formed a star schema. With this the Database is Loaded into my local psotgres.
___________________________________________________________________

  - TRANSFORM
    - Using the termnal prompt from VS CODE I initialze dbt into my project folder and created a connection profile into my local database as follows :
    > Postgres2:
        - target: dev__
        - outputs:__
           * dev:__
            - type: postgres__ 
            - host: localhost__
            - user: postgres__
            - password: '############'__
            - port: 5432__
            - dbname: whiskey_exchange__
            - schema: public__
            - threads: 10__
           -  keepalives_idle: 0 # default 0, indicating the system default. See below__
            - connect_timeout: 10 # default 10 seconds "__

    > Lineage_graph
    ![Graph](https://github.com/jbassie/ETL-PROJECT/blob/main/_images/linear_graph.png)


