

CREATE DATABASE PRACTICAS_CREADA;
USE  PRACTICAS_CREADA;

CREATE TABLE EJEMPLO(
NIF VARCHAR(9) NOT NULL,
NOMBRE VARCHAR(50) NOT NULL
)ENGINE=innodb;

ALTER TABLE EJEMPLO ADD EDAD tinyint DEFAULT 18;

CREATE TABLE EJEMPLO1(
DNI VARCHAR(9) ,
NOMBRE VARCHAR(50),
FECHA DATE DEFAULT '2012-11-12'
)ENGINE=innodb;

CREATE TABLE EJEMPLO2(
DNI VARCHAR(9) ,
NOMBRE VARCHAR(50) DEFAULT 'NO DEFINIDO',
USUARIO VARCHAR(30)
)ENGINE=innodb;

CREATE TABLE EJEMPLO3(
DNI VARCHAR(9) PRIMARY KEY,
NOMBRE VARCHAR(30) NOT NULL,
EDAD tinyint CHECK (5>EDAD>20),
CURSO ENUM('1','2','3')
)engine=innodb;

ALTER TABLE EJEMPLO3 change edad EDAD tinyint NOT NULL CHECK (5>EDAD>20);

create table fabricantes (
cod_fabricante tinyint primary key,
nombre varchar(15) unique,
pais varchar(15)
)engine=innodb;

create table articulos (
articulo varchar(20),
cod_fabricante tinyint,
peso decimal(3,2),
categoria enum('Primera','Segunda','Tercera'),
precio_venta decimal(6,2) default 100.0,
precio_costo decimal(6,2) default 100.0,
existencias smallint,
primary key (articulo,cod_fabricante,peso, categoria),
constraint fk_af foreign key (cod_fabricante)
references fabricantes(cod_fabricante) on delete no action
on update no action
)engine=innodb;

alter table ejemplo3 add sexo char(1) not null;
alter table ejemplo3 add importe decimal(5,2);

alter table ejemplo3 drop column sexo;
alter table ejemplo3 drop column importe;

RENAME TABLE ejemplo3 TO alumno;

create table tiendas (
nif varchar(9),
nombre varchar(20),
direccion varchar(20),
poblacion varchar(20),
provincia varchar(20),
codPostal smallint
)engine=innodb;

alter table tiendas add primary key (nif);
alter table tiendas modify provincia varchar(20) not null;
alter table tiendas modify nombre varchar(30) not null;

create table pedidos (
nif varchar(9),
articulo varchar(20),
cod_fabricante tinyint,
peso decimal(3,2),
categoria enum('Primera','Segunda','Tercera'),
fecha_pedido date,
unidades_pedidas tinyint default 5,
primary key (nif,articulo,cod_fabricante,peso,categoria,fecha_pedido),
constraint fk_p_t foreign key (nif) references tiendas(nif),
foreign key (articulo,cod_fabricante,peso,categoria) references
articulos(articulo,cod_fabricante,peso,categoria) on delete cascade,
foreign key (cod_fabricante) references fabricantes(cod_fabricante)
)engine=innodb;

create table ventas (
nif varchar(9),
articulo varchar(20),
cod_fabricante tinyint,
peso decimal(3,2),
categoria enum('Primera','Segunda','Tercera'),
fecha_venta date,
unidades_vendidas tinyint default 5,
primary key (nif,articulo,cod_fabricante,peso,categoria,fecha_venta),
foreign key (nif) references tiendas(nif),
foreign key (articulo,cod_fabricante,peso,categoria) references
articulos(articulo,cod_fabricante,peso,categoria) on delete cascade,
foreign key (cod_fabricante) references fabricantes(cod_fabricante)
)engine=innodb;

SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA LIKE 'practicas_creada';

Alter table pedidos modify unidades_pedidas mediumint default 5;
Alter table ventas modify unidades_vendidas mediumint default 5;

Alter table pedidos add PVP decimal (6,3);
Alter table ventas add PVP decimal (6,3);






