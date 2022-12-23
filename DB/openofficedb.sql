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
  `enabled` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `industry`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `industry` ;

CREATE TABLE IF NOT EXISTS `industry` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
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
  `company_id` INT NOT NULL,
  `industry_id` INT NOT NULL,
  `enabled` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  INDEX `fk_job_company1_idx` (`company_id` ASC),
  INDEX `fk_job_industry1_idx` (`industry_id` ASC),
  CONSTRAINT `fk_job_company1`
    FOREIGN KEY (`company_id`)
    REFERENCES `company` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_job_industry1`
    FOREIGN KEY (`industry_id`)
    REFERENCES `industry` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  `email` VARCHAR(45) NOT NULL,
  `img_url` VARCHAR(200) NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
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
  `title` VARCHAR(45) NULL,
  `job_offered` TINYINT NULL,
  `questions` TEXT NULL,
  `job_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_company_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_interview_job1_idx` (`job_id` ASC),
  CONSTRAINT `fk_company_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_interview_job1`
    FOREIGN KEY (`job_id`)
    REFERENCES `job` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `company_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `company_image` ;

CREATE TABLE IF NOT EXISTS `company_image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `img_url` VARCHAR(2000) NOT NULL,
  `date_created` DATETIME NULL,
  `img_description` VARCHAR(45) NULL,
  `company_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_company_image_company1_idx` (`company_id` ASC),
  CONSTRAINT `fk_company_image_company1`
    FOREIGN KEY (`company_id`)
    REFERENCES `company` (`id`)
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
  `recommendation` TINYINT NOT NULL,
  `rating` INT NOT NULL,
  `pros` TEXT NULL,
  `cons` TEXT NULL,
  `title` VARCHAR(45) NOT NULL,
  `advice` TEXT NULL,
  `company_id` INT NOT NULL,
  `published` TINYINT NULL,
  `enabled` TINYINT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  INDEX `fk_company_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_company_review_company1_idx` (`company_id` ASC),
  CONSTRAINT `fk_company_comment_user10`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_company_review_company1`
    FOREIGN KEY (`company_id`)
    REFERENCES `company` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `benefit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `benefit` ;

CREATE TABLE IF NOT EXISTS `benefit` (
  `id` INT NOT NULL,
  `description` TEXT NULL,
  `name` VARCHAR(45) NULL,
  `perk` TINYINT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `company_has_benefit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `company_has_benefit` ;

