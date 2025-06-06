-- Seleccionamos la base de datos mercaditopuglierin

USE mercaditopuglierin;

-- Consultas SQL para la generación de los informes:

-- INFORMES DE PRODUCTOS

-- Listado de Productos mas vendidos:
SELECT * FROM VistaProductosMasVendidos;

-- Listado del Stock de los productos:
SELECT Nombre_Producto AS Producto, Cantidad_Stock AS "Cantidad en Stock"
FROM producto
ORDER BY Cantidad_Stock DESC;

-- Informe que muestra el producto mas vendido por categoria
SELECT fn_ObtenerProductoMasVendidoporCategoria(1) AS "Producto mas Vendido";

-- INFORME DE CLIENTES

-- Listado de los 5 clientes con mayor cantidad de ventas.
SELECT * FROM VistaCantidadTotalVentasxCliente;

-- Listado de las ventas realizadas a cada cliente.
SELECT * FROM VistaHistorialVentasxCliente;

-- Informe que muestra el monto total de compras de un cliente especifico
SELECT fn_CalcularTotalComprasDeCliente(4) AS "Monto Total";

-- INFORMES DE PROVEEDORES

-- Informe con el Monto Total de compras por cada proveedor
SELECT * FROM VistaComprasTotalesxProveedor;

-- Informe con el Historial de Compras por Proveedor con el detalle de los articulos comprados
SELECT * FROM VistaProveedoresConArticulos;






