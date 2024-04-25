 -- drop database if exists superkinalDB; --

create database if not exists superkinalDB;

use superkinalDB;

create table Clientes(
	clienteID int not null auto_increment,
    nombre varchar (30) not null,
    apellido varchar (30) not null,
    telefono varchar (15),
    direccion varchar (150) not null,
    nit varchar (15),
    primary key PK_clienteID (clienteID)
);

create table Cargos(
	cargoID int not null auto_increment,
    nombreCargo varchar (30) not null,
    descripcionCargo varchar (100) not null,
    primary key PK_cargoID (cargoID)
);

create table Compras(
	compraID int not null auto_increment,
    fechaCompra date not null,
    totalCompra decimal (10,2) not null,
    primary key PK_compraID (compraID)
);

create table Distribuidores(
	distribuidorID int not null auto_increment,
    nombreDistribuidor varchar (30) not null,
    direccionDistribuidor varchar (200) not null,
	nitDistribuidor varchar (15) not null,
    telefonoDistribuidor varchar (15),
    web varchar (50),
    primary key PK_distribuidorID (distribuidorID)
);

create table CategoriaProductos(
	categoriaProductosID int not null auto_increment,
    nombreCategoria varchar (30) not null,
    descripcionCategoria varchar (100) not null,
    primary key PK_categoriaProductosID (categoriaProductosID)
);

create table Productos(
	productoID int not null auto_increment,
    nombreProducto varchar (50) not null,
    descripcionProducto varchar (100) not null,
    cantidadStock int (250),
    precioVentaUnitario decimal (10,2) not null,
    precioVentaMyor decimal (10,2) not null,
    precioCompra decimal(10, 2) not null,
    imagenProducto blob not null,
    distriuidorID int not null,
    categoriaProductosID int not null,
    primary key PK_productoID (productoID),
    constraint FK_Productos_Distribuidores foreign key (distribuidorID)
		references Distribuidores (distribuidorID),
	constraint Fk_Productos_CategoriaProductos foreign key (categoriaProductosID)
		references CategoriaProductos (categoriaProductosID)
);

create table Promociones (
	promocionID int not null,
    precioPromocion decimal (10,2) not null,
    descripcionPromocion varchar (100) not null,
    fechaInicio date,
    fechaFinalizacion date,
    productoID int not null,
    primary key PK_promocionID (promocionID),
    constraint FK_Promociones_Productos foreign key (productoID)
		references Productos (productoID)
);

create table DetalleCompra (
	detalleCompra int not null auto_increment,
    cantidadCompra int (250) not null,
    productoID int not null,
    compraID int not null,
    primary key PK_detalleCompraID (detalleCompraID),
    constraint FK_DetalleCompra_Productos foreign key (productoID)
		references Productos (productoID)
);

create table Cargos (
	cargoID int not null auto_increment,
    nombreCargo varchar (30) not null,
    descxripciopnCargo varchar (100),
    primary key PK_cargoID (cargoID)
);

create table Empleados(
	empleadoID int not null auto_increment,
    nombreEmpleado varchar (30) not null,
    apellidoEmpleado varchar (30) not null,
    sueldo decimal (10,2) not null,
    horaEntrada time not null,
    horaSalida time not null,
    cargoID int not null,
    encargadoID int not null,
    primary key PK_empleadoID (empleadoID),
    constraint FK_Empleados_Cargos foreign key (cargoID)
		references Cargos (cargoID),
	constraint FK_Empleados_Empleados foreign key (encargadoID)
		references Empleados (empleadoID)
);

create table Facturas (
	facturaID int not null auto_increment,
    fecha date not null,
    hora time not null,
    total decimal (10,2) not null,
    clienteID int not null,
    empleado int not null,
    primary key PK_facturaID (facturaID) 
);

create table TicketSoporte (
	ticketSoporteID int not null auto_increment,
    descripcionTicket varchar (250) not null,
    estatus varchar (30) not null,
    clienteID int not null,
    facturaID int not null,
    primary key PK_ticketSoporteID (ticketSoporteID),
    constraint FK_TicketSoporte_Clientes foreign key (clienteID)
		references Clientes (clienteID),
	constraint FK_TicketSoporte_Facturas foreign key (facturaID)
		references Facturas (facturaID)
);

create table DetalleFactura (
	detalleFacturaID int not null auto_increment,
    facturaID int not null,
    productoID int not null,
    primary key PK_detalleFacturaID (detalleFacturaID),
    constraint FK_DetalleFactura_Facturas foreign key (facturaID)
		references Facturas (facturaID),
	constraint FK_DetalleFactura_Productos foreign key (productoID)
		references Productos (productoID)
);

