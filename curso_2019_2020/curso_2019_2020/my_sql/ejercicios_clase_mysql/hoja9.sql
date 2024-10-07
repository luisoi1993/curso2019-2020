# Visualizar los departamentos en los que el salario medio 
# es mayor o igual que la media de todos los salarios.
SELECT dept_no,AVG(salario)
FROM emple 
GROUP BY dept_no
HAVING  AVG(salario)>=(SELECT AVG(salario)
								FROM emple);
								
# A partir de la tabla EMPLE, visualizar el número de vendedores del 
# departamento ‘VENTAS’.
SELECT COUNT(*)
FROM emple
WHERE dept_no = (SELECT dept_no
						FROM depart
						WHERE dnombre LIKE 'ventas')
AND oficio LIKE 'vendedor';

# Partiendo de la tabla EMPLE, visualizar por cada oficio 
# de los empleados del departamento ‘VENTAS’ la suma de salarios.
SELECT oficio, SUM(salario)
FROM emple 
WHERE dept_no LIKE (SELECT dept_no
					FROM depart
					WHERE dnombre LIKE 'ventas')
GROUP BY oficio;

# Seleccionar aquellos apellidos de la tabla EMPLE 
# cuyo salario sea igual a la media del salario en 
# su departamento.
SELECT apellido,salario
FROM emple
WHERE (salario,dept_no) IN (SELECT AVG(salario),dept_no
							FROM emple
							GROUP BY dept_no);


# A partir de la tabla EMPLE, visualizar el número de empleados de cada 
#departamento cuyo oficio sea ‘EMPLEADO’.
SELECT COUNT(*),dept_no
FROM emple 
WHERE oficio LIKE 'vendedor'
GROUP BY dept_no;

# Desde la tabla EMPLE, visualizar el departamento que tenga más 
#empleados cuyo oficio sea ‘EMPLEADO’.
SELECT dept_no,COUNT(*)
FROM emple
WHERE oficio LIKE 'empleado'
GROUP BY dept_no
HAVING COUNT(*) =(SELECT COUNT(*)
						FROM emple
						WHERE oficio LIKE 'empleado'
						GROUP BY dept_no
						ORDER BY COUNT(*) DESC LIMIT 1);
						
# A partir de las tablas EMPLE y DEPART,  visualizar el número de departamento
# y el nombre de departamento que tenga más empleados cuyo oficio sea ‘EMPLEADO’.
SELECT DEPT_NO,  DNOMBRE 
FROM DEPART
WHERE DEPT_NO = (SELECT  DEPT_NO 
						FROM EMPLE 
						WHERE OFICIO='EMPLEADO'
						GROUP BY DEPT_NO 
						HAVING COUNT(*) = (SELECT COUNT(*) 
						FROM EMPLE 
						WHERE OFICIO='EMPLEADO'
						GROUP BY DEPT_NO
						ORDER BY COUNT(*) DESC LIMIT 1));


# Buscar los departamentos que tienen más de dos 
# personas trabajando en la misma profesión.
SELECT dept_no,COUNT(*)
FROM emple
GROUP BY dept_no,oficio
HAVING COUNT(*) >2;

# A partir de la tabla EMPLE, obtener los nombres de 
# departamentos que tengan más de 4 personas trabajando.
SELECT dept_no,dnombre 
FROM depart
WHERE dept_no IN(SELECT dept_no
					 FROM emple
					 GROUP BY dept_no
					 HAVING COUNT(*)>4) ;
					 
# Obtener el número de departamento, 
# el nombre de departamento 
# [y el número de empleados] del departamento 
# con más empleados. (Dificultad Alta)
SELECT DEPT_NO, DNOMBRE
FROM DEPART 
WHERE DEPT_NO IN (SELECT DEPT_NO FROM EMPLE 
						GROUP BY DEPT_NO 
						HAVING COUNT(*) = (SELECT COUNT(*) FROM EMPLE
												GROUP BY DEPT_NO
												ORDER BY COUNT(*) LIMIT 1));

# Dada la tabla LIBRERÍA, visualizar por cada estante
# la suma de los ejemplares.
SELECT estante,SUM(ejemplares)
FROM libreria
GROUP BY estante;

# Visualizar el estante con más ejemplares de 
# la tabla LIBRERIA.
SELECT estante,SUM(ejemplares)
FROM libreria 
GROUP BY estante
ORDER BY estante,SUM(ejemplares) DESC LIMIT 1;

SELECT estante, sum(ejemplares) 
FROM libreria
GROUP BY estante
having sum(ejemplares) = (select sum(ejemplares)
					from libreria
                    group by estante
					ORDER BY SUM(ejemplares) DESC
					LIMIT 1);

# Visualizar los nombres de los alumnos de la tabla 
# ALUM que aparezcan en alguna de estas tablas: 
# NUEVOS y ANTIGUOS.
SELECT nombre
FROM alum
WHERE nombre IN(SELECT nombre
					FROM nuevos)
OR nombre IN(SELECT nombre 
				FROM antiguos);

# Visualizar los nombres de los alumnos de la tabla 
# ALUM que aparezcan en estas dos tablas: 
# NUEVOS y ANTIGUOS.				

SELECT nombre
FROM alum
WHERE nombre IN(SELECT nombre
					FROM nuevos)
AND nombre IN(SELECT nombre 
				FROM antiguos);


# A partir de las tablas PERSONAL, PROFESORES y 
# CENTROS, obtener la especialidad con menos profesores.
SELECT COUNT(especialidad),especialidad
FROM profesores
GROUP BY especialidad
ORDER BY especialidad ASC LIMIT 1;

select count(*), especialidad
from profesores
group by especialidad
having count(*)= (SELECT COUNT(*) 
					FROM profesores 
					GROUP BY especialidad
					ORDER BY count(*) ASC LIMIT 1);

# Obtener por cada función el  
# número de trabajadores.
SELECT funcion,COUNT(funcion)
FROM personal
GROUP BY funcion;

# Visualizar los diferentes estantes de la 
# tabla LIBRERÍA ordenados descendentemente 
# por estante.
SELECT estante 
FROM libreria
GROUP BY estante
ORDER BY estante DESC;

SELECT distinct estante
FROM librería 
ORDER BY estante DESC;

# Averiguar cuántos temas tiene cada estante.
SELECT estante,COUNT(tema)
FROM libreria
GROUP BY estante;

# Visualizar los estantes que tengan tres 
# temas
SELECT estante,COUNT(tema)
FROM libreria
GROUP BY estante
HAVING COUNT(tema) = 3;

						 					
