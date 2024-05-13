use superkinalDB;

DELIMITER $$
	create procedure sp_AgregarClientes(nom varchar (30), ape varchar (30), tel varchar (15), dir varchar (150), nt varchar (15))
    BEGIN
		insert into Clientes(nombre, apellido, telefono, direccion, nit) values
			(nom, ape, tel, dir, nt);
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
		select Clientes.clienteID, Clientes.nombre, Clientes.apellido, Clientes.telefono, Clientes.direccion, Clientes.nit
        from Clientes where clienteID = cliID;
    END$$
DELIMITER ;

DELIMITER $$
	create procedure sp_EditarCliente(in cliID int, in nom varchar (30), in ape varchar (30), in tel varchar (15), in dir varchar (150), nt varchar (15))
    BEGIN
		update Clientes 
        set nombre = nom, apellido = ape, telefono = tel, direccion = dir, nit = nt
        where clienteID = cliID;
    END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE sp_AgregarCargos(IN nomCar VARCHAR (30), IN desCar VARCHAR (100))
BEGIN 	
	INSERT INTO Cargos (nombreCargo , descripcionCargo)VALUES 
		(nomCar, desCar);
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE sp_ListarCargos()
	BEGIN
		select * from Cargos;
	END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE sp_EliminarCargo(IN carID INT)
BEGIN
	DELETE
	FROM Cargos 
		WHERE cargoID =  carID;
END$$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE sp_BuscarCargo(IN carID INT)
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
CREATE PROCEDURE sp_EditarCargo(IN carID INT,IN nomCar VARCHAR (30), IN desCar VARCHAR (100))
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
	SELECT 	* FROM Distribuidores
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
				values (nomEmp, apeEmp, suld, horEnt, horSal, cargID, encID);
		end$$
delimiter ;


delimiter $$
	create procedure sp_ListarEmpleados ()
		begin 
			select * FROM Empleados;
		end $$
delimiter ;

delimiter $$
	create procedure sp_EliminarEmpleados (in empID int)
		begin
			delete
				from Empleados
					where empleadoID = empID;
		end $$
delimiter ;

delimiter $$
	create procedure sp_BuscarEmpleados (in empID int)
		begin 
			select * from Empleados 
						where empleadoID = empID;
		end $$
delimiter ;

delimiter $$
	create procedure sp_EditarEmpleados (in empID int, in nomEmp varchar (30), in apeEmp  varchar (30), in suld decimal (10, 2), in horEnt time, in horSal time, in cargID int, in encaID int)
		begin
			update Empleados
				set	
					nombreEmpleado = nomEmp,
					apellidoEmpleado = apeEmp,
					sueldo = suld,
					horaEntrada = horEnt, 
					horaSalida = horSal,
					cargoID = cargID,
					encargadoID = encaID
					where empleadoID = empID;
		end $$
delimiter ;

-- FACTURAS --

delimiter $$
	create procedure sp_AgregarFacturas (in fech date, in hor time, in tot decimal (10, 2), in cliID int, in empID int)
		begin 
			insert into Facturas (fecha, hora, total, clienteID, empleadoID)
				values (fech, hor, tot, cliID, empID);
		end$$
delimiter ;

delimiter $$
	create procedure sp_ListarFacturas ()
		begin 
			select * FROM Facturas;
		end $$
delimiter ;

delimiter $$
	create procedure sp_EliminarFacturas (in facID int)
		begin
			delete
				from Facturas
					where facturaID = facID;
		end $$
delimiter ;

delimiter $$
	create procedure sp_BuscarFacturas (in facID int)
		begin 
			select * from Facturas
						where facturaID = facID;
		end $$
delimiter ;

delimiter $$
	create procedure sp_EditarFacturas (in facID int, in fech date, in hor time, in tot decimal (10, 2), in cliID int, in empID int)
		begin
			update Facturas
				set	
					fecha = fech,
					hora = hor,
					total = tot,
					clienteId = cliID,
					empleadoId = empID
					where facturaID = facID;
		end $$
delimiter ;

-- DETALLE FACTURA --
delimiter $$
	create procedure sp_AgregarDetalleFactura  (in factID int, in proID int)
		begin 
			insert into DetalleFactura  (facturaID, productoID)
				values (factID, proID);
		end$$
delimiter ;

delimiter $$
	create procedure sp_ListarDetalleFactura  ()
		begin 
			select * FROM DetalleFactura;
		end $$
delimiter ;

delimiter $$
	create procedure sp_EliminarDetalleFactura   (in detFacID int)
		begin
			delete
				from DetalleFactura  
					where detalleFacturaID = detFacID;
		end $$
delimiter ;

delimiter $$
	create procedure sp_BuscarDetalleFactura  (in detFacID int)
		begin 
			select
				DetalleFactura.facturaID,
                DetalleFactura.productoID
					from DetalleFactura 
						where detalleFacturaID  = detFacID;
		end $$
delimiter ;

delimiter $$
	create procedure sp_EditarDetalleFactura  (in detFacID int, in factID int, in proID int)
		begin
			update DetalleFactura 
				set	
					facturaID = factID,
					productoID = proID
					where detalleFacturaID  = detFacID;
		end $$
delimiter ;

-- TICKET SOPORTE --
delimiter $$
	create procedure sp_AgregarTicketSoporte (in desTick varchar (250), in est varchar (30), in cliID int, in facID int)
		begin 
			insert into Facturas (descripcionTicket, estatuts , clienteID , facturaID)
				values (desTick, "Recien creado", cliID, facID);
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
	create procedure sp_EliminarTicketSoporte  (in tickSopID int)
		begin
			delete
				from TicketSoporte 
					where ticketSoporteID = tickSopID;
		end $$
delimiter ;

delimiter $$
	create procedure sp_BuscarTicketSoporte (in tickSopID int)
		begin 
			select
				TicketSoporte.descripcionTicket,
                TicketSoporte.estatuts,
                TicketSoporte.clienteID,
                TicketSoporte.facturaID
					from TicketSoporte
						where ticketSoporteID = tickSopID;
		end $$
delimiter ;

delimiter $$
	create procedure sp_EditarTicketSoporte (in tickSopID int, in desTick varchar (250), in est varchar (30), in cliID int, in facID int)
		begin
			update TicketSoporte
				set	
					descripcionTicket = desTick,
					estatuts = est,
					clienteId = cliID,
					facturaId = facID
					where ticketSoporteID = tickSopID;
		end $$
delimiter ;

set global time_zone = '-6:00'; 