#1.crear

DROP DATABASE peluqueria;
CREATE DATABASE peluqueria DEFAULT CHARACTER SET UTF8
COLLATE utf8_general_ci;

USE peluqueria;


CREATE TABLE servicios(
	codigo INTEGER AUTO_INCREMENT PRIMARY KEY,
	fechahora DATETIME NOT NULL,
	precio DECIMAL(7,2),
	reymago ENUM('MELCHOR','GASPAR','BALTASAR')NOT NULL,
	FECHA DATE DEFAULT '2012-11-12',
	edad TINYINT CHECK(5>edad>20),
	curso ENUM('1','2','3'),
	nombre VARCHAR(15) UNIQUE,
	precio_venta DECIMAL(6,2)DEFAULT 100.0,
	) ENGINE=INNODB;
	



CREATE TABLE citas(
	
	PRIMARY KEY(DNIempleado,DNIcliente,codigoservicio,fechahora),
	CONSTRAINT fk_ce FOREIGN KEY(DNIempleado) REFERENCES empleados(DNI)
	ON DELETE NO ACTION ON UPDATE CASCADE,
	FOREIGN KEY(eventofechahora,eventogrupovecinos) REFERENCES eventos(fechahora,grupovecinos),
	CONSTRAINT fk_ep FOREIGN KEY (cod_provin) REFERENCES provincias(codprovincia)
	ON DELETE CASCADE ON UPDATE SET NULL,
	CONSTRAINT fk_af FOREIGN KEY(cod_fabricante) REFERENCES fabricantes(cod_fabricante)
	ON DELETE NO ACTION ON UPDATE NO ACTION
	)ENGINE=INNODB;
	


ALTER TABLE empleados CHANGE cod_provin cod_provin INT(2);


ALTER TABLE personas DROP FOREIGN KEY fk_personas;

ALTER TABLE personas DROP PRIMARY KEY ;

ALTER TABLE personas ADD CONSTRAINT fk_personas FOREIGN KEY(codprovin) REFERENCES provincias(codprovincia);

ALTER TABLE ejemplo ADD edad TINYINT DEFAULT 18;

ALTER TABLE ejemplo3 CHANGE edad EDAD TINYINT NOT NULL CHECK (5>EDAD>20);	
	
ALTER TABLE ejemplo3 ADD importe DECIMAL(5,2);

ALTER TABLE ejemplo3 DROP COLUMN sexo;

ALTER TABLE tiendas ADD PRIMARY KEY(nif);

RENAME TABLE ejemplo3 TO alumno;	
	
ALTER TABLE pedidos MODIFY unidades_pedidas MEDIUMINT DEFAULT 5;

#32.Modificar la estructura de la base de datos, para que las claves foráneas tengan condiciones de
#integridad referencial en borrado y modificación. Especificar todas las opciones de integridad
#referencial, y ejecutar sentencias de actualización para comprobar su funcionamiento.
ALTER TABLE trabajos DROP FOREING KEY fk_tc;
ALTER TABLE trabajos
ADD FOREIGN KEY (codC) REFERENCES conductores (codC)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE trabajos DROP FOREING KEY fk_tm;
ALTER TABLE trabajos
ADD FOREIGN KEY (codM) REFERENCES maquinas (codM)
ON DELETE SET NULL
ON UPDATE SET NULL;

ALTER TABLE trabajos DROP FOREING KEY fk_tp;
ALTER TABLE trabajos
ADD FOREIGN KEY (codP) REFERENCES proyectos (codP)
ON DELETE SET NULL
ON UPDATE CASCADE;		 
