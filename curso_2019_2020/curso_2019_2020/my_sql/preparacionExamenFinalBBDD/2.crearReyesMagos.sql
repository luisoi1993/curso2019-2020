DROP DATABASE reyesmagos;
CREATE DATABASE reyesmagos DEFAULT CHARACTER SET latin1
COLLATE LATIN1_SPANISH_CI;

USE reyesmagos;

CREATE TABLE grupovecinos(
	nombre VARCHAR(50) PRIMARY KEY,
	barrio VARCHAR(50) NOT NULL,
	n_intregantes INTEGER NULL
)ENGINE=INNODB;

CREATE TABLE vecinos(
	DNI VARCHAR(10) PRIMARY KEY,
	nombre VARCHAR(50)NOT NULL,
	apellidos VARCHAR(50) NOT NULL,
	reymago ENUM('MELCHOR','GASPAR','BALTASAR')NOT NULL,
	DNIvecinocaptor VARCHAR(10) NOT NULL,
	grupovecinos VARCHAR(50) NOT NULL,
	CONSTRAINT fk_vv FOREIGN KEY (DNIvecinocaptor) REFERENCES vecinos(DNI),
	CONSTRAINT fk_vg FOREIGN KEY (grupovecinos) REFERENCES grupovecinos(nombre)
)ENGINE=INNODB;

CREATE TABLE eventos (
	fechahora DATETIME NOT NULL,
	grupovecinos VARCHAR(50) NOT NULL,
	ubicacion VARCHAR(50)NOT NULL,
	PRIMARY KEY(fechahora,grupovecinos),
	CONSTRAINT fk_eg FOREIGN KEY (grupovecinos) REFERENCES grupovecinos(nombre)
)ENGINE=INNODB;

CREATE TABLE ninnos(
	codigo INTEGER AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	direccion VARCHAR(255) NULL,
	eventofechahora DATETIME,
	eventogrupovecinos VARCHAR(50),
	regalo VARCHAR(100) NULL,
	FOREIGN KEY(eventofechahora,eventogrupovecinos) REFERENCES eventos(fechahora,grupovecinos)
)ENGINE=INNODB;
	
	
	