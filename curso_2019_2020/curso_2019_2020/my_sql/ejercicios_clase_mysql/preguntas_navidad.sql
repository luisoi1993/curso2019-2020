

SELECT NombreCliente,nombreContacto,apellidoContacto,FormaPago,FechaPago
FROM clientes 
INNER JOIN pagos on Clientes.codigoCliente = pagos.CodigoCliente
where ciudad like "San Francisco" and pagos.CodigoCliente;

#Obtener el nombre del cliente ,ciudad y cuantos  pedidos se han realizado de los clientes
#cuya segunda letra del nombre es la 'a' y el pedido haya sido entregado el dia esperado

SELECT distinct NombreCliente,Ciudad,count(*) as PedidosRealizados 
FROM clientes INNER JOIN pedidos 
ON clientes.CodigoCliente=pedidos.CodigoCliente 
where nombreCliente like '_a%'
and FechaEsperada like FecHaEntrega
AND ESTADO LIKE 'Entregado'
GROUP BY nombreCliente, ciudad;

#Obtener el codigo de cliente de los clientes  que hayan comprado mas de 10.000 unidades
# en algun pedido, la entraga ha llegado tarde, sabiendo que  la forma de pagar de ese cliente
#haya sido por PayPAl en alguna ocasion .


SELECT CodigoCliente 
FROM pedidos 
WHERE CodigoCliente in (SELECT CodigoCliente FROM pagos  WHERE  FormaPago LIKE 'PayPal')
AND CodigoPedido in (SELECT  CodigoPedido FROM detallepedidos
						WHERE cantidad>10);
		
# Obtener el nombre de contacto,apellido del contacto y telefono del cliente que ha realizado
# un pedido en 2008 y este esta entregado

SELECT NombreContacto,ApellidoContacto,Telefono FROM clientes
WHERE CodigoCliente IN (SELECT CodigoCliente FROM pedidos
						WHERE FechaPedido like '2008%' AND
                        Estado LIKE 'Entregado'
                        GROUP BY CodigoCliente HAVING count(*)=1);
                        
#Obtener el  nombre  de contacto , pais ,ciudad del cliente que  realizo la mayor cantidad de pedidos

#Obtener el nombre y codigo de empleado de los empleados que trabajen en una oficina cuyo codigo ostal tenga 

#Seleccionar los nomres de clientes con un limite de credito mayor a 10000 
##hayna comprado palas

#oficionas con prefijo telefono español en las que haya un jefe con mas de 2 empleados

SELECT codigoOficina 
FROM oficinas
nombre telefono like"%34%"
and codigooficina in (SELECT codigoempleado from empleados
GROUP BY codigojefe
HAVING COUNT (*)>2); 

#Selecciona el codigo de empleado y los puestos de los empleados cuyo codigo postal de su odicina termine en 2
SELECT empleados.codigo empleado,empleado puestos FROM empleados
INNER JOIN oficinas ON empleados.codigooficinas = oficinas.codigooficinas
WHERE codigo postal like '%2';

SELECT Codigoempleado, puesto from empleados 
WHERE codigooficina IN (SELECT codigooficina  FROM oficina 
							WHERE codigopostal like "%2");
				
#Obtener  las oficinas  en las que hay mas de 2 jefes 
SELECT  codigoOficina FROM  oficinas 
WHERE CodigoOficina  IN (SELECT codigooficina FROM  empleados 
							GROUP BY codigoOficina 
							HAVING COUNT (distinct codigoJefe)>2);