insert into Clientes(nombre, apellido, telefono, direccion) values
	("Elkyn","Samayoa","6666-6666","Peten"),
    ("Jorge","Peralta","3333-3333","Quiche");

DELIMITER $$
	create procedure sp_AgregarClientes(nom varchar (30), ape varchar (30), tel varchar (15), dir varchar (150))
    BEGIN
		insert into Clientes(nombre, apellido, telefono, direccion) values
			(nom, ape, tel, dir);
    END $$
DELIMITER ;

DELIMITER $$
	create procedure sp_ListarClientes()
    BEGIN
		select * from Clientes;
    END$$
DELIMITER ;

DELIMITER $$
	create procedure sp_EliminarCliente(in cliID int)
    BEGIN
		delete from Clientes
        where clienteID = cliID;
    END$$
DELIMITER ;

DELIMITER $$
	create procedure sp_BuscarCliente(in cliID int)
    BEGIN
		select Clientes.nombre, Clientes.apellido, Clientes.telefono, Clientes.direccion
        from Clientes where clienteID = cliID;
    END$$
DELIMITER ;

DELIMITER $$
	create procedure sp_EditarCliente(in cliID int, in nom varchar (30), in ape varchar (30), in tel varchar (15), in dir varchar (150))
    BEGIN
		update Clientes 
        set nombre = nom, apellido = ape, telefono = tel, direccion = dir
        where clienteID = cliID;
    END$$
DELIMITER ;

-- Cargos 

DELIMITER $$ 
CREATE PROCEDURE sp_AgregarCargos(IN nomCar VARCHAR (30), IN desCar VARCHAR (100))
BEGIN 	
	INSERT INTO Cargos (nombreCargo , descripcionCargo)VALUES 
		(nomCar, desCar);
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE sp_ListarCargos()
	Begin
		select * from Cargos;
	END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE sp_EliminarCargos(IN carID INT)
BEGIN
	DELETE
	FROM Cargos 
		WHERE cargoID =  carID;
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE sp_BuscarCargos(IN carID INT)
BEGIN
	SELECT 	
		Cargos.cargoID,
		Cargos.nombreCargo  ,
		Cargos.descripcionCargo  
			FROM Cargos
			WHERE cargoID = carID;
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE sp_EditarCargos(IN carIS INT,IN nomCar VARCHAR (30), IN desCar VARCHAR (100))
BEGIN
	UPDATE Cargos
		SET
			nombreCargo  = nomCar,
			descripcionCargo  = desCar
			WHERE cargoID = carID;
END$$
DELIMITER ;

-- Compras 
DELIMITER $$ 
CREATE PROCEDURE sp_AgregarCompras(IN fech date, IN tot  decimal (10.2))
BEGIN 	
	INSERT INTO Compras (fechaCompra,totalCompra )VALUES 
		(fech, tot);
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE sp_ListarCompras()
BEGIN 
	SELECT * FROM Compras;
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE sp_EliminarCompras(IN compID INT)
BEGIN
	DELETE
	FROM Compras 
		WHERE compraID = compID;
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE sp_BuscarCompras(IN compID INT)
BEGIN
	SELECT 	
		Compras.compraID,
		Compras.fechaCompra, 
		Compras.totalCompra 
			FROM Compras
			WHERE compraID = compID;
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE sp_EditarCompras(IN compID INT,IN fechComp date, IN totComp  decimal (10.2))
BEGIN
	UPDATE Compras
		SET
			fechaCompra = fechComp,
			totalCompra = totComp
			WHERE compraID = compID;
END$$
DELIMITER ;

-- CategoriaProductos
DELIMITER $$ 
CREATE PROCEDURE sp_AgregarCategoriaProductos(IN nomCat VARCHAR (30), IN desCat VARCHAR (100))
BEGIN 	
	INSERT INTO CategoriaProductos (nombreCategoria , descripcionCategoria )VALUES 
		(nomCat, desCat);
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE sp_ListarCategoriaProductos()
BEGIN 
	SELECT * FROM CategoriaProductos;
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE sp_EliminarCategoriaProductos(IN catID  INT)
BEGIN
	DELETE
	FROM CategoriaProductos 
		WHERE categoriaProductoID = catID;
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE sp_BuscarCategoriaProductos(IN catID INT)
BEGIN
	SELECT 	
		CategoriaProductos.categoriaProductoID, 
		CategoriaProductos.nombreCategoria,  
		CategoriaProductos.descripcionCategoria  
			FROM CategoriaProductos
			WHERE categoriaProductoID  = catID;	
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE sp_EditarCategoriaProductos(IN catID INT,IN nomCat VARCHAR (30), IN desCat VARCHAR (100))
BEGIN
	UPDATE CategoriaProductos
		SET
			nombreCategoria  = nomCat,
			descripcionCategoria = desCat
			WHERE categoriaProductoID = catID;
