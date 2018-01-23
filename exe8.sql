DROP DATABASE IF EXISTS exe8;
CREATE DATABASE exe8;
USE exe8;

CREATE TABLE producto  (
id INT auto_increment,
precio INT,
name VARCHAR(20),
PRIMARY KEY (ID)
);

CREATE TABLE pedido (
id INT,
id_parent INT auto_increment,
PRIMARY KEY (id),
CONSTRAINT id_producto
FOREIGN KEY (id_parent) 
REFERENCES producto(id)
ON DELETE CASCADE
);


