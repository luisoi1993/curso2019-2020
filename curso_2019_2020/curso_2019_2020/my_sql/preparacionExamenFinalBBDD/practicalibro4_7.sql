#1.La ciudad y el telefono de las oficinas de Estados Unidos.
SELECT ciudad,telefono FROM oficinas
WHERE pais LIKE 'eeuu';

#2.El nombre,los apellidos y el email de los empleados a cargo
#de alberto Soria
SELECT nombre,apellido1,apellido2,email FROM empleados
WHERE codigojefe IN (SELECT codigojefe FROM empleados
							WHERE nombre LIKE 'alberto' AND apellido1 LIKE 'soria');
							
#3.El cargo,nombre,apellidos y email del jefe de la empresa.
SELECT puesto,nombre,apellido1,apellido2,email FROM empleados
WHERE codigojefe IS NULL;

#4.El nombre,apellidos y cargo de aquellos que no sean representantes de ventas
SELECT nombre,apellido1,apellido2,puesto FROM empleados
WHERE puesto NOT LIKE 'representante ventas';

#5.El numero de clientes que tiene la empresa
SELECT COUNT(codigocliente) FROM clientes;

#6.El nombre de los clientes eapañoles.
SELECT nombrecliente FROM clientes
WHERE pais LIKE 'españa';

#7.Cuantos clientes tiene cada pais
SELECT COUNT(codigocliente),pais FROM clientes
GROUP BY pais;

#8.Cuantos clientes tiene la ciudad de madrid.
SELECT COUNT(codigocliente) FROM clientes 
WHERE ciudad LIKE 'madrid';

#9.cuantos clientes tienen las ciudades que empiezn por m
SELECT COUNT(codigocliente) FROM clientes 
WHERE ciudad LIKE 'M%';

#10.El codigo de empleado y el numero de clientes al que atiende caada
#representante.
SELECT codigoempleadorepventas,COUNT(codigocliente) FROM clientes 
GROUP BY codigoempleadorepventas;

#11.El numero de clientes que no tiene asignado representante de ventas.
SELECT COUNT(codigocliente) FROM clientes
WHERE codigoempleadorepventas IS NULL;

#12.Cual fue el primer y ultimo pago que hizo algun cliente
SELECT MAX(fechapago),MIN(fechapago) FROM pagos;

#13.El codigo de cliente de aquellos clientes que hicieron pagos en 2008
SELECT codigocliente FROM pagos
WHERE fechapago LIKE '2008%';

#14.Los distintos estados por los que puede pasar un pedido
SELECT DISTINCT estado FROM pedidos;

#15.El numero de pedido ,codigo de cliente ,fecha requerida y
#fecha de entrega de los pedidos que no han sido entragados a
#tiempo
SELECT codigopedido,codigocliente,fechaesperada,fechaentrega FROM pedidos
WHERE  fechaesperada < fechaentrega;

#16.cuantos productos existen en cada linea de pedido.
SELECT COUNT(codigoproducto),gama FROM productos
GROUP BY gama;

#17.Un listado de los 20 codigos de productos mas pedidos ordenados
#por cantidad pedida
SELECT codigopedido,SUM(cantidad) FROM detallepedidos
GROUP BY codigopedido
ORDER BY SUM(cantidad) DESC LIMIT 20;

#18.El numero de pedido,codigo de cliente,fecha requerida y fecha de 
#entrega ha sido al menos dos dias antes de la fecha requerida
SELECT codigopedido,codigocliente,fechaesperada,fechaentrega
FROM pedidos 
WHERE fechaesperada>=ADDDATE(FechaEntrega,2);

#19.la facturacion que ha tenido la empresa en toda la historia, indicando
#la base imposible, eL IVA y el total facturado
SELECT SUM(cantidad*preciounidad)AS baseimponible,
SUM(cantidad*preciounidad)*0.18 AS IVA,
SUM(cantidad*preciounidad)*1.18 AS total
FROM detallepedidos;

#20.la misma informacion de la tabla anteriror 
#con los filtros por los codigos que empiecen por fr
#y agrupadas por codigo
SELECT SUM(cantidad*preciounidad) AS baseimponible,
SUM(cantidad*preciounidad) *0.18 AS IVA,
SUM(cantidad*preciounidad)*1.18 AS total
FROM detallepedidos
WHERE codigoproducto LIKE 'FR%'
GROUP BY codigoproducto;


SELECT * FROM detallepedidos;
SELECT * FROM productos;
SELECT * FROM pedidos;
SELECT * FROM pagos;
SELECT * FROM empleados;
SELECT * FROM clientes;