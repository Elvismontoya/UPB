CREATE TABLE Clientes (
ID INTEGER PRIMARY KEY AUTOINCREMENT,
Nombre TEXT,
Correo_Electronico TEXT,
Telefono NUMERIC
)

CREATE TABLE Productos (
ID_Producto INTEGER PRIMARY KEY AUTOINCREMENT,
Nombre TEXT,
Precio NUMERIC,
Stock NUMERIC
)

CREATE TABLE Pedidos (
ID_Pedido INTEGER PRIMARY KEY AUTOINCREMENT,
Fecha TEXT,
Total_compra NUMERIC,
ID_Cliente INTEGER,
FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID)
)

CREATE TABLE Detalle_Pedido (
ID_Pedido INTEGER,
ID_Producto INTEGER,
Cantidad INTEGER,
PRIMARY KEY (ID_Pedido, ID_Producto),
FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID_Pedido),
FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto)
)

INSERT INTO Clientes(Nombre, Correo_Electronico, Telefono)
VALUES ('Elvis Montoya','em05654@gmail.com',32054654231),
	   ('Mateo','MAT54@gmail.com',156321315)

INSERT INTO Productos (Nombre, Precio, Stock)
VALUES ('Takis', 3000.50, 20),
       ('Doritos', 2000.75, 15),
       ('Detodito', 2500.30, 30)

INSERT INTO Pedidos (ID_Cliente, Fecha, Total_compra)
VALUES (1, '2025-03-08', 3000.50),
       (2, '2025-03-09', 2000.30)

INSERT INTO Detalle_Pedido(ID_Pedido,ID_Producto,Cantidad)
VALUES (1,1,3),
	   (2,2,6)
	   
SELECT * FROM Clientes

SELECT Pedidos.ID_Pedido, Clientes.Nombre, Pedidos.Fecha, SUM(Productos.Precio * Detalle_Pedido.Cantidad) AS Total_compra FROM Pedidos
JOIN Clientes ON Pedidos.ID_Cliente = Clientes.ID
JOIN Detalle_Pedido ON Pedidos.ID_Pedido = Detalle_Pedido.ID_Pedido
JOIN Productos ON Detalle_Pedido.ID_Producto = Productos.ID_Producto
GROUP BY Pedidos.ID_Pedido, Clientes.Nombre, Pedidos.Fecha

SELECT Pedidos.ID_Pedido, Productos.Nombre AS Producto, Detalle_Pedido.Cantidad, Productos.Precio AS Precio_Unitario FROM Detalle_Pedido
JOIN Productos ON Detalle_Pedido.ID_Producto = Productos.ID_Producto
JOIN Pedidos ON Detalle_Pedido.ID_Pedido = Pedidos.ID_Pedido
