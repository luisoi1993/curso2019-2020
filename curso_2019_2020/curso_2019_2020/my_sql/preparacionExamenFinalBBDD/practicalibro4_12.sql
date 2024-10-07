#1. Obtener el nombre de los conductores con categoría 15.
SELECT nombre FROM conductores
WHERE categoria LIKE 15;


#2. Obtener la descripción de los proyectos en los que se haya realizado trabajos durante los días 11
#al 15 de septiembre de 2012.
SELECT descrip FROM proyectos
WHERE codp IN(SELECT codp FROM trabajos 
				  WHERE fecha BETWEEN '2012-9-11' AND '2012-09-15');
				  
#3. Obtener el nombre de los conductores que hayan trabajado con una Hormigonera, ordenados
#descendentemente.
SELECT nombre FROM conductores 
WHERE codc IN(SELECT codc FROM trabajos
				  WHERE codm IN(SELECT codm FROM maquinas
				  					 WHERE nombre LIKE 'hormigonera'))
ORDER BY nombre DESC;


#4. Obtener el nombre de los conductores que hayan trabajado con una Hormigonera en proyectos
#de Arganda.
SELECT nombre FROM conductores 
WHERE codc IN(SELECT codc FROM trabajos
					WHERE codm IN(SELECT codm FROM maquinas 
										WHERE nombre LIKE 'excavadora')
					AND codp IN(SELECT codp FROM proyectos
									WHERE localidad LIKE 'arganda'));
									
#5. Obtener el nombre de los conductores y descripción del proyecto, para aquellos conductores que
#hayan trabajado con una Hormigonera en proyectos de Arganda durante los días 12 al 17 de
#Septiembre.
SELECT conductores.nombre, proyectos.descrip
FROM conductores INNER JOIN trabajos ON conductores.codC = trabajos.codC
INNER JOIN proyectos ON proyectos.codP = trabajos.codP
WHERE trabajos.codM in (SELECT codM FROM maquinas where nombre like 'Hormigonera')
AND proyectos.localidad = 'Arganda'
AND trabajos.fecha BETWEEN '2012/09/12' AND '2012/09/18';

#6. Obtener los conductores que trabajan en los proyectos de José Pérez.
SELECT nombre FROM conductores
WHERE codc IN(SELECT codc FROM trabajos
				 WHERE codp IN(SELECT codp FROM proyectos
				 					WHERE cliente LIKE 'josé perez')); 
				 					
#7. Obtener el nombre y localidad de los conductores que NO trabajan en los proyectos de José
#Pérez
SELECT nombre,localidad FROM conductores 
WHERE codc NOT IN(SELECT codc FROM trabajos 
						WHERE codp IN(SELECT codp FROM proyectos
											WHERE cliente LIKE 'josé perez'));
											
#8.Obtener todos los datos de los proyectos realizados en Rivas o que sean de un cliente llamado
#José.
SELECT * FROM proyectos
WHERE localidad LIKE 'rivas' 
OR cliente LIKE 'jose';

#9. Obtener los conductores que habiendo trabajado en algún proyecto, figuren sin horas
#trabajadas.
SELECT * FROM conductores
WHERE codc IN(SELECT codc FROM trabajos
				  WHERE tiempo IS NULL);

#10. Obtener los empleados que tengan como apellido Pérez y hayan trabajado en proyectos de
#localidades diferentes a las suyas
SELECT conductores.*
FROM conductores INNER JOIN trabajos ON conductores.codC = trabajos.codC
INNER JOIN proyectos ON proyectos.codP = trabajos.codP
WHERE conductores.nombre like '%Pérez%'
AND proyectos.localidad <> conductores.localidad;

#11. Obtener el nombre de los conductores y la localidad del proyecto, para aquellos conductores
#que hayan trabajado con máquinas con precio hora comprendido entre 10000 y 15000 ptas.
SELECT DISTINCT C.nombre As "Conductor", P.localidad AS "Localidad del Proyecto"
FROM conductores C INNER JOIN trabajos T ON C.codC = T.codC
INNER JOIN maquinas M ON M.codM = M.codM
INNER JOIN proyectos P ON P.codP = T.codP
WHERE M.preciohora BETWEEN 10000 AND 15000;

SELECT DISTINCT conductores.nombre,proyectos.localidad FROM conductores
INNER JOIN trabajos ON conductores.codc=trabajos.codC
INNER JOIN maquinas ON trabajos.codm=maquinas.codm
INNER JOIN proyectos ON trabajos.codP=proyectos.codp
WHERE maquinas.preciohora BETWEEN 10000 AND 15000;

#12.Obtener el nombre y localidad de los conductores, y la localidad del proyecto para aquellos
#proyectos que sean de Rivas y en los que no se haya utilizado una máquina de tipo Excavadora o
#una máquina de tipo Hormigonera.
SELECT DISTINCT conductores.nombre,proyectos.localidad AS localidad_proyectos ,conductores.localidad FROM conductores
INNER JOIN trabajos ON conductores.codc=trabajos.codC
INNER JOIN maquinas ON trabajos.codm=maquinas.codm
INNER JOIN proyectos ON trabajos.codP=proyectos.codp
WHERE maquinas.nombre NOT IN('excavadora','hormigonera')
AND proyectos.localidad LIKE 'rivas';


#13. Obtener todos los datos de los proyectos, y para aquellos proyectos realizados el día 15 de
#Septiembre, además incluir el nombre y localidad de los conductores que hayan trabajado en dicho
#proyecto
SELECT proyectos.codp,proyectos.descrip,proyectos.localidad,proyectos.cliente,proyectos.telefono,conductores.nombre,conductores.localidad
FROM proyectos INNER JOIN trabajos
	ON trabajos.codP=proyectos.codp
