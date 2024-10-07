SELECT nombre_alumno,(nota1+nota2+nota3)/3 
AS notamedia FROM notas_alumnos
WHERE nota1 LIKE 7 AND (nota1+nota2+nota3)/3 > 6;

#23.Busca el número máximo de empleados 
#que hay en algún departamento
SELECT MAX(TOTAL) FROM (SELECT COUNT(*),DEPT_NO FROM
EMPLE GROUP BY DEPT_NO) AS TOTAL_EMPLE;

#1.Visualizar los departamentos en los que el salario medio 
# es mayor o igual que la media de todos los salarios.
SELECT dept_no,AVG(salario) FROM emple
GROUP BY dept_no 
HAVING AVG(salario) >=(SELECT AVG(salario) FROM emple);

#4.Seleccionar aquellos apellidos de la tabla EMPLE 
# cuyo salario sea igual a la media del salario en 
# su departamento.
SELECT apellido,salario FROM emple
WHERE (salario,dept_no) IN (SELECT AVG(salario),dept_no FROM emple
						  GROUP BY dept_no);
						  
# fecha de entrega ha sido al menos dos dias
# antes de la fecha requerida ADDATE
SELECT codigopedido,codigocliente,fechaesperada,fechaentrega
FROM pedidos 
WHERE fechaesperada>=ADDDATE(FechaEntrega,2);

#la base imposible, eL IVA y el total facturado
SELECT SUM(cantidad*preciounidad)AS baseimponible,
SUM(cantidad*preciounidad)*0.18 AS IVA,
SUM(cantidad*preciounidad)*1.18 AS total
FROM detallepedidos;

#de libras a kilos
select avg(Peso) as MediaLibras,avg(Peso*0.4535) as MediaKilos 
from jugadores where Nombre_equipo='Raptors';

#CONCAT une dos filas
select concat(nombre,'(',Nombre_equipo,')') from jugadores;

#CONCAT Y LENGTH
select length(concat(Ciudad,' ',Nombre)),concat(Ciudad,' ',Nombre) from equipos 
where length(concat(Ciudad,' ',Nombre))=(
   select max(length(concat(Ciudad,' ',Nombre))) from equipos);