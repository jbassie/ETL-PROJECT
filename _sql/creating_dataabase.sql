CREATE TABLE public.countries
(Country character varying(255) collate pg_catalog."default" Not null,
 Country_code character varying(8) collate pg_catalog."default" Not null,
 Country_id  integer  Not null,
 CONSTRAINT countries_pkey PRIMARY KEY (Country_id)
 )
 -- Run this command on psql(pgadmin4 command line)
 \copy countries from 'C:\Users\hp\Documents\GitHub\ETL-PROJECT-\data\Countries.csv' DELIMITER ',' CSV HEADER;
 
CREATE TABLE public.customers
(customer_id integer  Not null,
first_name character varying(255) collate pg_catalog."default" Not null,
last_name character varying(255) collate pg_catalog."default" Not null,
email character varying(255) collate pg_catalog."default" Not null,
street character varying(255) collate pg_catalog."default" Not null,
credit_provider character varying(255) collate pg_catalog."default" Not null,
four_digit integer not null,
country_id integer Not null,
CONSTRAINT customers_pkey PRIMARY KEY (customer_id),
CONSTRAINT country_id FOREIGN KEY (country_id)
REFERENCES public.countries (Country_id) MATCH SIMPLE
ON UPDATE NO ACTION
ON DELETE NO ACTION
)

-- Run this command on psql(pgadmin4 command line) --
 \copy customers from 'C:\Users\hp\Documents\GitHub\ETL-PROJECT-\data\Customers.csv' DELIMITER ',' CSV HEADER;
 
CREATE TABLE public.departments
(department_id integer Not null,
department character varying(255) collate pg_catalog."default" Not null,
CONSTRAINT department_pkey PRIMARY KEY (department_id)
)

-- Run this command on psql(pgadmin4 command line) --
 \copy departments from 'C:\Users\hp\Documents\GitHub\ETL-PROJECT-\data\Department.csv' DELIMITER ',' CSV HEADER;
 
CREATE TABLE public.employees
(employee_id integer Not null,
first_name character varying(255) collate pg_catalog."default" Not null,
last_name character varying(255) collate pg_catalog."default" Not null,
email character varying(255) collate pg_catalog."default" Not null,
city character varying(255) collate pg_catalog."default" Not null,
department_id integer Not null,
CONSTRAINT employees_pkey PRIMARY KEY (employee_id),
CONSTRAINT department_id FOREIGN KEY (department_id)
REFERENCES public.departments (department_id) MATCH SIMPLE
ON UPDATE NO ACTION
ON DELETE NO ACTION
)

-- Run this command on psql(pgadmin4 command line) --
 \copy employees from 'C:\Users\hp\Documents\GitHub\ETL-PROJECT-\data\Employee.csv' DELIMITER ',' CSV HEADER;

 CREATE TABLE public.products
(product_name character varying(255) collate pg_catalog."default" Not null,
Alcohol_amount numeric Not null,
Alcohol_percent numeric Not null,
Category character varying(255) collate pg_catalog."default" Not null,
Product_id integer Not null,
CONSTRAINT products_pkey PRIMARY KEY (product_id)
)

-- Run this command on psql(pgadmin4 command line) --
 \copy products from 'C:\Users\hp\Documents\GitHub\ETL-PROJECT-\data\Product.csv' DELIMITER ',' CSV HEADER;
 
CREATE TABLE public.payments
( payment_id integer Not null,
date timestamp without time zone,
customer_id integer Not null,
employee_id integer NOt null,
product_id integer Not null,
Price numeric Not null,
CONSTRAINT payments_pkey PRIMARY KEY (payment_id),
CONSTRAINT customer_id FOREIGN KEY (customer_id)
REFERENCES public.customers (customer_id) MATCH SIMPLE,
CONSTRAINT employee_id FOREIGN KEY (employee_id)
REFERENCES public.employees (employee_id) MATCH SIMPLE,
CONSTRAINT product_id FOREIGN KEY (product_id)
REFERENCES public.products (product_id) MATCH SIMPLE
ON UPDATE NO ACTION
ON DELETE NO ACTION
 )
 
 -- Run this command on psql(pgadmin4 command line) --
 \copy payments from 'C:\Users\hp\Documents\GitHub\ETL-PROJECT-\data\Payment.csv' DELIMITER ',' CSV HEADER;
 

