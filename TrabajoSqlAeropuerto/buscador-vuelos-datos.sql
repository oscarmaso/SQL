-- Insertar Datos

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