INNER JOIN conductores 
	ON trabajos.codc=conductores.codc
WHERE trabajos.fecha LIKE '2012-09-15';

#14. Obtener el nombre de los conductores y el nombre y localidad de los clientes, en los que se haya
#utilizado la máquina con precio hora más elevado
SELECT conductores.nombre,proyectos.cliente,proyectos.localidad FROM conductores
INNER JOIN trabajos 
 ON conductores.codc=trabajos.codC
 INNER JOIN	 proyectos
 	ON trabajos.codp=proyectos.codP
WHERE codm IN(SELECT codm FROM maquinas
					WHERE preciohora IN(SELECT MAX(preciohora) FROM maquinas));
					
#15. Obtener todos los datos de los proyectos que siempre han utilizado la máquina de precio más
#bajo.
SELECT DISTINCT proyectos.*
FROM trabajos inner join proyectos on  proyectos.codP = trabajos.codP
WHERE trabajos.codP NOT IN (SELECT codP
FROM trabajos
WHERE codM IN (SELECT codM
FROM maquinas
WHERE preciohora <> (SELECT MIN(preciohora)
FROM maquinas) ));

#16. Obtener los proyectos en los que haya trabajado el conductor de categoría más alta menos dos
#puntos, con la máquina de precio/ hora más bajo.
SELECT DISTINCT CodP
FROM trabajos
WHERE codM IN (SELECT codM
FROM maquinas
WHERE preciohora IN (SELECT MIN(preciohora) FROM maquinas) )
AND codC IN (SELECT codC FROM conductores
WHERE categoria IN (SELECT MAX(categoria) - 2 FROM conductores) );

#17. Obtener por cada uno de los clientes el tiempo total empleado en sus proyectos.
SELECT cliente, SUM(Tiempo)
FROM proyectos LEFT JOIN trabajos ON proyectos.codP = trabajos.codP
GROUP BY cliente;

#18. Obtener por cada uno de los proyectos existentes en la BD, la descripción del proyecto, el cliente
#y el total a facturar en ptas y en euros. Ordenar el resultado por uno de los totales y por cliente.
SELECT cliente, descrip, SUM(Tiempo*preciohora) As TotalPtas,
SUM(Tiempo*preciohora) / 166.366 AS TotalEuros
FROM proyectos LEFT JOIN trabajos ON proyectos.codP = trabajos.codP
LEFT JOIN maquinas ON trabajos.codM = maquinas.codM
GROUP BY cliente, descrip
ORDER BY 3,1;

#19. Obtener para el proyecto que más se vaya a facturar la descripción del proyecto, el cliente y el
#total a facturar en Ptas. y en euros
SELECT cliente, descrip, SUM(Tiempo*preciohora) As TotalPtas,
SUM(Tiempo*preciohora) / 166.386 AS TotalEuros
FROM proyectos INNER JOIN trabajos ON proyectos.codP = trabajos.codP
INNER JOIN maquinas ON trabajos.codM = maquinas.codM
GROUP BY descrip, cliente
HAVING SUM(Tiempo*preciohora) = (SELECT SUM(Tiempo*preciohora)
											FROM trabajos INNER JOIN maquinas
											ON trabajos.codM = maquinas.codM
											GROUP BY CodP
											Order by 1 desc
											Limit 1);

#20. Obtener los conductores que hayan trabajado en todos los proyectos de la localidad de
#Arganda

#Solución con inner join

SELECT trabajos.codc, nombre, COUNT(distinct trabajos.codp)
FROM conductores INNER JOIN trabajos ON conductores.codC = trabajos.codC
INNER JOIN proyectos ON trabajos.codp=proyectos.codp
WHERE proyectos.localidad like 'Arganda'
GROUP BY trabajos.codc, nombre
HAVING COUNT(DISTINCT trabajos.codp) = (SELECT COUNT(*) FROM proyectos
WHERE localidad like 'Arganda');

#Solución con subconsultas sólo

SELECT trabajos.codc, COUNT(distinct trabajos.codp)
FROM trabajos
WHERE codp in (select codp from proyectos where localidad like 'Arganda')
GROUP BY trabajos.codc
HAVING COUNT(DISTINCT trabajos.codp) = (SELECT COUNT(*) FROM proyectos
WHERE localidad like 'Arganda');

#21. Obtener el tiempo máximo dedicado a cada proyecto para aquellos proyectos en los que haya
#participado más de un conductor diferente.
SELECT CodP, MAX(tiempo) As MaxTiempo
FROM trabajos
GROUP BY CodP
HAVING COUNT(DISTINCT CodC) > 1;

#22. Obtener el número de partes de trabajo, código del proyecto, descripción y cliente para aquel
#proyecto que figure con más partes de trabajo.
SELECT proyectos.CodP, descrip, COUNT(*) As "Número de Trabajos"
FROM proyectos inner join trabajos ON proyectos.codP = trabajos.codP
GROUP BY proyectos.CodP, cliente, descrip
HAVING COUNT(*) >=ALL (SELECT COUNT(*)
FROM trabajos
GROUP BY CodP);

#23. Obtener la localidad cuyos conductores (al menos uno) haya participado en más de dos
#proyectos diferentes.
SELECT localidad
FROM conductores
WHERE CodC IN (SELECT CodC FROM trabajos
 GROUP BY CodC
 HAVING COUNT(DISTINCT CodP) > 2);
SELECT * FROM maquinas;
SELECT * FROM trabajos;
SELECT * FROM proyectos;
SELECT * FROM conductores;