CREATE DATABASE Ventas_Tech_DB;

/*eliminación de tablas*/
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;

/*creación de la tabla categorías*/
CREATE TABLE Categorias(
ID_categoria int NOT NULL PRIMARY KEY,
nombre_categoria varchar (50),
descripcion varchar (200)
);

/*creación de la tabla clientes*/
CREATE TABLE Clientes(
ID_cliente int NOT NULL  PRIMARY KEY,
Nombre varchar (100) NOT NULL,
Email varchar (100) UNIQUE,
Ciudad varchar (50),
Fecha_de_registro DATE NOT NULL
);

/*creación de la tabla tipo de producto*/
CREATE TABLE Productos(
ID_producto INT NOT NULL PRIMARY KEY,
Nombre_producto varchar (100) NOT NULL,
ID_categoria INT, FOREIGN KEY (ID_categoria) REFERENCES Categorias (ID_categoria),
Precio DECIMAL(10,2) NOT NULL,
Stock INT DEFAULT 0,
Activo TINYINT DEFAULT 1
);

/*creación de la tabla de ventas*/
CREATE TABLE Ventas(
ID_venta INT NOT NULL PRIMARY KEY,
ID_cliente INT, FOREIGN KEY (ID_cliente) REFERENCES Clientes (ID_cliente),
ID_producto INT, FOREIGN KEY (ID_producto) REFERENCES Productos (ID_producto),
Cantidad INT NOT NULL,
Precio_unitario DECIMAL (10,2) NOT NULL,
Fecha_venta DATE NOT NULL
);

/*Inserción de datos en categorías*/
INSERT INTO Categorias VALUES (1, 'Computación', 'Laptops, PCs y monitores');
INSERT INTO Categorias VALUES (2, 'Accesorios', 'Periféricos y complementos');
INSERT INTO Categorias VALUES (3, 'Audio', 'Auriculares y parlantes');
INSERT INTO Categorias VALUES (4, 'Almacenamiento', 'Discos y memorias');
SELECT * FROM Categorias

/*Inserción de datos en clientes*/
INSERT INTO Clientes VALUES (1, 'María López',   'maria@mail.com',   'Buenos Aires', '2024-01-05');
INSERT INTO Clientes VALUES (2, 'Carlos Ruiz',   'carlos@mail.com',  'Córdoba',      '2024-01-10');
INSERT INTO Clientes VALUES (3, 'Ana Gómez',     'ana@mail.com',     'Rosario',      '2024-02-01');
INSERT INTO Clientes VALUES (4, 'Pedro Sanz',    'pedro@mail.com',   'Mendoza',      '2024-02-15');
INSERT INTO Clientes VALUES (5, 'Laura Torres',  'laura@mail.com',   'Tucumán',      '2024-03-01');
SELECT * FROM Clientes

/*Inserción de datos en productos*/
INSERT INTO Productos VALUES (1, 'Laptop Pro 15',       1, 1200.00, 15, 1);
INSERT INTO Productos VALUES (2, 'Mouse Inalámbrico',   2,   28.00, 80, 1);
INSERT INTO Productos VALUES (3, 'Monitor 4K 27"',      1,  450.00, 12, 1);
INSERT INTO Productos VALUES (4, 'Auriculares BT Pro',  3,  120.00, 35, 1);
INSERT INTO Productos VALUES (5, 'SSD Externo 1TB',     4,  130.00, 18, 1);
INSERT INTO Productos VALUES (6, 'Teclado Mecánico',    2,   95.00, 40, 1);
SELECT * FROM Productos

/*Inserción de datos de ventas*/
INSERT INTO Ventas VALUES (1,  1, 1, 2, 1200.00, '2024-03-05');
INSERT INTO Ventas VALUES (2,  2, 2, 5,   28.00, '2024-03-06');
INSERT INTO Ventas VALUES (3,  3, 3, 1,  450.00, '2024-03-07');
INSERT INTO Ventas VALUES (4,  1, 4, 2,  120.00, '2024-03-08');
INSERT INTO Ventas VALUES (5,  4, 5, 3,  130.00, '2024-03-10');
INSERT INTO Ventas VALUES (6,  2, 6, 4,   95.00, '2024-03-11');
INSERT INTO Ventas VALUES (7,  5, 1, 1, 1200.00, '2024-03-12');
INSERT INTO Ventas VALUES (8,  3, 2, 8,   28.00, '2024-03-13');
INSERT INTO Ventas VALUES (9,  4, 4, 1,  120.00, '2024-03-14');
INSERT INTO Ventas VALUES (10, 5, 3, 2,  450.00, '2024-03-15');
SELECT * FROM Ventas

