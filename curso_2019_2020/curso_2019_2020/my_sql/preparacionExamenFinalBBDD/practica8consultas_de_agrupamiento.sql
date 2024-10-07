#1.A partir de la tabla EMPLE, visualiza cuántos empleados tienen
# apellido empezando por ‘A’.
SELECT COUNT(apellido) FROM emple
WHERE apellido LIKE 'a';

#2.Dada la tabla EMPLE, obtén el sueldo medio, el número de comisiones no nulas, 
# el máximo sueldo y el mínimo sueldo de los empleados del departamento 30.
SELECT AVG(salario),COUNT(comision),MAX(salario),MIN(salario) FROM emple
WHERE dept_no LIKE 30;

#3.Visualiza el número de empleados de cada departamento cuyo oficio sea ‘EMPLEADO.
SELECT COUNT(emp_no) FROM emple
WHERE oficio LIKE 'empleado'
GROUP BY dept_no;

#4.Busca los departamentos que tienen más de dos personas trabajando en la misma profesión.
SELECT dept_no ,oficio,COUNT(emp_no) FROM emple
GROUP BY dept_no,oficio 
HAVING COUNT(emp_no)>2;

#5.Obtener el número total de departamentos.
SELECT COUNT(dept_no) FROM  depart;

#6.Obtener el número total de departamentos que tienen empleados.
SELECT COUNT(DISTINCT dept_no) FROM emple;

#7.Obtener el número total de empleados del departamento 10 que son ANALISTAS.
SELECT COUNT(emp_no) FROM emple
WHERE dept_no LIKE 10 AND oficio LIKE 'analista';

#8.Obtener, para cada oficio de la tabla EMPLE, el sueldo máximo y el sueldo mínimo, excluyendo los sueldos de los ANALISTAS.
SELECT MAX(salario),MIN(salario),oficio FROM emple
WHERE oficio NOT LIKE 'analista'
GROUP BY oficio;

#9.Obtener los códigos de las asignaturas que tienen matriculados más de un alumno.
SELECT COD,COUNT(dni) FROM notas
GROUP BY cod
HAVING COUNT(dni) > 1;

#10.Obtener el DNI de los alumnos aprobados en cualquier asignatura.
SELECT DISTINCT DNI FROM notas
WHERE nota >= 5;

#11.Obtener el número de alumnos aprobados en cada asignatura.
SELECT COUNT(dni),cod FROM notas
WHERE nota >=5
GROUP BY cod; 

#12 Obtener el DNI de los alumnos cuya nota esté comprendida entre 5 y 7.
SELECT DISTINCT dni FROM notas
WHERE nota BETWEEN 5 AND 7;

#13.Obtener la nota media de en cada asignatura.
SELECT AVG(nota),cod FROM notas
GROUP BY cod;

#14.Obtener los códigos de las asignaturas en las que sólo hay matriculados un alumno.
SELECT cod,COUNT(dni) FROM notas
GROUP BY cod
HAVING COUNT(dni)=1;
SELECT * FROM notas;
SELECT * FROM emple;