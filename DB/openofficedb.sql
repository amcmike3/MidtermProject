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
  `location` VARCHAR(100) NULL,
  `enabled` TINYINT NOT NULL DEFAULT 1,
  `description` VARCHAR(500) NULL,
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
  `title` VARCHAR(99) NOT NULL,
  `description` VARCHAR(99) NULL,
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
  `benefit_id` INT NOT NULL,
  PRIMARY KEY (`company_id`, `benefit_id`),
  INDEX `fk_company_has_benefit..._benefit...1_idx` (`benefit_id` ASC),
  INDEX `fk_company_has_benefit..._company1_idx` (`company_id` ASC),
  CONSTRAINT `fk_company_has_benefit..._company1`
    FOREIGN KEY (`company_id`)
    REFERENCES `company` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_company_has_benefit..._benefit...1`
    FOREIGN KEY (`benefit_id`)
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
INSERT INTO `company` (`id`, `name`, `location`, `enabled`, `description`) VALUES (1, 'The good company', 'we are wherever you are', 1, 'some random stuff i guess I don\'t know we will fill this stuff in later');
INSERT INTO `company` (`id`, `name`, `location`, `enabled`, `description`) VALUES (2, 'Billy Bob\'s Art Gallery', 'Inside Bobs Head', 1, 'This Art Gallery is filled with paintings of Billy Bobs most treasured life moments these memories are priceless but Billy Bob would probably sell his soul for the low price of $19.99');
INSERT INTO `company` (`id`, `name`, `location`, `enabled`, `description`) VALUES (3, 'Daytona 500 gear', 'Kentucky', 1, 'We have all the Daytona 500 gear you could possibly need. This is also the headquarters for the committee to move the Daytona 500 to Kentucky.');
INSERT INTO `company` (`id`, `name`, `location`, `enabled`, `description`) VALUES (4, 'Always Late Construction', 'Inside Cheap Liqour', 1, 'Never on time, Probably charge to much, but we don\'t care as long as we can drink on the job.');
INSERT INTO `company` (`id`, `name`, `location`, `enabled`, `description`) VALUES (5, 'Shirtless Pool Cleaners', 'Hopefully somehwere warm..', 1, 'We might not look pretty but we\'re shirtless and know how to clean pools.');
INSERT INTO `company` (`id`, `name`, `location`, `enabled`, `description`) VALUES (6, 'Happy Planters', 'Rooted in your hometown', 1, 'We are happy so we can give your plants the love they have been missing.');
INSERT INTO `company` (`id`, `name`, `location`, `enabled`, `description`) VALUES (7, 'Cracked Pipe Plumbing', 'In someones basement', 1, 'We don\'t just fix cracked pipes we also give you a complimentary plumbers crack showcase.');
INSERT INTO `company` (`id`, `name`, `location`, `enabled`, `description`) VALUES (8, 'Coin Laundry', 'Across the street from Bobs Art Gallery', 1, 'Bring your own clothes, clean them yourself, fold them yourself, and pay us to do it.');
INSERT INTO `company` (`id`, `name`, `location`, `enabled`, `description`) VALUES (9, 'Cheap Liquor', 'Next to Coin Laundry', 1, 'The only thing we gaurantee is that the older you get the worse the hangovers get. Drink Responsibly.');
INSERT INTO `company` (`id`, `name`, `location`, `enabled`, `description`) VALUES (10, 'Resellers R Us', 'Confidential.. we don\'t want you to find us.', 1, 'We find things on clearance and then sell them to you for more on the internet!');

COMMIT;


-- -----------------------------------------------------
-- Data for table `industry`
-- -----------------------------------------------------
START TRANSACTION;
USE `open_officedb`;
INSERT INTO `industry` (`id`, `name`) VALUES (1, 'textile');
INSERT INTO `industry` (`id`, `name`) VALUES (2, 'Technology');
INSERT INTO `industry` (`id`, `name`) VALUES (3, 'Construction');
INSERT INTO `industry` (`id`, `name`) VALUES (4, 'Arts');
INSERT INTO `industry` (`id`, `name`) VALUES (5, 'Manufacturing');
INSERT INTO `industry` (`id`, `name`) VALUES (6, 'Retail');
INSERT INTO `industry` (`id`, `name`) VALUES (7, 'Sports');
INSERT INTO `industry` (`id`, `name`) VALUES (8, 'Landscaping');
INSERT INTO `industry` (`id`, `name`) VALUES (9, 'Food services');
INSERT INTO `industry` (`id`, `name`) VALUES (10, 'Nursing');

COMMIT;


-- -----------------------------------------------------
-- Data for table `job`
-- -----------------------------------------------------
START TRANSACTION;
USE `open_officedb`;
INSERT INTO `job` (`id`, `salary`, `years_experience`, `skills`, `education`, `certifications`, `company_id`, `industry_id`, `enabled`, `title`, `description`) VALUES (1, 89999, 25, 'Administration', 'Doctorates in website administration', 'Expert Administration from the institute the adminsters the certifications for administering administration expertly.', 1, 1, 1, 'administrator of adminstration', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `open_officedb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `first_name`, `last_name`, `role`, `email`, `img_url`, `description`) VALUES (1, 'openadmin', 'openadmin', 1, 'Johnny', 'Doughboy', 'admin', 'blah@blah.com', 'https://i.redd.it/tye3sd6w7it51.jpg', 'look at me i\'m pretty');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `first_name`, `last_name`, `role`, `email`, `img_url`, `description`) VALUES (2, 'hair24', 'hair24', 1, 'Harry', 'Smith', 'user', 'hair24@gmail.com', 'https://images.unsplash.com/photo-1555583743-991174c11425?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8aGFycnklMjBndXl8ZW58MHx8MHx8&auto=format&fit=crop&w=400&q=60', 'I have a lot of hair its part of my identity');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `first_name`, `last_name`, `role`, `email`, `img_url`, `description`) VALUES (3, 'finger32', 'finger32', 1, 'Fiona', 'Thieking', 'user', 'finger32@gmail.com', 'https://plus.unsplash.com/premium_photo-1671717724812-c264ec0e8fce?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZmluZ2Vyc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=400&q=60', 'I was born with extra fingers and missing toes');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `first_name`, `last_name`, `role`, `email`, `img_url`, `description`) VALUES (4, 'cool_man007', 'cool_man007', 1, 'James', 'Bond', 'user', 'cool_man007@gmail.com', 'https://images.unsplash.com/photo-1495576596703-e0063a132b6e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8c3B5fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=400&q=60', 'I like my drinks shaken not stirred');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `first_name`, `last_name`, `role`, `email`, `img_url`, `description`) VALUES (5, 'soap-sock88', 'soap-sock88', 1, 'John', 'Douglas', 'user', 'soap-sock88@gmail.com', 'https://images.unsplash.com/photo-1597843797221-e34b4a320b97?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8c29ja3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=400&q=60', 'I was disciplinged with a soap sock when I was a kid');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `first_name`, `last_name`, `role`, `email`, `img_url`, `description`) VALUES (6, 'supreme_garbage', 'supreme_garbage', 1, 'Terry', 'Paine', 'user', 'supreme_garbage@gmail.com', 'https://images.unsplash.com/flagged/photo-1572213426852-0e4ed8f41ff6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8d2FzdGV8ZW58MHx8MHx8&auto=format&fit=crop&w=400&q=60', 'I work for WM');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `first_name`, `last_name`, `role`, `email`, `img_url`, `description`) VALUES (7, 'surfaceCleaner', 'surfaceCleaner', 1, 'Shawni', 'Tawni', 'user', 'surfaceCleaner@gmail.com', 'https://images.unsplash.com/photo-1580256081112-e49377338b7f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Y2xlYW5lcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=400&q=60', 'I want to start my own cleaning business but I am crippled by insecurity');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `first_name`, `last_name`, `role`, `email`, `img_url`, `description`) VALUES (8, 'guy1234', 'guy1234', 1, 'Tawni', 'Shawni', 'user', 'guy1234@gmail.com', 'https://images.unsplash.com/photo-1564564244660-5d73c057f2d2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Z3V5fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=400&q=60', 'Just a normal dude');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `first_name`, `last_name`, `role`, `email`, `img_url`, `description`) VALUES (9, 'girl1929', 'girl1929', 1, 'Tony', 'Ale', 'user', 'girl1929@gmail.com', 'https://images.unsplash.com/photo-1602233158242-3ba0ac4d2167?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Z2lybHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=400&q=60', 'Just your average Girl');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `first_name`, `last_name`, `role`, `email`, `img_url`, `description`) VALUES (10, 'username_blank', 'username_blank', 1, 'Barry', 'Scary', 'admin', 'username_blank@gmail.com', 'https://images.unsplash.com/photo-1579389083078-4e7018379f7e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8YWRtaW58ZW58MHx8MHx8&auto=format&fit=crop&w=400&q=60', 'I am all business which is why I was promoted to admin of this website');

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
INSERT INTO `company_image` (`id`, `img_url`, `date_created`, `img_description`, `company_id`) VALUES (2, 'https://media.istockphoto.com/id/1340257709/photo/big-idea-concept-the-woman-open-the-door-in-the-maze-shaped-brain.jpg?s=612x612&w=is&k=20&c=mav7jGk4OxWEVzCTPe_-jGlrbgMH215injoARqKJ0BY=', '2000-01-01 0:00:00', 'Inside Bobs Head', 2);
INSERT INTO `company_image` (`id`, `img_url`, `date_created`, `img_description`, `company_id`) VALUES (3, 'https://media.istockphoto.com/id/153829591/photo/nascar-illustration-black-and-white.jpg?s=612x612&w=is&k=20&c=KJR9WxO42amXsdsGt9jOhGuGAkN6fODzfmilrW5Zi6I=', '2000-01-02 0:00:00', 'Nascar Fastcar', 3);
INSERT INTO `company_image` (`id`, `img_url`, `date_created`, `img_description`, `company_id`) VALUES (4, 'https://images.unsplash.com/photo-1613667240983-f71f399bf430?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bGlxdW9yfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=400&q=60', '2000-01-03 0:00:00', 'Inside Cheap Liqour', 4);
INSERT INTO `company_image` (`id`, `img_url`, `date_created`, `img_description`, `company_id`) VALUES (5, 'https://images.unsplash.com/photo-1486655643111-5a1741acd481?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cG9vbCUyMGJveXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=400&q=60', '2000-01-04 0:00:00', 'Hopefully somehwere warm..', 5);
INSERT INTO `company_image` (`id`, `img_url`, `date_created`, `img_description`, `company_id`) VALUES (6, 'https://images.unsplash.com/photo-1586280268958-9483002d016a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Z2FyZGVuZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=400&q=60', '2000-01-05 0:00:00', 'Rooted in your hometown', 6);
INSERT INTO `company_image` (`id`, `img_url`, `date_created`, `img_description`, `company_id`) VALUES (7, 'https://plus.unsplash.com/premium_photo-1664301132849-f52af765df79?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGx1bWJlcnN8ZW58MHx8MHx8&auto=format&fit=crop&w=400&q=60', '2000-01-06 0:00:00', 'In someones basement', 7);
INSERT INTO `company_image` (`id`, `img_url`, `date_created`, `img_description`, `company_id`) VALUES (8, 'https://plus.unsplash.com/premium_photo-1663036970563-99624abc950e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y29pbiUyMGxhdW5kcnl8ZW58MHx8MHx8&auto=format&fit=crop&w=400&q=60', '2000-01-07 0:00:00', 'Across the street from Bobs Art Gallery', 8);
INSERT INTO `company_image` (`id`, `img_url`, `date_created`, `img_description`, `company_id`) VALUES (9, 'https://images.unsplash.com/photo-1630382716699-a1bcd2d3b143?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bGlxdW9yJTIwc3RvcmV8ZW58MHx8MHx8&auto=format&fit=crop&w=400&q=60', '2000-01-08 0:00:00', 'Next to Coin Laundry', 9);
INSERT INTO `company_image` (`id`, `img_url`, `date_created`, `img_description`, `company_id`) VALUES (10, 'https://images.unsplash.com/photo-1594718166882-f000754d52db?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y29uZmlkZW50aWFsfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=400&q=60', '2000-01-09 0:00:00', 'Confidential.. we don\'t want you to find us.', 10);

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
INSERT INTO `benefit` (`id`, `description`, `name`, `perk`) VALUES (2, 'Health Insurance', 'Health', 0);
INSERT INTO `benefit` (`id`, `description`, `name`, `perk`) VALUES (3, 'Denatal Insurance', 'Dental', 0);
INSERT INTO `benefit` (`id`, `description`, `name`, `perk`) VALUES (4, 'Match 100% up to 6% of salary', '401k Matching', 0);
INSERT INTO `benefit` (`id`, `description`, `name`, `perk`) VALUES (5, '$100,000 benefit', 'Life Insurance', 0);
INSERT INTO `benefit` (`id`, `description`, `name`, `perk`) VALUES (6, '$45,000 benefit', 'Disability Insurance', 0);
INSERT INTO `benefit` (`id`, `description`, `name`, `perk`) VALUES (7, '4 weeks per year', 'Paid time off', 0);
INSERT INTO `benefit` (`id`, `description`, `name`, `perk`) VALUES (8, '10 days per year', 'Sick Leave', 0);
INSERT INTO `benefit` (`id`, `description`, `name`, `perk`) VALUES (9, '4 month paid at full time rate', 'Paternity Leave', 0);
INSERT INTO `benefit` (`id`, `description`, `name`, `perk`) VALUES (10, 'all inclusive gym weights, treadmills, sauna, hot tub', 'On-Site Gym', 1);
INSERT INTO `benefit` (`id`, `description`, `name`, `perk`) VALUES (11, 'Breakfast, Lunch, and Dinner', 'On-site meals', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `company_has_benefit`
-- -----------------------------------------------------
START TRANSACTION;
USE `open_officedb`;
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (1, 1);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (1, 2);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (1, 6);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (1, 9);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (1, 4);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (2, 1);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (2, 8);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (2, 10);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (2, 2);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (2, 4);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (3, 2);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (3, 9);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (3, 6);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (3, 8);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (4, 2);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (4, 6);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (4, 3);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (5, 3);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (5, 10);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (5, 7);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (6, 6);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (6, 3);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (6, 7);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (7, 2);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (7, 3);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (7, 7);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (7, 6);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (8, 3);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (8, 1);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (8, 2);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (9, 7);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (9, 10);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (9, 3);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (9, 8);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (10, 8);
INSERT INTO `company_has_benefit` (`company_id`, `benefit_id`) VALUES (10, 3);

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