END$$
DELIMITER ;

-- Distribuidores 
DELIMITER $$ 
CREATE PROCEDURE sp_AgregarDistribuidores(IN nomDis VARCHAR (30),IN dirDis VARCHAR (200), IN nitDis varchar(15), IN telDis varchar(15),  IN webDis varchar(50))
BEGIN 	
	INSERT INTO Distribuidores (nombreDistribuidor , direccionDistribuidor ,nitDistribuidor ,telefonoDistribuidor ,web )VALUES 
		(nomDis,dirDis,nitDis,telDis,webDis);
END$$
DELIMITER ; 

DELIMITER $$ 
CREATE PROCEDURE sp_ListarDistribuidores()
BEGIN 
	SELECT * FROM Distribuidores;
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE sp_EliminarDistribuidores(IN disID INT)
BEGIN
	DELETE
	FROM Distribuidores 
		WHERE distribuidorID = disID;
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE sp_BuscarDistribuidores(IN disID INT)
BEGIN
	SELECT 	
		Distribuidores.distribuidorID,
		Distribuidores.nombreDistribuidor,
		Distribuidores.direccionDistribuidor,
		Distribuidores.nitDistribuidor,
		Distribuidores.telefonoDistribuidor,
		Distribuidores.web 
			FROM Distribuidores
			WHERE distribuidorID = disID;
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE sp_EditarDistribuidores(IN disID INT,IN nomDis VARCHAR (30),IN dirDis VARCHAR (200), IN nitDis varchar(15), IN telDis varchar(15),  IN webDis varchar(50))
BEGIN
	UPDATE Distribuidores
		SET
			nombreDistribuidor = nomDis,
			direccionDistribuidor = dirDis,
			nitDistribuidor = nitDis,
			telefonoDistribuidor = telDis,
            web = webDis
			WHERE clienteID = cliID;
END$$
DELIMITER ;

-- Productos
DELIMITER $$
create procedure sp_AgregarProducto(in nomProd varchar(50),in desProd varchar(100),in cant int, in preUni decimal(10,2),in preMay decimal(10,2),in preComp decimal(10,2), in ima blob, in disID int, in catID int)
	BEGIN
		insert into Productos(nombreProducto, descripcionProducto, cantidadStock, precioUnitario, precioVentaMayor, precioCompra, imagenProducto, distribuidorID, categoriaProductosID ) values
			(nomProd, desProd, cant, preUni, preMay, preComp, ima, disID, catID);
	END $$
DELIMITER ;

DELIMITER $$
create procedure sp_ListarProducto()
	BEGIN 
		select * from Productos;
    END $$
DELIMITER ;

DELIMITER $$
create procedure sp_BuscarProducto(in prodID int)
	BEGIN 
		select * from Productos
        where productoID = prodID;
    END $$
DELIMITER ;

DELIMITER $$
create procedure sp_EliminarProducto(in prodID int)
	BEGIN
		delete from Productos
			where productoID = prodID;
    END $$
DELIMITER ;

DELIMITER $$
create procedure sp_EditarProducto(in prodID int, in nomProd varchar(50),in desProd  varchar(100),in cant int, in preUni decimal(10,2),in preMay decimal(10,2),in preComp decimal(10,2), in ima blob, in disID int, in catID int )
	BEGIN
		update Productos	
			set 
            nombreProducto = nomProd,
            descripcionProduto = desProd,
            cantidadStock = cant,
            precioVentaUnitario = preUni,
            precioVentaMayor = preMay,
            precioCompra = preCosp,
            imagenProducto = ima,
            distribuidorID = disID,
            categoriaProductosID = catID
            where productoID = proID;
    END $$
DELIMITER ;

-- DetalleCompra

DELIMITER $$
create procedure sp_AgregarDetalleCompra(in cantComp int, in prodID int, in compID int)
	BEGIN
		insert into DetalleCompra(cantidadCompra, productoID, compraID) values
			(cantComp, proID, comID);
    END $$
