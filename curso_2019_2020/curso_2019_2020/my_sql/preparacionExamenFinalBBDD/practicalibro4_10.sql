#1.
select NombreCliente,count(*)
from Pedidos inner join Clientes 
    On Pedidos.CodigoCliente=Clientes.CodigoCliente
group by NombreCliente;

#2.
SELECT nombrecliente ,SUM(cantidad) 
FROM clientes INNER JOIN pagos
	ON clientes.CodigoCliente=pagos.CodigoCliente
GROUP BY codigocliente;

select NombreCliente,sum(Cantidad)
from Pagos natural join Clientes
group by NombreCliente;

#3.
SELECT nombrecliente FROM clientes 
WHERE codigocliente IN(SELECT codigopedido FROM pedidos
							  WHERE fechapedido LIKE '2008%');
							  
#4.
SELECT nombrecliente,nombrecontacto,apellidocontacto FROM clientes 
WHERE codigocliente NOT IN(SELECT codigocliente FROM pagos); 

#5. 
SELECT nombrecliente,nombrecontacto,oficinas.Ciudad
FROM clientes INNER JOIN empleados
	ON clientes.CodigoEmpleadoRepVentas=codigoempleado
INNER JOIN oficinas
	ON empleados.CodigoOficina=oficinas.CodigoOficina;
	
#6.
SELECT nombre,apellido1,apellido2,codigooficina,puesto FROM empleados
WHERE puesto NOT LIKE'representante ventas';

#7.
select Ciudad,count(*)
from Empleados natural join Oficinas
group by Ciudad;

#8.
select e.Nombre as subordinado,j.Nombre as jefe 
from Empleados e inner join Empleados j 
on e.CodigoJefe = j.CodigoEmpleado;

#9.
SELECT nombre,apellido1,apellido2,puesto,ciudad FROM empleados
INNER JOIN oficinas
	ON empleados.codigooficina=oficinas.CodigoOficina
WHERE codigoempleado NOT IN(SELECT codigoempleadorepventas FROM clientes);

#10.
SELECT AVG(cantidadenstock),gama FROM productos
GROUP BY gama;

#11.
SELECT * FROM clientes
WHERE ciudad IN(SELECT ciudad FROM oficinas);

#12.
SELECT * FROM clientes 
WHERE ciudad NOT IN(SELECT ciudad FROM oficinas);

#13.
SELECT COUNT(codigocliente),codigocliente FROM clientes
GROUP BY codigoempleadorepventas;
#14.
SELECT * FROM clientes
WHERE codigocliente IN(SELECT codigocliente FROM pagos
								WHERE cantidad LIKE (SELECT MAX(cantidad)FROM pagos))
OR codigocliente IN (SELECT codigocliente FROM pagos
							WHERE cantidad LIKE(SELECT MIN(cantidad) FROM pagos));
							
#15.
SELECT SUM(cantidad*preciounidad),codigopedido FROM detallepedidos
GROUP BY codigopedido;

#16.
SELECT * FROM clientes
WHERE codigocliente IN(SELECT codigocliente FROM pedidos
								WHERE fechapedido LIKE '2008%'
								AND codigopedido IN(SELECT codigopedido FROM detallepedidos
															GROUP BY codigopedido
														  HAVING SUM(cantidad*preciounidad)>2000));
select distinct CodigoCliente
from Pedidos Natural Join DetallePedidos
where fechapedido between '2008/01/01' and '2008/12/31'
group by CodigoPedido
having sum(Cantidad*PrecioUnidad)>2000;
													
#17.
SELECT COUNT(estado),estado,codigocliente FROM pedidos
GROUP BY codigocliente,estado;

#18.

SELECT * FROM clientes
WHERE codigocliente IN(SELECT codigocliente FROM pedidos
								WHERE codigopedido IN(SELECT codigopedido FROM detallepedidos
															 WHERE cantidad >200));	
	
	
SELECT * FROM detallepedidos;
SELECT * FROM productos;
SELECT * FROM empleados;	
SELECT * FROM oficinas; 
SELECT * FROM clientes;
SELECT * FROM pedidos;
SELECT * FROM pagos;