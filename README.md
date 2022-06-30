# ETL PROJECT 
_______________________________________________________________
## OVERVIEW
- This is a simple ETL project. Firstly I scrapped a liquor store website to extract data about its various category of wines then converted it to a csv file. Using the faker nd names library from python, I created different customer names, employee names, city, country etc. 
- Using the data generated I created a local postgres database to store the data using pgcli in a star schema format to hold the data. After loading the data into postgres, I used dbt to transform the data into the solve  I wanted to solve with data, using postgres connection from dbt and visual studio code as the IDE for the transformation. 
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
    Used PostgreSQL as the Database for the data
 - Power Bi
 - dbt 
    Used dbt as a transformation tool for the data and to determine some data quality
    - dbt init
    - dbt source freshness
    - dbt run
    - dbt debug
    - dbt test
    - dbt docs generate
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
_________________________________________________________________________________________________________________________________________________________________________
 - LOAD
    - The dataframe are converted into different csv files in the same folder> Using Postgres PSQL COMMAND LINE PROMPT, I created the different tables to a `whiskey_exchange` database according the name of the of the exported csv file. Added foreign and Unique keys to the tables and formed a star schema. With this the Database is Loaded into my local psotgres. 
       Here is ERD representation of the database
       ![schema](https://github.com/jbassie/ETL-PROJECT/blob/main/_images/schema.png) 

________________________________________________________________________________________________________________________________________________________________________

  - TRANSFORM
    - Using the termnal prompt from VS CODE I initialze dbt into my project folder and created a connection profile into my local database as follows :
    > Postgres2:<br/>
        - target: dev <br/>
        - outputs:<br/>
           * dev:<br/>
            - type: postgres<br/>
            - host: localhost<br/>
            - user: postgres<br/>
            - password: '############'<br/>
            - port: 5432<br/>
            - dbname: whiskey_exchange<br/>
            - schema: public<br/>
            - threads: 10<br/>
           -  keepalives_idle: 0 # default 0, indicating the system default. See below<br/>
            - connect_timeout: 10 # default 10 seconds "<br/>

        The transformation process is represented in the lineage graph below:
    > Lineage_graph
    ![Graph](https://github.com/jbassie/ETL-PROJECT/blob/main/_images/linear_graph.png)

    - VISUALIZATION
    After the transforamtion step, the data is now ready for analysis. For the analysis,I represented the data in a simple Microsoft Power BI Dashboard to schowcase findings from the data. To achieve this I created a connection with Postgresql from Power BI and pulled the processed data.
    > Power BI Connection
    ![PostgresCOnnection](https://github.com/jbassie/ETL-PROJECT/blob/main/_images/posgresconne.png)

    After creating the connection I represented the data in a visual
      ![Visual](https://github.com/jbassie/ETL-PROJECT/blob/main/_images/Visual.png) 
   
      - Some Insights some the Visual
        - 2015 was had the best sales of $710,893<br/>
        - Scotch Whiskey was the most Sold Whiskey Type<br/>
        - JCB 16 Digit was the most Card type used for Purchase<br/>






