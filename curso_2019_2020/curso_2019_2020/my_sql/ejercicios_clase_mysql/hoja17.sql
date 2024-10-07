#3

UPDATE detallepedidos SET preciounidad = preciounidad * cantidad
WHERE codigoPedido IN(SELECT codigoPedido FROM pedidos 
							WHERE  fechaPedido BETWEEN CURRENT_DATE()
							AND DATE_SUB(CURRENT_DATE(), INTERVAL *1 MONTH));
							
UPDATE detallepedidos 
SET preciounidad = preciounidad ;
#4

UPDATE productos 
SET precioventa =(SELECT ROUND(AVG(preciounidad),2)
						FROM detallepedidos
						WHERE p.codigopedido= detallepedidos.codigoproducto)
WHERE proveedor LIKE 'naranjasvalencianas.com'
AND p.codigoproducto IN (SELECT codigoproducto
								FROM detallepedidos);
#5
DELETE FROM detallepedidos 
WHERE codigopedido IN(SELECT codigopedido
							FROM pedidos
							WHERE codigocliente IN (SELECT codigocliente FROM clientes 
															WHERE nombre LIKE 'beragua');
															
#6


#7
DELETE FROM pedidos
WHERE codigopedido IN(SELECT codigopedido FROM detallepedidos 
							WHERE codigoproducto
							IN(SELECT codigoProducto FROM productos
								WHERE gama LIKE 'frutales'
								AND precioventa
								NOT IN(SELECT preciounidad FROM detallepedidos)));
SELECT * FROM clientes;
