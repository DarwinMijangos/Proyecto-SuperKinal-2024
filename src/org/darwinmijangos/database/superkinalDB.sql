drop database if exists superkinalDB; 

create database if not exists superkinalDB;

use superKinalDB;

create table Clientes(
	clienteID int not null auto_increment,
    nombre varchar (30) not null,
    apellido varchar (30) not null,
    telefono varchar (15),
    direccion varchar (150) not null,
    nit varchar (15) not null,
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
    distribuidorID int not null,
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
	detalleCompraID int not null auto_increment,
    cantidadCompra int (250) not null,
    productoID int not null,
    compraID int not null,
    primary key PK_detalleCompraID (detalleCompraID),
    constraint FK_DetalleCompra_Productos foreign key (productoID)
		references Productos (productoID)
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
    empleadoID int not null,
    primary key PK_facturaID (facturaID),
    constraint FK_Facturas_Clientes foreign key (clienteID)
		references Clientes (clienteID),
	constraint FK_Facturas_Empleados foreign key (empleadoID)
		references Empleados (empleadoID)
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

create table NivelesAcceso(
	nivelAccesoID int not null auto_increment,
    nivelAcceso varchar (40) not null,
    primary key PK_nivelAccesoID (nivelAccesoID)
);

create table Usuarios(
	usuarioID int not null auto_increment,
    usuario varchar (30) not null,
    contrasenia varchar (100) not null,
    nivelAccesoID int not null,
    empleadoID int not null,
    constraint FK_Usuarios_NivelesAcceso foreign key (nivelAccesoID)
		references NivelesAcceso (nivelAccesoID),
	constraint FK_Usuarios_Empleados foreign key (empleadoID)
		references Empleados (empleadoID)
);



insert into Clientes(nombre, apellido, telefono, direccion, nit) values
	("Elkyn","Samayoa","1029-5607","Peten", "2360539-0"),
    ("Jose","Ajcu","1237-3987","Capital", "CF"),
    ("Darwin","Mijangos","3876-9273","Zacapa", "9283756-4"),
    ("Cristian","Lima","5689-1264","Chiquimula", "CF"),
    ("Jorge","Peralta","3456-1098","Quiche", "1208563-8");
    
insert into Cargos(nombreCargo, descripcionCargo) values
	("Contabilidad", "Se encarga de llevar la contabilidad de toda la empresa"),
    ("Cajero", "El cajero se encarga de cobrar los productos en caja"),
    ("Gerente de ventas", "Se encarga de aumentar las ventas mediante estrategias");
    
insert into NivelesAcceso(nivelAcceso) values
	("Admininstrador"),
    ("Usuario");