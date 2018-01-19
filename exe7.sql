DROP DATABASE IF EXISTS exe7;
CREATE DATABASE exe7;
USE exe7;

CREATE TABLE parent  (
id INT auto_increment,
name VARCHAR(20),
PRIMARY KEY (ID)
);

CREATE TABLE child (
id INT,
id_parent INT auto_increment,
PRIMARY KEY (id),
CONSTRAINT FK_parent
FOREIGN KEY (id_parent) REFERENCES parent(id)
);


