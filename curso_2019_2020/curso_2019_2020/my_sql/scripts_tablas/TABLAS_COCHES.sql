CREATE DATABASE IF NOT EXISTS COCHES CHARACTER SET 'UTF8' COLLATE 'UTF8_SPANISH_CI';
USE COCHES;
Create table marcas (
cifm integer (4) not null,
nombre char (8),
ciudad char (12),
primary key (cifm))
engine=innodb;

Create table concesionario(
cifc integer (4) not null,
nombre char (6),
ciudad char (12),
primary key (cifc))
engine=innodb;

Create table clientes(
dni integer (4) not null,
nombre char (8),
apellido char (8),
ciudad char (12),
primary key (dni))
engine=innodb;


Create table coches(
codcoche integer (3) not null,
nombre char (8),
modelo char (7),
primary key (codcoche))
engine=innodb;


Create table ventas(
cifc integer (4) not null,
dni integer (4) not null,
codcoche integer (3) not null,
color char (8),
primary key (cifc, dni, codcoche),
foreign key (cifc) references concesionario (cifc),
foreign key (dni) references clientes (dni),
foreign key (codcoche) references coches (codcoche))
engine=innodb;

Create table distribucion(
cifc integer (4) not null,
codcoche integer (3) not null,
cantidad integer (2),
primary key (cifc, codcoche),
foreign key (cifc) references concesionario (cifc),
foreign key (codcoche) references coches(codcoche))
engine=innodb;



Create table marco(
cifm integer (4) not null,
codcoche integer (3) not null,
primary key (cifm, codcoche),
foreign key (cifm) references marcas (cifm),
foreign key (codcoche) references coches (codcoche))
engine=innodb;

insert into marcas values (0001,'SEAT','MADRID');
insert into marcas values (0002,'RENAULT','BARCELONA');
insert into marcas values (0003,'CITROEN','VALENCIA');
insert into marcas values (0004,'AUDI','MADRID');
insert into marcas values (0005,'OPEL','BILBAO');
insert into marcas values (0006,'BMW','BARCELONA');

insert into concesionario values (0001,'ACAR','MADRID');
insert into concesionario values (0002,'BCAR','MADRID');
insert into concesionario values (0003,'CCAR','BARCELONA');
insert into concesionario values (0004,'DCAR','VALENCIA');
insert into concesionario values (0005,'ECAR','BILBAO');

insert into clientes values (0001,'LUIS','GARCIA','MADRID');
insert into clientes values (0002,'ANTONIO','LOPEZ','VALENCIA');
insert into clientes values (0003,'JUAN','MARTIN','MADRID');
insert into clientes values (0004,'MARIA','GARCIA','MADRID');
insert into clientes values (0005,'JAVIER','GONZALEZ','BARCELONA');
insert into clientes values (0006,'ANA','LOPEZ','BARCELONA');

insert into coches values (001,'IBIZA','GLX');
insert into coches values (002,'IBIZA','GTI');
insert into coches values (003,'IBIZA','GTD');
insert into coches values (004,'TOLEDO','GTD');
insert into coches values (005,'CORDOBA','GTI');
insert into coches values (006,'MEGANE','1.6');
insert into coches values (007,'MEGANE','GTI');
insert into coches values (008,'LAGUNA','GTD');
insert into coches values (009,'LAGUNA','TD');
insert into coches values (010,'ZX','16V');
insert into coches values (011,'ZX','TD');
insert into coches values (012,'XANTIA','GTD');
insert into coches values (013,'A4','1.8');
insert into coches values (014,'A4','2.8');
insert into coches values (015,'ASTRA','CARAVAN');
insert into coches values (016,'ASTRA','GTI');
insert into coches values (017,'CORSA','1.4');
insert into coches values (018,'300','316.i');
insert into coches values (019,'500','525i');
insert into coches values (020,'700','750i');

insert into ventas values (0001,0001,001,'BLANCO');
insert into ventas values (0001,0002,005,'ROJO');
insert into ventas values (0002,0003,008,'BLANCO');
insert into ventas values (0002,0001,006,'ROJO');
insert into ventas values (0003,0004,011,'ROJO');
insert into ventas values (0004,0005,014,'VERDE');



insert into distribucion values (0001,001,3);
insert into distribucion values (0001,005,7);
insert into distribucion values (0001,006,7);
insert into distribucion values (0002,006,5);
insert into distribucion values (0002,008,10);
insert into distribucion values (0002,009,10);
insert into distribucion values (0003,010,5);
insert into distribucion values (0003,011,3);
insert into distribucion values (0003,012,5);
insert into distribucion values (0004,013,10);
insert into distribucion values (0004,014,5);
insert into distribucion values (0005,015,10);
insert into distribucion values (0005,016,20);
insert into distribucion values (0005,017,8);

insert into marco values (0001,001);
insert into marco values (0001,002);
insert into marco values (0001,003);
insert into marco values (0001,004);
insert into marco values (0001,005);
insert into marco values (0002,006);
insert into marco values (0002,007);
insert into marco values (0002,008);
insert into marco values (0002,009);
insert into marco values (0003,010);
insert into marco values (0003,011);
insert into marco values (0003,012);
insert into marco values (0004,013);
insert into marco values (0004,014);
insert into marco values (0005,015);
insert into marco values (0005,016);
insert into marco values (0005,017);
insert into marco values (0006,018);
insert into marco values (0006,019);
insert into marco values (0006,020);
