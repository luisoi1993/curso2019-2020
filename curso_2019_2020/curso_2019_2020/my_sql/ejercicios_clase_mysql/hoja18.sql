#hoja18

#1
INSERT INTO cervezas VALUES(06,'ASFA',2000,500),
IMPORT INTO reparto
SELECT codem,cadb,06,CURRENT.DATE(),10 FROM empleados
INNER JOIN bares WHERE empleados nombre LIKE 'valentin siempre'
AND bares.localidad LIKE 'villa botip';

#2
INSERT INTO bares VALUES('005','Puzzles','44444444f','ontigola');
INSERT INTO reparto SELECT codom,'005','06',CURRENT_DATE(),200 
						FROM empleados WHERE nombre LIKE 'Vicente apellido'; 
					
#3
UPDATE cervezas 
SET capacidad=70
WHERE capacidad LIKE 70
AND envase LIKE 'barril';

#4
DELETE FROM bares
WHERE codb NOT IN (SELECT codb FROM reparto WHERE fecha BETWEEN '2019-01-27 'AND '2020-02-27');

DELETE FROM bares
WHERE codB NOT IN (SELECT codB FROM repartos 
						WHERE fecha BETWEEN  CURRENT_DATE()
						AND DATE_SUB (CURRENT_DATE(), INTERVAL 1 YEAR));
#5
DELETE FROM cervezas 
WHERE stock*0,1>(SELECT AVG(catidad) FROM reparto
						WHERE cervezas codc= reparto codc); 
#6
CREATE TABLE bares2 SELECT * FROM bares,
UPDATE bares
SET nombre =(SELECT nombre FROM bares2
				WHERE codB LIKE '004')
				CIFC =(SELECT cifc FROM bares2
						WHERE codB LIKE '004')
				localidad =(SELECT localidad FROM bares2
								WHERE codB LIKE '004')
WHERE codb LIKE '003';

#7
CREATE TABLE repartos2 
SELECT  * FROM repartos;
 
UPDATE repartos
SET cantidad= cantidad-1
WHERE codb=(SELECT codb FROM bares WHERE cif LIKE '111111111x')
AND codc IN (SELECT codc FROM cervezas WHERE envase LIKE 'lata')
AND fecha IN (SELECT MAX(fecha) FROM repartos2);

#8
INSERT INTO reparto
SELECT 1,codb,codc,CURRENT_DATE(),10 
FROM reparto
WHERE codb IN (SELECT codb 
					FROM bares
					WHERE  cif LIKE '5555555H'
					AND cantidad > 100;

UPDATE cervezas
SET stock -10
WHERE CODE IN (SELECT CODE FROM repartos WHERE  cantidad >100);
					
#9
DELETE FROM repartos WHERE codem IN (SELECT codm FROM empleados
												WHERE  nombres 'prudencio cnaj')
AND codb IN (SELECT codb FROM bares WHERE NOMBRE LIKE STOP);
