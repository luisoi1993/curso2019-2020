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
 
#33. Crear una vista que contenga el nombre del conductor, la descripción del proyecto y la media
#aritmética del tiempo trabajado.
CREATE VIEW ap33 (conductor, proyecto, tiempoMedio)
AS SELECT nombre, descrip, avg(tiempo)
FROM conductores, trabajos, proyectos
WHERE conductores.codC = trabajos.codC AND
trabajos.codP = proyectos.codP
GROUP BY nombre, descrip;