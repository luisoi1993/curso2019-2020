COMMIT WORK;
ROLLBACK WORK;

SET AUTOCOMMIT 0;

UPDATE Productos SET STOCK=STOCK-2 WHERE CodigoProducto='AAAF102';
INSERT INTO Pedidos VALUES
	(CodigoPedido,Fechapedido,practicas
	(25,NOW(),'Francisco Garcia','pendiente de entrega');
	
INSERT INTO DetallePedidos
	(CodigoPedido,CodigoProducto,Unidades) VALUES
		(25,'AAAF102',2);

COMMIT WORK;


SELECT * FROM pedidos;	

