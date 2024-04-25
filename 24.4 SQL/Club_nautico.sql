create table Socio(
	n_socio serial primary key,
	nombre varchar(30) unique not null,
	apellidos varchar(30) not null,
	dni varchar(9) not null,
	domicilio varchar(50) not null,
	f_nacimiento date not null
);

create table Barco(
	matricula varchar(10) primary key,
	nombre varchar(30) not null,
	n_amarre integer not null,
	cuota money not null,
	nombre_propietario varchar(30) not null,
	n_socio integer not null,
	CONSTRAINT fk_nombresocio FOREIGN KEY (nombre_propietario) REFERENCES Socio (nombre),
	CONSTRAINT fk_numerosocio FOREIGN KEY (n_socio) REFERENCES Socio (n_socio)
);

create table Patron(
	dni varchar(9) primary key,
	nombre varchar(30) unique not null,
	apellidos varchar(30) not null,
	domicilio varchar(50) not null,
	f_nacimiento date not null
);

create table Salidas(
	id_salida serial primary key,
	destino varchar(30) not null,
	fecha date not null,
	hora time not null,
	patron varchar(30) not null,
	matricula varchar(10) not null,
	CONSTRAINT fk_patron FOREIGN KEY (patron) REFERENCES Patron (dni),
	CONSTRAINT fk_barco_matricula FOREIGN KEY (matricula) REFERENCES Barco (matricula)
);