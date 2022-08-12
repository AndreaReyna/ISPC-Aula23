-- Creacion de tablas
-- 1: Realice la consulta correspondiente para crear la tabla Perro, teniendo en cuenta sus claves foráneas y primarias.
-- 2: Inserte en la tabla correspondiente un nuevo animal (perro) como paciente y el dueño asociado a ese animal.

CREATE TABLE dueno (
  dni int NOT NULL,
  nombre varchar(50) NOT NULL,
  apellido varchar(50) NOT NULL,
  telefono varchar(50) NOT NULL,
  direccion varchar(50) NOT NULL,
  PRIMARY KEY (dni)
);

CREATE TABLE perro (
  id_perro int NOT NULL AUTO_INCREMENT,
  nombre varchar(50) NOT NULL,
  fecha_nac date NOT NULL,
  sexo varchar(50) NOT NULL,
  dni_dueno int not null,
  PRIMARY KEY (id_perro),
  FOREIGN KEY (dni_dueno) REFERENCES dueno(dni)
);

CREATE TABLE historial (
  id_historial int NOT NULL AUTO_INCREMENT,
  fecha date NOT NULL,
  perro int NOT NULL,
  descripcion varchar(50) NOT NULL,
  monto double NOT NULL,
  PRIMARY KEY (id_historial),
  FOREIGN KEY (perro) REFERENCES perro(id_perro)
);

INSERT INTO dueno(dni, nombre, apellido, telefono, direccion) VALUES (34152423, "Juan", "Perez", "3421456235", "Francia 2254, Santa Fe");
INSERT INTO perro(nombre, fecha_nac, sexo, dni_dueno) VALUES ("Negra", '2020-01-01', "F", 34152423);
INSERT INTO dueno(dni, nombre, apellido, telefono, direccion) VALUES (32152413, "Maria", "Rodriguez", "3421456235", "San Martin 2254, Santa Fe");
INSERT INTO perro(nombre, fecha_nac, sexo, dni_dueno) VALUES ("Beto", '2016-01-01', "M", 32152413);
INSERT INTO historial(fecha, perro, descripcion, monto) VALUES ('2021-08-01', 1, "Corte de pelo", 500);
INSERT INTO historial(fecha, perro, descripcion, monto) VALUES ('2022-08-01', 2, "Corte de pelo", 200);

SELECT * FROM dueno;
SELECT * FROM perro;
SELECT * FROM historial;

-- 10: Vaciar la tabla historial y resetear el contador del campo ID.
TRUNCATE TABLE historial;
ALTER TABLE historial AUTO_INCREMENT=1;

-- 11: Obtener todos los dueños que tengan perros de menos de 5 años de edad que no hayan visitado la peluquería en el año 2022.

SELECT d.* FROM dueno d 
INNER JOIN perro p ON (p.dni_dueno = d.dni)
INNER JOIN historial h ON (h.perro = p.id_perro)
WHERE (YEAR(p.fecha_nac)>2017 AND YEAR (h.fecha)<2022)
