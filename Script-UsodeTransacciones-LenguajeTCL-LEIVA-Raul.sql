-- Seleccionamos la base de datos mercaditopuglierin

USE mercaditopuglierin;


-- Se va a insertar un nuevo registro en la tabla "cliente" mediante el uso de una  transaccion y el uso de commit y rollback
-- para la insercion, usamos el procedimiento almacenado "SP_InsertarCliente" que visualizamos a continuacion:
/* 
DELIMITER //
CREATE PROCEDURE SP_InsertarCliente (
	p_Nombre VARCHAR(50), 
    p_Apellido VARCHAR(50),
    p_Tipo_Documento INT,
    p_Numero_Documento VARCHAR(15),
    p_Direccion VARCHAR(50),
    p_Provincia INT,
    p_Telefono VARCHAR(20),
    p_Email VARCHAR(50)
)
BEGIN 
	IF EXISTS (SELECT 1 FROM cliente WHERE Numero_Documento = p_Numero_Documento) THEN
		SELECT 'El Numero d	e Documento ya tiene asociado un Cliente' AS Mensaje, id_cliente 
        FROM cliente 
        WHERE Numero_Documento = p_Numero_Documento;
	ELSE 
		INSERT INTO cliente (Nombre, Apellido, Tipo_Documento, Numero_Documento, Direccion, Provincia, Telefono, Email)
		VALUES (p_Nombre, p_Apellido, p_Tipo_Documento, p_Numero_Documento, p_Direccion, p_Provincia, p_Telefono, p_Email);
	END IF;
END //

DELIMITER ;
*/

-- Iniciamos la transaccion

START TRANSACTION;

CALL SP_InsertarCliente("Jose","Dominguez", 1, 37939411, "Los Paraisos 234", 6,3517895145, "domingol@gmail.com");

-- Confirmamos la transaccion mediante el uso de Commit

COMMIT; 

-- revisamos que el cliente fue insertado
SELECT * FROM cliente;


/* Insertaremos otros registros, pero en esta oportunidad se crearan puntos de restauracion 
para poder volver a dichos puntos sin tener que revertir la transaccion completa.*/

START TRANSACTION;

CALL SP_InsertarCliente("Martin","Genius", 1, 37939811, "La Salada 27", 6,3513424125, "somos_genius@hotmail.com");
SAVEPOINT primer_registro; -- creamos el primer punto de restauracion.

CALL SP_InsertarCliente("Arabella","Quiñonez", 1, 17364127, "Independencia 56", 6,3516147124, "qarabella@gmail.com");
SAVEPOINT segundo_registro; -- creamos el segundo punto de restauracion.

CALL SP_InsertarCliente("Josefa","Eliatore", 1, 17364127, "La dominga 3 lote 5", 6,3519874135, "jose_elia@hotmail.com");
SAVEPOINT tercer_registro; -- creamos el tercer punto de restauracion.

-- retornamos al segundo punto de restauracion, ya que el ultimo ingreso dara error por tener el mismo Numero de Documento del registro anterior.
ROLLBACK TO segundo_registro;

-- confirmamos la transaccion.

COMMIT; 

-- revisamos que los primeros 2 clientes fueron insertados
SELECT * FROM cliente;
