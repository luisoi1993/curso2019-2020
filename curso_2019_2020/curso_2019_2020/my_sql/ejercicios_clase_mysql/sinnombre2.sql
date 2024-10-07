#1
DELETE FROM CLientes WHERE CodigoCliente NOT IN
(SELECT  DISTINCT CodigoCliente FROM Pedidos);
#2
UPDATE Productos SET PrecioVenta=PrecioVenta*1.2 WHERE NOT EXITS
(SELECT DISTINCT CodigoProducto FROM  DetallePedidos
WHERE  DetallePedidos.CodigoProducto=Productos.CodigoProducto);
#3
DELETE FROM Pagos WHERE CodigoCliente=
	(SELECT CodigoCliente FROM Clientes WHERE LimiteCredito =
		(SELECT MIN(LimiteCredito) FROM Clientes));

#4
UPDATE Clientes SET LimiteCredito=0 WHERE CodigoCliente=
	(SELECT CodigoCliente FROM Pedidos NATURAL JOIN DetallePedidos
	WHERE Cantidad =(SELECT MIN(cantidad) FROM DetallePedidos WHERE
							CodigoProducto='OR-179') AND CodigoProducto='OR-179'
);

#5