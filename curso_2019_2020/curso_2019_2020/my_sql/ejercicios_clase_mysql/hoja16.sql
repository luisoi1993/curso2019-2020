#practica 16

#1.Dar de alta un nuevo articuo de 'Primera' categoria para los fabricantes de 'FRANCIA' y abastecer 
#con cinco unidadesde ese artículo a todas las tiendas y en la fecha de hoy
INSERT INTO ARTICULOS 
    SELECT 'Yogur Fresa', COD_FABRICANTE, 4,'Primera', 120, 100, 190
    FROM FABRICANTES
    WHERE PAIS='FRANCIA';

INSERT INTO PEDIDOS
  SELECT NIF, 'Yogur Fresa', COD_FABRICANTE, 4,'Primera', current_date(),5
  	FROM TIENDAS inner join FABRICANTES
  	WHERE PAIS='FRANCIA';

UPDATE ARTICULOS SET EXISTENCIAS = EXISTENCIAS – 5* (SELECT COUNT( NIF) FROM TIENDAS)
where articulo like ‘Yogur fresa’;


#2. Dar de alta una tienda en la provincia de 'MADRID' y abastecerla con 20 unidades de cada uno
# de los articulos existentes
INSERT INTO TIENDAS VALUES ('1010-C','La Cesta', 'C/Juan Mazo 30','Alcalá','MADRID',28809); 

INSERT INTO PEDIDOS
SELECT '1010-C', ARTICULO, COD_FABRICANTE, PESO, CATEGORIA, current_date(), 20 
FROM ARTICULOS;

UPDATE ARTICULOS SET EXISTENCIAS = EXISTENCIAS – 20;

#3Realizar una venta para todas las tiendas de la provincia de 'TOLEDO' de 10 unidades en
#los articulos de 'Primera' categoria.
INSERT INTO VENTAS
   SELECT NIF,  ARTICULO, COD_FABRICANTE, PESO, CATEGORIA,  current_date(), 10
      FROM TIENDAS, ARTICULOS 
      WHERE PROVINCIA='TOLEDO'
      AND CATEGORIA='Primera';


#4Cambiar todos los articulos  de 'PRIMERA'categoria a'Segunda' categoria del pais 'ITALIA'

#5.Eliminar aquellas tiendas que no han realizado ventas.

#6. Dar de alta dos tiendas en la provincia de 'SEVILLA' y abastecerlas con 30 unidades
#de artículos de la marca de fabricante 'GALLO'


#7.Cambiar los datos de la tienda con NIF '1111-A' igualándolos a los de las tienda con NIF '2222-A'
CREATE TABLE tiendas2 SELECT * FROM tiendas;
UPADATE tiendas
SET nombre =(SELECT  nombre FROM tiendas)SET direccion=(SELECT direccion FROM tiendas)
SET direccion =(SELECT direccion FROM tiendas)SET poblacion=(SELECT poblacion FROM tiendas)
SET provincia =(SELECT provincia FROM tiendas)SET codpostal=(SELECT codpostal FROM tiendas); 

#8.Borrar los pedidos que no tengan tienda
DELETE
FROM pedidos
WHERE nif NOT IN (
SELECT DISTINCT nif
FROM tiendas);


#9.Eliminar los artículos que no hayan tenido ni compras ni ventas
DELETE
FROM articulos
WHERE articulo NOT IN (
SELECT DISTINCT articulo
FROM pedidos);

#10.Restar uno a las unidades de los últimos pedidos de la tienda con NIF '5555-B' 
#con la fecha actual
UPDATE pedidos SET EXISTENCIAS = EXISTENCIAS – 20;


SELECT * FROM articulos;
SELECT * FROM fabricantes;
SELECT * FROM pedidos;
SELECT * FROM tiendas;

