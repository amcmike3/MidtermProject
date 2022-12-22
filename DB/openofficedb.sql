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
-- Table `company_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `company_image` ;

CREATE TABLE IF NOT EXISTS `company_image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `img_url` VARCHAR(2000) NOT NULL,
  `date_created` DATETIME NULL,
  `img_description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `company` ;

CREATE TABLE IF NOT EXISTS `company` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `location` VARCHAR(500) NULL,
  `company_image_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_company_company_image1_idx` (`company_image_id` ASC),
  CONSTRAINT `fk_company_company_image1`
    FOREIGN KEY (`company_image_id`)
    REFERENCES `company_image` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  `company_id` INT NOT NULL,
  `other` VARCHAR(500) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_benefit_company1_idx` (`company_id` ASC),
  CONSTRAINT `fk_benefit_company1`
    FOREIGN KEY (`company_id`)
    REFERENCES `company` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `job`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `job` ;

CREATE TABLE IF NOT EXISTS `job` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `salary` INT NULL,
  `years_experience` INT NULL,
  `skills` TEXT NULL,
  `education` VARCHAR(100) NULL,
  `certifications` VARCHAR(200) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_image` ;

CREATE TABLE IF NOT EXISTS `user_image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `img_url` VARCHAR(2000) NOT NULL,
  `date_created` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `enabled` TINYINT NULL DEFAULT 1,
  `first_name` VARCHAR(45) NULL DEFAULT 'Johnny',
  `last_name` VARCHAR(45) NULL DEFAULT 'Doughboy',
  `role` VARCHAR(45) NULL DEFAULT 'USER',
  `job_id` INT NOT NULL,
  `user_image_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  INDEX `fk_user_job_idx` (`job_id` ASC),
  INDEX `fk_user_user_image1_idx` (`user_image_id` ASC),
  CONSTRAINT `fk_user_job`
    FOREIGN KEY (`job_id`)
    REFERENCES `job` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_user_image1`
    FOREIGN KEY (`user_image_id`)
    REFERENCES `user_image` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `company_jobs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `company_jobs` ;

CREATE TABLE IF NOT EXISTS `company_jobs` (
  `job_id` INT NOT NULL,
  `company_id` INT NOT NULL,
  PRIMARY KEY (`job_id`, `company_id`),
  INDEX `fk_job_has_company_company1_idx` (`company_id` ASC),
  INDEX `fk_job_has_company_job1_idx` (`job_id` ASC),
  CONSTRAINT `fk_job_has_company_job1`
    FOREIGN KEY (`job_id`)
    REFERENCES `job` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_job_has_company_company1`
    FOREIGN KEY (`company_id`)
    REFERENCES `company` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `interview`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `interview` ;

CREATE TABLE IF NOT EXISTS `interview` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `process` TEXT NOT NULL,
  `comment_date` DATETIME NULL,
  `user_id` INT NOT NULL,
  `company_jobs_job_id` INT NOT NULL,
  `company_jobs_company_id` INT NOT NULL,
  `title` VARCHAR(45) NULL,
  `job_offered` TINYINT NOT NULL,
  `questions` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_company_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_company_comment_company_jobs1_idx` (`company_jobs_job_id` ASC, `company_jobs_company_id` ASC),
  CONSTRAINT `fk_company_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_company_comment_company_jobs1`
    FOREIGN KEY (`company_jobs_job_id` , `company_jobs_company_id`)
    REFERENCES `company_jobs` (`job_id` , `company_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `company_review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `company_review` ;

CREATE TABLE IF NOT EXISTS `company_review` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NOT NULL,
  `review_date` DATETIME NULL,
  `user_id` INT NOT NULL,
  `company_jobs_job_id` INT NOT NULL,
  `company_jobs_company_id` INT NOT NULL,
  `benefit_id` INT NOT NULL,
  `recommendation` TINYINT NOT NULL,
  `rating` INT NOT NULL,
  `pros` TEXT NULL,
  `cons` TEXT NULL,
  `title` VARCHAR(45) NOT NULL,
  `advice` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_company_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_company_comment_company_jobs1_idx` (`company_jobs_job_id` ASC, `company_jobs_company_id` ASC),
  INDEX `fk_company_review_benefit1_idx` (`benefit_id` ASC),
  CONSTRAINT `fk_company_comment_user10`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_company_comment_company_jobs10`
    FOREIGN KEY (`company_jobs_job_id` , `company_jobs_company_id`)
    REFERENCES `company_jobs` (`job_id` , `company_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_company_review_benefit1`
    FOREIGN KEY (`benefit_id`)
    REFERENCES `benefit` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
-- Data for table `job`
-- -----------------------------------------------------
START TRANSACTION;
USE `open_officedb`;
INSERT INTO `job` (`id`, `salary`, `years_experience`, `skills`, `education`, `certifications`) VALUES (1, 89999, 25, 'Administration', 'Doctorates in website administration', 'Expert Administration from this institute of administering administration');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `open_officedb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `first_name`, `last_name`, `role`, `job_id`, `user_image_id`) VALUES (1, 'openadmin', 'openadmin', 1, 'open', 'admin', 'admin', 1, NULL);

COMMIT;

