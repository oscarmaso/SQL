DROP DATABASE IF EXISTS exe6;
CREATE DATABASE exe6;
USE exe6;

CREATE TABLE persona
(
    nombre VARCHAR(20),
    apellido1 VARCHAR(20),
    apellido2 VARCHAR(20),	
    edad tinyint,
    fechanacimiento DATE,
    PRIMARY KEY(nombre, apellido1, apellido2)
);
CREATE TABLE producto
(
    id int NOT NULL AUTO_INCREMENT,
    nombre varchar(20),
    descripcion varchar(20),
    imagen varchar(20)
    
);
