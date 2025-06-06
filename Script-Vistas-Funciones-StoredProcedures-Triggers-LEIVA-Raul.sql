-- Seleccionamos la base de datos mercaditopuglierin

USE mercaditopuglierin;

/*-------------------- CREACION DE VISTAS --------------------*/

-- VISTA de Historial de Compras por Proveedor con sus Artículos

CREATE OR REPLACE VIEW VistaProveedoresConArticulos AS 
SELECT p.Razon_Social, p.Telefono, p.Email, pr.Nombre_producto, pr.Cantidad_Stock
FROM proveedor p
JOIN compra c ON p.id_proveedor = c.Proveedor
JOIN detalle_compra dc ON c.Nro_orden_compra = dc.Nro_Compra
JOIN producto pr ON dc.Producto = pr.id_producto;

-- VISTA de Historial de Ventas por Cliente

CREATE OR REPLACE VIEW VistaHistorialVentasxCliente AS 
SELECT CONCAT(c.Nombre,' ',c.Apellido) AS Cliente, pr.Nombre_producto, (dp.Cantidad*dp.Precio_Unitario) AS "Monto Total", p.Fecha_pedido
FROM cliente c
JOIN pedido p ON p.Cliente = c.id_cliente
JOIN detalle_pedido dp ON p.id_pedido = dp.Pedido
JOIN producto pr ON dp.Producto = pr.id_producto;

-- VISTA Cantidad Total de Ventas por Cliente 

CREATE OR REPLACE VIEW VistaCantidadTotalVentasxCliente AS 
SELECT c.Nombre, c.Apellido, COUNT(p.id_pedido) AS "Cantidad Total"
FROM cliente c
JOIN pedido p ON p.Cliente = c.id_cliente
GROUP BY c.Nombre, c.Apellido
ORDER BY COUNT(p.id_pedido) DESC
LIMIT 5;

-- VISTA de Productos mas Vendidos

CREATE OR REPLACE VIEW VistaProductosMasVendidos AS
SELECT pr.Nombre_producto, SUM(dp.Cantidad) AS "Total Vendido"
FROM producto pr
JOIN detalle_pedido dp ON pr.id_producto = dp.Producto
GROUP BY pr.Nombre_producto
ORDER BY SUM(dp.Cantidad) DESC
LIMIT 0, 15;

-- VISTA de Compras totales por Proveedor

CREATE OR REPLACE VIEW VistaComprasTotalesxProveedor AS
SELECT p.Razon_Social AS Proveedor, COUNT(c.Nro_orden_compra) AS "Cantidad Compras", SUM(c.Total_compra) AS "Monto Total"
FROM proveedor p
LEFT JOIN compra c ON c.Proveedor = p.id_proveedor
GROUP BY p.Razon_Social; 


/*-------------------- CREACION DE FUNCIONES --------------------*/

-- Funcion para calcular el total de compras de un cliente

DELIMITER //
CREATE FUNCTION fn_CalcularTotalComprasDeCliente(id_cliente INT)
RETURNS DECIMAL(8, 2)
DETERMINISTIC
BEGIN
	DECLARE TotalCompras DECIMAL(8, 2);
    SELECT SUM(p.Total_pedido)
    INTO TotalCompras
    FROM pedido p
    WHERE p.cliente = id_cliente;
    RETURN TotalCompras;
END //
DELIMITER ;

-- Funcion para calcular la cantidad de ventas realizadas por un empleado

