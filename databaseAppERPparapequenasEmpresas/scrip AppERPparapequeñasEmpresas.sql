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
-- Table `db_proyectoC3`.`terceros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_proyectoC3`.`terceros` (
  `id_terceros` INT NOT NULL AUTO_INCREMENT,
  `idcliente` INT NULL,
  `id_proveedor` INT NULL,
  `tipo_documento` VARCHAR(45) NULL,
  `numero_documento` VARCHAR(100) NULL,
  `nombres` VARCHAR(100) NULL,
  `apellidos` VARCHAR(100) NULL,
  PRIMARY KEY (`id_terceros`))
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
-- Table `db_proyectoC3`.`contacto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_proyectoC3`.`contacto` (
  `id_contacto` INT NOT NULL AUTO_INCREMENT,
  `contacto` VARCHAR(45) NULL,
  `email` VARCHAR(100) NOT NULL,
  `telefono` VARCHAR(45) NULL,
  `proveedor_id_proveedor` INT NOT NULL,
  `tipo_contacto_id_tipo_contacto` INT NOT NULL,
  `terceros_id_terceros` INT NOT NULL,
  PRIMARY KEY (`id_contacto`),
  INDEX `fk_contacto_tipo_contacto1_idx` (`tipo_contacto_id_tipo_contacto` ASC) VISIBLE,
  INDEX `fk_contacto_terceros1_idx` (`terceros_id_terceros` ASC) VISIBLE,
  CONSTRAINT `fk_contacto_tipo_contacto1`
    FOREIGN KEY (`tipo_contacto_id_tipo_contacto`)
    REFERENCES `db_proyectoC3`.`tipo_contacto` (`id_tipo_contacto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contacto_terceros1`
    FOREIGN KEY (`terceros_id_terceros`)
    REFERENCES `db_proyectoC3`.`terceros` (`id_terceros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  `terceros_id_terceros` INT NOT NULL,
  PRIMARY KEY (`id_direcciones`),
  INDEX `fk_direcciones_terceros1_idx` (`terceros_id_terceros` ASC) VISIBLE,
  CONSTRAINT `fk_direcciones_terceros1`
    FOREIGN KEY (`terceros_id_terceros`)
    REFERENCES `db_proyectoC3`.`terceros` (`id_terceros`)
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
    REFERENCES `db_proyectoC3`.`terceros` (`idcliente`)
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


-- -----------------------------------------------------
-- Table `db_proyectoC3`.`kardex`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_proyectoC3`.`kardex` (
  `id_kardex` INT NOT NULL AUTO_INCREMENT,
  `factura_id_factura` INT NOT NULL,
  `producto_id_producto` INT NOT NULL,
  `unidades` INT NULL,
  `valor_unidad` DOUBLE NULL,
  PRIMARY KEY (`id_kardex`),
  INDEX `fk_kardex_factura1_idx` (`factura_id_factura` ASC) VISIBLE,
  INDEX `fk_kardex_producto1_idx` (`producto_id_producto` ASC) VISIBLE,
  CONSTRAINT `fk_kardex_factura1`
    FOREIGN KEY (`factura_id_factura`)
    REFERENCES `db_proyectoC3`.`factura` (`id_factura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_kardex_producto1`
    FOREIGN KEY (`producto_id_producto`)
    REFERENCES `db_proyectoC3`.`producto` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_proyectoC3`.`documentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_proyectoC3`.`documentos` (
  `id_documentos` INT NOT NULL,
  PRIMARY KEY (`id_documentos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_proyectoC3`.`factura_venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_proyectoC3`.`factura_venta` (
  `id_factura_venta` INT NOT NULL AUTO_INCREMENT,
  `subtotal` DOUBLE NULL,
  `ipo_consumo` DOUBLE NULL,
  `iva` DOUBLE NULL,
  `total` DOUBLE NULL,
  `terceros_id_terceros` INT NOT NULL,
  `factura_id_factura` INT NOT NULL,
  PRIMARY KEY (`id_factura_venta`),
  INDEX `fk_factura_venta_terceros1_idx` (`terceros_id_terceros` ASC) VISIBLE,
  INDEX `fk_factura_venta_factura1_idx` (`factura_id_factura` ASC) VISIBLE,
  CONSTRAINT `fk_factura_venta_terceros1`
    FOREIGN KEY (`terceros_id_terceros`)
    REFERENCES `db_proyectoC3`.`terceros` (`id_terceros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_venta_factura1`
    FOREIGN KEY (`factura_id_factura`)
    REFERENCES `db_proyectoC3`.`factura` (`id_factura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_proyectoC3`.`factura_compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_proyectoC3`.`factura_compra` (
  `id_factura_compra` INT NOT NULL AUTO_INCREMENT,
  `subtotal` DOUBLE NULL,
  `ipo_comsumo` DOUBLE NULL,
  `iva` DOUBLE NULL,
  `total` DOUBLE NULL,
  `factura_id_factura` INT NOT NULL,
  `terceros_id_terceros` INT NOT NULL,
  PRIMARY KEY (`id_factura_compra`),
  INDEX `fk_factura_compra_factura1_idx` (`factura_id_factura` ASC) VISIBLE,
  INDEX `fk_factura_compra_terceros1_idx` (`terceros_id_terceros` ASC) VISIBLE,
  CONSTRAINT `fk_factura_compra_factura1`
    FOREIGN KEY (`factura_id_factura`)
    REFERENCES `db_proyectoC3`.`factura` (`id_factura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_compra_terceros1`
    FOREIGN KEY (`terceros_id_terceros`)
    REFERENCES `db_proyectoC3`.`terceros` (`id_terceros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_proyectoC3`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_proyectoC3`.`usuarios` (
  `id_usuarios` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(120) NULL,
  `password` VARCHAR(120) NULL,
  `grupo` VARCHAR(45) NULL,
  `subgrupo` VARCHAR(45) NULL,
  `terceros_id_terceros` INT NOT NULL,
  PRIMARY KEY (`id_usuarios`),
  INDEX `fk_usuarios_terceros1_idx` (`terceros_id_terceros` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_terceros1`
    FOREIGN KEY (`terceros_id_terceros`)
    REFERENCES `db_proyectoC3`.`terceros` (`id_terceros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
