SELECT * 
FROM libreria
WHERE tema like 'labores';

SELECT apellido,dept_no
FROM emple
WHERE dept_no like 10 or dept_no like 30;

SELECT apellido,dept_no
FROM emple
WHERE dept_no NOT IN (10,30);

SELECT apellido
FROM emple
WHERE oficio IN ('empleado','vendedor','analista');

SELECT apellido
FROM emple
WHERE oficio NOT IN ('empleado','vendedor','analista');

SELECT apellido,salario
FROM emple
WHERE salario  BETWEEN 1500 AND 2000;

SELECT apellido,salario
FROM emple
WHERE salario NOT BETWEEN 1500 AND 2000;

SELECT apellido,salario,dept_no
FROM emple
WHERE SALARIO > 2000 AND dept_no IN(10,20);

SELECT dni,nompre,apellido,curso,nivel,clase
FROM ALUM0405
ORDER BY nombre,apellidos;

SELECT AVG(salario)
FROM emple
WHERE dept_no like 10;

SELECT COUNT(*)
FROM EMPLE;

SELECT COUNT(comision)
FROM emple;


SELECT MAX(salario)
FROM emple;

SELECT MAX(apellido)
FROM emple;

SELECT MIN(salario)
FROM emple;

SELECT SUM(salario)
FROM emple;

SELECT AVG(salario)
FROM emple;

SELECT COUNT(DISTINCT oficio)
FROM emple;

SELECT DEPT_NO, COUNT(*) AS NUM_EMPLE FROM EMPLE
GROUP BY DEPT_NO HAVING COUNT(*)>4;

SELECT SUM(salario) AS total_salario,
MAX(salario) AS maximo_salario,
MIN(salario) AS minimo_salario
FROM emple
GROUP BY dept_no;

SELECT dept_no,emp_no,COUNT(*) 
FROM emple
GROUP BY dept_no,oficio;

#Busca el número máximo de empleados que hay en algún departamento.
SELECT MAX(TOTAL)
 FROM (SELECT COUNT(*) AS TOTAL, DEPT_NO 
 FROM EMPLE 
 GROUP BY DEPT_NO) AS TOTAL_EMPLE;
 
 SELECT DEPT_NO,COUNT(*)
 FROM EMPLE 
 GROUP BY DEPT_NO 
 ORDER BY COUNT(*) DESC LIMIT 1;

