-- Seleccionamos la base de datos mercaditopuglierin

USE mercaditopuglierin;

-- INSERTAMOS LOS DATOS EN LAS TABLAS --

-- Tabla tipo_documento

INSERT INTO tipo_documento (Descripcion)
VALUES 
	("D.N.I."),
	("C.U.I.T."),
	("Libreta Civica"),
	("L.E."),
	("Pasaporte");

-- Tabla Provincia

INSERT INTO provincia (Nombre)
VALUES 
	("Buenos Aires"),
	("Ciudad Autónoma de Buenos Aires"),
	("Catamarca"),
	("Chaco"),
	("Chubut"),
	("Córdoba"),
	("Corrientes"),
	("Entre Ríos"),
	("Formosa"),
	("Jujuy"),
	("La Pampa"),
	("La Rioja"),
	("Mendoza"),
	("Misiones"),
	("Neuquén"),
	("Río Negro"),
	("Salta"),
	("San Juan"),
	("San Luis"),
    ("Santa Cruz"),
	("Santa Fe"),
	("Santiago del Estero"),
	("Tierra del Fuego"),
	("Tucuman");
    
    -- Tabla cliente

INSERT INTO cliente (Nombre, Apellido, Tipo_Documento, Numero_Documento, Direccion, Provincia, Telefono, Email)
VALUES
	("Francisco", "Alvarez", 1, "33526952", "9 de julio 1532", 6, 3516359426, "fran_alvarez@gmail.com"),
	("Jimena", "Loperato", 1, "25364785", "Obispo Oro 345", 6, 3513452159, "jloperato@gmail.com"),
    ("Sofia", "Gomez", 5, "AAH800715", "Caseros 100", 6, 3515895423, "sofi87@yahoo.com"),
    ("Amilcar", "Vicario", 1, "40568124", "Av. Virgen del Valle 789", 3, 3834368741, "a_milcar@gmail.com"),
    ("Adrian", "Roccio", 5, "ABR700587", "Duarte Quiros 2145", 6, 3513251547, "aroccio@hotmail.com"),
    ("Miriam", "Garcia", 1, "23564833", "Av. Santa Fe 167", 6, 3512456879, "ga_miri@gmail.com"),
    ("Francisco", "Vera", 1, "40568452", "Manuel Esteban Pizarro 1899", 6, 3515856532, "veravera87@ncr.com.ar"),
    ("Cecilia", "Amarillo", 1, "30411537", "Av. Libertad 43", 2, 1152456874, "chechuyellow@gmail.com"),
	("Gonzalo", "Vaquero", 1, "45456874", "Ciudad de la Paz 456", 1, 1123654125, "gonvaquero@frc.utn.edu.ar"),
    ("Joaquin", "Naranjo", 5, "AAG801785", "Independencia 874", 6, 3516348137, "jnaranjo@yahoo.com");
    
-- Tabla Empleado

INSERT INTO empleado (Nombre, Apellido, Tipo_Documento, Numero_Documento, Direccion, Provincia, Telefono, Email, Fecha_nacimiento, Fecha_ingreso)
VALUES
	("Martin", "Puglierin", 1, "25996321", "Sarmiento 43", 6,  3513475869, "martinpuglierin@gmail.com", "1977-05-19", "2010-02-14"),
    ("Anabella", "Puglierin", 1, "27414522", "Sol de Mayo 764", 6, 3518147454, "an_puglierin@gmail.com", "1979-03-02", "2010-02-14"),
    ("Mabel", "Martinez", 1, "33584745", "Av. Colon 2334", 6, 3514784165, "mamartinez@gmail.com", "1989-11-05", "2010-06-01"),
    ("Jose", "Cortese", 1, "44029417", "Laprida 78", 6, 3516129856, "cortese_jose@gmail.com", "2004-09-16", "2023-03-01");
    
-- Tabla Proveedor

INSERT INTO proveedor (Razon_Social, Tipo_Documento, Numero_Documento, Direccion, Provincia, Telefono, Email)
VALUES
	("Frigorifico San Antonio SRL", 2, "30999254156", "Capilla de los Remedios KM 8.5", 6, 3512031478, "frigorificosanantonio@gmail.com"),
	("760 Bebidas SAS", 2, "30417845255", "Julio A. Roca 760", 6, 3514685077, "760bebidas@gmail.com"),
    ("Cordoba Drinks", 2, "30744228566", "Aviador Richardson 1692", 6, 3514656068, "drinkscordoba@gmail.com"),
    ("Nuevo Aviccat SRL", 2, "30254145843", "Arturo Illia 587", 3, 3834024678, "nuevoaviccat@yahoo.com"),
    ("Cuesta del Portezuelo SA", 2, "30999228567", "Sarmiento 789", 3, 3834784541, "cuestadelportezuelo@gmail.com"),
    ("Mirta Gimenez", 1, "17841471", "Camino los Tres Cruces", 3, 3834611475, "mirti78@hotmail.com");
    
