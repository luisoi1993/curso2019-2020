#26. Eliminar el proyecto Solado de José Pérez.	

DROP FROM proyectos
WHERE descrip LIKE 'solado'
AND cliente LIKE 'jose perez';	

DROP FROM trabajos
WHERE codp IN (SELECT codp FROM proyectos
					WHERE descrrip LIKE 'solado'
					AND cliente LIKE 'jose perez');
					
