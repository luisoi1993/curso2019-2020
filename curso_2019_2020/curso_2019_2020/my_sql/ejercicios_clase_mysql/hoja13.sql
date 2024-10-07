#Practica 13

#1Dadas las tablas Alum y NUEVOS, insertar en la tabla ALUM los
#nuevos alumnos
INSERT INTO alum
	SELECT * FROM nuevos
	WHERE nombre NOT IN(SELECT nombre
								FROM alumn);
								

#2Insertar un empleado de apellido 'Saavedra' con numero 2000.
#la fecha de alta será la actual,  el salario será el mismo 
#salario del empleado 'SALA' mas el 20 por ciento y el resto 
#de datos serán los mismod que los datos de 'SALA'
INSERT INTO emple
	SELECT 2000,'SAAVEDRA',OFICIO,DIR,current_date(),SALARIO*1.2,
	COMISION,DEPT_NO
	FROM emple WHERE apellido='SALA';
	
#3Añadir un nuevo profesor con DNI 8790055 y de nombre 'Clara Salas'
#en el centro o en loa centros cuyo número de administrativos sesa 1
#en la especialidad de 'IDIOMA'
CREATE TABLE emple2 
SELECT * FROM emple;

INSERT INTO profesores
	SELECT cod_centro,8790055,'salas, clara', 'IDIOMA'
	FROM personal
	WHERE funcion ='administrativo'
	GROUP BY cod_centro
	HAVING COUNT (*)=1;
	
#4
UPDATE  emple 
SET dept_no = (SELECT dept_NO 
					FROM emple 
					WHERE oficio LIKE 'empleado'
					GROUP BY dept_no
					HAVING COUNT(*)
					ORDER BY COUNT(*) DESC
					LIMIT 1)
WHERE apellido LIKE 'SAAVEDRA';

#5
DELETE FROM depart 
WHERE dept_no NOT IN(SELECT dept_no 
							FROM emple);
							
#6 Modificar el numero de plazas con un valor igual a la
#mitad en aquellos centros con menos de dos profesores
UPDATE centros
SET num_plazas =
WHERE cod_centro IN (SELECT cod_centros
							FROM profesores 
							GROUP BY cod_centro
							HAVING COUNT(*)<2);
							
#7 Eliminar los centros que no tengan personal
DELETE FROM centros
	WHERE cod_centro NOT IN (SELECT cod_centro
									FROM personal);
									
#borrar al personal que esté en centros de menos de 300 plazas
#y con menos de dos profesores
DELETE FROM personal
WHERE cod_centro IN (SELECT cod_centro
							FROM centros 
							WHERE num_plazas < 300 AND COD_CENTRO IN (SELECT cod_centro 
																					FROM profesores
																					GROUP BY cod_centro
																					HAVING COUNT(*)<2));

#Borrar a los profesores que estén el la tabla profesores y que 
#no esten en la tabla personal
DELETE FROM profesores
	WHERE dni NOT IN (SELECT dni
										FROM personal);
									


#A partir de las tablas EMPLE y DEPART creamos una vista que contenga las columnas:
#EMP_NO,APELLIDO,DEPT_NO, Y DNOMBRE
		
SELECT * FROM personal;
SELECT * FROM centros;
SELECT * FROM profesores;
