CREATE DATABASE pelu__canina CHARACTER SET utf8mb4; 
USE pelu__canina;
CREATE TABLE dueno(
dni int NOT NULL ,
nombre varchar(50) NOT NULL,
apellido varchar(50) NOT NULL,
telefono varchar(50) NOT NULL,
direccion varchar(50) NOT NULL,
primary key (dni)
);

insert into dueno value (32571531,"Juan","Gomez","2615558974","Olavarria 618");
insert into dueno value (25123698,"Luis","GOnzalez","4397885","San Martin 1255");
insert into dueno value (34528782,"Daniel","Peralta","4215674","Boulogne Sur Mer 58");
insert into dueno value (17854236,"Alberto","Catano","4789652","Martinez de Rosa 475");
insert into dueno value (19658746,"Luciano","Zamora","4741202","Belgrano 125");


CREATE TABLE perro(
id_perro int not null ,
nombre varchar(50) not null,
fecha_nacimiento date not null,
sexo varchar(50)not null,
dni_dueno int not null,
primary key(id_perro),
foreign key(dni_dueno) references dueno(dni)
);

insert into perro value(1,"Bronco",2017-02-17,"Macho",19658746);
insert into perro value(2,"Bobis",07/12/2010,"Macho",17854236);
insert into perro value(3,"Firulai",11/05/2019,"Macho",34528782);
insert into perro value(4,"Vita",01/10/2017,"Hembra",25123698);
insert into perro value(5,"Manala",27/03/2011,"Hembra",32571531);

-- Utilizo update para actualizar los valores de fecha.
-- Fueron cargados  es un formato erroneo
update perro
set fecha_nacimiento='2011-03-27'
where id_perro=5;
select*from perro;



create table historial(
id_historial int not null,
nombre varchar(50)not null,
fecha date not null,
perro int not null,
descripcion varchar(50) not null,
monto double not null,
primary key(id_historial),
foreign key(perro) references perro(id_perro)
);
insert into historial value(1,'Vacunacion','2021-02-19',5,'Se coloca vacuna y realiza bañado',1750.00);
insert into historial value(2,'peluqueria','2022-06-29',3,'Bañado y peinado',3600.00);
insert into historial value(3,'peluqueria','2022-03-05',5,'Corte pelo y uñas',1750.00);
insert into historial value(4,'Vacunacion','2021-09-1',5,'Se coloca vacuna y pipeta ',1750.00);
select*from historial;
-- EJERCICIO--
-- Obtener todos los perros de sexo “Macho” nacidos entre 2020 y 2022. --
select * from perro;
select * 
from perro
where sexo='Macho' 
and fecha_nacimiento 
between '2020-01-01' and '2022-12-31';