DELIMITER //
CREATE FUNCTION fn_CalcularCantidadVentasdeEmpleado(id_empleado INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE CantidadVentas INT;
    SELECT COUNT(*)
    INTO CantidadVentas
    FROM pedido p
    WHERE p.Empleado = id_empleado;
    RETURN CantidadVentas;
END //
DELIMITER ;

-- Funcion para obtener el producto mas vendido de una determinada categoria.

DELIMITER //
CREATE FUNCTION fn_ObtenerProductoMasVendidoporCategoria(CategoriaID INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	DECLARE ProductoNombre VARCHAR(50);
    SELECT p.Nombre_producto
    INTO ProductoNombre
    FROM producto p
    JOIN detalle_pedido dp ON p.id_producto = dp.Producto
    WHERE p.Categoria = CategoriaID
	GROUP BY p.Nombre_producto
	ORDER BY SUM(dp.Cantidad) DESC
    LIMIT 1;
        
    RETURN ProductoNombre;
END //
DELIMITER ;

-- Funcion que devuelva el nombre del proveedor a quien se le hizo la ultima compra de un producto

DELIMITER //
CREATE FUNCTION fn_ObtenerProveedorUltimaCompradeProducto(Producto_id INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	DECLARE ProveedorNombre VARCHAR(50);
    SELECT p.Razon_Social
    INTO ProveedorNombre
    FROM proveedor p
    JOIN compra c ON p.id_proveedor = c.Proveedor
    JOIN detalle_compra dc ON c.Nro_orden_compra = dc.Nro_Compra
    JOIN producto pr ON dc.Producto = pr.id_producto
    WHERE pr.id_producto = Producto_id
    ORDER BY c.Fecha_compra DESC LIMIT 1;
    RETURN ProveedorNombre;
END //


/*-------------------- CREACION DE STORED PROCEDURES --------------------*/

-- Stored Procedure para insertar un nuevo cliente

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

-- Stored Procedure para insertar un nuevo proveedor

DELIMITER //
CREATE PROCEDURE SP_InsertarProveedor (
	p_RazonSocial VARCHAR(50), 
    p_Tipo_Documento INT,
    p_Numero_Documento VARCHAR(15),
    p_Direccion VARCHAR(50),
    p_Provincia INT,
    p_Telefono VARCHAR(20),
    p_Email VARCHAR(50)
)
BEGIN 
	IF EXISTS (SELECT 1 FROM proveedor WHERE Numero_Documento = p_Numero_Documento) THEN
		SELECT 'El proveedor ya existe con ID' AS Mensaje, id_proveedor 
        FROM proveedor 
        WHERE Numero_Documento = p_Numero_Documento;
	ELSE 
		INSERT INTO proveedor (Razon_Social, Tipo_Documento, Numero_Documento, Direccion, Provincia, Telefono, Email)
		VALUES (p_RazonSocial, p_Tipo_Documento, p_Numero_Documento, p_Direccion, p_Provincia, p_Telefono, p_Email);
	END IF; 
END //

DELIMITER ;

-- Stored Procedure para Insertar un nuevo pedido con detalle

DELIMITER //
CREATE PROCEDURE SP_InsertarNuevoPedido (
	p_Cliente INT,
    p_Empleado INT,
    dp_Producto INT,
    dp_Cantidad INT
    
)
BEGIN
	
    DECLARE EstadoPedido INT;
    DECLARE Precio_Producto DECIMAL(8,2);
    DECLARE Total_pedido DECIMAL(8,2);
    DECLARE StockProducto INT;
    
    SET EstadoPedido = 1;
	SET Precio_Producto = (SELECT Precio_unitario FROM producto WHERE id_producto = dp_Producto);
    SET Total_pedido = dp_Cantidad * Precio_Producto;
    SET StockProducto = (SELECT Cantidad_Stock FROM producto WHERE id_producto = dp_Producto);
    
    IF StockProducto > dp_Cantidad THEN
    
		INSERT INTO pedido (Total_pedido, Cliente, Empleado, Estado)
		VALUES (Total_pedido, p_Cliente, p_Empleado, EstadoPedido);
    
		SET @ultimo_pedido_id = LAST_INSERT_ID();
        
		INSERT INTO detalle_pedido (Producto, Cantidad, Precio_Unitario, Pedido)
		VALUES (dp_Producto, dp_Cantidad, Precio_Producto, @ultimo_pedido_id);
      
      ELSE 
		SELECT 'No hay disponibilidad de Stock para este producto' AS Mensaje;
        SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'No hay suficiente stock';
			
	  END IF;
      
END //
DELIMITER ;

-- Stored Procedure para registrar una nueva compra con detalle

DELIMITER //
CREATE PROCEDURE SP_RegistrarNuevaCompra (
	c_Proveedor INT,
    c_Empleado INT,
    dc_Producto INT,
    dc_Cantidad INT,
    dc_Precio_Unitario DECIMAL(8,2)
    
)
BEGIN

	DECLARE Total_compra DECIMAL(8,2);
    SET Total_compra = dc_Cantidad * dc_Precio_Unitario;
    
    INSERT INTO compra (Total_compra, Proveedor, Empleado)
    VALUES (Total_compra, c_Proveedor, c_Empleado);
    
    SET @ultima_compra_id = LAST_INSERT_ID();
        
    INSERT INTO detalle_compra (Producto, Cantidad, Precio_Unitario, Nro_Compra)
    VALUES (dc_Producto, dc_Cantidad, dc_Precio_Unitario, @ultima_compra_id);
        
END //
DELIMITER ;

-- Stored Procedure para registrar un pago

DELIMITER //
CREATE PROCEDURE SP_RegistrarPago (
	p_MetodoPago INT,
    p_Pedido INT
        
)
BEGIN
	DECLARE MontoPedido DECIMAL(8,2);
    DECLARE EstadoPedido INT;
	SET MontoPedido = (SELECT Total_Pedido FROM pedido WHERE id_pedido = p_Pedido);
	SET EstadoPedido = (SELECT Estado FROM pedido WHERE id_pedido = p_Pedido);
    
    IF EstadoPedido = 1 THEN
		INSERT INTO pago (Monto, Metodo_pago, Pedido)
		VALUES (MontoPedido, p_MetodoPago, p_Pedido);
    ELSE
		SELECT 'El Pedido ya se encontraba abonado' AS Mensaje; 
	END IF;        
        
END //
DELIMITER ;





/*-------------------- CREACION DE TRIGGERS --------------------*/

-- Trigger para actualizar el precio y la cantidad de un producto luego de realizar una compra

DELIMITER // 
CREATE TRIGGER trg_ActualizarProducto_AfterCompra
AFTER INSERT
ON detalle_compra
FOR EACH ROW
BEGIN
	
    DECLARE NuevoPrecio DECIMAL(8,2) default 0;
    DECLARE PrecioProdActual DECIMAL(8,2);
        
    SET NuevoPrecio = NEW.Precio_Unitario * 1.30;
    SET PrecioProdActual = (SELECT Precio_Unitario FROM producto WHERE id_producto = NEW.Producto);
    
    IF NuevoPrecio > PrecioProdActual THEN
		UPDATE producto
		SET Precio_Unitario = NuevoPrecio,
			Cantidad_Stock = Cantidad_Stock + NEW.Cantidad
        WHERE id_producto = NEW.Producto;
	ELSE 
		UPDATE producto
		SET Cantidad_Stock = Cantidad_Stock + NEW.Cantidad
        WHERE id_producto = NEW.Producto;
        
	END IF;
    
END //

DELIMITER ;

-- Trigger para actualizar la cantidad de un producto luego de realizar un pedido

DELIMITER // 
CREATE TRIGGER trg_ActualizarProducto_AfterPedido
AFTER INSERT
ON detalle_pedido
FOR EACH ROW
BEGIN
	
    UPDATE producto
	SET Cantidad_Stock = Cantidad_Stock - NEW.Cantidad
	WHERE id_producto = NEW.Producto;
	     
END //
DELIMITER ;

-- Trigger para actualizar el estado de un pedido luego de realizar el pago

DELIMITER // 
CREATE TRIGGER trg_ActualizarEstadoPedido_AfterPago
AFTER INSERT
ON pago
FOR EACH ROW
BEGIN
	        
    UPDATE pedido
	SET Estado = 2
	WHERE id_pedido = NEW.Pedido;
	     
END //
DELIMITER ;
 
