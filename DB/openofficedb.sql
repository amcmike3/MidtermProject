-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema open_officedb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `open_officedb` ;

-- -----------------------------------------------------
-- Schema open_officedb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `open_officedb` DEFAULT CHARACTER SET utf8 ;
USE `open_officedb` ;

-- -----------------------------------------------------
-- Table `company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `company` ;

CREATE TABLE IF NOT EXISTS `company` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `location` VARCHAR(500) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `benefit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `benefit` ;

CREATE TABLE IF NOT EXISTS `benefit` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `health` TINYINT NOT NULL DEFAULT 0,
  `dental` TINYINT NOT NULL DEFAULT 0,
  `vision` TINYINT NOT NULL DEFAULT 0,
  `paid_vacation` TINYINT NOT NULL DEFAULT 0,
  `retirement_planning` TINYINT NOT NULL DEFAULT 0,
  `retirement_contributions` TINYINT NOT NULL DEFAULT 0,
  `bonus` TINYINT NOT NULL DEFAULT 0,
  `life_insur` TINYINT NOT NULL DEFAULT 0,
  `disability_insur` TINYINT NOT NULL DEFAULT 0,
  `family_leave` TINYINT NOT NULL DEFAULT 0,
  `sick_days` TINYINT NOT NULL DEFAULT 0,
  `wellness_program` TINYINT NOT NULL DEFAULT 0,
  `home_office_stipend` TINYINT NOT NULL DEFAULT 0,
  `education_benefits` TINYINT NOT NULL DEFAULT 0,
  `stock_options` TINYINT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `job`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `job` ;

CREATE TABLE IF NOT EXISTS `job` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `salary` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `experience` TEXT NULL,
  `skills` TEXT NULL,
  `education` TEXT NULL,
  `pic` VARCHAR(45) NULL,
  `certifications` TEXT NULL,
  `veteran` TINYINT NOT NULL DEFAULT 0,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `enabled` TINYINT NULL DEFAULT 1,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `role` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS openuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'openuser'@'localhost' IDENTIFIED BY 'openuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'openuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `open_officedb`;
INSERT INTO `user` (`id`, `experience`, `skills`, `education`, `pic`, `certifications`, `veteran`, `username`, `password`, `enabled`, `first_name`, `last_name`, `role`) VALUES (1, NULL, NULL, NULL, NULL, NULL, DEFAULT, 'openadmin', 'openadmin', 1, 'open', 'admin', 'admin');

COMMIT;

