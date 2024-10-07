#Borrar de la tabla ALUM los ANTIGUOS alumnos.

DELETE FROM ALUM
WHERE NOMBRE IN
 (SELECT NOMBRE FROM ANTIGUOS);
 
#Borrar todos los departamentos de la tabla DEPART para los 
cuales no existan empleados en EMPLE.

DELETE FROM DEPART
WHERE DEPT_NO NOT IN
(SELECT distinct DEPT_NO FROM EMPLE); 


#Eliminar los centros que no tengan personal.

DELETE FROM centros
WHERE cod_centro NOT IN(SELECT DISTINCT cod_centro
								FROM personal);