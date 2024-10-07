#hoja14

#1.El socio con documento "23333444" quiere inscribirse en "basquet" este año, pero no recuerda su
#númerto de socio. Inscribe al socio en la tabla "inscriptos" buscando el número de socio a partr de
#su número de documento.
INSERT INTO inscritos(numeroSocio,deporte,fecha,cuota)
SELECT numeroSocio,"basquet", YEAR(CURRENT_DATE()),'s'
FROM socios
WHERE dni LIKE '23333444';


#2.Intenta inscribir una persona a partir de un número de dtocumento que no exista en la tabla “socios”
#para el deporte ‘tenis’.
INSERT INTO inscritos(numerosocio,deporte,año,cuota)
SELECT numeroSocio,,'tenis', YEAR(),'s'
FROM socios
WHERE documento='30333444';

#3
INSERT INTO inscritos(numerosocio,deprote,año,cuota)
SELECT numeroSoccio,'basquet', YEAR(CURRENT_DATE()),'n'
FROM socios
WHERE nombre ='Agustin Perez';

#4
INSERT INTO inscriptos(numerosocio,deporte,año,cuota)
SELECT numeroSocio,'natacion', YEAR(CURRENT_DATE())'n'
FROM socios
WHERE domicilio='Urquiza 283'
¿?;
#5
SELECT s.nombre,i.deporte,i.añp
FROM socios s
INNER JOIN inscriptos i ON i.numero=s.numerosocio;

#6
SELECT i.deporte, i.fecha COUNT(i.deporte) AS cantidad
FROM INCRIPTOS i
GROUP BY i.deporte,i.fecha;

#7
CREATE TABLE inscritospordeporteyanio(
deporte;


#8
INSERT INTO insccrptospordeporteyanio
SELECT i.deorte,i.fecha, COUNT(i.deporte)
FROM inscrito i
GROUP BY i.deporte, i.fecha;

#9
SELECT s.nombre AS socio,i.deporte AS deporte, i.fecha
FROM socios s
INNER JOIN inscriptos i ON s.numeroSocio=i.numeroSocio
WHERE i.cuota LIKE 'N';

#10
INSERT INTO sociosdeudores
SELECT i.numeroSocio,i.nombre,i.fecha
FROM inscriptos i
WHERE i.cuota LIKE 'N';

#11
INSERT INTO alumnosporprofesor
SELECT d.profesor,d.nombre, COUNT(i.deporte)
FROM deportes d
LEFT JOIN inscriptos i ON i.deporte=d.nombre
GROUP BY d.profesor,d.nombre;

#12
DELETE
FROM deportes
WHERE nombre NOT IN (
SELECT DISTINCT deporte
FROM inscritos);

#13
DELETE
FROM profesores
WHERE nombre NOT IN (
SELECT DISTINCT profesor
FROM deportes);
SELECT *
FROM socios;
SELECT *
FROM deportes;
SELECT *
FROM inscritos;