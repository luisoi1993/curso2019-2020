SELECT * FROM emple;
SELECT * FROM depart;

SELECT emp_no,apellido,oficio,dept_no
FROM emple
WHERE dept_no like 20
ORDER BY Apellido;

CREATE TABLE ALUM0405(
	DNI VARCHAR (10)PRIMARY KEY,
    NOMBRE VARCHAR(15)NOT NULL,
    APELLDOS VARCHAR(20)NOT NULL,
    FECHA_NAC DATE,
    DIRECCION VARCHAR(20)NOT NULL,
    POBLACION VARCHAR(20),
    PROVINCIA VARCHAR(20),
    CURSO INTEGER(1)NOT NULL,
    NIVEL VARCHAR(3)NOT NULL,
    CLASE CHAR(2),
    FALTAS1 INTEGER(2)DEFAULT 0,
    FALTAS2 INTEGER(2)DEFAULT 0,
    FALTAS3 INTEGER(2)DEFAULT 0
    )ENGINE=INNODB;
    
    SELECT * FROM ALUM0405;

   SELECT dni,nombre,apelldos,curso,nivel,clase
   FROM ALUM0405;
   
   SELECT * 
   FROM ALUM
   WHERE localidad LIKE 'TOLEDO';
   
   SELECT NOMBRE,APELLDOS 
   FROM ALUM0405
   WHERE poblacion like 'madrid';
   
   SELECT dni,nombre,apelldos,curso,nivel,clase
   FROM alum0405
   ORDER BY apelldos,nombre;

SELECT dnombre,dept_no AS departamento
FROM depart;

SELECT nombre_alumno,(nota1+nota2+nota3)/3 AS nota_media
FROM notas_alumnos;

SELECT nombre_alumno,(nota1+nota2+nota3)/3 AS nota_media
FROM notas_alumnos
WHERE NOTA1 LIKE 7 AND (nota1+nota2+nota3) >6;

SELECT * 
FROM emple
where apellido like 'j%';

SELECT *
FROM emple
WHERE apellido like '_r%';

SELECT *
FROM emple
WHERE apellido like 'A%o%';




