#Obtener el cifc de todos los concesionarios cuya cantidad de coches distribuida
#está comprendida entre 10 y 18 ambos inclusive.
SELECT cifc
FROM distribucion
WHERE cantidad>=10 AND cantidad<=18;

SELECT cifc
FROM distribucion
WHERE cantidad
BETWEEN 10 AND 18;

#Obtener todos los codcoche de los coches cuyo nombre no contiene ninguna 'A’
SELECT codcoche
FROM coches
WHERE nombre NOT LIKE '%A%';

#Obtener el número total de nombre de marcas de coches que son de MADRID.
SELECT COUNT(DISTINCT nombre)
FROM marcas
WHERE ciudad LIKE 'madrid';


#Obtener la media de coches que tienen todos los concesionarios
SELECT SUM(cantidad)/COUNT(DISTINCT cifc) 
FROM distribución;

#Obtener el dni con numeración más baja de todos los clientes que han
#comprado un coche blanco.
SELECT MIN(dni)
FROM ventas
WHERE color LIKE 'blanco';

#Obtener el cifc de todos los concesionarios cuyo número de coches en stock no
#es nulo.
SELECT DISTINCT cifc
FROM distribucion
WHERE cantidad IS NOT NULL;

#Obtener el dni de los clientes que han comprado algún coche a un
#concesionario de Madrid.
SELECT DISTINCT dni
FROM ventas
WHERE cifc IN (SELECT cifc
					FROM concesionario
					WHERE ciudad LIKE 'madrid');

#Obtener el color de los coches vendidos por el concesionario ‘ACAR’.
SELECT DISTINCT color 
FROM ventas
WHERE cifc IN(SELECT cifc
					FROM concesionario
					WHERE nombre LIKE 'ACAR');

#Obtener el codcoche de los coches vendidos por algún concesionario de
#Madrid.
SELECT DISTINCT codcoche
FROM ventas
WHERE cifc IN (SELECT cifc
					FROM concesionario
					WHERE ciudad LIKE 'madrid');

#Obtener el nombre y el modelo de los coches vendidos por algún concesionario
#de Barcelona.
SELECT nombre,modelo
FROM coches
WHERE codcoche IN(SELECT codcoche
						FROM ventas
						WHERE cifc IN(SELECT cifc
											FROM concesionario
											WHERE ciudad LIKE 'barcelona'));
											
#Obtener todos los nombres de los clientes que hayan adquirido algún coche del
#concesionario ‘DCAR’;
SELECT nombre 
FROM clientes
WHERE dni IN(SELECT dni
					FROM ventas
					WHERE cifc IN(SELECT cifc
										FROM concesionario
										WHERE nombre LIKE 'dcar'));
										
#Obtener el nombre y el apellido de los clientes que han adquirido un coche
#modelo ‘GTI’ de color blanco
SELECT nombre,apellido
FROM clientes
WHERE dni IN(SELECT dni 
				FROM ventas
				WHERE color LIKE'blanco' AND codcoche IN(SELECT codcoche 
																		FROM coches
																		WHERE modelo LIKE 'gti'));

#Obtener el nombre y el apellido de los clientes cuyo dni es menor que el de los
#clientes que son de Barcelona.
SELECT nombre,apellido
FROM clientes
WHERE dni < ALL(SELECT dni
				FROM clientes
				WHERE ciudad LIKE 'barcelona');

#Obtener el nombre y el apellido de los clientes cuyo nombre empieza por ‘A’ y
#cuyo dni es mayor que el de ¡ALGUNO! de los clientes que son de Madrid.
SELECT nombre,apellido
FROM clientes
WHERE nombre LIKE 'a%' AND dni > ANY(SELECT dni 
												FROM clientes
												WHERE ciudad LIKE 'madrid');
#Obtener el dni de los clientes cuya ciudad sea la última de la lista alfabética de
#las ciudades donde hay concesionarios.
SELECT dni 
FROM clientes
WHERE ciudad = (SELECT MAX(ciudad)
					FROM concesionario);

