#Dar de alta una cerveza nueva de jarra y abastecer con 20 unidades a cada bar de la
#localidad 'La esponja'.
INSERT INTO cervezas (CODC,ENVASE,CAPACIDAD,STOCK) VALUES (06,'jarra',2.000,2000);

INSERT INTO reparto
SELECT 1,CODB,CODC,CURRENT_DATE(), 20 	FROM bares
INNER JOIN cervezas
INNER JOIN empleados
WHERE cervezas.CODC LIKE 06 
AND BARES.LOCALIDAD LIKE 'La Esponja';

#Incrementar el sueldo de los repartidores en un 10% para aquellos que hayan tenido algún
#reparto de cervezas de barril en el último año.

UPDATE empleados SET sueldo = sueldo*1.10
WHERE CODEM IN (SELECT CODEM FROM reparto
					WHERE CODC LIKE 05);
					
#Contratamos a Laura Martínez con un sueldo igual a la media de los sueldos de todos los
#empleados y actualizamos la tabla de repartos para asignar a la nueva empleada aquellos
#repartos del o los repartidor que han repartido la menor cantidad de cerveza.
INSERT INTO empleados (CODEM,NOMBRE,SUELDO) VALUES (4,'Laura Martínez',110000);

UPDATE reparto SET CODEM = 4
WHERE CODEM IN(SELECT CODEM FROM reparto
					GROUP BY CODEM
					HAVING SUM(CANTIDAD)=(SELECT SUM(CANTIDAD) FROM reparto
												GROUP BY CODEM
												ORDER BY SUM(CANTIDAD) DESC LIMIT 1));
												
												
#Elimina aquellos bares que tengan la menor variedad de cervezas repartidas (diferente
#código de cerveza).
DELETE FROM bares
WHERE CODB IN(SELECT CODB FROM reparto
					GROUP BY CODB
					HAVING COUNT(DISTINCT CODC)=(SELECT COUNT(DISTINCT CODC) FROM reparto
															GROUP BY CODEM
															ORDER BY COUNT(DISTINCT CODC) DESC LIMIT 1));	


#Realizar una inserción de un envase nuevo llamado 'Barril M' cuya capacidad sea la mitad
#que la de un barril normal y que tenga en stock la mitad de la suma de todo el stock de los
#barriles.
SELECT SUM(STOCK)/2
FROM cervezas;

INSERT INTO cervezas (CODC,ENVASE,CAPACIDAD,STOCK) VALUES (07,'Barril M',30.000,3760);

#Elimina la cerveza que menos se haya repartido en el bar 'Las Vegas'.

DELETE FROM cervezas
WHERE CODC IN(SELECT CODC FROM reparto
					WHERE CODB LIKE 002
					GROUP BY CODC 
					HAVING SUM(cantidad)=(SELECT SUM(cantidad) FROM reparto
					GROUP BY CODC
					ORDER BY SUM(cantidad) DESC LIMIT 1));