#obtener el nombre de cliente ,de contacto ,pais,ciudad que realizo el mayor numero de pedidos
SELECT NombreCliente,NombreContacto,pais,ciudad FROM clientes
WHERE CodigoCliente IN( SELECT codigoCliente  
						FROM pedidos
						GROUP BY codigoCliente
						HAVING COUNT(*) =(SELECT COUNT(*)
											FROM pedidos 
											GROUP BY codigoCliente
											ORDER BY COUNT(*) DESC LIMIT 1); 
											
#obtener el nombre dde los jefes y cuantos empleados tiene a su cargo
 SELECT E1 nombre AS jefes, COUNT (E2 nombre) AS empleados FROM empleados E1
 INNER JOIN Empleados E2 ON E1.CodigoEmpleado=E2.CodigoJefe
 GROUP BY 1;
 
 #Selecciona  los clientes y pedidos  de los clientes  que han hecho pagos con paypal
 #o cheques
 SELECT clientes.codigocliente, pedidos.codigopedidos FROM clientes
 INNER JOIN pedidos ON clientes.codigoclientes = pedidos.codigocliente
 INNER JOIN pagos  ON clientes.codigocliente = pagos.CodigoCliente
 WHERE pagos.formapago = "Paypal" OR pagos.formapago ="Cheque";
 
 #Obtener el email de los empleados y el nobre de sus clientes ordenados alfabeticamente 
 #que viven es españa


#Mostrar cuantos pedidos tiene el cliente con el codigo - #3
SELECT COUNT(clientes nombrecliente) AS numerospedidos
FROM clientes
INNER JOIN pedidos ON clientes.codigocliente=pedidos.codigocliente
WHERE pedidos.codigocliente=3;

#obtener el nombre del cliente y la fecha de pago del nombrecliente sea Gerardo valley
SELECT clientes.nombrecliente,pagos.FechaPago
FROM clientes
INNER JOIN pagos ON clientes codigocliente=pagos.CodigoCliente
WHERE nombrecliente LIKE 'gerardo valley';	

#Obtener el nombre y el telefono de los clientes cuyo codigooficina 
#sea 'mad-es'
SELECT nombrecliente,telefono 
FROM clientes 
WHERE codigopostal IN(SELECT codigopostal 
							FROM oficinas 
							WHERE codigooficina LIKE 'mad-es');
							
#obtener el nombre de los clientes y nombre de los productos pedidos por los
#clientes de madrid
SELECT clientes nombrecliente,productos.nombre 
FROM clientes
INNER JOIN pedidos ON clientes.CodigoCliente = pedidos.codigocliente
INNER JOIN productos ON productos.CodigoProducto= detallepedidos.codigocliente
WHERE ciudad LIKE 'MADRID';

#obtener todos los proveedores del cliente 'naturagua'.
SELECT DISTINCT proveedor
FROM productos
INNER JOIN detllepedidos ON productos.codigoproducto=detallepedidos.codigoproducto
INNER JOIN pedidos ON pedidos.CodigoPedido = detallepedidos.CodigoPedido
INNER JOIN clientes ON pedidos.codigoCliente = clientes.codigocliente
WHERE clientes.NombreCliente LIKE 'naturagua';

#nombre de clientes con pedidos entre enero y mayo  del 2008 y no tengan cometario
SELECT nombrecliente IN (SELECT codigocliente 
								FROM pedidos
								WHERE cometarios IS NULL
								AND fechapedido BETWEEN '2008/01/01' AND '2008/05/31';
#Mostrar los clientes que hayan hecho un pedido rechazado o se haya
#entregado despues de la fecha esperada y haya pagado con paypal 
SELECT DISTINCT clientes.NombreCliente 
FROM clientes
INNER JOIN pedidos ON pedidos.codigocliente = clientes.CodigoCliente
INNER JOIN pagos IN clientes.codigocliente = pagos.CodigoCliente
WHERE estado LIKE 'rechazado' OR fechaentraga > fechaesperada
AND formapago LIKE 'paypal';
 
#visualiza los 3 clientes que mas han pagado y la forma de pago
#sea paypal 
SELECT clientes.nombrecliente, SUM(pagos.Cantidad) AS totalpagado,pagos.FormaPago
FROM clientes
INNER JOIN pagos ON clientes.codigocliente = pagos.codigocliente
GROUP BY pagos.codigocliente 
ORDER BY total_pagado DESC LIMIT 3;

#obtener el nombre y el apellido1 de los empleados cuya oficina
#este en españa y ordenado por apellido2,muestra solo 3 a partir
#del 2 registro

SELECT nombre,apellido1
FROM empleados 
WHERE codigooficina IN(SELECT codigooficina
								FROM oficinas
								WHERE  pais LIKE 'españa' OR pais LIKE
								'spain')
ORDER BY apellido2 LIMIT 2,3; 

			