DROP DATABASE IF EXISTS ZOO_Exercises;
CREATE DATABASE ZOO_Exercises;
USE ZOO_Exercises;


CREATE TABLE ZOO(

nombre VARCHAR(20),
ciudad VARCHAR(20),
pais VARCHAR(20),
tamaño ENUM('Categoria A','Categoria B'),
presupuesto DOUBLE,
PRIMARY KEY (nombre)
);

CREATE TABLE ESPECIE (
nomcientifico VARCHAR(20),
nomvulgar VARCHAR(20) NOT NULL,
familia VARCHAR(20),
peligro VARCHAR(20),
PRIMARY KEY  (nomcientifico)
);

CREATE TABLE ANIMAL (
ID INT,
nomzoo VARCHAR(20),
nomespecie VARCHAR(20),
sexo ENUM ('MACHO','HEMBRA'),
añonacim VARCHAR(20),
pais VARCHAR(20),
continente VARCHAR(20),
PRIMARY KEY (ID),
FOREIGN KEY (nomzoo) REFERENCES  ZOO(nombre),
FOREIGN KEY (nomespecie) REFERENCES  ESPECIE(nomcientifico)
);
