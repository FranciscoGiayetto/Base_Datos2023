drop database if exists gimnasio; 
create database gimnasio;
use gimnasio;

create table sedes (
    id int not null auto_increment primary key,
    nombre varchar(50) not null,
    direccion varchar(50) not null
);

create table tipoClase (
    id int not null auto_increment primary key,
    nombre varchar(50) not null
);

CREATE TABLE clases (
    id int not null auto_increment primary key,
    fecha date,
    hora time,
    CantidadMaxima int,
    sede int,
    tipoClase int,
    constraint sede foreign key (sede) references sedes(id),
    constraint tipoClase foreign key (tipoClase) references tipoClase(id)
);

create table asistencias(
    id int not null auto_increment primary key,
    estado varchar(50) not null
);

create table socios(
    dni int not null  primary key,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    fechaNacimiento date
);


CREATE table reserva(
    id int not null auto_increment primary key,
    clase int,
    socio int,
    asistencia int,
    constraint clase foreign key (clase) references clases(id),
    constraint socio foreign key (socio) references socios(dni),
    constraint asistencia foreign key (asistencia) references asistencias(id)
);

create table estados(
    id int not null auto_increment primary key,
    estado varchar(50) not null
);

create table tipos(
    id int not null auto_increment primary key,
    nombre varchar(50) not null
);

create table planes(
    id int not null auto_increment primary key,
    nombre varchar(50) not null,
    fecha date,
    fechaLimite date,
    tipo int,
    socioPlan int,
    estado int,
    constraint tipo foreign key (tipo) references tipos(id),
    constraint socioPlan foreign key (socioPlan) references socios(dni),
    constraint estado foreign key (estado) references estados(id)
);

create table sesiones(
    id int not null auto_increment primary key,
    nombre varchar(50) not null,
    orden int not null,
    plan int,
    constraint plan foreign key (plan) references planes(id)
);

create table ejercios(
    id int not null auto_increment primary key,
    nombre varchar(50) not null,
    repeticiones int not null,
    series int not null,
    peso varchar(30),
    notas varchar(255),
    sesion int,
    constraint sesion foreign key (sesion) references sesiones(id)
);

create table registros(
    id int not null auto_increment primary key,
    fecha date,
    peso varchar(30),
    observaciones varchar(255),
    cantidadRepeticiones int,
    seriesLogradas int,
    ejercicio int,
    constraint ejercicio foreign key (ejercicio) references ejercios(id)
);

-- Querys 