-- Tabla Categoria

INSERT INTO categoria (Descripcion)
VALUES
	("Carnes Vacunas"),
    ("Productos Avicolas"),
    ("Dulces Regionales"),
    ("Productos Regionales"),
    ("Bebidas");
    
-- Tabla Producto

INSERT INTO producto (Nombre_producto, Precio_unitario, Cantidad_Stock, Categoria)
VALUES
	("Peceto", 15000.00, 5, 1),
    ("Cuadrada", 11000.00, 4, 1),
    ("Tortuguita", 9500.00, 7, 1),
    ("Osobuco", 7700.00, 4, 1),
    ("Tapa de Nalga", 10000.00, 5, 1),
    ("Nalga", 13800.00, 10, 1),
    ("Bola de Lomo", 11000.00, 5, 1),
    ("Cuadril", 13000.00, 7, 1),
    ("Colita de Cuadril", 14000.00, 6, 1),
    ("Lomo", 18000.00, 10, 1),
    ("Bife Angosto", 12000.00, 10, 1),
    ("Vacio", 15000.00, 7, 1),
    ("Bife Ancho", 12000.00, 10, 1),
    ("Asado", 13000.00, 9, 1),
    ("Entraña", 20000.00, 10, 1),
    ("Falda", 7400.00, 10, 1),
    ("Matambre", 9500.00, 6, 1),
    ("Tapa de Asado", 11500.00, 3, 1),
    ("Roast Beaf", 11000.00, 5, 1),
    ("Paleta", 10800.00, 4, 1),
    ("Palomita", 9500.00, 10, 1),
    ("Bife Americano", 13000.00, 7, 1),
    ("Carnaza Común", 7400.00, 8, 1),
    ("Chorizo de Cerdo", 10500.00, 15, 1),
    ("Chorizo Bombon", 15200.00, 12, 1),
    ("Morcilla", 6400.00, 10, 1),
    ("Chinchulin", 9200.00, 6, 1),
    ("Molleja", 28000.00, 6, 1),
    ("Riñon", 8650.00, 5, 1),
    ("Milanesa de Carne", 11650.00, 18, 1),
    ("Milanesa de Pollo", 9690.00, 13, 2),
    ("Pollo", 4650.00, 30, 2),
    ("Pechuga", 12000.00, 20, 2),
    ("Pata Muslo", 3600.00, 20, 2),
    ("Alita", 2500.00, 10, 2),
    ("Maple de Huevos Color", 7650.00, 15, 2),
    ("Huevos Color - Docena", 4100.00, 20, 2),
    ("Huevos Color - Media Docena", 2100.00, 20, 2),
    ("Maple de Huevos Blancos", 6700.00, 14, 2),
    ("Huevos Blancos - Docena", 4000.00, 18, 2),
    ("Huevos Blancos - Media Docena", 2000.00, 18, 2),
    ("Dulce de Membrillo 2Kg", 7000.00, 7, 3),
    ("Dulce de Batata 2Kg", 5000.00, 8, 3),
    ("Tamales x Unidad", 2500.00, 100, 4),
    ("Tamales x Docena", 25000.00, 30, 4),
    ("Humitas x Unidad", 2500.00, 100, 4),
    ("Humitas x Docena", 25000.00, 25, 4),
    ("Coca Cola Original 1,5L", 2760.00, 10, 5),
    ("Coca Cola Original 500ml", 1240.00, 10, 5),
    ("Coca Cola Original 2,25L", 4120.00, 10, 5),
    ("Coca Cola Zero 1,5L", 2760.00, 12, 5),
    ("Coca Cola Zero 500ml", 1240.00, 12, 5),
    ("Coca Cola Zero 2,25L", 4120.00, 12, 5),
    ("Fanta Naranja 1,5L", 2760.00, 10, 5),
    ("Fanta Naranja 500ml", 1240.00, 10, 5),
    ("Fanta Naranja 2,25L", 3745.00, 10, 5),
    ("Fanta Naranja Zero 1,5L", 2760.00, 10, 5),
    ("Fanta Naranja Zero 500ml", 1240.00, 10, 5),
    ("Fanta Naranja Zero 2,25L", 3745.00, 10, 5),
    ("Sprite 1,5L", 2760.00, 7, 5),
    ("Sprite 500ml", 1240.00, 8, 5),
    ("Sprite 2,25L", 3745.00, 5, 5),
    ("Sprite Zero 1,5L", 2460.00, 4, 5),
    ("Sprite Zero 500ml", 1240.00, 6, 5),
    ("Sprite Zero 2,25L", 3745.00, 3, 5);
    
