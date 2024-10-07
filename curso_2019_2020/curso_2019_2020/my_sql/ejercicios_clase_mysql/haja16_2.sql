#hoja16

#10.
DELETE FROM pedidos WHERE nif NOT IN (SELECT nif FROM FROM tiendas)
OR nif IS NULL;
DELETE FROM pedidos WHERE NIF IS NULL;
#ALTER TABLE pedidos MODIFY nif NIF VARCHAR(10) NULL;

#11
DELETE FROM articulos
WHERE(Aticulo,cod_fabricante,peso,categoria)NOT IN (
																	SELECT ariculo,cod_fabricante,peso,categoria FRO ventas)
																	AND(articulo,cod_fabricante,peso,categoria)NOT IN(
																	SELECT articulo,cod_fabricante,peso,categoria FROM pedidos);

#12
#a
UPDATE pedidos
SET unidades_pedidas=unidades_pedidas-1
WHERE nif='5555-B'
AND fecha_pedido=(SELECT maax(fecha_pedido)
						FROM pedidos WHERE nif='5555-B');
						
#b
UPDATE PEDIDOS
SET unidades_pedidas=unidades_pedidas-1
WHERE NIF='5555-b'
ORDER BY fecha_pedido DESC LIMIT 5;

#13
INSERT INTO pedidos
SELECT DISTINCT '5555-b', ARTICULO,cod_fabricante,peso,categoria,CURRENT_DATE()
FROM ventas
GROUP BY articulo,cod_fabricante ,peso,categoria
HAVING SUM(unidades_vendidas)>30;

INSERT INTO pedidos
SELECT DISTINCT '5555-b', ARTICULO,cod_fabricante,peso,categoria,CURRENT_DATE()
FROM ventas
GROUP BY articulo,cod_fabricante ,peso,categoria
WHERE unidades_vendidas >30;
#14

DELETE FROM pedidos 
WHERE (articulo,cod_fabricante,peso,categoria)IN(
		SELECT articulo,cod_fabricante,peso,categoria
		FROM articulos
		WHERE cod_fabricante=(SELECT COD_FABRICANTE
									FROM fabricantes
									WHERE pais='BELGICA'))
AND categoria='primera';

#15
#a
INSERT INTO pedidos 
SELECT DISTINCT '1111-A',articulo,cod_fabricante,peso,categoria,CURRENT()DATE,20
FROM ventas
GROUP BY articulo,cod_fabricante,peso,categoria
HAVING SUM(unidades_vendidas)=(SELECT SUM(unidades
										GROUP BY articulos
										ORDER BY SUM(unidades_vendidas)DESC
										LIMIT 1);
#b
INSERT INTO pedidos 
SELECT DISNTINCT '1111-A',articulo,cod_fabricante,peso,categoria,CURRENT_DATE(),20
FROM ventas
GROUP BY articulo,cod_fabricante,peso,categoria
HAVING SUM(unidades_vendidas)=(SELECT MAX(unidades_vendidas)FROM ventas;

#16

UPDATE pedidos p
SET unidades_pedidas=(SELECT exixtencias*0.2 FROM articulos
							WHERE articulo=p, articulo
							AND cod_fabricante=p.cod_fabricante
							AND peso=p.peso
							AND categoria=p.categoria)
WHERE unidades_pedidas>(SELECT existencias FROM articulos
								WHERE articulo=p.articulo
								AND cod_fabricante=p.cod_fabricante
								AND peso=p.peso
								AND categoria=p.CATEGORIA);
								
#17


