#1Crea un usuario llamado paco@localhost con la sintaxis create user con permisos
#de solo conexión y comprueba que se puede conectar

CREATE USER paco IDENTIFIED BY root;

#2Crea un usuario llamado juan@localhost con la sintaxis grant con permisos de solo 
#conexion y comprueba que se pueda conectar.

CREATE USER juan IDENTIFIED BY root;

#3Otorga al usuario paco@localhost permisos de select en la tabla jardineria.clientes
#y comprueba que se puede consultar la tabla

GRANT SELECT ON jardineria.*clientes TO paco;

#4.Otorga al usuario juan@localhost permisos de select, insert y update en las 
#tablas de la base de datos jardineria con opcion GRANT

GRANT SELECT, INSERT,UPDATE ON jardineria.* TO juan; 

GRANT SELECT ON jardineria.* TO juan; 

GRANT INSERT ON jardineria.* TO juan;

GRANT UPDATE ON jardineria.* TO juan;

#5.Conéctate co el usuario juan y otorga permisos de selección en la tabla
#jardineria.empleados

GRANT SELECT ON jardineria.empleados TO juan;

#6.Quítale ahora los permisos a paco de seleccion en la tabla jardineria.empleados

REVOKE SELECT ON jardineria.empleados FROM paco;

#7.Conéctate con root y elimina todos los permisos que has concedido a Paco
#y juan
REVOKE ALL PRIVILEGES ON *.* FROM paco,juan;

#8.Otorga a Juan los permisos de SELECT sobre las columnas CodigoOficina y Ciudad
#de la tabla Oficinas de la base de datos jardineria.
GRANT SELECT ON jardineria.codigooficina,ciudad TO juan;

#9.Conectate con juan y ejecuta el query 'SELECT' * from jardineria.Oficinas
#¿que sucede?

#NO TE DEJA.

#10.Borra el usuario paco@localhost

DELETE FROM mysql.user WHERE USER = 'paco';  


GRANT SELECT jjardineriaadineria.codigooficina,

