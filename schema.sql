DROP DATABASE  IF EXISTS employee_db;
CREATE DATABASE employee_db;
USE employee_db;

DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS departments;

CREATE TABLE employee (
PRIMARY KEY(id),
id INT AUTO_INCREMENT,
first_name VARCHAR(30),
last_name VARCHAR(30),
role_id INT,
manager_id INT ,
PRIMARY KEY(id)
);

CREATE TABLE department (
id INT NOT NULL,
id INT AUTO_INCREMENT NOT NULL,
name VARCHAR(30),
PRIMARY KEY(id)
);

CREATE TABLE roles (
PRIMARY KEY(id),    
id INT AUTO_INCREMENT,
title VARCHAR(30),
salary DECIMAL,
department_id INT,
PRIMARY KEY(id)
);



INSERT INTO employee (first_name, last_name) values ('John', 'Doe', 1);
INSERT INTO employee (first_name, last_name) values ('Mike', 'Chan', 3);
INSERT INTO employee (first_name, last_name) values ('Ashley', 'Rodriguez', 4);
INSERT INTO employee (first_name, last_name) values ('Kevin', 'Tupik', 4);
INSERT INTO employee (first_name, last_name) values ('Mailia', 'Brown',7);
INSERT INTO employee (first_name, last_name) values ('Sarah', 'Lourd',3);
INSERT INTO employee (first_name, last_name) values ('Tom', 'Allen', 3);

INSERT INTO roles (title, salary, department_id) values ('CEO', 400000, 1),
INSERT INTO roles (title, salary, department_id) values ('HR', 100000, 3),
INSERT INTO roles (title, salary, department_id) values ('Engineer', 200000, 4),
INSERT INTO roles (title, salary, department_id) values ('junior Dev', 80000, 4)
INSERT INTO roles (title, salary, department_id) values ('sen Dev', 150000, 4)

INSERT INTO department (id, name) values (3, 'HR'),
INSERT INTO department (id, name) values (1, 'manager'),
INSERT INTO department (id, name) values (4, 'eng')

SELECT * FROM employee;
SELECT * FROM department;