-- Tabla Estado_pedido

INSERT INTO estado_pedido (Descripcion)
VALUES
	("Pendiente"),
    ("Entregado");

-- Tabla Pedido

INSERT INTO pedido (Total_pedido, Cliente, Empleado, Estado)
VALUES 
	(36220.00, 3, 2, 2),
    (25000.00, 5, 1, 2),
	(42680.00, 3, 3, 2),
    (73240.00, 6, 2, 2),
    (30700.00, 2, 4, 2),
    (30000, 1, 1, 2),
    (77700.00, 7, 3, 2),
    (15000.00, 2, 2, 2),
    (14410.00, 3, 4, 2),
    (17760.00, 4, 1, 2),
    (7000.00, 8, 3, 2),
    (11395.00, 9, 2, 2),
    (13000.00, 10, 4, 1);
  
  -- Tabla Detalle_Pedido

INSERT INTO detalle_pedido (Producto, Cantidad, Precio_Unitario, Pedido)
VALUES 
	(1, 2, 15000.00, 1),
	(38, 1, 2100.00, 1),
    (50, 1, 4120.00, 1),
    (45, 1, 25000.00, 2),
    (30, 2, 11650.00, 3),
    (31, 2, 9690.00, 3),
    (9, 3, 14000.00, 4),
    (18, 2, 11500.00, 4),
    (50, 2, 4120.00, 4),
    (33, 2, 12000.00, 5),
    (39, 2, 6700.00, 5),
    (47, 1, 25000.00, 6),
    (43, 1, 5000.00, 6),
    (15, 1.5, 20000.00, 7),
    (28, 1, 28000.00, 7),
    (27, 1, 9200.00, 7),
    (24, 1, 10500.00, 7),
    (46, 6, 2500.00, 8),
    (30, 2, 11650.00, 9),
    (57, 1, 2760.00, 9),
    (2, 1, 11000.00, 10),
    (40, 1, 4000.00, 10),
    (48, 1, 2760.00, 10),
    (42, 1, 7000.00, 11),
    (36, 1, 7650.00, 12),
    (65, 1, 3745.00, 12),
    (22, 1, 13000.00, 13);
    
-- Tabla Medodo_Pago

INSERT INTO metodo_pago (Descripcion)
VALUES 
	("Efectivo"),
    ("Tarjeta de Débito"),
    ("Tarjeta de Crédito"),
    ("Billetera Electrónica"),
    ("Transferencia");
    
-- Tabla Pago

INSERT INTO pago (Monto, Metodo_pago, Pedido)
VALUES
	(36220.00, 2, 1),
    (25000.00, 4, 2),
    (42680.00, 4, 3),
    (73240.00, 3, 4),
    (30700.00, 4, 5),
    (30000.00, 2, 6),
    (77700.00, 5, 7),
    (15000.00, 1, 8),
    (14410.00, 1, 9),
    (17760.00, 2, 10),
    (7000.00, 1, 11),
    (11395.00, 4, 12),
    (13000.00, 1, 13);
    
 -- Tabla Compra
 
 INSERT INTO compra (Total_compra, Proveedor, Empleado)
 VALUES
	(105000.00, 1, 1),
    (166775.00, 4, 1),
    (42000.00, 5, 2),
    (350000.00, 6, 2),
    (46144.00, 2, 2);
    
-- Tabla Detalle_Compra

INSERT INTO detalle_compra (Producto, Cantidad, Precio_Unitario, Nro_Compra)
VALUES
	(18, 5, 8050.00, 1),
    (20, 5, 7560.00, 1),
    (4, 5, 5390.00, 1),
    (32, 15, 3255.00, 2),
    (33, 10, 8400.00, 2),
    (34, 10, 2520.00, 2),
    (35, 5, 1750.00, 2),
    (42, 5, 4900.00, 3),
    (43, 5, 3500.00, 3),
    (45, 5, 17500.00, 4),
    (47, 5, 17500.00, 4),
    (50, 8, 2884.00, 5),
    (53, 8, 2884.00, 5);
    
    
    
 