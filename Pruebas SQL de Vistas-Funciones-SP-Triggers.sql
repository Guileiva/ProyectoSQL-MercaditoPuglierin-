-- Seleccionamos la base de datos mercaditopuglierin

USE mercaditopuglierin;

-- Pruebas

-- 1era Vista
SELECT * FROM vistaproveedoresconarticulos;

-- 2da Vista
SELECT * FROM vistahistorialventasxcliente;

-- 3ra Vista
SELECT * FROM VistaCantidadTotalVentasxCliente;

-- 4ra Vista
SELECT * FROM vistaproductosmasvendidos;

-- 5ta Vista
SELECT * FROM vistacomprastotalesxproveedor;

-- FUNCIONES

-- 1era Funcion
SELECT fn_CalcularTotalComprasDeCliente (4) AS "Monto Total";

-- 2da Funcion
SELECT fn_CalcularCantidadVentasdeEmpleado (2) AS "Cantidad Ventas";

-- 3er Funcion
SELECT fn_ObtenerProductoMasVendidoporCategoria (1) AS "Producto mas vendido";

-- 4ta Funcion
SELECT fn_ObtenerProveedorUltimaCompradeProducto (42) AS "Proveedor";

-- STORED PROCEDURES

-- 1er Stored Procedure
CALL SP_InsertarCliente("Pedro", "Perez", 1, "28818599", "San Jeronimo 166", 6, 3512465874, "peter87@gmail.com");
-- Revisar que el cliente fue insertado
SELECT * FROM cliente;

-- para validar que ya existe el cliente con ese numero documento
CALL SP_InsertarCliente("Pablo", "Ramos", 1, "28818599", "9 de julio 567", 6, 3512465875, "pablomarmol@gmail.com");

-- 2do Stored Procedure
CALL SP_InsertarProveedor("Genius SA", 2, "30888471245", "Santa Fe 563", 6, 3512485874, "Genius_sa@gmail.com");
-- Revisar que el proveedor fue ingresado
SELECT * FROM proveedor;

-- para validar que el proveedor ya existe
CALL SP_InsertarProveedor("Genius SRL", 2, "30888471245", "Santa Fe 663", 6, 3512495874, "Genius_sa2@gmail.com");

-- 3er Stored Procedure

CALL SP_InsertarNuevoPedido(3,1,30,2);
-- Revisar que el pedido fue ingresado correctamente 
SELECT p.id_pedido, dp.producto, dp.cantidad 
FROM pedido p
JOIN detalle_pedido dp ON p.id_pedido = dp.pedido;

-- para validar que no hay stock
CALL SP_InsertarNuevoPedido(3,1,30,20);

-- 4to Stored Procedure

CALL SP_RegistrarNuevaCompra(1, 2, 1, 4, 10000);
-- Validar que la compra fue ingresada
SELECT c.Nro_orden_compra, dc.producto, dc.cantidad, p.precio_unitario
FROM compra c
JOIN detalle_compra dc ON c.Nro_orden_compra = dc.Nro_compra
JOIN producto p ON dc.producto = p.id_producto;

-- para validar que actualice tambien el precio
CALL SP_RegistrarNuevaCompra(1, 2, 1, 2, 13000);
-- Validar que la compra fue ingresada y se actualizo el precio del producto que antes era de 15000
SELECT * FROM producto WHERE id_producto = 1;

-- 5to Stored Procedure
-- revisamos el estado del pedido 13, si esta en 1 se deben cambiar a 2 al registrar el pago.
SELECT * FROM pedido
WHERE id_pedido = 13;
CALL SP_RegistrarPago(1,13);

-- para validar el mensaje de que ya esta abonado
CALL SP_RegistrarPago(1,13);

