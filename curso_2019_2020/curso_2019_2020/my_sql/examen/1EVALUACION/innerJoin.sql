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


#22. Obtener el número de partes de trabajo, código del proyecto, descripción y cliente para aquel
#proyecto que figure con más partes de trabajo.

SELECT proyectos.CodP, descrip, COUNT(*) As "Número de Trabajos"
FROM proyectos inner join trabajos ON proyectos.codP = trabajos.codP
GROUP BY proyectos.CodP, cliente, descrip
HAVING COUNT(*) >=ALL (SELECT COUNT(*)
FROM trabajos
GROUP BY CodP);											Limit 1);