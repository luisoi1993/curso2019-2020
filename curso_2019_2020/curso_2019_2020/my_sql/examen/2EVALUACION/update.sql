#4.Modificar el número de departamento de ‘SAAVEDRA’.
#El nuevo departamento será el departamento donde hay más
#empleados cuyo oficio sea ‘EMPLEADO’.

CREATE TABLE EMPLE2 SELECT * FROM EMPLE;

UPDATE EMPLE
 SET DEPT_NO=
 (SELECT DEPT_NO FROM EMPLE2 WHERE OFICIO='EMPLEADO'
	GROUP BY DEPT_NO
 	HAVING COUNT(*) = (SELECT COUNT(*) FROM EMPLE2
 	WHERE OFICIO='EMPLEADO'
	GROUP BY DEPT_NO
	ORDER BY COUNT(*) DESC
	LIMIT 1))
 WHERE APELLIDO ='SAAVEDRA';
 


#6.Modificar el número de plazas con un valor igual
a la mitad en aquellos centros con menos de dos profesores.

UPDATE CENTROS
 SET NUM_PLAZAS=NUM_PLAZAS/2
 WHERE COD_CENTRO IN
 (SELECT COD_CENTRO FROM PROFESORES GROUP BY COD_CENTRO
 HAVING COUNT(*) <2);
 
#24. Subir el precio por hora en un 10% del precio
#por hora más bajo para todas las máquinas excepto 
#para aquella que tenga el valor más alto

UPDATE maquinas
SET preciohora = preciohora + (SELECT MIN(preciohora)*0.1
FROM maquinas2)
WHERE preciohora <> (SELECT MAX(preciohora)
FROM maquinas2);

#30. Modificar el código del conductor ‘C01’ 
#de la tabla conductores,por el código ‘C08’.

alter table trabajos
drop foreign key fk_tc;
alter table trabajos
add constraint fk_tc foreign key (codc) references conductores(codc)
on update cascade;
UPDATE conductores
SET codC = 'C08'
WHERE codC = 'C01';

 