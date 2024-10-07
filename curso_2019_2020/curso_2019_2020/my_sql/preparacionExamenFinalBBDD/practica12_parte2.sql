#24. Subir el precio por hora en un 10% del precio por hora más bajo
#para todas las máquinas excepto para aquella que tenga el valor más alto.
UPDATE maquinas
SET preciohora = preciohora + (SELECT MIN(preciohora)*0.1
FROM maquinas2)
WHERE preciohora <> (SELECT MAX(preciohora)
FROM maquinas2);

#25. Subir la categoría un 15% a los conductores que no hayan trabajado
#con Volquete y hayan trabajado en
#más de un proyecto distinto.
UPDATE conductores 
SET categoria =categoria *1.15
WHERE codc NOT IN(SELECT codc FROM proyectos
						WHERE codm IN(SELECT codm FROM maquinas
											WHERE nombre LIKE 'volquete'))
AND codc IN( SELECT codc FROM proyectos
				GROUP BY codc 
				HAVING COUNT(DISTINCT codp) >1);
				
#26. Eliminar el proyecto Solado de José Pérez.	
DROP FROM proyectos
WHERE descrip LIKE 'solado'
AND cliente LIKE 'jose perez';	

DROP FROM trabajos
WHERE codp IN (SELECT codp FROM proyectos
					WHERE descrrip LIKE 'solado'
					AND cliente LIKE 'jose perez');
					
#27. Modificar la estructura de la base de datos,
#añadiendo las claves foráneas, sin ninguna opción de
#integridad referencial.
ALTER TABLE trabajos
ADD FOREIGN KEY (codC) REFERENCES conductores (codC);
ALTER TABLE trabajos
ADD FOREIGN KEY (codM) REFERENCES maquinas (codM);
ALTER TABLE trabajos
ADD FOREIGN KEY (codP) REFERENCES proyectos (codP);


#28.Insertar en la tabla trabajos la fila ‘C01’, ‘M04’,’P07’,’19/09/02’,100
INSERT INTO trabajos 
	VALUES ('C01', 'M04','P07','19/sep/02',null);
	
#29. Eliminar el conductor ‘C01’ de la tabla conductores.
Delete from trabajos where codc like ‘C01’;

#30. Modificar el código del conductor ‘C01’ de la tabla conductores,
#por el código ‘C08’.
alter table trabajos
drop foreign key fk_tc;
alter table trabajos
add constraint fk_tc foreign key (codc) references conductores(codc)
on update cascade;
UPDATE conductores
SET codC = 'C08'
WHERE codC = 'C01';

#31. Modificar el código del conductor ‘C01’ de la tabla conductores, por el código ‘C07’
alter table trabajos
drop foreign key fk_tc;
alter table trabajos
add constraint fk_tc foreign key (codc) references conductores(codc)
on update cascade;
UPDATE conductores
SET codC = 'C07'
WHERE codC = 'C01';

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

#33. Crear una vista que contenga el nombre del conductor, la descripción del proyecto y la media
#aritmética del tiempo trabajado.
CREATE VIEW ap33 (conductor, proyecto, tiempoMedio)
AS SELECT nombre, descrip, avg(tiempo)
FROM conductores, trabajos, proyectos
WHERE conductores.codC = trabajos.codC AND
trabajos.codP = proyectos.codP
GROUP BY nombre, descrip;

#34. Crear una vista sobre la tabla trabajos, para los trabajos realizados después del 15 de
#septiembre de 2002. Crearla sin la cláusula “With Check Option” y sin ella, comprobando su
#funcionamiento.
CREATE VIEW ap34a (conductor, maquina, proyecto, fecha, tiempo)
AS SELECT codc, codm, codp, fecha, tiempo
FROM trabajos
WHERE fecha > '15/sep/02';

INSERT INTO ap34
VALUES ('C01','M01','P01','03/sep/02',10);

#35. Eliminar las tablas de la base de datos.
DROP VIEW ap33;
DROP VIEW ap34;
DROP TABLE trabajos;
DROP TABLE conductores;
DROP TABLE maquinas;
DROP TABLE proyectos;

SELECT * FROM conductores;
SELECT * FROM maquinas;
SELECT * FROM proyectos;
SELECT * FROM trabajos;