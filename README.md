# ETL PROJECT 
_______________________________________________________________
## OVERVIEW
- This is a simple ETL project. Firstly I scrapped and liquor store website to extract data about its various category of wines converting it to a csv file. Using the faker library from python, I created different customer names, employee names, city, country etc. 
- Using the data generated I created a local postgres database to store the data using pgcli with a star schema format to hold the data. After loading the data into postgres, I used dbt to transform the data into the solve  I wanted to solve with data, using postgres connection from dbt and visual studio code for the transformation. 
- With the transformed data data, I created a connection with from Power BI with Postgres as my Data Source to extract only transformed table for data analysis and visualization.

## USAGES
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

## PROCESS
 - EXTRACT.


