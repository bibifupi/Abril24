create table Cliente(
	dni char(9) primary key,
	nombre varchar(255) not null ,
	direccion varchar(255) not null
);
create table Asunto(
	n_expediente serial primary key,
	dni_c char(9) references Cliente(dni),
	f_inicio date not null,
	f_archivo date not null,
	estado varchar(20) check (estado in ('abierto', 'cerrado', 'en proceso'))
);
create table Procurador(
	dni char(9) primary key,
	nombre varchar(255) not null,
	direccion varchar(255) not null
);

create table asuntoProcurador(
n_expediente int,
dni char(9) not null,
primary key (n_expediente, dni),
foreignkey (n_expediente) references asunto(n_expediente),
foreign key (dni) references procurador(dni)
);