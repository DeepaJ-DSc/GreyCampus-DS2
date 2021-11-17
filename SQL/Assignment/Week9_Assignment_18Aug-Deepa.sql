-- Creating Database
-- 1. Create two tables:
	-- i. product
	-- ii. product_groups 

CREATE TABLE product_groups (
	group_id SERIAL PRIMARY KEY,
	group_name varchar(255) UNIQUE NOT NULL);

CREATE TABLE products (
	product_id SERIAL PRIMARY KEY,
	product_name varchar(255) UNIQUE NOT NULL,
	price numeric (11,2) NOT NULL,
	group_id INTEGER REFERENCES product_groups(group_id));

-- 2. Insert some values into each table.

INSERT INTO product_groups (group_name)
VALUES ('Smartphone');

INSERT INTO product_groups (group_name)
VALUES ('Laptop');

INSERT INTO product_groups (group_name)
VALUES ('Tablet');

SELECT * FROM product_groups;

-- Returns a table with 3 rows.

INSERT INTO products (product_name, price, group_id)
VALUES ('Microsoft Lumia', 200.00, 1);

INSERT INTO products (product_name, price, group_id)
VALUES ('HTC One', 400.00, 1);

INSERT INTO products (product_name, price, group_id)
VALUES ('Nexus', 500.00, 1);

INSERT INTO products (product_name, price, group_id)
VALUES ('iPhone', 900.00, 1);

INSERT INTO products (product_name, price, group_id)
VALUES ('HP Elite', 1200.00, 2);

INSERT INTO products (product_name, price, group_id)
VALUES ('Lenovo Thinkpad', 700.00, 2);

INSERT INTO products (product_name, price, group_id)
VALUES ('Sony VAIO', 700.00, 2);

INSERT INTO products (product_name, price, group_id)
VALUES ('Dell Vostro', 800.00, 2);

INSERT INTO products (product_name, price, group_id)
VALUES ('iPad', 700.00, 3);

INSERT INTO products (product_name, price, group_id)
VALUES ('Kindle Fire', 150.00, 3);

INSERT INTO products (product_name, price, group_id)
VALUES ('Samsung Galaxy Tab', 200.00, 3);

SELECT * FROM products;

INSERT INTO products (product_name, price, group_id)
VALUES ('Microsoft Lumia', 200.00, 1);

INSERT INTO products (product_name, price, group_id)
VALUES ('Microsoft Lumia', 200.00, 1);

-- Returns a table with 11 rows.

-- Window Functions

-- Now with the tables created, solve the following questions using window functions.

-- 1. Find average price for every product group.

-- SELECT depname, empno, salary, avg(salary) OVER (PARTITION BY depname) FROM empsalary;

SELECT group_name, avg(price) OVER (PARTITION BY products.group_id) FROM products
INNER JOIN product_groups
ON products.group_id = product_groups.group_id

-- We can see the average price of Smartphone is 500, Laptop is 850 and Tablet is 350.

-- 2. Find the product name, the price, product group name, along with the average prices of each product group.

SELECT product_name, price, group_name, avg(price) OVER (PARTITION BY products.group_id) FROM products
INNER JOIN product_groups
ON products.group_id = product_groups.group_id

-- We can see the details of the products along with the average price of each group.
