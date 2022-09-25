-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_proyectoC3
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_proyectoC3
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_proyectoC3` DEFAULT CHARACTER SET utf8 ;
USE `db_proyectoC3` ;

-- -----------------------------------------------------
-- Table `db_proyectoC3`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_proyectoC3`.`cliente` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `tipo_documento` VARCHAR(45) NULL,
  `numero_documento` VARCHAR(100) NULL,
  `nombres` VARCHAR(100) NULL,
  `apellidos` VARCHAR(100) NULL,
  PRIMARY KEY (`idcliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_proyectoC3`.`tipo_contacto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_proyectoC3`.`tipo_contacto` (
  `id_tipo_contacto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id_tipo_contacto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_proyectoC3`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_proyectoC3`.`proveedor` (
  `id_proveedor` INT NOT NULL AUTO_INCREMENT,
  `tipo_documento` VARCHAR(45) NULL,
  `numero_documento` VARCHAR(60) NULL,
  `nombres` VARCHAR(120) NULL,
  `apellidos` VARCHAR(120) NULL,
  PRIMARY KEY (`id_proveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_proyectoC3`.`contacto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_proyectoC3`.`contacto` (
  `id_contacto` INT NOT NULL AUTO_INCREMENT,
  `contacto` VARCHAR(45) NULL,
  `cliente_idcliente` INT NOT NULL,
  `proveedor_id_proveedor` INT NOT NULL,
  `tipo_contacto_id_tipo_contacto` INT NOT NULL,
  PRIMARY KEY (`id_contacto`),
  INDEX `fk_contacto_cliente_idx` (`cliente_idcliente` ASC) VISIBLE,
  INDEX `fk_contacto_proveedor1_idx` (`proveedor_id_proveedor` ASC) VISIBLE,
  INDEX `fk_contacto_tipo_contacto1_idx` (`tipo_contacto_id_tipo_contacto` ASC) VISIBLE,
  CONSTRAINT `fk_contacto_cliente`
    FOREIGN KEY (`cliente_idcliente`)
    REFERENCES `db_proyectoC3`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contacto_proveedor1`
    FOREIGN KEY (`proveedor_id_proveedor`)
    REFERENCES `db_proyectoC3`.`proveedor` (`id_proveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contacto_tipo_contacto1`
    FOREIGN KEY (`tipo_contacto_id_tipo_contacto`)
    REFERENCES `db_proyectoC3`.`tipo_contacto` (`id_tipo_contacto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_proyectoC3`.`tipo_direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_proyectoC3`.`tipo_direccion` (
  `id_tipo_direccion` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`id_tipo_direccion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_proyectoC3`.`direcciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_proyectoC3`.`direcciones` (
  `id_direcciones` INT NOT NULL AUTO_INCREMENT,
  `direccion` VARCHAR(45) NULL,
  `pais` VARCHAR(45) NULL,
  `departamento` VARCHAR(45) NULL,
  `ciudad` VARCHAR(45) NULL,
  `cliente_idcliente` INT NOT NULL,
  `proveedor_id_proveedor` INT NOT NULL,
  `tipo_direccion_id_tipo_direccion` INT NOT NULL,
  PRIMARY KEY (`id_direcciones`),
  INDEX `fk_direcciones_cliente1_idx` (`cliente_idcliente` ASC) VISIBLE,
  INDEX `fk_direcciones_proveedor1_idx` (`proveedor_id_proveedor` ASC) VISIBLE,
  INDEX `fk_direcciones_tipo_direccion1_idx` (`tipo_direccion_id_tipo_direccion` ASC) VISIBLE,
  CONSTRAINT `fk_direcciones_cliente1`
    FOREIGN KEY (`cliente_idcliente`)
    REFERENCES `db_proyectoC3`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_direcciones_proveedor1`
    FOREIGN KEY (`proveedor_id_proveedor`)
    REFERENCES `db_proyectoC3`.`proveedor` (`id_proveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_direcciones_tipo_direccion1`
    FOREIGN KEY (`tipo_direccion_id_tipo_direccion`)
    REFERENCES `db_proyectoC3`.`tipo_direccion` (`id_tipo_direccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_proyectoC3`.`factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_proyectoC3`.`factura` (
  `id_factura` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NULL,
  `cliente_idcliente` INT NOT NULL,
  PRIMARY KEY (`id_factura`),
  INDEX `fk_factura_cliente1_idx` (`cliente_idcliente` ASC) VISIBLE,
  CONSTRAINT `fk_factura_cliente1`
    FOREIGN KEY (`cliente_idcliente`)
    REFERENCES `db_proyectoC3`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_proyectoC3`.`detalle_factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_proyectoC3`.`detalle_factura` (
  `id_detalle_factura` INT NOT NULL AUTO_INCREMENT,
  `factura_id_factura` INT NOT NULL,
  PRIMARY KEY (`id_detalle_factura`),
  INDEX `fk_detalle_factura_factura1_idx` (`factura_id_factura` ASC) VISIBLE,
  CONSTRAINT `fk_detalle_factura_factura1`
    FOREIGN KEY (`factura_id_factura`)
    REFERENCES `db_proyectoC3`.`factura` (`id_factura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_proyectoC3`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_proyectoC3`.`producto` (
  `id_producto` INT NOT NULL AUTO_INCREMENT,
  `referencia` VARCHAR(45) NULL,
  `nombre_producto` VARCHAR(120) NULL,
  `descripcion_producto` VARCHAR(200) NULL,
  `detalle_factura_id_detalle_factura` INT NOT NULL,
  PRIMARY KEY (`id_producto`),
  INDEX `fk_producto_detalle_factura1_idx` (`detalle_factura_id_detalle_factura` ASC) VISIBLE,
  CONSTRAINT `fk_producto_detalle_factura1`
    FOREIGN KEY (`detalle_factura_id_detalle_factura`)
    REFERENCES `db_proyectoC3`.`detalle_factura` (`id_detalle_factura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
