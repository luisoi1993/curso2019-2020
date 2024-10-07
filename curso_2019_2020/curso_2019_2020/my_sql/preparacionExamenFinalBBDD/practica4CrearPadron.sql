DROP DATABASE padron;

CREATE DATABASE padron;

USE  padron;

CREATE TABLE provincias( 
	codprovincia INT(2) PRIMARY KEY,
	nombre_provincia VARCHAR(25)
)ENGINE=INNODB;

CREATE TABLE empleados(
	nombre VARCHAR(25) PRIMARY KEY,
	edad INT(2),
	cod_provin INT(2),
	CONSTRAINT fk_ep FOREIGN KEY (cod_provin) REFERENCES provincias(codprovincia)
	ON DELETE CASCADE ON UPDATE SET NULL
)ENGINE=INNODB;

CREATE TABLE bloquepisos(
	calle VARCHAR(30),
	numero INT(3),
	piso INT(2),
	puerta CHAR(1),
	codigo_postal INT(5),
	metros INT(5),
	comentarios VARCHAR(60),
	cod_zona INT(2),
	DNI VARCHAR(10),
	PRIMARY KEY(calle,numero,piso,puerta)
)ENGINE=INNODB;

CREATE TABLE zonas(
	cod_zona INT(2) PRIMARY KEY,
	nombrezona VARCHAR(20),
	masdatos VARCHAR(50)
)ENGINE=INNODB;

USE information_schema;

SHOW TABLES;

USE padron;

ALTER TABLE empleados CHANGE cod_provin cod_provin INT(2);

ALTER TABLE empleados ADD CONSTRAINT fk_empleados FOREIGN KEY (cod_provin) REFERENCES provincias(codprovincia);


CREATE TABLE personas(
	DNI VARCHAR(10)PRIMARY KEY,
	nombre VARCHAR(30),
	direccion VARCHAR(50),
	poblacion VARCHAR(40),
	codprovin INT(2),
	CONSTRAINT fk_personas FOREIGN KEY (codprovin) REFERENCES provincias(codprovincia)
	ON DELETE CASCADE ON UPDATE SET NULL
)ENGINE=INNODB;

ALTER TABLE personas DROP FOREIGN KEY fk_personas;
ALTER TABLE personas DROP PRIMARY KEY ;
ALTER TABLE provincias DROP PRIMARY KEY;
ALTER TABLE personas ADD CONSTRAINT fk_personas FOREIGN KEY(codprovin) REFERENCES provincias(codprovincia);


	
	 

