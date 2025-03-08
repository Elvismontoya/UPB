CREATE TABLE Clientes (
ID INTEGER PRIMARY KEY AUTOINCREMENT,
Nombre TEXT,
Correo_Electronico TEXT,
Telefono NUMERIC
);

CREATE TABLE Productos (
ID_Producto INTEGER PRIMARY KEY AUTOINCREMENT,
Nombre TEXT,
Precio NUMERIC,
Stock NUMERIC
);

CREATE TABLE Pedidos (
ID_Pedido INTEGER PRIMARY KEY AUTOINCREMENT,
Fecha TEXT,
Total_compra NUMERIC,
ID_Cliente INTEGER,
FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID)
);

CREATE TABLE Detalle_Pedido (
ID_Pedidos INTEGER,
ID_Productos INTEGER,
Cantidad INTEGER,
PRIMARY KEY (ID_Pedidos, ID_Productos),
FOREIGN KEY (ID_Pedidos) REFERENCES Pedidos(ID_Pedido),
FOREIGN KEY (ID_Productos) REFERENCES Productos(ID_Producto)
);

INSERT INTO Clientes(Nombre, Correo_Electronico, Telefono)
VALUES ('Elvis Montoya','em05654@gmail.com',32054654231),
	   ('Mateo','MAT54@gmail.com',156321315)

INSERT INTO Productos (Nombre, Precio, Stock)
VALUES ('Takis', 3000.50, 20),
       ('Doritos', 2000.75, 15),
       ('Detodito', 2500.30, 30);

INSERT INTO Pedidos (ID_Cliente, Fecha, Total_compra)
VALUES (1, '2025-03-08', 3000.50),
       (2, '2025-03-09', 2000.30);

INSERT INTO Detalle_Pedido(ID_Pedidos,ID_Productos,Cantidad)
VALUES (1,1,3),
	   (2,2,6);
	   
SELECT * FROM Clientes
SELECT Nombre, ID_Pedido, Fecha, Total_compra FROM  Clientes, Pedidos 
SELECT Nombre, Cantidad, Total_compra FROM Productos, Pedidos, Detalle_Pedido

