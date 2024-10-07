#1.Un listado de clientes indicando el nombre del cliente
#y cuantos pedidos ha realizado

#version SQL-92 (Natural Join)
SELECT NombreCliente,count(*)
FROM Pedidos 
NATURAL JOIN Clientes
GROUP BY NombreCliente;

#version SQL-92 (Inner join)
SELECT NombreCliente,count(*)
FROM Pedidos 
INNER JOIN Clientes 
    ON Pedidos.CodigoCliente=Clientes.CodigoCliente
GROUP BY NombreCliente;

#2.Un listado con los nombres de los clientes y el total pagado
#por cada uno de ellos.
SELECT nombrecliente,SUM(cantidad)
FROM clientes 
NATURAL JOIN pagos
GROUP BY nombrecliente;

SELECT nombrecliente,SUM(cantidad)
FROM clientes 
INNER JOIN  pagos
ON clientes.codigocliente = pagos.codigocliente
GROUP BY nombrecliente;

#3.El nombre de los clientes que hayan hecho pedidos en 2018
SELECT DISTINCT nombrecliente 
FROM clientes
WHERE codigocliente IN (SELECT codigocliente
								FROM pedidos
								WHERE fechapedido LIKE '2008%');
								
SELECT DISTINCT NombreCliente
FROM Pedidos 
natural join Clientes
WHERE Pedidos.FechaPedido LIKE '2008%';

#4.EL nombre del cliente y el nombre y apellido de sus representantes
#de aquellos clientes que no hayan realizado pagos
SELECT Clientes.NombreCliente,Empleados.Nombre
FROM Empleados 
INNER JOIN Clientes 
  	ON Clientes.CodigoEmpleadoRepVentas=Empleados.CodigoEmpleado
WHERE NOT EXISTS (SELECT CodigoCliente
						 FROM Pagos 
						WHERE Pagos.CodigoCliente=Clientes.CodigoCliente); 	
  
SELECT Clientes.NombreCliente,Empleados.Nombre,Empleados.Apellido
FROM Empleados 
INNER JOIN  Clientes 
  	ON Clientes.CodigoEmpleadoRepVentas=Empleados.CodigoEmpleado
WHERE clientes.codigocliente NOT IN(SELECT CodigoCliente 
									FROM Pagos);
									
#5.Un listado de clientes donde aparezca el nombre de su comercial 
#y la ciudad donde esta su oficina.
SELECT Clientes.NombreCliente,Empleados.Nombre,Oficinas.Ciudad
FROM Empleados 
INNER JOIN Oficinas 
	ON Oficinas.CodigoOficina=Empleados.CodigoOficina
    INNER JOIN Clientes 
  	ON Clientes.CodigoEmpleadoRepVentas=Empleados.CodigoEmpleado;

#6.El nombre,apellidos,oficina y cargo de aquellos
#que no sean representantes de ventas.
SELECT nombre,apellido1,apellido2 ,codigooficina,puesto
FROM empleados
WHERE NOT LIKE puesto 'representante ventas';

#7.Cuantos empleados tiene cada oficina,mostrando el nombre
#de ciudad donde esta la oficina
SELECT COUNT(codigoempleado),ciudad
FROM empleados
NATURAL JOIN oficinas
GROUP BY codigooficina;

#8.Un listado con el nombre de los empleados , y el nombre
#de sus respectivos jefes 
SELECT e.Nombre AS subordinado,j.Nombre AS jefe 
FROM Empleados e
INNER JOIN Empleados j 
ON e.CodigoJefe = j.CodigoEmpleado;

#9.El nombre,apellido,oficina(ciudad) y cargo del empleado
#que no represente a ningun cliente
SELECT Nombre,Apellido1,Apellido2,Ciudad,Puesto 
FROM Empleados
NATURAL JOIN Oficinas
WHERE NOT EXISTS (SELECT CodigoCliente 
						FROM Clientes 
						WHERE CodigoEmpleadoRepVentas=CodigoEmpleado);

SELECT Nombre,Apellido1,Apellido2,Ciudad,Puesto 
FROM Empleados
NATURAL JOIN Oficinas
WHERE empleados.CodigoEmpleado NOT IN (SELECT CodigoEmpleadoRepVentas 
													FROM Clientes );						
#10.La media de unidades en stock de los productos
#agrupados por gama.
SELECT AVG(cantidadenstock) AS mediaDeStock,gama
FROM productos
GROUP BY gama;

#11.Los clientes que residan en la misma ciudad donde hay una 
#oficina,indicando donde esta la oficina.
SELECT Clientes.NombreCliente ,Clientes.Ciudad
FROM Clientes 
INNER JOIN Oficinas 
	  ON Oficinas.Ciudad=Clientes.Ciudad;
	  
#12.Los clientes que residan en ciudades donde no hay oficinas
#ordenando por la ciudad que residen.
SELECT Clientes.NombreCliente,Clientes.Ciudad
FROM Clientes 
WHERE NOT EXISTS (SELECT CodigoOficina
FROM Oficinas 
WHERE Oficinas.Ciudad=Clientes.Ciudad);

SELECT clientes.codigocliente, clientes.ciudad 
FROM clientes
WHERE ciudad NOT IN (SELECT oficinas.ciudad			
							FROM oficinas 
							INNER JOIN clientes
							ON clientes.ciudad=oficinas.ciudad)
ORDER BY clientes.ciudad DESC;

#13.El numero de clientes que tiene asignado cada representante de ventas.
SELECT count(*),Empleados.Nombre
FROM Clientes
INNER JOIN Empleados
ON Clientes.CodigoEmpleadoRepVentas=Empleados.CodigoEmpleado
WHERE Empleados.Puesto='Representante Ventas'
GROUP BY Empleados.Nombre;
SELECT * FROM clientes;
SELECT * FROM pedidos;
SELECT * FROM pagos;
SELECT * FROM empleados;
SELECT * FROM oficinas;
SELECT * FROM productos;