CREATE TABLE IF NOT EXISTS `company_has_benefit` (
  `company_id` INT NOT NULL,
  `benefit..._id` INT NOT NULL,
  PRIMARY KEY (`company_id`, `benefit..._id`),
  INDEX `fk_company_has_benefit..._benefit...1_idx` (`benefit..._id` ASC),
  INDEX `fk_company_has_benefit..._company1_idx` (`company_id` ASC),
  CONSTRAINT `fk_company_has_benefit..._company1`
    FOREIGN KEY (`company_id`)
    REFERENCES `company` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_company_has_benefit..._benefit...1`
    FOREIGN KEY (`benefit..._id`)
    REFERENCES `benefit` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_subscribed_to_company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_subscribed_to_company` ;

CREATE TABLE IF NOT EXISTS `user_subscribed_to_company` (
  `user_id` INT NOT NULL,
  `company_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `company_id`),
  INDEX `fk_user_has_company_company1_idx` (`company_id` ASC),
  INDEX `fk_user_has_company_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_company_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_company_company1`
    FOREIGN KEY (`company_id`)
    REFERENCES `company` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `article`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `article` ;

CREATE TABLE IF NOT EXISTS `article` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `description` TEXT NOT NULL,
  `article_url` VARCHAR(200) NULL,
  `date_posted` DATETIME NULL,
  `user_id` INT NOT NULL,
  `industry_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_article_user1_idx` (`user_id` ASC),
  INDEX `fk_article_industry1_idx` (`industry_id` ASC),
  CONSTRAINT `fk_article_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_article_industry1`
    FOREIGN KEY (`industry_id`)
    REFERENCES `industry` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `interview_question`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `interview_question` ;

CREATE TABLE IF NOT EXISTS `interview_question` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `interview_has_interview_question`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `interview_has_interview_question` ;

CREATE TABLE IF NOT EXISTS `interview_has_interview_question` (
  `interview_id` INT NOT NULL,
  `interview_question_id` INT NOT NULL,
  PRIMARY KEY (`interview_id`, `interview_question_id`),
  INDEX `fk_interview_has_interview_question_interview_question1_idx` (`interview_question_id` ASC),
  INDEX `fk_interview_has_interview_question_interview1_idx` (`interview_id` ASC),
  CONSTRAINT `fk_interview_has_interview_question_interview1`
    FOREIGN KEY (`interview_id`)
    REFERENCES `interview` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_interview_has_interview_question_interview_question1`
    FOREIGN KEY (`interview_question_id`)
    REFERENCES `interview_question` (`id`)
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
-- Data for table `company`
-- -----------------------------------------------------
START TRANSACTION;
USE `open_officedb`;
INSERT INTO `company` (`id`, `name`, `location`, `enabled`) VALUES (1, 'The good company', 'we are wherever you are', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `industry`
-- -----------------------------------------------------
START TRANSACTION;
USE `open_officedb`;
INSERT INTO `industry` (`id`, `name`) VALUES (1, 'textile');

COMMIT;


-- -----------------------------------------------------
-- Data for table `job`
-- -----------------------------------------------------
START TRANSACTION;
USE `open_officedb`;
INSERT INTO `job` (`id`, `salary`, `years_experience`, `skills`, `education`, `certifications`, `company_id`, `industry_id`, `enabled`) VALUES (1, 89999, 25, 'Administration', 'Doctorates in website administration', 'Expert Administration from the institute the adminsters the certifications for administering administration expertly.', 1, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `open_officedb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `first_name`, `last_name`, `role`, `email`, `img_url`, `description`) VALUES (1, 'openadmin', 'openadmin', 1, 'Johnny', 'Doughboy', 'admin', 'blah@blah.com', 'https://i.redd.it/tye3sd6w7it51.jpg', 'look at me i\'m pretty');

COMMIT;


-- -----------------------------------------------------
-- Data for table `interview`
-- -----------------------------------------------------
START TRANSACTION;
USE `open_officedb`;
INSERT INTO `interview` (`id`, `process`, `comment_date`, `user_id`, `title`, `job_offered`, `questions`, `job_id`) VALUES (1, 'I applied for an administration job at the good company and they emailed me, to schedule a phone interview. After the phone interview we had 18 rounds of whiteboard interviews asking incredibly in depth data structure and algorithm questions. ', NULL, 1, 'What are data structures and algorithms?...', 1, 'Two Sum, Regex matching, Binary Search', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `company_image`
-- -----------------------------------------------------
START TRANSACTION;
USE `open_officedb`;
INSERT INTO `company_image` (`id`, `img_url`, `date_created`, `img_description`, `company_id`) VALUES (1, 'https://m.media-amazon.com/images/W/WEBP_402378-T2/images/I/51keG5vVCNL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg', '2000-01-01 00:00:00', 'The good company', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `company_review`
-- -----------------------------------------------------
START TRANSACTION;
USE `open_officedb`;
INSERT INTO `company_review` (`id`, `content`, `review_date`, `user_id`, `recommendation`, `rating`, `pros`, `cons`, `title`, `advice`, `company_id`, `published`, `enabled`) VALUES (1, 'I don\'t like this company... I love this company', '2000-01-01 00:00:00', 1, 1, 9, 'Just found out the company that produces yardsticks won’t be making them any longer.', 'I sent my hearing aids in for repair 3 weeks ago. I haven’t heard anything since.', 'Sarcasm 101', 'keep humor in the company culture', 1, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `benefit`
-- -----------------------------------------------------
START TRANSACTION;
USE `open_officedb`;
INSERT INTO `benefit` (`id`, `description`, `name`, `perk`) VALUES (1, '401k matching 100%', '401k', 0);
INSERT INTO `benefit` (`id`, `description`, `name`, `perk`) VALUES (2, 'honestly, this gym is only slightly better than a hotel gym', 'on site gym', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `company_has_benefit`
-- -----------------------------------------------------
START TRANSACTION;
USE `open_officedb`;
INSERT INTO `company_has_benefit` (`company_id`, `benefit..._id`) VALUES (1, 1);
INSERT INTO `company_has_benefit` (`company_id`, `benefit..._id`) VALUES (1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_subscribed_to_company`
-- -----------------------------------------------------
START TRANSACTION;
USE `open_officedb`;
INSERT INTO `user_subscribed_to_company` (`user_id`, `company_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `article`
-- -----------------------------------------------------
START TRANSACTION;
USE `open_officedb`;
INSERT INTO `article` (`id`, `title`, `description`, `article_url`, `date_posted`, `user_id`, `industry_id`) VALUES (1, 'the effects of frolicking on mental health', '\"tip-toeing through the tulips\" is often seen as a practice for those who are insane but does it have mental health benefits?', 'https://www.foxnews.com/lifestyle/twitter-user-discovers-frolicking-viral', '2000-01-01 00:00:00', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `interview_question`
-- -----------------------------------------------------
START TRANSACTION;
USE `open_officedb`;
INSERT INTO `interview_question` (`id`, `title`, `name`, `description`) VALUES (1, 'Two Sum', 'Two Sum', 'Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.\n\nYou may assume that each input would have exactly one solution, and you may not use the same element twice.\n\nYou can return the answer in any order.');
INSERT INTO `interview_question` (`id`, `title`, `name`, `description`) VALUES (2, 'Regex Matching', 'Regex Matching', 'Given an input string s and a pattern p, implement regular expression matching with support for \'.\' and \'*\' where:\n\n\'.\' Matches any single character.​​​​\n\'*\' Matches zero or more of the preceding element.\nThe matching should cover the entire input string (not partial).');
INSERT INTO `interview_question` (`id`, `title`, `name`, `description`) VALUES (3, 'Binary Search', 'Binary Search', 'Given an array of integers nums which is sorted in ascending order, and an integer target, write a function to search target in nums. If target exists, then return its index. Otherwise, return -1.\n\nYou must write an algorithm with O(log n) runtime complexity.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `interview_has_interview_question`
-- -----------------------------------------------------
START TRANSACTION;
USE `open_officedb`;
INSERT INTO `interview_has_interview_question` (`interview_id`, `interview_question_id`) VALUES (1, 1);
INSERT INTO `interview_has_interview_question` (`interview_id`, `interview_question_id`) VALUES (1, 2);
INSERT INTO `interview_has_interview_question` (`interview_id`, `interview_question_id`) VALUES (1, 3);

COMMIT;

