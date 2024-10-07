#1.Dadas las tablas ALUM y NUEVOS, insertar en la tabla ALUM los
# nuevos alumnos.
INSERT INTO alum 
SELECT * FROM nuevos
WHERE nombre NOT IN (SELECT nombre FROM alum);

#3.Insertar un empleado de apellido ‘SAAVEDRA’ con número 2000.
#La fecha de alta será la actual, el SALARIO será el mismo salario del
#empleado ’SALA’ más el 20 por ciento y el resto de datos serán los mismos que
#los datos de ‘SALA’
INSERT INTO EMPLE
SELECT 2000, 'SAAVEDRA', OFICIO, DIR, current_date(), SALARIO*1.2,
COMISION,DEPT_NO
FROM EMPLE WHERE APELLIDO='SALA';

#Añadir un nuevo profesor con DNI 8790055 y de nombre
#‘Clara Salas’ en el centro o en los centros cuyo número
#de administrativos sea 1 en la especialidad de ‘IDIOMA’. 

INSERT INTO PROFESORES
 Select cod_centro, 8790055,'Salas, Clara', 'IDIOMA'
 FROM PERSONAL
 WHERE FUNCION='ADMINISTRATIVO'
 GROUP BY COD_CENTRO
 HAVING COUNT(*) =1);
