#practica 5.1 libro
#1
INSERT INTO oficinas VALUES
('FUE-ES','Fuenlabradda','España','Madrid','28941','918837627','C/Las suertes,27','Bajo A');

#2
INSERT INTO Empleados (CodigoEmpleado,Nombre,Apellido1,Email,CodigoOficina,Puesto) VALUES
(400,'Ismael','Sanchez','isanchez@jardineria.com','Fue-ES','Rep.Ventas');

INSERT INTO empleados
SELECT '400','Juan','Pérez','Garcia',222,'juan@domenico.es',codigooficina,NULL,'Representante Ventas'
FROM oficinas
WHERE ciudad LIKE 'paris';

#3
INSERT INTO Clientes(CodigoCliente,NombreCliente,Telefono,CodigoEmpleadoRepVentas)
VALUES(288,'Riegos Pérez','918882763',400);

#4
START TRANSACTION; 
INSERT INTO Pedidos (CodigoPedido,FechaPedido,Estado,CodigoCliente)
	VALUES (1900,'2010-06-03','pendiente',288);
INSERT INTO Detallepedidos(CodigoPedido,CodigoProducto,Cantidad,
	PrecioUnidad,NumeroLinea) VALUES (1900,'OR-99',1,15.99,1);
INSERT INTO DetallePedidos (CodigoPedido,CodigoProducto,Cantidad, PrecioUnidad,NumeroLinea)
	VALUES (1900,'OR-251',3,168,2);
COMMIT WORK;

#5
UPDATE Clientes SET CodigoCLiente=290 WHERE CodigoCliente=288;

#6
DELETE FROM Clientes WHERE CodigoCliente=288;


fabricantesarticulos