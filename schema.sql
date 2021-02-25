DROP DATABASE  IF EXISTS employee_DB;
CREATE DATABASE employee_DB;
USE employee_DB;


CREATE TABLE employee (
id INT AUTO_INCREMENT NOT NULL,
first_name VARCHAR(30),
last_name VARCHAR(30),
role_id INT,
manager_id INT ,
PRIMARY KEY(id)
);

CREATE TABLE department (
id INT AUTO_INCREMENT NOT NULL,
name VARCHAR(30),
PRIMARY KEY(id)
);

CREATE TABLE roles (   
id INT AUTO_INCREMENT,
title VARCHAR(30),
salary DECIMAL,
department_id INT,
PRIMARY KEY(id)
);



INSERT INTO employee (first_name, last_name) values ('John', 'Doe');
INSERT INTO employee (first_name, last_name) values ('Mike', 'Chan');
INSERT INTO employee (first_name, last_name) values ('Ashley', 'Rodriguez');
INSERT INTO employee (first_name, last_name) values ('Kevin', 'Tupik');
INSERT INTO employee (first_name, last_name) values ('Mailia', 'Brown');
INSERT INTO employee (first_name, last_name) values ('Sarah', 'Lourd');
INSERT INTO employee (first_name, last_name) values ('Tom', 'Allen');

INSERT INTO roles (title, salary) values ('CEO', 400000);
INSERT INTO roles (title, salary) values ('HR', 100000);
INSERT INTO roles (title, salary) values ('Engineer', 200000);
INSERT INTO roles (title, salary) values ('junior Dev', 80000);
INSERT INTO roles (title, salary) values ('sen Dev', 150000);


INSERT INTO department (name) values ('HR');
INSERT INTO department (name) values ('manager');
INSERT INTO department (name) values ('eng');

SELECT * FROM employee;
SELECT * FROM department;
SELECT * FROM roles;