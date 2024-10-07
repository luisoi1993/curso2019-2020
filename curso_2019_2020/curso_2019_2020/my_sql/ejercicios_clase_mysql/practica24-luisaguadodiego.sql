#Crea la tabla Empleados2_baja con la siguiente estructura:
 
CREATE TABLE Empleados2_baja (
		nif varchar(4),
		nomEmple varchar(20),
		codJefe varchar(4),
		salario INT(5),
		usuario VARCHAR(20),
		fecha DATE,
		PRIMARY KEY (nif),
		FOREIGN KEY (codJefe) REFERENCES Empleados2 (nif) ON DELETE CASCADE
)engine=INNODB;

#Crea un trigger que inserte una fila en la tabla Empleados2_baja cuando se borre una fila en la tabla
#Empleados2 creada en el ejercicio 1 de esta práctica. Los datos que se insertan son los correspondientes
#al empleado que se da de baja en la tabla Empleados2. En los campos usuario y fecha se guardarán el
#usuario de la base de datos que ejecuta la sentencia DML y la fecha actual.


DELIMITER |
CREATE OR REPLACE TRIGGER bajas
AFTER DELETE ON empleados2
FOR EACH ROW
BEGIN
INSERT INTO empleados_baja VALUES (:old.dni,:old.nomemp,:old.codjefe,
:old.salario, USER, SYSDATE);
END; |

DELIMITER;
