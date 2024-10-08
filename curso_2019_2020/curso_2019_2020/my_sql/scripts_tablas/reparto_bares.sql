CREATE DATABASE REPARTO_BARES;

use reparto_bares;
CREATE TABLE BARES (
CODB VARCHAR(3) NOT NULL,
NOMBRE VARCHAR(15) NOT NULL,
CIF VARCHAR(10),
LOCALIDAD VARCHAR(20) NOT NULL
)ENGINE INNODB;

CREATE TABLE CERVEZAS (
CODC VARCHAR(3) NOT NULL,
ENVASE VARCHAR(10) NOT NULL,
CAPACIDAD DECIMAL(6 , 3) NOT NULL,
STOCK INTEGER NOT NULL
)ENGINE INNODB;


CREATE TABLE EMPLEADOS (
CODEM VARCHAR(3) NOT NULL,
NOMBRE VARCHAR(30) NOT NULL,
SUELDO INTEGER NOT NULL
)ENGINE INNODB;


CREATE TABLE REPARTO (
CODEM VARCHAR(3) NOT NULL,
CODB VARCHAR(3) NOT NULL,
CODC VARCHAR(3) NOT NULL,
FECHA DATE NOT NULL,
CANTIDAD INTEGER NOT NULL
)ENGINE INNODB;


ALTER TABLE BARES ADD CONSTRAINT PK_BARES PRIMARY KEY (CODB);

ALTER TABLE CERVEZAS ADD CONSTRAINT PK_CERVEZAS PRIMARY KEY (CODC);

ALTER TABLE EMPLEADOS ADD CONSTRAINT PK_EMPLEADOS PRIMARY KEY (CODEM);

ALTER TABLE REPARTO ADD CONSTRAINT PK_REPARTO PRIMARY KEY(CODEM,CODB,CODC,FECHA);

ALTER TABLE REPARTO ADD CONSTRAINT FK_REPARTO1 FOREIGN KEY (CODEM) REFERENCES EMPLEADOS(CODEM);

ALTER TABLE REPARTO ADD CONSTRAINT FK_REPARTO2 FOREIGN KEY (CODB) REFERENCES BARES(CODB);

ALTER TABLE REPARTO ADD CONSTRAINT FK_REPARTO3 FOREIGN KEY(CODC) REFERENCES CERVEZAS(CODC);

INSERT INTO CERVEZAS VALUES ('01','Botella',0.2,3600);
INSERT INTO CERVEZAS VALUES ('02','Botella',0.33,1200);
INSERT INTO CERVEZAS VALUES ('03','Lata',0.33,2400);
INSERT INTO CERVEZAS VALUES ('04','Botella',1.0,288);
INSERT INTO CERVEZAS VALUES ('05','Barril',60.0,30);

INSERT INTO BARES VALUES ('001','Stop','11111111X','Villa Botijo');
INSERT INTO BARES VALUES ('002','Las Vegas','22222222Y','Villa Botijo');
INSERT INTO BARES VALUES ('003','Club Social',null,'Las Ranas');
INSERT INTO BARES VALUES ('004','Otra Ronda','33333333Z','La Esponja');

INSERT INTO EMPLEADOS VALUES ('1','Prudencio Caminero',120000);
INSERT INTO EMPLEADOS VALUES ('2','Vicente Merario',110000);
INSERT INTO EMPLEADOS VALUES ('3','Valentin Siempre',100000);

INSERT INTO REPARTO VALUES ('1','001','01','05/10/21',240);
INSERT INTO REPARTO VALUES ('1','001','02','05/10/21',48);
INSERT INTO REPARTO VALUES ('1','002','03','05/10/22',60);
INSERT INTO REPARTO VALUES ('1','004','05','05/10/22',4);
INSERT INTO REPARTO VALUES ('2','002','03','05/10/22',48);
INSERT INTO REPARTO VALUES ('2','002','05','05/10/23',2);
INSERT INTO REPARTO VALUES ('2','004','01','05/10/23',480);
INSERT INTO REPARTO VALUES ('2','004','02','05/10/24',72);
INSERT INTO REPARTO VALUES ('3','003','03','05/10/24',48);
INSERT INTO REPARTO VALUES ('3','003','04','05/10/25',20);