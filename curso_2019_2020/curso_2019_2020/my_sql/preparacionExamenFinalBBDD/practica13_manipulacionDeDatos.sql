#1.Dadas las tablas ALUM y NUEVOS, insertar en la tabla ALUM los
# nuevos alumnos.
INSERT INTO alum 
SELECT * FROM nuevos
WHERE nombre NOT IN (SELECT nombre FROM alum);

#2.Borrar de la tabla ALUM los ANTIGUOS alumnos.
DELETE FROM ALUM
WHERE NOMBRE IN
 (SELECT NOMBRE FROM ANTIGUOS);
 
#3.Insertar un empleado de apellido ‘SAAVEDRA’ con número 2000.
#La fecha de alta será la actual, el SALARIO será el mismo salario del
#empleado ’SALA’ más el 20 por ciento y el resto de datos serán los mismos que
#los datos de ‘SALA’
INSERT INTO EMPLE
SELECT 2000, 'SAAVEDRA', OFICIO, DIR, current_date(), SALARIO*1.2,
COMISION,DEPT_NO
FROM EMPLE WHERE APELLIDO='SALA';


#4.Modificar el número de departamento de ‘SAAVEDRA’.
#El nuevo departamento será el departamento donde hay más
#empleados cuyo oficio sea ‘EMPLEADO’.
CREATE TABLE EMPLE2 SELECT * FROM EMPLE;

UPDATE EMPLE
 SET DEPT_NO=
 (SELECT DEPT_NO FROM EMPLE2 WHERE OFICIO='EMPLEADO'
	GROUP BY DEPT_NO
 	HAVING COUNT(*) = (SELECT COUNT(*) FROM EMPLE2
 	WHERE OFICIO='EMPLEADO'
	GROUP BY DEPT_NO
	ORDER BY COUNT(*) DESC
	LIMIT 1))
 WHERE APELLIDO ='SAAVEDRA'; 
 
#5.Borrar todos los departamentos de la tabla DEPART para los cuales no existan empleados
#en EMPLE.
DELETE FROM DEPART
WHERE DEPT_NO NOT IN
(SELECT distinct DEPT_NO FROM EMPLE); 


#6.Modificar el número de plazas con un valor igual a la mitad en aquellos centros con
#menos de dos profesores.
UPDATE CENTROS
 SET NUM_PLAZAS=NUM_PLAZAS/2
 WHERE COD_CENTRO IN
 (SELECT COD_CENTRO FROM PROFESORES GROUP BY COD_CENTRO
 HAVING COUNT(*) <2);

#7.Eliminar los centros que no tengan personal.
DELETE FROM centros
WHERE cod_centro NOT IN(SELECT DISTINCT cod_centro
								FROM personal);
								
#8. Añadir un nuevo profesor con DNI 8790055 y de nombre ‘Clara Salas’ en el centro o en los
#centros cuyo número de administrativos sea 1 en la especialidad de ‘IDIOMA’. 
INSERT INTO PROFESORES
 Select cod_centro, 8790055,'Salas, Clara', 'IDIOMA'
 FROM PERSONAL
 WHERE FUNCION='ADMINISTRATIVO'
 GROUP BY COD_CENTRO
 HAVING COUNT(*) =1);
 
#9. Borrar al personal que esté en centros de menos de 300 plazas y con menos de dos
#profesores
DELETE FROM PERSONAL
WHERE COD_CENTRO IN
 (SELECT COD_CENTRO FROM CENTROS WHERE NUM_PLAZAS<300)
 AND COD_CENTRO IN
(SELECT COD_CENTRO FROM PROFESORES GROUP BY COD_CENTRO
HAVING COUNT(*) <2);

#10.Borrar a los profesores que estén en la tabla PROFESORES y que no estén en la tabla
#PERSONAL
DELETE FROM profesores
WHERE apellidos NOT IN (SELECT apellidos FROM personal);

#11. A partir de las tablas EMPLE y DEPART creamos una vista que contenga las columnas:
#EMP_NO, APELLIDO, DEPT_NO y DNOMBRE
CREATE VIEW EMP_DEPT (EMP_NO, APELLIDO, DEPT_NO, DNOMBRE)
AS
 SELECT EMP_NO, APELLIDO, EMPLE.DEPT_NO, DNOMBRE
 FROM EMPLE INNER JOIN DEPART ON EMPLE.DEPT_NO=DEPART.DEPT_NO;
 
#12.Crear una vista llamada CONSERJES que contenga el nombre del centro y el nombre de
#sus conserjes.
CREATE VIEW CONSERJES
AS
 SELECT NOMBRE, APELLIDOS
 FROM CENTROS INNER JOIN PERSONAL ON
 CENTROS.COD_CENTRO=PERSONAL.COD_CENTRO
 WHERE FUNCION = ‘CONSERJE’;
SELECT * FROM personal;
SELECT * FROM profesores;
SELECT * FROM centros;
SELECT * FROM emple;