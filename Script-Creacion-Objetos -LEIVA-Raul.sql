-- Se crea la Base de datos

CREATE DATABASE IF NOT EXISTS MercaditoPuglierin;

-- usamos la Base de datos creada

USE MercaditoPuglierin;

-- Se crean las tablas 

-- Tabla Tipo_Documento
CREATE TABLE tipo_documento (
	id_tipo_documento INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Descripcion VARCHAR(20) NOT NULL
);

-- Tabla Cliente
CREATE TABLE cliente (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Nombre VARCHAR(50) NOT NULL,
	Apellido VARCHAR(50) NOT NULL,
	Tipo_Documento INT UNIQUE NOT NULL,
	Numero_Documento INT UNIQUE NOT NULL,
	Direccion VARCHAR(50),
	Telefono VARCHAR(20),	
	Email VARCHAR(50),
	Fecha_Registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Tipo_Documento) REFERENCES tipo_documento(id_tipo_documento)
);

-- Tabla Empleado
CREATE TABLE empleado (
	id_empleado INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Nombre VARCHAR(50) NOT NULL,
	Apellido VARCHAR(50) NOT NULL,
	Tipo_Documento INT UNIQUE NOT NULL,
	Numero_Documento INT UNIQUE NOT NULL,
	Direccion VARCHAR(50),
	Telefono VARCHAR(20) NOT NULL,
	Email VARCHAR(50) NOT NULL,
	Fecha_nacimiento DATE NOT NULL,
    Fecha_ingreso DATETIME NOT NULL,
	Fecha_Registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Tipo_Documento) REFERENCES tipo_documento(id_tipo_documento)
);

-- Tabla Proveedor
CREATE TABLE proveedor (
	id_proveedor INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Razon_Social VARCHAR(50) NOT NULL,
	Tipo_Documento INT UNIQUE NOT NULL,
	Numero_Documento INT UNIQUE NOT NULL,
	Direccion VARCHAR(50),
	Telefono VARCHAR(20) NOT NULL,
	Email VARCHAR(50) NOT NULL,
	Fecha_Registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Tipo_Documento) REFERENCES tipo_documento(id_tipo_documento)
);

-- Tabla Categoria
CREATE TABLE categoria (
	id_categoria INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Descripcion VARCHAR(20) NOT NULL
);

-- Tabla Producto
CREATE TABLE producto (
	id_producto INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Nombre_producto VARCHAR(50) NOT NULL,
    Precio_unitario DECIMAL(8, 2) NOT NULL,
    Cantidad_Stock INT DEFAULT 0 NOT NULL, 
    Categoria INT NOT NULL,
    FOREIGN KEY (Categoria) REFERENCES categoria(id_categoria)
);

-- Tabla Estado_Pedido
CREATE TABLE estado_pedido (
	id_estado_pedido INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Descripcion VARCHAR(20) NOT NULL
);

-- Tabla Pedido
CREATE TABLE pedido (
	id_pedido INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Fecha_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    Total_pedido DECIMAL(8, 2) NOT NULL,
    Cliente INT NOT NULL, 
    Empleado INT NOT NULL,
    Estado INT NOT NULL,
    FOREIGN KEY (Cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (Empleado) REFERENCES empleado(id_empleado),
    FOREIGN KEY (Estado) REFERENCES estado_pedido(id_estado_pedido)
);

-- Tabla Detalle_Pedido
CREATE TABLE detalle_pedido (
	id_detalle_pedido INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Producto INT NOT NULL,
    Cantidad INT NOT NULL,
    Precio_Unitario DECIMAL(8, 2) NOT NULL,
    Pedido INT NOT NULL,
    FOREIGN KEY (Pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (Producto) REFERENCES producto(id_producto)
);
    
-- Tabla Metodo_Pago
CREATE TABLE metodo_pago (
	id_metodo_pago INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Descripcion VARCHAR(20) NOT NULL
);

-- Tabla Pago
CREATE TABLE pago (
	id_pago INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Monto DECIMAL(8, 2) NOT NULL,
    Fecha_pago DATETIME DEFAULT CURRENT_TIMESTAMP,
    Metodo_pago INT NOT NULL,
    Pedido INT NOT NULL,
    FOREIGN KEY (Pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (Metodo_pago) REFERENCES metodo_pago(id_metodo_pago)
);

-- Tabla Compra
CREATE TABLE Compra (
	Nro_orden_compra INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Fecha_compra DATETIME DEFAULT CURRENT_TIMESTAMP,
    Total_compra DECIMAL(8, 2) NOT NULL,
    Proveedor INT NOT NULL, 
    Empleado INT NOT NULL,
    FOREIGN KEY (Proveedor) REFERENCES proveedor(id_proveedor),
    FOREIGN KEY (Empleado) REFERENCES empleado(id_empleado)
);

-- Tabla Detalle_Compra
CREATE TABLE detalle_compra (
	id_detalle_compra INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Producto INT NOT NULL,
    Cantidad INT NOT NULL,
    Precio_Unitario DECIMAL(8, 2) NOT NULL,
    Nro_Compra INT NOT NULL,
    FOREIGN KEY (Nro_Compra) REFERENCES compra(Nro_orden_compra),
    FOREIGN KEY (Producto) REFERENCES producto(id_producto)
);
