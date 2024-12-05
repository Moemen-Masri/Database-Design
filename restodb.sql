CREATE DATABASE restaurant_management;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    f_name VARCHAR(50) NOT NULL,
    l_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15)
);

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    f_name VARCHAR(50) NOT NULL,
    l_name VARCHAR(50) NOT NULL,
    position VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    hire_date DATE NOT NULL
);

CREATE TABLE Menu_Items (
    item_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    category ENUM('Appetizer', 'Main Course', 'Dessert') NOT NULL,
    availability BOOLEAN DEFAULT TRUE
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    employee_id INT,
    order_date date,
    status ENUM('Pending', 'Completed', 'Cancelled') NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

CREATE TABLE Reservations (
    reserv_id INT PRIMARY KEY,
    customer_id INT,
    reserv_date date NOT NULL,
    prs_nb INT NOT NULL,
    status ENUM('Confirmed', 'Cancelled') NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);