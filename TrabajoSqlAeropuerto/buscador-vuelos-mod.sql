-- Modificación de la estructura con varias instrucciones
-- para insertar y quitar una columna, añadir y 
-- quitar una propiedad (UNIQUE, AUTO_INCREMENT, etc.)
-- añadir y quitar una PRIMARY O FOREIGN KEY.

ALTER TABLE ASIENTOS MODIFY -- CHANGE
	CodAsiento CHAR(4), -- CodAsiento CodAsiento CHAR(4),
	ADD Reservado CHAR(2) AFTER TipoClase,
	ADD PRIMARY KEY(CodAsiento);

ALTER TABLE RESERVA MODIFY -- CHANGE
	Precio FLOAT UNSIGNED; -- Precio Precio DECIMAL(10,2) UNSIGNED;

ALTER TABLE VUELO 
	DROP COLUMN Llegada,
	ADD LlegadaEstimada TIME;
