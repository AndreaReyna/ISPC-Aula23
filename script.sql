
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Perro_Dueno` DEFAULT CHARACTER SET utf8 ;
USE `Perro_Dueno` ;

-- -----------------------------------------------------
-- Table `Perro_Dueno`.`Dueno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Perro_Dueno`.`Dueno` (
  `dni` INT NOT NULL ,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(90) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`dni`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Perro_Dueno`.`Perro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Perro_Dueno`.`Perro` (
  `id_perro` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Fecha_nac` DATE NOT NULL,
  `Sexo` VARCHAR(20) NOT NULL,
  `DNI_dueno` INT NOT NULL,
  PRIMARY KEY (`id_perro`),
  INDEX `DNI_dueno_idx` (`DNI_dueno` ASC) VISIBLE,
  CONSTRAINT `DNI_dueno`
    FOREIGN KEY (`DNI_dueno`)
    REFERENCES `Perro_Dueno`.`Dueno` (`dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Perro_Dueno`.`Historial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Perro_Dueno`.`Historial` (
  `id_Historial` INT NOT NULL AUTO_INCREMENT,
  `Fecha` DATETIME NOT NULL,
  `Perro_id` INT NOT NULL,
  `Descripcion` VARCHAR(90) NOT NULL,
  `Monto` INT NOT NULL,
  PRIMARY KEY (`id_Historial`),
  INDEX `Perro_id_idx` (`Perro_id` ASC) VISIBLE,
  CONSTRAINT `Perro_id`
    FOREIGN KEY (`Perro_id`)
    REFERENCES `Perro_Dueno`.`Perro` (`id_perro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

ALTER TABLE `Perro_Dueno`.`dueno` MODIFY `Telefono` BIGINT ; 
-- Ejercicio 1
insert into `Perro_Dueno`.`dueno` (`dni`, `Nombre`, `Apellido`, `Telefono`, `Direccion`) VALUES ('41712450', 'Francisco', 'Beltran', '3512587148', 'Lopez y planes 2931'), ('38923138', 'Micaela', 'Gallo', '3519875145', 'Estados Unidos 5161');
-- Ejercicio 2
insert into `Perro_Dueno`.`Perro` (`Nombre`, `Fecha_nac`,`Sexo`,`DNI_dueno`) VALUES ('Rocco','2015-12-5','Macho','41712450');
-- Ejercicio 5
select `Perro_Dueno`.`Perro`.`Nombre` from `Perro_Dueno`.`dueno`,  `Perro_Dueno`.`Perro` where `Perro_Dueno`.`dueno`.`Nombre`='Pedro' ;