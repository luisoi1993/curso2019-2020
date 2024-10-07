#1.Visualizar los departamentos en los que el salario medio 
# es mayor o igual que la media de todos los salarios.
SELECT dept_no,AVG(salario) FROM emple
GROUP BY dept_no 
HAVING AVG(salario) >=(SELECT AVG(salario) FROM emple);

#2.A partir de la tabla EMPLE, visualizar el número de vendedores del 
#departamento ‘VENTAS’.
SELECT COUNT(emp_no) FROM emple
WHERE oficio LIKE 'vendedor' AND dept_no LIKE(SELECT dept_no FROM depart
															WHERE dnombre LIKE 'ventas');
															
#3.Partiendo de la tabla EMPLE, visualizar por cada oficio 
# de los empleados del departamento ‘VENTAS’ la suma de salarios
SELECT SUM(salario) ,oficio FROM emple
WHERE dept_no LIKE(SELECT dept_no FROM depart
						 WHERE dnombre LIKE 'ventas')
GROUP BY oficio;

#4.Seleccionar aquellos apellidos de la tabla EMPLE 
# cuyo salario sea igual a la media del salario en 
# su departamento.
SELECT apellido,salario FROM emple
WHERE (salario,dept_no) IN (SELECT AVG(salario),dept_no FROM emple
						  GROUP BY dept_no);
						  
#5. A partir de la tabla EMPLE, visualizar el número de empleados de
# cada departamento cuyo oficio sea ‘EMPLEADO’.
SELECT COUNT(emp_no),dept_no FROM emple
WHERE oficio LIKE 'empleado'
GROUP BY dept_no;

#6.Desde la tabla EMPLE, visualizar el departamento que tenga más empleados cuyo oficio sea ‘EMPLEADO’.
SELECT COUNT(emp_no),dept_no FROM emple
WHERE oficio LIKE 'empleado'
GROUP BY dept_no 
HAVING COUNT(emp_no) LIKE (SELECT COUNT(emp_no) FROM emple
									WHERE oficio LIKE 'empleado'
									GROUP BY dept_no
									ORDER BY COUNT(emp_no) DESC LIMIT 1);
						
#7.A partir de las tablas EMPLE y DEPART, 
# visualizar el número de departamento
# y el nombre de departamento que tenga más empleados 
# cuyo oficio sea ‘EMPLEADO’. 
SELECT dept_no,dnombre FROM depart
WHERE dept_no LIKE (SELECT dept_no  FROM emple
						  WHERE oficio LIKE 'empleado'
						  GROUP BY dept_no
						  HAVING COUNT(emp_no) LIKE(SELECT COUNT(emp_no) FROM emple
						  									 WHERE oficio LIKE 'empleado'
						  									 GROUP BY dept_no
						  									 ORDER BY COUNT(emp_no) DESC LIMIT 1));
						  									 
#8.Buscar los departamentos que tienen más de dos 
# personas trabajando en la misma profesión. 
SELECT dept_no,oficio,COUNT(emp_no) FROM emple
GROUP BY dept_no,oficio
HAVING COUNT(emp_no) > 2;

#9.A partir de la tabla EMPLE, obtener los nombres de 
# departamentos que tengan más de 4 personas trabajando.
SELECT dnombre FROM depart
WHERE dept_no IN (SELECT dept_no FROM emple
						GROUP BY dept_no
						HAVING COUNT(*)>4);

#10.Obtener el número de departamento, 
# el nombre de departamento 
# [y el número de empleados] del departamento 
SELECT depart.dnombre,depart.DEPT_NO,COUNT(emp_no) FROM emple
INNER JOIN depart ON emple.dept_no=depart.dept_no
GROUP BY emple.dept_no
ORDER BY COUNT(emp_no) DESC LIMIT 1;


#11.Dada la tabla LIBRERÍA, visualizar por cada estante
# la suma de los ejemplares.
SELECT SUM(ejemplares),estante FROM libreria 
GROUP BY estante;

#12.Visualizar el estante con más ejemplares de 
# la tabla LIBRERIA.
SELECT SUM(ejemplares),estante FROM libreria
GROUP BY estante
ORDER BY SUM(ejemplares) DESC LIMIT 1; 

SELECT estante, sum(ejemplares) FROM libreria
GROUP BY estante
having sum(ejemplares) = (select sum(ejemplares)
					from libreria
                    group by estante
					ORDER BY SUM(ejemplares) DESC
					LIMIT 1);
					
#13.Visualizar los nombres de los alumnos de la tabla 
# ALUM que aparezcan en alguna de estas tablas: 
# NUEVOS y ANTIGUOS.
SELECT nombre FROM alum
WHERE nombre IN (SELECT nombre FROM nuevos)
OR nombre IN(SELECT nombre FROM antiguos);

#14.Visualizar los nombres de los alumnos de la tabla 
# ALUM que aparezcan en estas dos tablas: 
# NUEVOS y ANTIGUOS
SELECT nombre FROM alum
WHERE nombre IN (SELECT nombre FROM nuevos)
AND nombre IN(SELECT nombre FROM antiguos);

#15.A partir de las tablas PERSONAL, PROFESORES y 
# CENTROS, obtener la especialidad con menos profesores.
SELECT COUNT(dni),especialidad FROM profesores
GROUP BY especialidad
ORDER BY COUNT(dni) LIMIT 1;

#16.Obtener por cada función el  
# número de trabajadores.
SELECT COUNT(dni),funcion FROM personal
GROUP BY funcion;

#17.Visualizar los diferentes estantes de la 
# tabla LIBRERÍA ordenados descendentemente.
# por estante.
SELECT DISTINCT estante FROM libreria
ORDER BY estante DESC;

#18.Averiguar cuántos temas tiene cada estante.
SELECT COUNT(tema),estante FROM libreria
GROUP BY estante;

#19. Visualizar los estantes que tengan tres 
# temas.
SELECT COUNT(tema),estante FROM libreria
GROUP BY estante
HAVING COUNT(tema) =3;
SELECT * FROM centros;
SELECT * FROM profesores;
SELECT * FROM personal;
SELECT * FROM antiguos;
SELECT * FROM nuevos;
SELECT * FROM alum;
SELECT * FROM libreria;
SELECT * FROM depart;
SELECT * FROM emple;