DROP DATABASE practicas;

CREATE DATABASE practicas;

USE practicas;

CREATE TABLE ejemplo(
	NIF VARCHAR(9) NOT NULL,
	nombre VARCHAR(50) NOT NULL
)ENGINE=INNODB;

ALTER TABLE ejemplo ADD edad TINYINT DEFAULT 18;

CREATE TABLE ejemplo1(
	DNI VARCHAR(9),
	nombre VARCHAR(50),
	FECHA DATE DEFAULT '2012-11-12'
)ENGINE=INNODB;

CREATE TABLE ejemplo2(
	DNI VARCHAR(9),
	nombre VARCHAR(50)DEFAULT'no definido',
	usuario VARCHAR(30) 
)ENGINE=INNODB;

CREATE TABLE ejemplo3(
	DNI VARCHAR(9) NOT NULL PRIMARY KEY,
	nombre VARCHAR(30)NOT NULL,
	edad TINYINT CHECK(5>edad>20),
	curso ENUM('1','2','3')
)ENGINE=INNODB;

ALTER TABLE ejemplo3 CHANGE edad EDAD TINYINT NOT NULL CHECK (5>EDAD>20);

CREATE TABLE fabricantes(
	cod_fabricante TINYINT(2)PRIMARY KEY,
	nombre VARCHAR(15) UNIQUE,
	pais VARCHAR(15)
)ENGINE=INNODB;

CREATE TABLE articulos(
	articulo VARCHAR(20),
	cod_fabricante TINYINT ,
	peso DECIMAL(3,2),
	categoria ENUM('primera','segunda','tercera'),
	precio_venta DECIMAL(6,2)DEFAULT 100.0,
	precio_costo DECIMAL(6,2)DEFAULT 100.0,
	existencias SMALLINT,
	PRIMARY KEY(articulo,cod_fabricante,peso,categoria),
	CONSTRAINT fk_af FOREIGN KEY(cod_fabricante) REFERENCES fabricantes(cod_fabricante)
	ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=INNODB;

ALTER TABLE ejemplo3 ADD sexo CHAR(1) NOT NULL;
ALTER TABLE ejemplo3 ADD importe DECIMAL(5,2);

ALTER TABLE ejemplo3 DROP COLUMN sexo;
ALTER TABLE ejemplo3 DROP COLUMN importe;

RENAME TABLE ejemplo3 TO alumno;

CREATE TABLE tiendas(
	NIF VARCHAR(9),
	nombre VARCHAR(20),
	direccion VARCHAR(20),
	poblacion VARCHAR(20),
	provincia VARCHAR(20),
	codpotal SMALLINT
)ENGINE=INNODB;

ALTER TABLE tiendas ADD PRIMARY KEY(nif);
ALTER TABLE tiendas MODIFY provincia VARCHAR(20) NOT NULL;
ALTER TABLE tiendas MODIFY nombre VARCHAR(30)NOT NULL;

CREATE TABLE pedidos(
	NIF VARCHAR(9),
	articulo VARCHAR(20),
	cod_fabricante TINYINT,
	peso DECIMAL (3,2),
	categoria ENUM('primera','segunda','tercera'),
	fecha_pedido DATE,
	unidades_pedidas TINYINT DEFAULT 5,
	PRIMARY KEY(NIF,articulo,cod_fabricante,peso,categoria,fecha_pedido),
	CONSTRAINT fk_p_t FOREIGN KEY(nif) REFERENCES tiendas(nif),
	FOREIGN KEY(articulo,cod_fabricante,peso,categoria)
	REFERENCES articulos(articulo,cod_fabricante,peso,categoria) ON DELETE CASCADE,
	FOREIGN KEY(cod_fabricante) REFERENCES fabricantes(cod_fabricante)
)ENGINE=INNODB;

CREATE TABLE ventas(
	NIF VARCHAR(9),
	articulo VARCHAR(20),
	cod_fabricante INTEGER(3),
	peso DECIMAL(3,2),
	categoria ENUM('primera','segunda','tercera'),
	fecha_venta DATE,
	unidades_vendidas TINYINT DEFAULT 5,
	PRIMARY KEY(nif,articulo,cod_fabricante,peso,categoria,fecha_venta),
	FOREIGN KEY(nif)REFERENCES tiendas(nif),
	FOREIGN KEY(articulo,cod_fabricante,peso,categoria)
	REFERENCES articulos(articulo,cod_fabricante,peso,categoria) ON DELETE CASCADE,
	FOREIGN KEY(cod_fabricante) REFERENCES fabricantes(cod_fabricante)
)ENGINE=INNODB;

SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
WHERE TABLE_SCHEMA LIKE 'prueba';

ALTER TABLE pedidos MODIFY unidades_pedidas MEDIUMINT DEFAULT 5;
ALTER TABLE ventas MODIFY unidades_vendidas MEDIUMINT DEFAULT 5;

ALTER TABLE pedidos ADD pvp DECIMAL(6,3);
ALTER TABLE ventas ADD pvp DECIMAL(6,3);	

