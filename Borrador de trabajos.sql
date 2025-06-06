SELECT CalcularTotalComprasDeCliente(2) as "Total Ventas al Cliente";

SELECT p.Razon_Social, p.Telefono, p.Email, a.Nombre_producto, a.Cantidad_Stock
FROM proveedor p
JOIN compra c ON p.id_proveedor = c.Proveedor
JOIN detalle_compra dc ON c.Nro_orden_compra = dc.Nro_Compra
JOIN producto a ON dc.Producto = a.id_producto;

SELECT Nombre_producto, Cantidad_Stock
FROM producto 
WHERE Cantidad_Stock < 5;

SELECT c.Nombre, c.Apellido, pr.Nombre_producto, dp.Precio_Unitario, p.Fecha_pedido
FROM cliente c
JOIN pedido p ON p.Cliente = c.id_cliente
JOIN detalle_pedido dp ON p.id_pedido = dp.Pedido
JOIN producto pr ON dp.Producto = pr.id_producto;

SELECT pr.Nombre_producto, SUM(dp.Cantidad)
FROM producto pr
LEFT JOIN detalle_pedido dp ON pr.id_producto = dp.Producto
GROUP BY pr.Nombre_producto
ORDER BY SUM(dp.Cantidad) DESC
LIMIT 0, 15;

SELECT * FROM VistaProductosMasVendidos;

SELECT * FROM VistaComprasTotalesxProveedor;

SELECT p.Razon_Social AS Proveedor, COUNT(c.Nro_orden_compra) AS "Cantidad Compras", SUM(c.Total_compra) AS "Monto Total"
FROM proveedor p
LEFT JOIN compra c ON c.Proveedor = p.id_proveedor
GROUP BY p.Razon_Social; 

SELECT COUNT(*)
    FROM pedido
    WHERE Empleado = 1;
    
    SELECT CalcularCantidadVentasdeEmpleado(1) AS "Cantidad Ventas";
    
    SELECT ObtenerStockdeProducto("Peceto");
    
    SELECT Cantidad_Stock
    FROM producto
    WHERE Nombre_producto = "Peceto";
    
    SELECT P.Razon_Social
    FROM proveedor p
    JOIN compra c ON p.id_proveedor = c.Proveedor
    JOIN detalle_compra dc ON c.Nro_orden_compra = dc.Nro_Compra
    JOIN producto pr ON dc.Producto = pr.id_producto
    WHERE pr.Nombre_producto = "Coca Cola Zero 2,25L"
    ORDER BY c.Fecha_compra DESC LIMIT 1;
    
    SELECT ObtenerProveedorUltimaCompradeProducto("Coca Cola Zero 2,25L");
    
    SELECT p.Nombre_producto
    FROM producto p
    JOIN detalle_compra dc ON p.id_producto = dc.Producto
    WHERE p.Categoria = "Carnes";
    
    SELECT p.Nombre_producto
    FROM producto p
    WHERE "Carnes" = (
			SELECT prod.Categoria
			FROM producto prod
			LEFT JOIN detalle_pedido dp ON prod.id_producto = dp.Producto
			GROUP BY prod.Categoria
			ORDER BY SUM(dp.Cantidad) DESC
			LIMIT 0, 1
       );
     
     SELECT prod.Categoria, SUM(dp.Cantidad) 
			FROM producto prod
			LEFT JOIN detalle_pedido dp ON prod.id_producto = dp.Producto
			GROUP BY prod.Categoria
			ORDER BY SUM(dp.Cantidad) DESC
			LIMIT 0, 4;
    
    
    SELECT p.Categoria 
    FROM producto p
    WHERE p.id_producto = (
			SELECT pr.id_producto
			FROM producto pr
			LEFT JOIN detalle_pedido dp ON pr.id_producto = dp.Producto
			GROUP BY pr.id_producto
			ORDER BY SUM(dp.Cantidad) DESC
			LIMIT 0, 1
            );
            
-- Funcion para obtener la cantidad disponible en stock de un producto

DELIMITER //
CREATE FUNCTION ObtenerStockdeProducto(ProductoNombre VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE StockProducto INT;
    SELECT Cantidad_Stock
    INTO StockProducto
    FROM producto
    WHERE Nombre_producto = ProductoNombre;
    RETURN StockProducto;
END //
DELIMITER ;

-- probar SP Insertar nuevo pedido

CALL SP_InsertarNuevoPedido(2,3,2,5);

CALL SP_InsertarCliente(
"Pedro", 
    "Lucas",
    1,
    "27717633",
    "9 de julio 1532",
    3,
    351287458,
    "soy@yujsnso.com"
);

CALL SP_RegistrarNuevaCompra(2,1,1,3,13000);

SHOW TRIGGERS;

DROP TRIGGER before_alta_cliente;

INSERT INTO pago (Monto, Metodo_pago, Pedido)
VALUES (55000.00, 2, 22);

CALL SP_RegistrarPago(3,21);


-- Stored Procedure para insertar un nuevo cliente

DELIMITER //
CREATE PROCEDURE SP_InsertarClientePrueba (
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
		INSERT INTO cliente (Nombre, Apellido, Tipo_Documento, Numero_Documento, Direccion, Provincia, Telefono, Email)
		VALUES (p_Nombre, p_Apellido, p_Tipo_Documento, p_Numero_Documento, p_Direccion, p_Provincia, p_Telefono, p_Email);
	
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_alta_cliente
BEFORE INSERT ON cliente
FOR EACH ROW
BEGIN
	  
    IF EXISTS (SELECT 1 FROM cliente WHERE Numero_Documento = NEW.Numero_documento) THEN
		SELECT 'El Cliente ya existe con ID' AS Mensaje, id_cliente 
        FROM cliente 
        WHERE Numero_Documento = p_Numero_Documento;
    END IF;
END //
DELIMITER ;

CALL SP_InsertarClientePrueba(
"Pedro", 
    "Lucas",
    1,
    "27717633",
    "9 de julio 1532",
    3,
    351287458,
    "soy@yujsnso.com"
);









