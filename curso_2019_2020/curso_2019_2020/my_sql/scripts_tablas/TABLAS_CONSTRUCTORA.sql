DROP DATABASE IF EXISTS CONSTRUCTORA;
create database CONSTRUCTORA DEFAULT CHARACTER SET UTF8;
USE CONSTRUCTORA;

create table proyectos(
codP varchar(3) not null,
descrip varchar(30) not null,
localidad varchar(30) not null,
cliente varchar(50) not null,
telefono varchar(9),
primary key (codP))
engine innodb;

create table maquinas(
codM varchar(3) not null,
nombre varchar(30) not null,
precioHora int(6) not null,
primary key (codM))
engine innodb;

create table conductores(
codC varchar(3) not null,
nombre varchar(40) not null,
localidad varchar(30) not null,
categoria int(2) not null,
primary key (codC))
engine innodb;

create table trabajos(
codC varchar(3) not null,
codM varchar(3) not null,
codP varchar(3) not null,
fecha date not null,
tiempo int(4) null,
primary key (codC,codM,codP,fecha),
constraint fk_tc foreign key (codC) references conductores(codC),
constraint fk_tm foreign key (codM) references maquinas(codM),
constraint fk_tp foreign key (codP) references proyectos(codP))
engine innodb;

insert into proyectos values ('P01','Garaje','Arganda','Felipe Sol','600111111');
insert into proyectos values ('P02','Solado','Rivas','José Pérez','915511101');
insert into proyectos values ('P03','Garaje','Arganda','Rosa López','600569841');
insert into proyectos values ('P04','Techado','Loeches','José Pérez','915511101');
insert into proyectos values ('P05','Buhardilla','Rivas','Ana Botijo',null);

insert into maquinas values ('M01','Excavadora',15000);
insert into maquinas values ('M02','Hormigonera',10000);
insert into maquinas values ('M03','Volquete',11000);
insert into maquinas values ('M04','Apisonadora',18000);

insert into conductores values ('C01','José Sánchez','Arganda',18);
insert into conductores values ('C02','Manuel Díaz','Arganda',15);
insert into conductores values ('C03','Juan Pérez','Rivas',20);
insert into conductores values ('C04','Luis Ortíz','Arganda',18);
insert into conductores values ('C05','Javier Martín','Loeches',12);
insert into conductores values ('C06','Carmen Pérez','Rivas',15);

insert into trabajos values ('C02','M03','P01','2012/09/10',100);
insert into trabajos values ('C03','M01','P02','2012/09/10',200);
insert into trabajos values ('C05','M03','P02','2012/09/10',150);
insert into trabajos values ('C04','M03','P02','2012/09/10',90);
insert into trabajos values ('C01','M02','P02','2012/09/12',120);
insert into trabajos values ('C02','M03','P03','2012/09/13',30);
insert into trabajos values ('C03','M01','P04','2012/09/15',300);
insert into trabajos values ('C02','M03','P02','2012/09/15',null);
insert into trabajos values ('C01','M03','P04','2012/09/15',180);
insert into trabajos values ('C05','M03','P04','2012/09/15',90);
insert into trabajos values ('C01','M02','P04','2012/09/17',null);
insert into trabajos values ('C02','M03','P01','2012/09/18',null);