DROP DATABASE IF EXISTS exe5;
CREATE DATABASE exe5;
USE exe5;
CREATE TABLE contacto
(
    id INT NOT NULL,
    nombre VARCHAR(30),
    PRIMARY KEY (id)
);

CREATE TABLE politico
(
    Nombre INT NOT NULL,
    id_contacto INT NOT NULL,
    cantidad   INT,
    PRIMARY KEY(Nombre),
    INDEX (id),
    FOREIGN KEY (id_contacto) REFERENCES contacto(id)
);
