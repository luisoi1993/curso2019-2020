#1.La ciudad y el telefono de las oficinas de Estados unidos.
SELECT ciudad,telefono
FROM oficinas
WHERE pais LIKE'EEUU';

#2.El nombre,los apellidos y el email de los empleados a cargo de Alberto Soria.
SELECT nombre,apellido1,apellido2,email
FROM empleados
WHERE codigojefe like 3;

#3.El cargo,el nombre,apellidos y email del jefe de la empresa
SELECT puesto,nombre,apellido1,apellido2
FROM empleados
WHERE codigojefe IS NULL;

#4.El nombre,apellidos y cargo de aquellos que no sean representantes de ventas
SELECT nombre,apellido1,apellido2,puesto
FROM empleados
WHERE puesto not like 'representante ventas';

#5. El numero de clientes que tiene la empresa
SELECT COUNT(codigocliente)
FROM clientes;

#6 El nombre de los clientes españoles
SELECT nombrecliente 
FROM clientes
WHERE pais LIKE 'spain' OR pais LIKE 'españa';

#7.Cuantos clientes tiene cada pais
SELECT pais, COUNT(*)
FROM clientes
GROUP BY pais;

#8.Cuantos clientes tiene la ciudad de madrid
SELECT COUNT(CodigoCliente)
FROM clientes
WHERE ciudad like'madrid';

#9.Cuantos clientes tienen las ciudades que empiezan por M
SELECT count(codigocliente)
FROM clientes 
WHERE CIUDAD LIKE 'm%';

#10.EL codigo de empleado y el numero de clientes al que atiende cada representante de ventas.
SELECT codigoempleadorepventas,COUNT(*) AS total_clientes
FROM clientes
GROUP BY codigoempleadorepventas;

#11.El numero de clientes que no tiene asignado representante de ventas
SELECT COUNT(CODIGOCLIENTE) AS sin_representante
FROM clientes
WHERE codigoempleadorepventas IS NULL; 

#12.Cual fue el primer y ultimo pago que hizo algun cliente. 
SELECT MIN(FechaPago),  MAX(FechaPago)
FROM pagos;

#13.El codigo de cliente de aquellos clientes que hicieron pagos en 2008
SELECT codigocliente
FROM pagos
where fechapago like '2008%';

#14.Los distintos estados por los que puede pasar un pedido.
SELECT DISTINCT estado
FROM pedidos;

#15.El numero de pedidos, codigo de cliente,fecha requerida,fecha de entrega de
#los pedidos que no han sido entregados a tiempo.
SELECT codigopedido,codigopedido,fechaesperada,fechaentrega
FROM pedidos 
WHERE FechaEsperada < fechaentrega;

#16.Cuantos productos existen en cada linea de pedido. 
SELECT COUNT(*),gama
from productos
GROUP BY gama;

#17.Un listado de los 20 codigos de productos mas pedidos ordenados por cantidad
#pedida.
select sum(Cantidad),CodigoProducto
from DetallePedidos
group by CodigoProducto
order by sum(cantidad) desc
limit 20;

#18.El numero de pedido,codigo de cliente ,fecha requerida y fecha de entrega
#de los pedidos cuya fecha de entrega ha sido al menos dos dias antes de 
#la fecha requerida.
SELECT codigopedido,codigocliente,fechaesperada,fechaentrega
FROM pedidos
where FechaEsperada>=ADDDATE(FechaEntrega,2);

#19.La facturacion que ha tenido la empresa en toda la historia,indicando la base
#imponible, el iva y el total facturado
SELECT sum(Cantidad*PrecioUnidad) as baseImponible, 
       sum(Cantidad*PrecioUnidad)*0.18 as iva,
       sum(Cantidad*PrecioUnidad)*1.18 as total
FROM DetallePedidos;

#20.La misma informacion que en la pregunta anterior, pero agrupada por el
#codigo de producto filtrada por los codigo que empiecen por fr.
SELECT sum(Cantidad*PrecioUnidad) as baseImponible, 
       sum(Cantidad*PrecioUnidad)*0.18 as iva,
       sum(Cantidad*PrecioUnidad)*1.18 as total,
       codigoproducto
FROM DetallePedidos
WHERE codigoproducto like 'fr%'
GROUP BY codigoproducto;



