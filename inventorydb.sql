-- create users table
CREATE TABLE users (
	id int NOT NULL,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    username varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
)
-- create admins table
CREATE TABLE admins (
	id int NOT NULL,
    role varchar(255),
    user_id int,
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    PRIMARY KEY(id)
)

-- create customers table
CREATE TABLE customers (
	id int NOT NULL,
    phone varchar(11) NOT NULL,
    gender enum('male', 'female'),
    date_of_birth DATE,
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    user_id int,
	FOREIGN KEY (user_id) REFERENCES users(id),
    PRIMARY KEY(id)
)

-- create categories table
CREATE TABLE categories (
	id int NOT NULL,
    name varchar(255),
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
)

-- create items table
CREATE TABLE items (
	id int NOT NULL,
    name varchar(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    size enum('small', 'medium', 'large') NOT NULL,
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    category_id int,
    FOREIGN KEY(category_id) REFERENCES categories(id),
    PRIMARY KEY(id)
)

-- create orders table
CREATE TABLE orders (
	id int NOT NULL,
    payment_status enum('pending', 'successful', 'declined') DEFAULT 'pending',
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    customer_id int,
    FOREIGN KEY(customer_id) REFERENCES customers(id),
    PRIMARY KEY(id)
)

-- create orderitems table
CREATE TABLE orderitems (
	id int NOT NULL,
    order_id int,
    item_id int,
    total_price DECIMAL (10,2) NOT NULL,
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(order_id) REFERENCES orders(id),
    FOREIGN KEY(item_id) REFERENCES items(id),
    PRIMARY KEY(id)
)

-- inserting into table users
insert into users (id, first_name, last_name, email, username, password)
values (1, 'emmanuel', 'adeyemi', 'feranmia51@gmail.com', 'K-Honsu', '1234567890')

insert into users (id, first_name, last_name, email, username, password)
values (2, 'daniel', 'adesoji', 'sojidan@gmail.com', 'dan_soji', '1234567890')

-- inserting into categories table
insert into categories (id, name)
values (1, 'tech')

insert into categories (id, name)
values (2, 'beauty-products')

-- getting records from users table
select * from users

-- getting records from category table
select * from categories 

-- updating a user table
update users
set first_name = 'feranmi'
where id = 1  

-- updating a category table
update categories
set name = 'tech_products'
where id = 1 

-- deleting records from users table
delete from users 
where id = 2 


-- deleting from category table
delete from categories
where id = 2 