DELIMITER ;

DELIMITER $$
create procedure sp_ListarDetalleCompra()
	BEGIN
		select * from DetalleCompra;
    END $$
DELIMITER ;

DELIMITER $$
create procedure sp_BuscarDetalleCompra(in detCompID int)
	BEGIN
		select * from DetalleCompra
				where detalleCompraID = detCompID;
    END $$
DELIMITER ;

DELIMITER $$
create procedure sp_EliminarDetalleCompra(in detCompID int)
	BEGIN
		delete
			from DetalleCompra
				where detalleCompraID = detCompID;
    END $$
DELIMITER ;

DELIMITER $$
create procedure sp_EditarDetalleCompra(in detCompID int, in cantComp int, in prodID int, in compID int)
	BEGIN
		update DetalleCompra
			set
				cantidadCompra = cantComp,
                productoId = prodID,
                compraId = compID
					where detalleCompraID = detCompID;
    END $$
DELIMITER ;
-- Promociones
DELIMITER $$
create procedure sp_AgregarPromociones(prePro decimal (10,2), desPro varchar (100), fechIn date, fechFin date, in prodID int)
BEGIN
	insert into Promociones(precioPromocion, descripcionPromocion, fechaInicio, fechaFinalizacion, productoId )values
    (prePro, desPro, fechIn, fechFin, prodID);
    
END $$
DELIMITER ;

DELIMITER $$
create procedure sp_ListarPromociones()
BEGIN
	select * FROM Promociones;

END $$
DELIMITER ;

DELIMITER $$
create procedure sp_EliminarPromociones(in promID int)
BEGIN
	delete
		from Promociones
        where promocionID = promID;
END $$
DELIMITER ;

DELIMITER $$
create procedure sp_BuscarPromociones(in promID int)
BEGIN
	select * from Promociones
            where promocionID = promID;
END $$
DELIMITER  ;

DELIMITER $$
create procedure sp_EditarPromociones(in promID int, prePro decimal (10,2), desPro varchar (100), fechIn date, fechFin date, in prodID int )
BEGIn
	update Promociones
		set
			precioPromocion = prePro,
            descripcionPromocion = desPro,
            fechaInicio = fechIn,
            fechFinalizacion = fechFin,
            profuctoId = prodID
            where promocionID = promID;
END $$
DELIMITER ;

-- Empleados
delimiter $$
	create procedure sp_AgregarEmpleados (in nomEmp varchar (30), in apeEmp  varchar (30), in suld decimal (10, 2), in horEnt time, in horSal time, in cargID int, in encID int)
		begin 
			insert into Empleados (nombreEmpleado , apellidoEmpleado, sueldo, horaEntrada, horaSalida, cargoID, encargadoID)
				values (nomEmp, apeEmp, suld, horEnt, horSal, cargID, encaID);
		end$$
delimiter ;


delimiter $$
	create procedure sp_ListarEmpleados ()
		begin 
			select * FROM Empleados;
		end $$
delimiter ;
CALL sp_ListarEmpleados ();

delimiter $$
	create procedure sp_EliminarEmpleados (in empID int)
		begin
			delete
				from Empleados
					where empleadoID = empID;
		end $$
delimiter ;

delimiter $$
	create procedure sp_BuscarEmpleados (in empId int)
		begin 
			select
				Empleados.nombreEmpleado,
                Empleados.apellidoEmpleado,
                Empleados.sueldo,
                Empleados.horaEntrada,
                Empleados.horaSalida,
                Empleados.cargoId,
                Empleados.encargadoId
					from Empleados 
						where empleadoId = empId;
		end $$
delimiter ;

delimiter $$
	create procedure sp_EditarEmpleados (in empId int, in nomEmp varchar (30), in apeEmp  varchar (30), in sud decimal (10, 2), in horEntr time, in horSld time, in cargId int, in encaId int)
		begin
			update Empleados
				set	
					nombreEmpleado = nomEmp,
					apellidoEmpleado = apeEmp,
					sueldo = sud,
					horaEntrada = horEntr, 
					horaSalida = horSld,
					cargoId = cargId,
					encargadoId = encaId
					where empleadoId = empId;
		end $$
delimiter ;

-- FACTURAS --

delimiter $$
	create procedure sp_AgregarFacturas (in fech date, in hor time, in tot decimal (10, 2), in cliId int, in empId int)
		begin 
			insert into Facturas (fecha, hora, total, clienteId, empleadoId)
				values (fech, hor, tot, cliId, empId);
		end$$
