create database padron;
use padron;
create table provincias(
  codprovincia int(2) primary key,
  nombre_provincia varchar(25)
  )engine=innodb;

create table empleados(
  nombre varchar(25) primary key,
  edad int(2),
  cod_provin int(2) references provincias(codprovincia) 
		on delete cascade on update set null
)engine=innodb;

create table bloquespisos (
calle varchar(30),
numero int(3),
piso int(2),
puerta char(1),
codigo_postal int(5),
metros int (5),
comentarios varchar(60),
cod_zona int(2),
dni varchar(10),
primary key (calle,numero,piso,puerta)
)engine=innodb;

create table zonas (
  cod_zona int(2) primary key,
  nombrezona varchar(20),
  masdatos varchar(50)
)engine=innodb;

create table personas (
  dni varchar(10) primary key,
  nombre varchar(30),
  direccion varchar(50),
  poblacion varchar(40),
  codprovin int(2),
  constraint fk_personas foreign key (codprovin) references provincias(codprovincia) 
      on delete cascade  on update set null
)engine=innodb;

use information_schema;
show tables;
describe key_column_usage;
select table_name,constraint_name from key_column_usage;

use padron;
alter table empleados change cod_provin cod_provin int(2);
alter table empleados add constraint fk_empleados foreign key (cod_provin) references provincias(codprovincia);

alter table personas drop foreign key fk_personas;
alter table personas drop primary key;
alter table provincias drop primary key;  # No se puede porque es referenciada por la tabla EMPLEADOS

alter table personas add constraint fk_personas foreign key (codprovin) references provincias(codprovincia);

 