 #A partr de la tabla EMPLE, visualiza cuántos empleados 
 #tienen apellido empezaando por ‘A’.
 SELECT *
 FROM emple 
 WHERE apellido like 'a%';
 
 #Dada la tabla EMPLE, obtén el sueldo medio,
#el número de comisiones no nulas, el máximo sueldo y
#el mínimo sueldo de los empleados del departamento 30. 
SELECT AVG(salario) AS salario_medio,
COUNT(comision) AS comisiones_no_nulas,
MAX(salario) AS salario_maximo,
MIN(salario) AS salario_minimmo
FROM emple
WHERE dept_no like 30;

 #Visualiza el número de empleados de cada departamento cuyo ofcio sea ‘EMPLEADO’. 
SELECT COUNT(*) AS numero_empleados
FROM emple
WHERE oficio like 'empleado'
group by DEPT_NO;

 #Busca los departamentos que tienen más de dos personas
 #trabajando en la misma profesión.
SELECT DEPT_NO, OFICIO, COUNT(*)
FROM EMPLE
GROUP BY DEPT_NO, OFICIO
HAVING COUNT(*) >=2;

#Obtener el número total de departamentos. 
SELECT COUNT(dept_no) AS total_departamentos
FROM depart;

#Obtener el número total de departamentos que tienen empleados.
 SELECT COUNT(DISTINCT dept_no)
 FROM emple;
 
 #Obtener el número total de empleados del departamento 10 que son ANALISTAS. 
 SELECT COUNT(*) 
 FROM emple
 WHERE dept_no like 10 AND oficio like 'analista';
 
  #Obtener, para cada ofcio de la tabla EMPLE, el sueldo máximo y el sueldo mínimo,
  #excluyendo los sueldos de los ANALISTAS.
  SELECT oficio, MAX(salario),MIN(salario)
  FROM emple
  WHERE oficio NOT LIKE 'analista'
  GROUP BY oficio;

# Obtener los códigos de las asignaturas que tenen matriculados más de un alumno.
SELECT cod,COUNT(cod)
FROM notas
GROUP BY cod
HAVING COUNT(dni) >= 2; 

#Obtener el DNI de los alumnos aprobados en cualquier asignatura.
SELECT distinct dni 
FROM notas
where nota >=5;

#Obtener el número de alumnos aprobados en cada asignatura.
SELECT cod,COUNT(dni)
FROM notas
WHERE nota >=5
GROUP BY cod;

#Obtener el DNI de los alumnos cuya nota esté comprendida
# entre 5 y 7. 
SELECT dni
FROM notas
WHERE nota BETWEEN 5 AND 7;

 #Obtener la nota media de en cada asignatura.
 SELECT cod,AVG(nota)
 FROM notas
 GROUP BY cod;
 
 #Obtener los códigos de las asignaturas en las 
 #que sólo hay matriculados un alumno.
SELECT cod 
FROM notas
GROUP BY cod
HAVING COUNT(cod) = 1;

# obtener el dni de los alumnos aprobados en cualquier asignatura.
select distinct dni
from notas
where nota >=5;

# Obtener el número de alumnos aprobados en cada asignatura.
SELECT COUNT(*),cod
FROM notas
WHERE nota >=5
GROUP BY cod;


# Obtener el DNI de los alumnos cuya nota esté comprendida entre 5 y 7.
SELECT dni
FROM notas 
WHERE nota >=5 AND nota <=7;

SELECT DNI
 FROM NOTAS 
WHERE NOTA BETWEEN 5 AND 7;


# Obtener la nota media de en cada asignatura.
SELECT AVG(nota),cod
FROM notas
GROUP BY cod;

# Obtener los códigos de las asignaturas en las que sólo hay matriculados un alumno.

SELECT COD, COUNT(DNI)
FROM NOTAS
GROUP BY COD
HAVING COUNT(DNI) = 1;

SELECT * FROM notas;