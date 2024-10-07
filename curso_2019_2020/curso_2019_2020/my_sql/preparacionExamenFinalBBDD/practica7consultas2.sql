#1.Consulta las filas de la tabla LIBRERÍA cuyo tema sea ‘LABORES’.
SELECT * FROM libreria
WHERE  tema LIKE 'labores';

#2. Consulta los apellidos de la tabla EMPLE cuyo número de
# departamento sea 10 o 30.
SELECT apellido FROM emple 
WHERE dept_no IN (10,30);

#3.Consulta los apellidos de la tabla EMPLE cuyo número de departamento no sea
#ni 10 ni 30.
SELECT apellido FROM emple 
WHERE dept_no NOT IN (10,30);

#4.Consulta los apellidos de la tabla EMPLE cuyo oficio sea ‘VENDEDOR’,
#‘ANALISTA’ o ‘EMPLEADO’.
SELECT apellido FROM emple
WHERE oficio IN ('vendedor','analista','empleado');

#5.Consulta los apellidos de la tabla EMPLE cuyo oficio no sea ni ‘VENDEDOR’ ni
#‘ANALISTA’ ni ‘EMPLEADO’.
SELECT apellido FROM emple
WHERE oficio NOT IN('vendedor','analista','empleado');

#6. A partir de la tabla EMPLE, obtén el apellido y el salario de los empleados cuyo
#salario esté comprendido entre 1500 y 2000.
SELECT apellido,salario FROM emple
WHERE salario BETWEEN 1500 AND 2000;

#7.A partir de la tabla EMPLE, obtener el apellido y el salario de los empleados
#cuyo SALARIO no esté comprendido entre 1500 y 2000.
SELECT apellido,salario FROM emple
WHERE salario NOT BETWEEN 1500 AND 2000;

#8.A partir de la tabla EMPLE, obtén el APELLIDO, SALARIO y DEPT_NO de los
#empleados cuyo salario sea mayor de 2000 en los departamentos 10 o 20.
SELECT apellido,salario,dept_no FROM emple
WHERE salario > 2000 AND dept_no IN (10,20);

#9.Consulta el DNI, NOMBRE, APELLIDOS, CURSO, NIVEL y CLASE de todos los
#alumnos ordenado por APELLIDOS y NOMBRE ascendentemente.
SELECT dni,nombre,apellidos,curso,nivel,clase
FROM alum0405
ORDER BY apellidos,nombre ASC;

#10.Obtén el salario medio de los empleados del departamento 10 de la tabla
#EMPLE.
SELECT AVG(salario) FROM emple
WHERE dept_no LIKE 10;

#11.Obtén el número de filas de la tabla EMPLE.
SELECT COUNT(*) FROM emple;

#12.Calcula el número de empleados de la tabla EMPLE donde la COMISIÓN no es
#nula
SELECT COUNT(comision) FROM emple;

#13.Obtén el máximo salario de la tabla EMPLE
SELECT MAX(salario) FROM emple;

#14.Obtén el apellido máximo (alfabéticamente) de la tabla EMPLE
SELECT MAX(apellido) FROM emple;

#15.Obtén el mínimo salario de la tabla EMPLE.
SELECT MIN(salario) FROM emple;

#16.Obtén la suma de todos los salarios de la tabla EMPLE
SELECT SUM(salario) FROM emple;

#17.Obtén la media de todos los salarios de la tabla EMPLE.
SELECT AVG(salario) FROM emple;

#18.Calcula el número de oficios que hay en la tabla EMPLE (sin repeticiones)
SELECT COUNT(DISTINCT oficio) FROM emple;

#19.Visualizar a partir de la tabla EMPLE el número de empleados que hay en cada
#departamento.
SELECT COUNT(emp_no),dept_no FROM emple
GROUP BY dept_no;
#20.Visualiza el código de departamento de los departamentos
#con más de 4 empleados
SELECT dept_no,COUNT(emp_no) FROM emple
GROUP BY dept_no
HAVING COUNT(emp_no) >4;

#21.Obtén la suma de salarios, el salario máximo y el salario mínimo
#por cada departamento de la tabla EMPLE.
SELECT SUM(salario),MAX(salario),MIN(salario),dept_no FROM emple
GROUP BY dept_no;

#22.Calcula el número de empleados que realizan
#cada OFICIO en cada DEPARTAMENTO. 
SELECT COUNT(emp_no),dept_no,oficio FROM emple
GROUP BY dept_no,oficio;

#23.Busca el número máximo de empleados que hay en algún departamento
SELECT MAX(TOTAL) FROM (SELECT COUNT(*) AS TOTAL, DEPT_NO FROM
EMPLE GROUP BY DEPT_NO) AS TOTAL_EMPLE;

SELECT DEPT_NO,COUNT(*) FROM EMPLE GROUP BY DEPT_NO ORDER BY
COUNT(*) DESC LIMIT 1;

SELECT * FROM depart;
SELECT * FROM alum0405;
SELECT * FROM alum;
SELECT * FROM alumnos;
SELECT * FROM libreria;
SELECT * FROM emple;