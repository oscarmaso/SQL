CREATE USER 'administrador'@'localhost' IDENTIFIED BY 'AdminDam2017.';
CREATE USER 'anonimo'@'localhost' IDENTIFIED BY 'Anony2018.';
CREATE USER 'comprador'@'localhost' IDENTIFIED BY '2018Vuelos.';

GRANT ALL PRIVILEGES ON buscador_vuelos.* TO 'administrador'@'localhost';
GRANT SELECT ON buscador_vuelos.VUELO TO 'anonimo'@'localhost';
GRANT INSERT ON buscador_vuelos.RESERVA TO 'comprador'@'localhost';
GRANT SELECT ON buscador_vuelos.ASIENTOS TO 'comprador'@'localhost';
GRANT SELECT ON buscador_vuelos.VUELO TO 'comprador'@'localhost';
GRANT SELECT ON buscador_vuelos.COMPAÑIA TO 'comprador'@'localhost';
GRANT SELECT ON buscador_vuelos.TERMINALES TO 'comprador'@'localhost';
GRANT SELECT ON buscador_vuelos.AEROPUERTO TO 'comprador'@'localhost';
FLUSH PRIVILEGES;
