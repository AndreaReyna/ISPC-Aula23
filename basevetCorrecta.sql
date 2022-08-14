

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Dueno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Dueno` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Dueno` (
  `idDueno` INT NOT NULL,
  `nombreDueno` VARCHAR(45) NOT NULL,
  `ApellidoDueno` VARCHAR(45) NOT NULL,
  `Telefono` INT NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDueno`))
ENGINE = InnoDB;

-- cargo dueno
INSERT INTO `mydb`.`dueno` (`idDueno`, `nombreDueno`, `ApellidoDueno`, `Telefono`, `Direccion`) VALUES ('01', 'pamela', 'suarez', '123455', 'bra 1760');





-- -----------------------------------------------------
-- Table `mydb`.`Perro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Perro` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Perro` (
  `idPerro` INT NOT NULL AUTO_INCREMENT,
  `fecha_nac` DATE NOT NULL,
  `sexo` VARCHAR(45) NOT NULL,
  `dniDueno` VARCHAR(45) NOT NULL,
  `nombrePerro` VARCHAR(45) NOT NULL,
  `idDueno` INT NULL,
  PRIMARY KEY (`idPerro`),
  INDEX `idDueno_idx` (`idDueno` ASC) VISIBLE,
  CONSTRAINT `idDueno`
    FOREIGN KEY (`idDueno`)
    REFERENCES `mydb`.`Dueno` (`idDueno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- id dueno

UPDATE `mydb`.`perro` SET `idDueno` = '1' WHERE (`idPerro` = '1');

-- cambio fecha 

UPDATE `mydb`.`perro` SET `fecha_nac` = '2020-09-23' WHERE (`idPerro` = '1');


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
