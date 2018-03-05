DROP DATABASE IF EXISTS buscador_vuelos;
CREATE DATABASE buscador_vuelos;
USE buscador_vuelos;

CREATE TABLE AEROPUERTO(
	CodIATA CHAR(3),
	Nombre  VARCHAR(20), 
	Ciudad  VARCHAR(20),
	Pais	VARCHAR(20),
	PRIMARY KEY (CodIATA)
);

CREATE TABLE TERMINALES(
	Numero  CHAR,
	CodIATA CHAR(3),
	PRIMARY KEY (Numero), -- Clave Principal Numeor para llevarsela a tabla VUELO.
	CONSTRAINT FK_TERMINALES
	FOREIGN KEY (CodIATA) REFERENCES AEROPUERTO(CodIATA)
);

CREATE TABLE COMPAÑIA (
	CodCompañia	CHAR(3),
	Nombre		VARCHAR(20),
	Logo		BLOB, -- Tamaño para iconos de (65,535 bytes, 65KB) (MEDIUMBLOB + Tamaño)
	PRIMARY KEY (CodCompañia)
);
	

CREATE TABLE VUELO(
	CodVuelo 		CHAR(5), -- Char=5 ~Por que solo ponen codigos hasta 5 numeros~
	CodCompañia 		CHAR(3), -- Char=3 basado en ~Códigos OACI~
	Numero 			CHAR,  
	AeropuertoOrigen 	VARCHAR(20),
	AeropuertoDestino 	VARCHAR(20),
	Estado 			ENUM('Antes de tiempo','Puntual','Cancelado','Retrasado','Embarcando','No info'),
	Salida  		TIME,	
	LLegada 		TIME,
	PRIMARY KEY(CodVuelo, CodCompañia), 
	-- Añado "Numero" de la tabla "AEROPUERTO"
 	-- Porque me parece importante poder llamar a CodVuelo y CodCompañia con Numero desde esta tabla
	CONSTRAINT FK_VUELO
	FOREIGN KEY (Numero) REFERENCES TERMINALES(Numero),
	FOREIGN KEY (CodCompañia) REFERENCES COMPAÑIA(CodCompañia)
);

CREATE TABLE ASIENTOS (
	CodAsiento  INT(4), 
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
	DNI 		CHAR(9),
	Nombre 		VARCHAR(20),
	Apellido1 	VARCHAR(20),
	Apellido2	 VARCHAR(20),
	PRIMARY KEY (DNI)
);

CREATE TABLE RESERVA (
	Localizador	CHAR(6),
	DNI		CHAR(9), 		
	Precio		CHAR(5),
	PRIMARY KEY (Localizador),
	CONSTRAINT FK_RESERVA
	FOREIGN KEY (DNI) REFERENCES PASAJEROS(DNI)
);

CREATE TABLE RESERVA_VUELOS (
	Localizador	CHAR(6),
	CodVuelo	CHAR(5),
	CONSTRAINT FK_RVUELOS
	FOREIGN KEY (Localizador) REFERENCES RESERVA(Localizador),
	FOREIGN KEY (CodVuelo) REFERENCES VUELO(CodVuelo)
);

ALTER TABLE ASIENTOS MODIFY -- CHANGE
	CodAsiento CHAR(4), -- CodAsiento CodAsiento CHAR(4),
	ADD Reservado CHAR(2) AFTER TipoClase,
	ADD PRIMARY KEY(CodAsiento);

ALTER TABLE RESERVA MODIFY -- CHANGE
	Precio FLOAT UNSIGNED; -- Precio Precio DECIMAL(10,2) UNSIGNED;

ALTER TABLE VUELO 
	DROP COLUMN Llegada,
	ADD LlegadaEstimada TIME;


INSERT AEROPUERTO
	VALUES ('ALG', 'Alicante-Elche', 'Alicante', 'España'),
	('AGP', 'Malaga-Costa del Sol', 'Malaga', 'España'),
	('CJC', 'El Loa', 'Calama', 'Chile'),
	('VLC', 'Manises', 'Valencia', 'España'),
	('MHC', 'Castro', 'Region de Los Lagos', 'Chile');

INSERT TERMINALES VALUES
	('4','ALG'),
	('3','AGP'),
	('2','CJC'),
	('6','VLC'),
	('5','MHC');

INSERT COMPAÑIA VALUES 	
	('RSO','Aero Asia','/Escritorio/SQL-master/TrabajoSqlAeropuerto/Iconos/icono1.png'),
	('AMX','Aeromexico','/Escritorio/SQL-master/TrabajoSqlAeropuerto/Iconos/icono2.jpg'),
	('SKU','Sky Airline','/Escritorio/SQL-master/TrabajoSqlAeropuerto/Iconos/icono3.png'),
	('AEW','Aerosvit Airlines','/Escritorio/SQL-master/TrabajoSqlAeropuerto/Iconos/icono4.png'),
	('ABQ','Airblue','/Escritorio/SQL-master/TrabajoSqlAeropuerto/Iconos/icono5.png');

INSERT VUELO VALUES
	('AETIR','RSO','4','Manises','Castro','No info','12:50','20:00'),
	('GHKJN','AMX','6','Alicante-Elche','Manises','Cancelado','20:50','7:00'),
	('ORTYG','AEW','5','Castro','El Loa','Puntual','17:50','21:00'),
	('SDWSW','ABQ','2','El Loa','Malaga-Costa del Sol','Embarcando','19:50','2:00'),
	('VFDER','SKU','3','Malaga-Costa del SOl','Castro','Retrasado','16:50','20:00');

INSERT ASIENTOS VALUES
	('03B3','Primera Clase','NO'),
	('10A2','Turista','SI'),
	('05C1','Turista Superior','NO'),
	('10B2','Ejecutivo','NO'),
	('07C3','Primera Clase','SI');

INSERT PASAJEROS VALUES 
	('28355614H','Maria','Garcia','Lopez'),
	('12611434M','Sara','Castellon','Rodrigez'),
	('61146427E','Lucia','Domingo','Marte'),
	('49826346C','Pablo','Locero','Castellon'),
	('59694277P','Salemon','Palestino','Rodrigo');

INSERT RESERVA VALUES 
	('2WGWR6','28355614H','350'),
	('74SGWG','12611434M','50'),
	('3735SS','61146427E','100'),
	('2345GE','49826346C','300'),
	('3758GR','59694277P','400');

INSERT RESERVA_VUELOS VALUES 
	('2WGWR6','AETIR'),
	('74SGWG','GHKJN'),
	('3735SS','ORTYG'),
	('2345GE','SDWSW'),
	('3758GR','VFDER');

