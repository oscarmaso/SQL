/*	AEROPUERTO(CodIATA, Nombre, Ciudad, País)
--	TERMINALES(Número, CodIATA)
--	VUELO(CodVuelo, CodCompañia, AeropuertoOrigen, AeropuertoDestino, Estado)
--	ASIENTOS(CodAsiento, TipoClase)
--	PASAJEROS(DNI, Nombre, Apellido1, Apellido2)
--	RESERVA(Localizador, DNI,‎Precio)
--	RESERVA_VUELOS(Localizador, CodVuelo)
--	COMPAÑIA(CodCompañia, Nombre, Logo) */

DROP DATABASE IF EXISTS buscador_vuelos;
CREATE DATABASE buscador_vuelos;
USE buscador_vuelos;

CREATE TABLE AEROPUERTO(
	CodIATA CHAR(10),
	Nombre  VARCHAR(20), 
	Ciudad  VARCHAR(20),
	Pais	VARCHAR(20),
	PRIMARY KEY (CodIATA)
);

CREATE TABLE TERMINALES(
	Numero CHAR,
	CodIATA CHAR(10),
	PRIMARY KEY (Numero), -- Clave Principal Numeor para llevarsela a tabla VUELO.
	CONSTRAINT FK_TERMINALES
	FOREIGN KEY (CodIATA) REFERENCES AEROPUERTO(CodIATA)
);

CREATE TABLE VUELO(
	CodVuelo 		CHAR(5), -- Char=5 ~Por que solo ponen codigos hasta 5 numeros~
	CodCompañia 		CHAR(3), -- Char=3 basado en ~Códigos OACI~
	Numero 			CHAR,  
	AeropuertoOrigen 	VARCHAR(20),
	AeropuertoDestino 	VARCHAR(20),
	Estado 			ENUM('Antes de tiempo','Puntual','Cancelado','Retrasado','Embarcando'),
	Salida  		TIME,	
	LLegada 		TIME,
	PRIMARY KEY(CodVuelo, CodCompañia), 
	-- Añado "Numero" de la tabla "AEROPUERTO"
 	-- Porque me parece importante poder llamar a CodVuelo y CodCompañia con Numero desde esta tabla
	CONSTRAINT FK_VUELO
	FOREIGN KEY (Numero) REFERENCES TERMINALES(Numero)
);

CREATE TABLE ASIENTOS (
	CodAsiento  char(4), 
	-- 2 Primeros Numero para la Fila, 1 Letra para la posicion, 1 Numero para el asiento
	-- Ejemplo   03B3
	TipoClase ENUM('Turista','Turista Superior','Ejecutivo','Primera Clase')
	-- Avion Grande:
	--  A     B     C	
	-- OOO - OOO - OOO
	-- OOO - OOO - OOO
	-- OXO - OOO - OOO
	-- Avion Normal: 
	--  A     B 
	-- OOO - OOO
	-- OXO - OOO
);

CREATE TABLE PASAJEROS (
	DNI CHAR(15),
	Nombre VARCHAR(20),
	Apellido1 VARCHAR(20),
	Apellido2 VARCHAR(20),
	PRIMARY KEY (DNI)
);







