DROP DATABASE IF EXISTS CLUB_DEPORTIVO;
CREATE DATABASE CLUB_DEPORTIVO DEFAULT CHARACTER SET UTF8; 
USE CLUB_DEPORTIVO;

#modelo físico en mysql

CREATE TABLE socios(
   numeroSocio INT(3) UNSIGNED AUTO_INCREMENT,
   dni VARCHAR(9) NOT NULL,
   nombre VARCHAR(50) NOT NULL,
   domicilio VARCHAR(50) NULL,
   PRIMARY KEY (numeroSocio)
) engine=innodb
auto_increment 1;

CREATE TABLE profesores(
codigo INT(2) UNSIGNED,
nombre VARCHAR(40), 
domicilio VARCHAR(50),
PRIMARY KEY(nombre)
)engine innodb;

CREATE TABLE deportes(
   codigo INT(2) UNSIGNED,
   nombre VARCHAR(40),
   profesor VARCHAR(40),
   PRIMARY KEY (nombre),
   CONSTRAINT FK_D_P FOREIGN KEY (profesor) REFERENCES profesores(nombre)
) engine=innodb;

CREATE TABLE inscritos (
   numeroSocio INT(3) UNSIGNED,
   deporte VARCHAR(40),
   fecha YEAR NOT NULL,
   cuota CHAR(1),
   PRIMARY KEY (numeroSocio,deporte,fecha),
   CONSTRAINT FK_I_S FOREIGN KEY (numeroSocio) REFERENCES socios (numeroSocio),
   CONSTRAINT FK_I_D FOREIGN KEY (deporte) REFERENCES deportes (nombre)
) engine=innodb;


CREATE TABLE sociosdeudores(
numeroSocio INT(3) UNSIGNED,
deporte VARCHAR(40),
fecha YEAR NOT NULL,
PRIMARY KEY (numeroSocio,deporte,fecha),
CONSTRAINT FK_SD_S FOREIGN KEY (numeroSocio) REFERENCES socios (numeroSocio),
CONSTRAINT FK_SD_D FOREIGN KEY (deporte) REFERENCES deportes (nombre)
)engine innodb;

CREATE TABLE alumnosporprofesor(
profesor VARCHAR(40),
deporte VARCHAR(40),
cantidad TINYINT UNSIGNED
)engine innodb;


INSERT INTO socios VALUES (23,'22333444','Juan Perez','Colon 123');
INSERT INTO socios VALUES (56,'23333444','Ana Garcia','Sarmiento 984');
INSERT INTO socios VALUES (102,'24333444','Hector Fuentes','Sucre 293');
INSERT INTO socios VALUES (150,'25333444','Agustin Perez','Avellaneda 1234');
INSERT INTO socios VALUES (230,'26333444','Maria Perez','Urquiza 283');
INSERT INTO socios VALUES (231,'29333444','Agustin Perez','Urquiza 283');

INSERT INTO profesores VALUES (1,'Bautista Pereyra','Sarmiento 984');
INSERT INTO profesores VALUES (2,'Natalia Nores','Sucre 356');
INSERT INTO profesores VALUES (3,'Tadeo Torres','Urquiza 209');
INSERT INTO profesores VALUES (4,'Daniel Morales','Salta 1234');

INSERT INTO deportes VALUES('1','Tenis','Tadeo Torres');
INSERT INTO deportes VALUES('2','Natacion','Natalia Nores');
INSERT INTO deportes VALUES('3','Basquet','Bautista Pereyra');
INSERT INTO deportes VALUES('4','Paddle','Bautista Pereyra');
INSERT INTO deportes VALUES('5','Futbol','Tadeo Torres');

INSERT INTO inscritos VALUES (23,'Tenis','2005','s');
INSERT INTO inscritos VALUES (23,'Tenis','2006','s');
INSERT INTO inscritos VALUES (23,'Natacion','2005','s');
INSERT INTO inscritos VALUES (102,'Tenis','2005','s');
INSERT INTO inscritos VALUES (102,'Natacion','2006','s');


