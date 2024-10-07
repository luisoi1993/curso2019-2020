# Visualizar los departamentos en los que el salario medio 
# es mayor o igual que la media de todos los salarios.

SELECT DEPT_NO, AVG(SALARIO) FROM EMPLE
GROUP BY DEPT_NO
HAVING AVG(SALARIO) >=(SELECT  AVG(SALARIO) FROM EMPLE);

# A partir de la tabla EMPLE, visualizar el número de vendedores del 
# departamento ‘VENTAS’. 
select  count(*)
from  emple
where  dept_no = (select  dept_no  from  depart  where  dnombre='VENTAS')
and oficio='VENDEDOR';

# Partiendo de la tabla EMPLE, visualizar por cada oficio 
# de los empleados del departamento ‘VENTAS’ la suma de salarios.
select oficio,  sum(salario)
from emple
where dept_no=(select dept_no from depart where dnombre='VENTAS')
group by oficio;

# Seleccionar aquellos apellidos de la tabla EMPLE 
# cuyo salario sea igual a la media del salario en 
# su departamento.
select apellido, salario
from emple
where (salario,dept_no) in
(select avg(salario),dept_no from emple
group by dept_no);


# A partir de la tabla EMPLE, visualizar el número de empleados de cada departamento cuyo oficio sea ‘EMPLEADO’.
SELECT dept_no, COUNT(*) "Nºemple"
FROM EMPLE
WHERE OFICIO LIKE 'EMPLEADO'
GROUP BY DEPT_NO;

# Desde la tabla EMPLE, visualizar el departamento que tenga más empleados cuyo oficio sea ‘EMPLEADO’.
# MySQL:
select dept_no, count(*) from emple
where OFICIO LIKE 'EMPLEADO'
GROUP BY DEPT_NO
having count(*) = (SELECT COUNT(*)
			FROM EMPLE
			WHERE OFICIO LIKE 'EMPLEADO'
			GROUP BY DEPT_NO
			ORDER BY COUNT(*) DESC
			LIMIT 1);


# Oracle:
SELECT dept_no, COUNT(*) "Nºemple"
FROM EMPLE
WHERE OFICIO LIKE 'EMPLEADO'
GROUP BY DEPT_NO
HAVING COUNT(*) =
(SELECT MAX(COUNT(*)) FROM EMPLE WHERE OFICIO LIKE 'EMPLEADO' GROUP BY DEPT_NO);

# A partir de las tablas EMPLE y DEPART, 
# visualizar el número de departamento
# y el nombre de departamento que tenga más empleados 
# cuyo oficio sea ‘EMPLEADO’.
# MySQL:
SELECT DEPT_NO,  DNOMBRE  FROM DEPART
WHERE DEPT_NO = (SELECT  DEPT_NO  FROM EMPLE 
WHERE OFICIO=’EMPLEADO’     GROUP BY DEPT_NO 
HAVING COUNT(*) = (SELECT COUNT(*) FROM EMPLE 
WHERE OFICIO=’EMPLEADO’
GROUP BY DEPT_NO
ORDER BY COUNT(*) DESC 
LIMIT 1));

# Oracle:
SELECT DEPT_NO, DNOMBRE  FROM DEPART
WHERE DEPT_NO =
(SELECT  dept_no  FROM EMPLE WHERE OFICIO LIKE 'EMPLEADO'
GROUP BY DEPT_NO
having COUNT(*) =
(SELECT MAX(COUNT(*)) FROM EMPLE WHERE OFICIO LIKE 'EMPLEADO' GROUP BY DEPT_NO));



# Buscar los departamentos que tienen más de dos 
# personas trabajando en la misma profesión. 
SELECT DEPT_NO, COUNT(*) FROM EMPLE 
GROUP BY DEPT_NO, OFICIO  HAVING COUNT(*) > 2;

# A partir de la tabla EMPLE, obtener los nombres de 
# departamentos que tengan más de 4 personas trabajando.

SELECT DEPT_NO, DNOMBRE FROM DEPART 
WHERE DEPT_NO IN (SELECT DEPT_NO FROM EMPLE 
					GROUP BY DEPT_NO 
				HAVING COUNT(*)>4);

# Obtener el número de departamento, 
# el nombre de departamento 
# [y el número de empleados] del departamento 
# con más empleados. (Dificultad Alta).

SELECT DEPT_NO, DNOMBRE FROM DEPART 
WHERE DEPT_NO IN (SELECT DEPT_NO FROM EMPLE 
			GROUP BY DEPT_NO 
			HAVING COUNT(*) = (SELECT COUNT(*) FROM EMPLE
						GROUP BY DEPT_NO
						ORDER BY COUNT(*)
						LIMIT 1));


# PRÁCTICA 9: SUBCONSULTAS CON OPERADOR
 
# Ejecuta el script de creación de 
# tablas TABLAS_PRACTICAS.SQL.
SOURCE TABLAS_PRACTICAS.SQL;

# Dada la tabla LIBRERÍA, visualizar por cada estante
# la suma de los ejemplares.

SELECT estante, sum(ejemplares) FROM librería 
GROUP BY estante;

# Visualizar el estante con más ejemplares de 
# la tabla LIBRERIA.
# MySQL:
SELECT estante, sum(ejemplares) FROM librería
GROUP BY estante
having sum(ejemplares) = (select sum(ejemplares)
					from libreria
                    group by estante
					ORDER BY SUM(ejemplares) DESC
					LIMIT 1);

# Oracle:
SELECT estante, sum(ejemplares) FROM librería
GROUP BY estante
HAVING sum(ejemplares) = (SELECT max(sum(ejemplares)) FROM librería
GROUP BY estante);

# Visualizar los nombres de los alumnos de la tabla 
# ALUM que aparezcan en alguna de estas tablas: 
# NUEVOS y ANTIGUOS.

SELECT nombre FROM alum
WHERE nombre IN (SELECT nombre FROM nuevos)
or nombre IN (SELECT nombre FROM antiguos);

# Visualizar los nombres de los alumnos de la tabla 
# ALUM que aparezcan en estas dos tablas: 
# NUEVOS y ANTIGUOS.
SELECT nombre FROM alum
WHERE nombre IN (SELECT nombre FROM nuevos)
AND nombre IN (SELECT nombre FROM antiguos);

# A partir de las tablas PERSONAL, PROFESORES y 
# CENTROS, obtener la especialidad con menos profesores.
# MySQL:
select count(*), especialidad from profesores
group by especialidad
having count(*)= (SELECT count(*)  FROM profesores 
					GROUP BY especialidad
					ORDER BY count(*) ASC
					LIMIT 1);
# Oracle:
SELECT especialidad FROM profesores 
GROUP BY especialidad
HAVING count(*) = (SELECT min(count(*)) FROM profesores GROUP BY especialidad);


# Obtener por cada función el  
# número de trabajadores.
SELECT  funcion,  count(*)  FROM personal 
GROUP BY funcion;

# Visualizar los diferentes estantes de la 
# tabla LIBRERÍA ordenados descendentemente 
# por estante.

SELECT distinct estante FROM librería 
ORDER BY estante DESC;

# Averiguar cuántos temas tiene cada estante.
SELECT estante, count(*)  AS Nºtemas 
FROM libreria GROUP BY estante;

# Visualizar los estantes que tengan tres 
# temas.
SELECT estante,  count(*) AS NºTemas FROM librería 
GROUP BY estante
HAVING count(*)=3;