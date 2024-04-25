create table colecciones
(
	id_coleccion serial primary key,
	volumen integer not null
);

create table libros
(
	isbn char(20) primary key,
	titulo varchar(30) not null,
	autor varchar(60) not null,
	editorial varchar(30) not null,
	id_coleccion integer,
	constraint FK_libros_colecciones foreign key (id_coleccion) references colecciones(id_coleccion) ON DELETE CASCADE ON UPDATE CASCADE
);

create table provincias
(
	id_provincia serial primary key,
	nombre varchar(30) not null,
	xtension integer not null,
	id_almacen integer not null
);

create table almacenes
(
id_almacen serial primary key,
f_apertura date not null,
direccion varchar(50) not null,
id_provincia integer not null,
);

create table poblaciones
(
	id_poblacion serial primary key,
	nombre varchar(60) not null,
	habitantes integer not null,
	id_provincia integer,
	constraint FK_poblaciones_provincias foreign key (id_provincia) references provincias(id_provincia) ON DELETE CASCADE ON UPDATE CASCADE
);

create table stocks
(
	isbn char(20),
	id_almacen integer,
	cantidad integer not null,
	constraint PK_stocks primary key (isbn,id_almacen),
	constraint FK_stocks_libros foreign key (isbn) references libros(isbn) ON DELETE CASCADE ON UPDATE CASCADE,
	constraint FK_stocks_almacenes foreign key (id_almacen) references almacenes(id_almacen) ON DELETE CASCADE ON UPDATE CASCADE
);

create table socios
(
id_socio serial primary key,
dni char(9),
nombre varchar(30),
apellidos varchar(60),
telefono varchar(15),
id_poblacion integer,
id_socio_avalador integer,
constraint FK_socios_poblaciones foreign key (id_poblacion) references poblaciones(id_poblacion) ON DELETE CASCADE ON UPDATE CASCADE,
constraint FK_socios_avalador foreign key (id_socio_avalador) references socios(id_socio) ON DELETE CASCADE ON UPDATE CASCADE
);

create table pedidos
(
	id_pedido serial primary key,
	f_envio char(15),
	f_pago char(15),
	id_socio integer,
	constraint FK_pedidos_socios foreign key (id_socio) references socios(id_socio) ON DELETE CASCADE ON UPDATE CASCADE
	
);

create table detalles_pedido
(
	id_pedido serial,
	id_consecutivo integer,
	isbn char(20) not null,
	cantidad integer not null,
	constraint PK_detalles_pedido primary key (id_pedido, id_consecutivo),
	constraint FK_detalles_pedido_pedidos foreign key (id_pedido) references pedidos(id_pedido) ON DELETE CASCADE ON UPDATE CASCADE
);