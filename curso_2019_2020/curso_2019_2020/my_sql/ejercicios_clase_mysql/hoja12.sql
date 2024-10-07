#hoja 12
#1. Obtener el nombre de los conductores con categoría 15. 
SELECT nombre 
FROM conductores
WHERE categoria LIKE 15;

#2. Obtener la descripción de los proyectos en los que se haya realizado trabajos 
#durante los días 11 al 15 de septiembre de 2012.
SELECT descrip
FROM proyectos
WHERE codp IN (SELECT codp
					FROM trabajos 
					WHERE fecha BETWEEN '2012-9-11' AND '2012-9-15');
					
SELECT descrip
FROM proyectos
INNER JOIN trabajos 
ON proyectos.codP = trabajos.codP 
WHERE fecha BETWEEN '2012-9-11' AND '2012-9-15'; 

#3. Obtener el nombre de los conductores que hayan trabajado con una Hormigonera, ordenados
# descendentemente.
SELECT nombre 
FROM conductores
WHERE codc IN(SELECT codc
					FROM trabajos
					WHERE codm IN(SELECT codm
										FROM maquinas
										WHERE nombre LIKE 'hormigonera'))
ORDER BY nombre DESC;

SELECT conductores.nombre 
FROM conductores
INNER JOIN trabajos
ON conductores.codc=trabajos.codc
INNER JOIN maquinas 
ON trabajos.codm=maquinas.codM
WHERE maquinas.nombre LIKE 'hormigonera'
ORDER BY conductores.nombre DESC;

#4. Obtener el nombre de los conductores que hayan trabajado con una
# Hormigonera en proyectos de Arganda.
SELECT nombre 
FROM conductores
WHERE codc IN(SELECT codc 
					FROM trabajos 
					WHERE codm IN (SELECT codm
										FROM maquinas
										WHERE nombre LIKE 'hormigonera')
					AND Codp IN (SELECT codp 
										FROM proyectos
										WHERE localidad LIKE 'arganda'));

SELECT conductores.nombre
FROM conductores
INNER JOIN trabajos
	ON conductores.codc=trabajos.codc
INNER JOIN maquinas
	ON trabajos.codm=maquinas.codm
INNER JOIN proyectos 
	ON trabajos.codp=proyectos.codp
WHERE maquinas.nombre LIKE 'hormigonera' AND proyectos.localidad LIKE'arganda';

#5. Obtener el nombre de los conductores y descripción del proyecto,
#para aquellos conductores que hayan trabajado con una Hormigonera en 
#proyectos de Arganda durante los días 12 al 17 de Septiembre.
SELECT conductores.nombre,proyectos.descrip
FROM conductores
INNER JOIN trabajos
ON conductores.codc=trabajos.codc
INNER JOIN proyectos
ON trabajos.codp=proyectos.codp
INNER JOIN maquinas
ON trabajos.codm=maquinas.codm
WHERE  maquinas.nombre LIKE 'hormigonera'
AND proyectos.localidad LIKE 'arganda'
AND trabajos.fecha  BETWEEN '2012-09-12' AND '2012-09-17';

SELECT conductores.nombre, proyectos.descrip
FROM conductores 
INNER JOIN trabajos 
ON conductores.codC = trabajos.codC 
INNER JOIN proyectos 
ON proyectos.codP = trabajos.codP 
WHERE trabajos.codM in (SELECT codM 
								FROM maquinas
								WHERE nombre LIKE 'Hormigonera')
AND proyectos.localidad = 'Arganda'
AND trabajos.fecha BETWEEN '2012/09/12' AND '2012/09/18';

#6. Obtener los conductores que trabajan en los proyectos de José Pérez.
SELECT DISTINCT conductores.nombre
FROM conductores
INNER JOIN trabajos
ON conductores.codC=trabajos.codc
WHERE codp IN(SELECT codp 
					FROM proyectos
					WHERE cliente LIKE 'josé perez');
					
SELECT DISTINCT conductores.nombre
FROM conductores
INNER JOIN trabajos
 ON conductores.codC = trabajos.codC 
