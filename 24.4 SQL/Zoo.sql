create table Zoo (
	id_zoo serial primary key,
	pto_anual money not null,
	nombre varchar(30) not null,
	ciudad varchar(30) not null,
	pais varchar(30) not null,
	tamaño number not null
);

create table Especie(
	id_especie serial primary key,
	n_cientifico varchar(50) not null,
	n_vulgar varchar(50) not null,
	familia varchar(50) not null,
	peligro_extincion bool not null
);

create table Animal(
	id_animal varchar(20) primary key,
	pais_origen varchar(30) not null,
	contienente varchar(30) not null,
	sexo varchar(1) check (sexo in ('M', 'H')) not null,
	f_nacimiento date not null,
	id_zoo int,
	id_especie varchar(20),
	FOREIGN KEY (id_zoo) REFERENCES Zoo (id_zoo),
	FOREIGN KEY (id_especie) REFERENCES Especie (id_especie)
);

