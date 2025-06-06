USE mysql;

-- Creación de usuarios:

-- Se crean tres usuarios utilizando el comando CREATE USER. 

-- El primer y segundo usuario se crean para tener permisos de solo lectura en todas las tablas. 

CREATE USER IF NOT EXISTS 'user_lectura_1'@'localhost' IDENTIFIED BY 'lectura';
CREATE USER IF NOT EXISTS 'user_lectura_123'@'localhost' IDENTIFIED BY 'lectura123';

-- El tercer usuario se crea para tener permisos de lectura y escritura de datos en todas las tablas.

CREATE USER IF NOT EXISTS 'user_lectura_escritura'@'localhost' IDENTIFIED BY 'lectura_escritura';

-- Utilizamos los comandos ALTER USER Y RENAME USER para modificar la contraseña y cambiar el nombre del Segundo Usuario

RENAME USER 'user_lectura_123'@'localhost' TO 'user_lectura_2'@'localhost'; -- usamos RENAME USER para modificar el nombre

ALTER USER 'user_lectura_2'@'localhost' IDENTIFIED BY 'lectura2'; -- Usamos ALTER USER para modificar la contraseña

-- Con el comando DROP USER eliminamos el Segundo Usuario

DROP USER 'user_lectura_2'@'localhost';

-- Asignacion de permisos a los usuarios creados

-- Se asignan los permisos utilizando el comando GRANT. 

-- Para el primer usuario "user_lectura_1" se le otorga el permiso de lectura SELECT. 

GRANT SELECT ON mercaditopuglierin.* TO 'user_lectura_1'@'localhost';

-- En el caso del usuario "user_lectura_escritura" se le otorgan tanto permisos de escritura como de lectura SELECT, INSERT, UPDATE Y DELETE.

GRANT SELECT, INSERT, UPDATE, DELETE ON mercaditopuglierin.* TO 'user_lectura_escritura'@'localhost'; 

-- Revisamos los permisos asignados a cada uno de los usuarios usando la sentencia SHOW GRANTS.

SHOW GRANTS FOR 'user_lectura_1'@'localhost';

SHOW GRANTS FOR 'user_lectura_escritura'@'localhost';

-- Quitaremos el permiso de eliminacion al usuario "user_lectura_escritura" con el comando REVOKE.

REVOKE DELETE ON mercaditopuglierin.* FROM 'user_lectura_escritura'@'localhost';

-- Verificamos que el permiso fue revocado.

SHOW GRANTS FOR 'user_lectura_escritura'@'localhost';