INNER JOIN proyectos 
 ON proyectos.codP = trabajos.codP 
WHERE proyectos.cliente = 'José Pérez';

SELECT DISTINCT conductores.nombre 
FROM conductores
Where codC IN(SELECT codC
				 FROM trabajos
				 WHERE codP IN (SELECT codP 
				 					FROM proyectos 
									WHERE proyectos.cliente like 'José Pérez'));

#7. Obtener el nombre y localidad de los conductores que 
#NO trabajan en los proyectos de José Pérez
SELECT conductores.nombre, conductores.localidad
FROM conductores 
WHERE codC NOT IN (SELECT codC 
						FROM trabajos 
						WHERE codP IN (SELECT codP
											FROM proyectos 
											WHERE cliente = 'José Pérez'));


#8. Obtener todos los datos de los proyectos realizados en Rivas
# o que sean de un cliente llamado José.
SELECT *
FROM proyectos
WHERE localidad LIKE 'rivas' OR cliente LIKE '%josé%';

#9. Obtener los conductores que habiendo trabajado en algún proyecto,
# figuren sin horas trabajadas.
SELECT conductores.nombre
FROM conductores
INNER JOIN trabajos
ON conductores.codc=trabajos.codc
WHERE trabajos.codp IS NOT NULL AND trabajos.tiempo IS NULL;

#10. Obtener los empleados que tengan como apellido Pérez y 
#hayan trabajado en proyectos de localidades diferentes a las suyas
SELECT conductores.* 
FROM conductores
INNER JOIN trabajos 
ON conductores.codC = trabajos.codC 
INNER JOIN proyectos 
ON proyectos.codP = trabajos.codP 
WHERE conductores.nombre 
LIKE '%Pérez%' AND proyectos.localidad <> conductores.localidad;

SELECT nombre
FROM conductores
WHERE nombre LIKE '%Perez' AND codc NOT IN(SELECT codc 
														FROM trabajos
														WHERE codP in (select codP from proyectos where conductores.localidad like proyectos.localidad) and codc in (select codc from trabajos);

#11. Obtener el nombre de los conductores y la localidad del proyecto,para
#aquellos conductores que hayan trabajado con maáquinas con precio hora
#comprendido entre 10000 y 15000 ptas
SELECT DISTINCT c.nombre AS "Conductor",P.localidad AS "Localidad del Proyecto"
FROM conductores C INNER JOIN trabajos T ON C.codC=t.codC
INNER JOIN maquinas M ON M.codM = M.codM	
INNER JOIN proyectos P ON P.codp=T.codP
WHERE M.preciohora BETWEEN 10000 AND 15000;

#12.Obtener el nombre y localidad de los conductores, y la localidad del proyecto
#para aquellos proyectos que sean de Rivas y en los que no se haya utilizado una 
#maquina de tipo hormigonera
SELECT C.nomnre AS Conductor , C.localidad AS Localidad_Conductor, P.localidad AS Localidad_del_proyecto,M.nombre AS Maquina
FROM conductores
C INNER JOIN  trabajos T ON C.codC=T.codC
INNER JOIN maquinas M ON M.codM= M.codM
INNER JOIN proyectos P ON P.codP= T.codP
WHERE P.localidad LIKE 'Rivas'
AND P.Codp NOT IN(SELECT codP
						FROM trabajos 
						Tl INNER JOIN maquinas Mll ON Ml.codM=Tl.codM
						WHERE(Ml.nombre='Excavadora' OR Ml.nombre='Hormigonera'));
					
#13.Obtener todos los datos de proyectos, y para aquellos proyectos realizados el dia 15 de
#septiembre, además incluir el nombre y localidad de los conductores que hayan
#trabajado en dicho proyecto

SELECT DISTINCT P.*,cnombre,c.localidad
FROM conductores C INNER JOIN trabajos T ON C.
								  
SELECT * FROM conductores;
SELECT * FROM maquinas;
SELECT * FROM proyectos;
SELECT * FROM trabajos;