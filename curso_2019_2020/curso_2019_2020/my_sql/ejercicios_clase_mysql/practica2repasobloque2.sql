#1.Subir en un 20% el coste básico de las asignaturas de la titulación de Químicas que
#tengan matriculados más de 2 alumnos.

UPDATE asignatura  SET costebasico  = costebasico + (costebasico * 20 / 100)
WHERE IDasignatura IN ( SELECT idasignatura FROM alumno_asignatura
								GROUP BY idasignatura
								HAVING COUNT(idalumno) >2)
AND idtitulacion LIKE (SELECT idtitulacion FROM titulacion 
								WHERE nombre LIKE 'quimicas');
								

#2.Añadir una nueva titulación denominada “Informática” y asignarle dos nuevas
#asignaturas a dicha titulación, de 4 y 5 créditos respectivamente que se cursarán en
#el primer y segundo cuatrimestre del primer curso y las impartirá el profesor Luis
#Ramírez.

INSERT INTO titulacion (idtitulacion,nombre) VALUES ('1700000','informatica');
								
INSERT INTO profesor(idprofesor,dni) VALUES ('p102','16161616A');

INSERT INTO asignatura (idasignatura,nombre,creditos,cuatrimestre,costebasico,idprofesor,idtitulacion,curso) VALUES
('000116','base de datos',4,'1',30,00,'p102','1700000',1),
('000117','programacion',5,'2',30,00,'p102','1700000',1);


#3.Elimina la matrícula del alumno A131313 en Contabilidad.

DELETE FROM alumno_asignatura 
WHERE idalumno LIKE 'A131313';

#4.Modifica la estructura de la tabla PERSONA para añadir un nuevo campo
# denominado Comision de tipo numérico real (6,2). Posteriormente modifica el
# valor de este campo asignándole un 5% del coste total pagado por los alumnos
# matriculados en las asignaturas en las que imparte clase cada profesor. Si esa
# persona no imparte clase, no se le asigna comisión.

ALTER TABLE persona ADD comision FLOAT(6,2);

#no se hacerlo sin buscar yo los datos primero y actualizar las comisiones una a una .
#UPDATE persona SET comision = ((SELECT costebasico FROM asignatura)*(SELECT COUNT(idalumno) FROM alumno_asignatura GROUP BY idasignatura)) /20;

SELECT costebasico,idasignatura FROM asignatura;

SELECT COUNT(idalumno) FROM alumno_asignatura 
GROUP BY idasignatura;

SELECT * FROM profesor;

#multiplico las dos consultas y las divido entro 20 para sacar el 5%
UPDATE persona SET comision = 0.6
WHERE nombre LIKE 'elena';

UPDATE persona SET comision =2.4
WHERE nombre LIKE 'luis';

UPDATE persona SET comision = 1.3
WHERE nombre LIKE 'maria';

UPDATE persona SET comision = 2.6
WHERE nombre LIKE 'pepe';

# 5.Incrementa en una unidad el número de matrícula de todos los alumnos
# matriculados en las asignaturas de primer curso de la titulación Matemáticas,
# porque repiten todos.
UPDATE alumno_asignatura SET nummeromatricula = numeromatricula +1
WHERE idasignatura IN (SELECT idasignatura FROM asignatura 
								WHERE idtitulacion IN (SELECT idtitulacion FROM titulacion
																WHERE nombre LIKE 'matematicas'))
AND idasignatura IN (SELECT idasignatura FROM asignatura 
							WHERE curso LIKE 1);