delimiter ;

delimiter $$
	create procedure sp_ListarFacturas ()
		begin 
			select 
				Facturas.facturaId,
				Facturas.fecha,
                Facturas.hora,
                Facturas.total,
                Facturas.clienteId,
                Facturas.empleadoId
					FROM Facturas;
		end $$
delimiter ;

delimiter $$
	create procedure sp_EliminarFacturas (in facId int)
		begin
			delete
				from Facturas
					where facturaId = facId;
		end $$
delimiter ;

delimiter $$
	create procedure sp_BuscarFacturas (in facId int)
		begin 
			select
				Facturas.fecha,
                Facturas.hora,
                Facturas.total,
                Facturas.clienteId,
                Facturas.empleadoId
					from Facturas
						where facturaId = facId;
		end $$
delimiter ;

delimiter $$
	create procedure sp_EditarFacturas (in facId int, in fech date, in hor time, in tot decimal (10, 2), in cliId int, in empId int)
		begin
			update Facturas
				set	
					fecha = fech,
					hora = hor,
					total = tot,
					clienteId = cliId,
					empleadoId = empId
					where facturaId = facId;
		end $$
delimiter ;

-- DETALLE FACTURA --
delimiter $$
	create procedure sp_AgregarDetalleFactura  (in factId int, in proId int)
		begin 
			insert into DetalleFactura  (facturaId, productoId)
				values (factId, proId);
		end$$
delimiter ;

delimiter $$
	create procedure sp_ListarDetalleFactura  ()
		begin 
			select 
				DetalleFactura.detalleFacturaId,
				DetalleFactura.facturaId,
                DetalleFactura.productoId
					FROM DetalleFactura;
		end $$
delimiter ;

delimiter $$
	create procedure sp_EliminarDetalleFactura   (in detaFacId int)
		begin
			delete
				from DetalleFactura  
					where detalleFacturaId  = detaFacId;
		end $$
delimiter ;

delimiter $$
	create procedure sp_BuscarDetalleFactura  (in detaFacId int)
		begin 
			select
				DetalleFactura.facturaId,
                DetalleFactura.productoId
					from DetalleFactura 
						where detalleFacturaId  = detaFacId;
		end $$
delimiter ;

delimiter $$
	create procedure sp_EditarDetalleFactura  (in detaFacId int, in factId int, in proId int)
		begin
			update DetalleFactura 
				set	
					facturaId = factId,
					productoId = proId
					where detalleFacturaId  = detaFacId;
		end $$
delimiter ;

-- TICKET SOPORTE --
delimiter $$
	create procedure sp_AgregarTicketSoporte (in descTick varchar (250), in est varchar (30), in cliId int, in facId int)
		begin 
			insert into Facturas (descripcionTicket, estatuts , clienteId , facturaId)
				values (descTick, "Recien creado", cliId, facId);
		end$$
delimiter ;

delimiter $$
	create procedure sp_ListarTicketSoporte ()
		begin 
			select TicketSoporte.ticketSoporteID, TicketSoporte.descripcionTicket, TicketSoporte.estatus, TicketSoporte.facturaID,
            concat("ID: ", Clientes.clienteID, " | ", Clientes.nombre, " ", Clientes.apellido) as "cliente"
            FROM TicketSoporte
            join Clientes on TicketSoporte.clienteID = Clientes.clienteID;
		end $$
delimiter ;

delimiter $$
	create procedure sp_EliminarTicketSoporte  (in tickSopId int)
		begin
			delete
				from TicketSoporte 
					where ticketSoporteId = tickSopId;
		end $$
delimiter ;

delimiter $$
	create procedure sp_BuscarTicketSoporte (in tickSopId int)
		begin 
			select
				TicketSoporte.descripcionTicket,
                TicketSoporte.estatuts,
                TicketSoporte.clienteId,
                TicketSoporte.facturaId
					from TicketSoporte
						where ticketSoporteId = tickSopId;
		end $$
delimiter ;

delimiter $$
	create procedure sp_EditarTicketSoporte (in tickSopID int, in descTick varchar (250), in est varchar (30), in cliId int, in facId int)
		begin
			update TicketSoporte
				set	
					descripcionTicket = descTick,
					estatuts = est,
					clienteId = cliId,
					facturaId = facId
					where ticketSoporteId = tickSopId;
		end $$
delimiter ;

set global time_zone = '-6:00';