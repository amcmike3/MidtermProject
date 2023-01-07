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
  `article_url` TEXT NULL,
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
  `title` VARCHAR(200) NULL,
  `name` TEXT NULL,
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
INSERT INTO `job` (`id`, `salary`, `years_experience`, `skills`, `education`, `certifications`, `company_id`, `industry_id`, `enabled`, `title`, `description`) VALUES (2, 120000, 1, 'writing code', 'Bachelors degree in computer science', 'CompTIA network+', 9, 2, 1, 'developer', 'develops software');
INSERT INTO `job` (`id`, `salary`, `years_experience`, `skills`, `education`, `certifications`, `company_id`, `industry_id`, `enabled`, `title`, `description`) VALUES (3, 115000, 2, 'building stuff', 'Bachelors degree in computer science', 'none', 4, 3, 1, 'heavy equipment', 'operates earthmovers');
INSERT INTO `job` (`id`, `salary`, `years_experience`, `skills`, `education`, `certifications`, `company_id`, `industry_id`, `enabled`, `title`, `description`) VALUES (4, 95000, 4, 'staying with in lines', 'Masters degree in underwater basket weaving', 'Divers certificate', 2, 4, 1, 'apraiser', 'looks at art');
INSERT INTO `job` (`id`, `salary`, `years_experience`, `skills`, `education`, `certifications`, `company_id`, `industry_id`, `enabled`, `title`, `description`) VALUES (5, 100000, 1, 'making usable stuff', 'Bachelors degree in computer science', 'none', 7, 5, 1, 'miller', 'mills parts');
INSERT INTO `job` (`id`, `salary`, `years_experience`, `skills`, `education`, `certifications`, `company_id`, `industry_id`, `enabled`, `title`, `description`) VALUES (6, 85000, 0, 'selling stuff', 'high school diploma', 'none', 10, 6, 1, 'clerk', 'runs register');
INSERT INTO `job` (`id`, `salary`, `years_experience`, `skills`, `education`, `certifications`, `company_id`, `industry_id`, `enabled`, `title`, `description`) VALUES (7, 200000, 6, 'keeping your eye on the goal', 'high school diploma', 'Skill Distillery Bootcamp certification', 3, 7, 1, 'driver', 'racecar driver');
INSERT INTO `job` (`id`, `salary`, `years_experience`, `skills`, `education`, `certifications`, `company_id`, `industry_id`, `enabled`, `title`, `description`) VALUES (8, 75000, 2, 'making things grow', 'high school diploma', 'Certified green thumb', 6, 8, 1, 'lawncare specialist', 'cuts grass, ensures growth');
INSERT INTO `job` (`id`, `salary`, `years_experience`, `skills`, `education`, `certifications`, `company_id`, `industry_id`, `enabled`, `title`, `description`) VALUES (9, 85000, 0, 'making food edible', 'high school diploma', 'none', 10, 9, 1, 'frycook', 'deep fries oreos and cheesecake');
INSERT INTO `job` (`id`, `salary`, `years_experience`, `skills`, `education`, `certifications`, `company_id`, `industry_id`, `enabled`, `title`, `description`) VALUES (10, 90500, 2, 'lifesaving, patience', 'Bachelors degree in computer science', 'none', 10, 10, 1, 'nurse', 'keeps people from dying');

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
INSERT INTO `interview` (`id`, `process`, `comment_date`, `user_id`, `title`, `job_offered`, `questions`, `job_id`) VALUES (2, 'I applied for an administration job at the good company and they emailed me, to schedule a phone interview. After the phone interview we had 18 rounds of whiteboard interviews asking incredibly in depth data structure and algorithm questions.', '2000-01-01 0:00:00', 1, 'What are data structures and algorithms?...', 1, 'Two Sum, Regex matching, Binary Search', 1);
INSERT INTO `interview` (`id`, `process`, `comment_date`, `user_id`, `title`, `job_offered`, `questions`, `job_id`) VALUES (3, 'I applied for a developer job at a big tech company and they reached out by email to schedule a phone interview. I felt like I passed the phone interview with flying colors and was scheduled a whiteboard interview shortly after. I was asked about the four pillars of object oriented programming and nearly had a nervous breakdown. It was my first whiteboard interview, so naturally, I completely bombed and they never followed up with me. ', '2001-01-01 0:00:00', 2, 'What are the 4 pillars of OOP?', 0, 'Abstraction, Encapsulation, Inheritance, Polymorphism', 2);
INSERT INTO `interview` (`id`, `process`, `comment_date`, `user_id`, `title`, `job_offered`, `questions`, `job_id`) VALUES (4, 'I know a guy that knows a guy that works as a hiring manager at Google. Despite having connections, a phone interview was scheduled via email and the interview process began shortly after. The phone interview was a breeze, however the follow-up whiteboard interview was more challenging than expected. Going into incredibly deep programming concepts that only an expert programmer like myself would be able to answer.', '2002-01-01 0:00:00', 3, 'What are 3 commonly used data structures?', 1, 'Arrays, Linked Lists, Hash Tables', 3);
INSERT INTO `interview` (`id`, `process`, `comment_date`, `user_id`, `title`, `job_offered`, `questions`, `job_id`) VALUES (5, 'What more can I say? My interview was a complete disaster. The phone interview went well enough, but boy oh boy was I not ready for the whiteboard interview. The interviewer had me attempt to write out a nested for loop which of course I forgot the syntax for. I was then asked to talk them through one of my previous projects, but of course that\'s the project that Alex McMichael solo carried our team on. It was a complete nightmare. Reminder to remove that project from my GitHub before next interview.', '2003-01-01 0:00:00', 4, 'What are data structures and algorithms?...', 0, 'Two Sum, Regex matching, Binary Search', 4);
INSERT INTO `interview` (`id`, `process`, `comment_date`, `user_id`, `title`, `job_offered`, `questions`, `job_id`) VALUES (6, 'Today was my day. After aceing the phone interview, I found myself in an office room with three senior developers hammering me with questions. The last question regarding conditionals, tasked me with converting an if statement to a ternary. It was at that moment, the heavenly rays sent down from God himself enveloped my person and a vision came to me. I was reminded of Alex and his obsession early on in our coding bootcamp with ternaries. 16 weeks of arduous training and incessant dad jokes had brought me here, and I was ready. After receiving a standing ovation for my exemplary performance, I was offered a position starting at 6 figures.', '2004-01-01 0:00:00', 5, 'What are data structures and algorithms?...', 1, 'Two Sum, Regex matching, Binary Search', 5);
INSERT INTO `interview` (`id`, `process`, `comment_date`, `user_id`, `title`, `job_offered`, `questions`, `job_id`) VALUES (7, '10 rounds of whiteboard interviews... 10 rounds... I was almost there. The interviewers asked me everything from hashmaps to arraylists, loops to arrays. Ultimately I was rejected because I am currently living in China.', '2005-01-01 0:00:00', 6, 'What are data structures and algorithms?...', 0, 'Two Sum, Regex matching, Binary Search', 6);
INSERT INTO `interview` (`id`, `process`, `comment_date`, `user_id`, `title`, `job_offered`, `questions`, `job_id`) VALUES (8, 'I applied for an entry level software developer position that required 0-3 years experience and only really asked for a bachelors degree and working knowledge of some basic programming languages. I passed the first round of interviews and I just finished the second round. The email they sent me said that it was going to be a coding/problem solving interview and I should come with my favorite text editor(IDE) pulled up and my programming language of my choice which is java. They asked me about the 4 pillars of Object-Oriented Programming which was good to have studied before the exam. Naturally, as a graduate of Skill Distillery, I had no problem answering this question and was offered a position several days later.', '2006-01-01 0:00:00', 7, 'What are data structures and algorithms?...', 1, 'Two Sum, Regex matching, Binary Search', 7);
INSERT INTO `interview` (`id`, `process`, `comment_date`, `user_id`, `title`, `job_offered`, `questions`, `job_id`) VALUES (9, 'After making it through the phone interview, I was sent a short technical scenario. A fictitious set of requirements to code a solution to at home with whatever resources I wanted and then submit it the following day. After submitting the technical piece, I was scheduled a formal interview and asked how to find the missing number in an array from 1 to 100. After proving my resourcefulness and problem-solving skills, I was able to impress the interviewer and later joined the company as a junior developer.', '2007-01-01 0:00:00', 8, 'What are data structures and algorithms?...', 1, 'Two Sum, Regex matching, Binary Search', 8);
INSERT INTO `interview` (`id`, `process`, `comment_date`, `user_id`, `title`, `job_offered`, `questions`, `job_id`) VALUES (10, 'I applied for an administration job at the good company and they emailed me, to schedule a phone interview. After the phone interview we had 18 rounds of whiteboard interviews asking incredibly in depth data structure and algorithm questions.', '2008-01-01 0:00:00', 9, 'What are data structures and algorithms?...', 1, 'Two Sum, Regex matching, Binary Search', 9);
INSERT INTO `interview` (`id`, `process`, `comment_date`, `user_id`, `title`, `job_offered`, `questions`, `job_id`) VALUES (11, 'What more can I say? My interview was a complete success. The phone interview went well enough, and boy oh boy was I ready for the whiteboard interview. The interviewer had me write out a nested for loop which of course I fremembered the syntax for. I was then asked to talk them through one of my previous projects, and luckily that\'s the project that Alex McMichael helped our team on every step of the way. It was a wonderful experience. Reminder to sticky that project to my GitHub front page before next interview.', '2009-01-01 0:00:00', 10, 'What are data structures and algorithms?...', 1, 'Two Sum, Regex matching, Binary Search', 10);

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
INSERT INTO `company_review` (`id`, `content`, `review_date`, `user_id`, `recommendation`, `rating`, `pros`, `cons`, `title`, `advice`, `company_id`, `published`, `enabled`) VALUES (2, 'Exciting Work, Abusive Culture', '2009-01-01 0:00:00', 8, 0, 2, '- You can learn a lot very quickly in a very short time\n- Surrounded with nothing but incredibly smart and driven individuals.\n- Compensation is well beyond my expectations, and more than suitable.\n- Exciting projects all across the company that keep you interested and focused.\n- Amazon is changing the world', '- Can be overwhelming, very steep learning curve\n- Can be difficult to keep up if you are not self motivated', 'Senior Engineering Manager', 'Practice Time Management', 1, 1, 1);
INSERT INTO `company_review` (`id`, `content`, `review_date`, `user_id`, `recommendation`, `rating`, `pros`, `cons`, `title`, `advice`, `company_id`, `published`, `enabled`) VALUES (3, 'Can be amazing for some people, horrible for others', '2009-01-01 0:00:00', 7, 1, 3, '- A place where you can learn a lot about all kinds of things, both technical and about yourself', '- You\'re responsible for your own career progression and finding the places and teams that are doing the stuff you want to do. No one is going to take you by the hand and help you with that.\n- Amazon is built, quite deliberately, to be Darwinian. The strong survive and the weak perish (metaphorically speaking) and the \'bar\' is constantly increasing. The level of performance that would have been acceptable five years ago will get you canned today. It\'s a kind of crucible that\'ll help you develop a harder edge, if you can survive, that can serve you well in your career and in life, but it\'s often not a pleasant experience.', 'Software Development Manager ', 'Avoid Management Positions', 2, 0, 1);
INSERT INTO `company_review` (`id`, `content`, `review_date`, `user_id`, `recommendation`, `rating`, `pros`, `cons`, `title`, `advice`, `company_id`, `published`, `enabled`) VALUES (4, 'Good to start career.', '2009-01-01 0:00:00', 2, 0, 7, 'Good company for starting your career in the memory industry.', 'Compensation is too low as per the industry', 'Engineer', 'Gain experience and then find better paying job.', 3, 1, 1);
INSERT INTO `company_review` (`id`, `content`, `review_date`, `user_id`, `recommendation`, `rating`, `pros`, `cons`, `title`, `advice`, `company_id`, `published`, `enabled`) VALUES (5, 'A good place to work but not great.\nGRAD introduces some mess but it\'s needed to have a good quality of engineers otherwise too many coasters.\nSome engeineers are excellent and smart while some are lazy and coasting.\nThe management depends on teams and mine is not lucky too much.', '2009-01-01 0:00:00', 3, 1, 3, 'Great WLB', 'Low comp, limited career growth', 'Software Engineer', 'Further go further', 4, 0, 1);
INSERT INTO `company_review` (`id`, `content`, `review_date`, `user_id`, `recommendation`, `rating`, `pros`, `cons`, `title`, `advice`, `company_id`, `published`, `enabled`) VALUES (6, 'Best centralized and productive infrastructure platform to work, and work culture. Learned expert level proficiency and efficient communication.Enjoyed the free Coffee, as it made my day productive.', '2009-01-01 0:00:00', 1, 0, 4, 'Free lunches.', 'Restricted building entries.', 'Business Architect', 'Take advatage of all the free food!', 5, 1, 1);
INSERT INTO `company_review` (`id`, `content`, `review_date`, `user_id`, `recommendation`, `rating`, `pros`, `cons`, `title`, `advice`, `company_id`, `published`, `enabled`) VALUES (7, 'There have been many times when the workload was painful and devastating to my wellbeing with no management support. In my new role, that is not the case but executive leadership is not trusted and new tracking metrics are unfair. Overall I am content and would not seek a job change at this time.', '2009-01-01 0:00:00', 2, 1, 6, 'Good environment, Growth Mindset, Learning Opportunities, Career Paths, Internal Jobs Opportunities, and a sense of belonging, inclusive teams.', 'With a lot of different applications internally, we still have opportunities to improve internal process.', 'Meteorological Operations Specialist', 'Bring Your Own Outlet!', 6, 0, 1);
INSERT INTO `company_review` (`id`, `content`, `review_date`, `user_id`, `recommendation`, `rating`, `pros`, `cons`, `title`, `advice`, `company_id`, `published`, `enabled`) VALUES (8, 'Run! Run far away!', '2009-01-01 0:00:00', 9, 0, 7, 'This company does not care about people. They just care about profits. They cut 30% of your people with same workload so your team is not successful and then blame you for failing.', 'Discriminate against older workers, set people up to fail to get rid of them.', 'Senior Director', 'Avoid the vending ', 7, 1, 1);
INSERT INTO `company_review` (`id`, `content`, `review_date`, `user_id`, `recommendation`, `rating`, `pros`, `cons`, `title`, `advice`, `company_id`, `published`, `enabled`) VALUES (9, 'Huge company. Lots of room to grow.', '2009-01-01 0:00:00', 5, 0, 9, 'Amazing learning opportunities Great work culture Supportive work-life balance', 'Onboarding was tricky and a bit overwhelming Huge company = bit lost on where to find information', '', '', 9, 0, 1);
INSERT INTO `company_review` (`id`, `content`, `review_date`, `user_id`, `recommendation`, `rating`, `pros`, `cons`, `title`, `advice`, `company_id`, `published`, `enabled`) VALUES (10, 'i really dont know how i landed this job! its so cushy and amazing. they are so supportive of the needs of me and my family. i recommend them to everyone ive met looking for a job!', '2009-01-01 0:00:00', 8, 1, 9, 'GREAT WLB, work from home options, paternity leave', ' little parking, out of the way', 'software engineer', 'shoot for the stars', 4, 1, 1);
INSERT INTO `company_review` (`id`, `content`, `review_date`, `user_id`, `recommendation`, `rating`, `pros`, `cons`, `title`, `advice`, `company_id`, `published`, `enabled`) VALUES (11, 'Very friendly staff. Supportive environment for junior developers trying to jumpstart their careers.', '2009-01-01 0:00:00', 5, 1, 7, 'Excellent company for junior developers who are eager to learn in a fast-paced environment, Welcoming team with endless knowledge and experience in the field', 'None', 'Software Developer', 'Always bring a towel!', 5, 1, 1);
INSERT INTO `company_review` (`id`, `content`, `review_date`, `user_id`, `recommendation`, `rating`, `pros`, `cons`, `title`, `advice`, `company_id`, `published`, `enabled`) VALUES (12, 'This company was absolutely brilliant! I would have kept working here the rest of my life if they didn\'t fire me.. I mean honestly for almost two years all I did was show up for the morning meeting make up some BS about what I am doing but how I am experincing some issue and doing research. It was fantastic I took several vacations to Florida in the mean time and even got a co-worker to cover for me while I made excuses that my grandma died and was attending the funeral. (I was really out fishing I caught a personal record wahoo during those \"vacations\").', '2009-01-01 0:00:00', 4, 1, 9, 'No responsibilities if you know how to work the system', 'pay isn\'t great but considering I hardly did anything I wouldn\'t complain', 'Quality Assurance', 'Do your best not to get caught ', 8, 1, 1);

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
INSERT INTO `user_subscribed_to_company` (`user_id`, `company_id`) VALUES (2, 3);
INSERT INTO `user_subscribed_to_company` (`user_id`, `company_id`) VALUES (4, 4);
INSERT INTO `user_subscribed_to_company` (`user_id`, `company_id`) VALUES (10, 2);
INSERT INTO `user_subscribed_to_company` (`user_id`, `company_id`) VALUES (8, 6);
INSERT INTO `user_subscribed_to_company` (`user_id`, `company_id`) VALUES (5, 6);
INSERT INTO `user_subscribed_to_company` (`user_id`, `company_id`) VALUES (5, 2);
INSERT INTO `user_subscribed_to_company` (`user_id`, `company_id`) VALUES (10, 8);
INSERT INTO `user_subscribed_to_company` (`user_id`, `company_id`) VALUES (10, 5);
INSERT INTO `user_subscribed_to_company` (`user_id`, `company_id`) VALUES (1, 6);
INSERT INTO `user_subscribed_to_company` (`user_id`, `company_id`) VALUES (10, 1);
INSERT INTO `user_subscribed_to_company` (`user_id`, `company_id`) VALUES (9, 5);
INSERT INTO `user_subscribed_to_company` (`user_id`, `company_id`) VALUES (7, 2);
INSERT INTO `user_subscribed_to_company` (`user_id`, `company_id`) VALUES (2, 5);
INSERT INTO `user_subscribed_to_company` (`user_id`, `company_id`) VALUES (7, 5);
INSERT INTO `user_subscribed_to_company` (`user_id`, `company_id`) VALUES (7, 7);
INSERT INTO `user_subscribed_to_company` (`user_id`, `company_id`) VALUES (6, 8);
INSERT INTO `user_subscribed_to_company` (`user_id`, `company_id`) VALUES (3, 5);
INSERT INTO `user_subscribed_to_company` (`user_id`, `company_id`) VALUES (4, 3);
INSERT INTO `user_subscribed_to_company` (`user_id`, `company_id`) VALUES (6, 7);
INSERT INTO `user_subscribed_to_company` (`user_id`, `company_id`) VALUES (3, 10);
INSERT INTO `user_subscribed_to_company` (`user_id`, `company_id`) VALUES (4, 2);
INSERT INTO `user_subscribed_to_company` (`user_id`, `company_id`) VALUES (2, 9);
INSERT INTO `user_subscribed_to_company` (`user_id`, `company_id`) VALUES (8, 10);
INSERT INTO `user_subscribed_to_company` (`user_id`, `company_id`) VALUES (1, 9);

COMMIT;


-- -----------------------------------------------------
-- Data for table `article`
-- -----------------------------------------------------
START TRANSACTION;
USE `open_officedb`;
INSERT INTO `article` (`id`, `title`, `description`, `article_url`, `date_posted`, `user_id`, `industry_id`) VALUES (1, 'the effects of frolicking on mental health', '\"tip-toeing through the tulips\" is often seen as a practice for those who are insane but does it have mental health benefits?', 'https://www.foxnews.com/lifestyle/twitter-user-discovers-frolicking-viral', '2000-01-01 00:00:00', 1, 1);
INSERT INTO `article` (`id`, `title`, `description`, `article_url`, `date_posted`, `user_id`, `industry_id`) VALUES (2, 'develop softwere happienes', 'the first ever developer happines report', 'https://www.globenewswire.com/en/news-release/2022/09/28/2524236/0/en/Zenhub-Releases-the-Industry-s-First-Software-Developer-Happiness-Report.html', '2001-01-01 0:00:00', 3, 2);
INSERT INTO `article` (`id`, `title`, `description`, `article_url`, `date_posted`, `user_id`, `industry_id`) VALUES (3, 'constuction employment increase', 'constuction employment to increase in 27 states', 'https://mecktimes.com/news/2022/12/20/construction-employment-increases-in-27-states/', '2002-01-01 0:00:00', 4, 3);
INSERT INTO `article` (`id`, `title`, `description`, `article_url`, `date_posted`, `user_id`, `industry_id`) VALUES (4, 'art apraiser finds hidden message', 'an antique roadshow guest was left open-mouthed after an expert revealed the hidden message in a statue.', 'https://www.the-sun.com/entertainment/tv/4941657/antiques-roadshow-guest-shocked-hidden-message-statue-mother/', '2003-01-01 0:00:00', 7, 4);
INSERT INTO `article` (`id`, `title`, `description`, `article_url`, `date_posted`, `user_id`, `industry_id`) VALUES (5, 'u.s. factories strong', 'its been a very good year for U.S. manufacturing ', 'https://www.npr.org/2022/10/20/1130021630/factories-factory-industrial-production-employment-jobs-economy', '2004-01-01 0:00:00', 2, 5);
INSERT INTO `article` (`id`, `title`, `description`, `article_url`, `date_posted`, `user_id`, `industry_id`) VALUES (6, 'work saves lives', 'worker saves lives by hiding guest and coworkers in freezer', 'https://www.msn.com/en-us/news/crime/tops-worker-saved-lives-hiding-customers-colleagues-in-freezer/ar-AA145sjD', '2005-01-01 0:00:00', 10, 6);
INSERT INTO `article` (`id`, `title`, `description`, `article_url`, `date_posted`, `user_id`, `industry_id`) VALUES (7, 'how i cheated on a race', 'crazy wall move wins race, why? SCIENCE', 'https://www.iflscience.com/nascar-driver-beats-other-racers-using-insane-physics-trick-he-saw-in-a-videogame-66033', '2006-01-01 0:00:00', 8, 7);
INSERT INTO `article` (`id`, `title`, `description`, `article_url`, `date_posted`, `user_id`, `industry_id`) VALUES (8, 'landscapers move to 4-10s', 'landscapers happier with improved schedule', 'https://www.totallandscapecare.com/business/article/15114437/landscapers-move-to-a-410-work-week-makes-everyone-happier', '2007-01-01 0:00:00', 9, 8);
INSERT INTO `article` (`id`, `title`, `description`, `article_url`, `date_posted`, `user_id`, `industry_id`) VALUES (9, 'the man the can the legend', 'fictional chef or a real live person, chef boyardee', 'https://www.npr.org/2011/05/17/136398042/the-man-the-can-recipes-of-the-real-chef-boyardee#:~:text=Stewart%2C%20Tabori%20%26%20Chang-,Unlike%20the%20friendly%20but%20fictional%20food%20faces%20of%20Betty%20Crocker,immigrated%20to%20America%20from%20Italy.', '2008-01-01 0:00:00', 6, 9);
INSERT INTO `article` (`id`, `title`, `description`, `article_url`, `date_posted`, `user_id`, `industry_id`) VALUES (10, 'nursing takes to the seas', 'nursing on the high seas. meet new people, travell and get paid for it.', 'ajc.com/pulse/why-becoming-a-cruise-ship-nurse-might-be-the-job-for-you/ZGZ7XLLZL5DAFOVDFQQIEZK3PU/', '2009-01-01 0:00:00', 5, 10);
INSERT INTO `article` (`id`, `title`, `description`, `article_url`, `date_posted`, `user_id`, `industry_id`) VALUES (11, 'guy happy for once', 'trollolo', 'https://youtu.be/oavMtUWDBTM', '2010-01-01 0:00:00', 4, 4);
INSERT INTO `article` (`id`, `title`, `description`, `article_url`, `date_posted`, `user_id`, `industry_id`) VALUES (12, 'this guy got famous for this', 'here how to live forever. ', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', '2011-01-01 0:00:00', 5, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `interview_question`
-- -----------------------------------------------------
START TRANSACTION;
USE `open_officedb`;
INSERT INTO `interview_question` (`id`, `title`, `name`, `description`) VALUES (1, 'Two Sum', 'Two Sum', 'Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.\n\nYou may assume that each input would have exactly one solution, and you may not use the same element twice.\n\nYou can return the answer in any order.');
INSERT INTO `interview_question` (`id`, `title`, `name`, `description`) VALUES (2, 'Regex Matching', 'Regex Matching', 'Given an input string s and a pattern p, implement regular expression matching with support for \'.\' and \'*\' where:\n\n\'.\' Matches any single character.​​​​\n\'*\' Matches zero or more of the preceding element.\nThe matching should cover the entire input string (not partial).');
INSERT INTO `interview_question` (`id`, `title`, `name`, `description`) VALUES (3, 'Binary Search', 'Binary Search', 'Given an array of integers nums which is sorted in ascending order, and an integer target, write a function to search target in nums. If target exists, then return its index. Otherwise, return -1.\n\nYou must write an algorithm with O(log n) runtime complexity.');
INSERT INTO `interview_question` (`id`, `title`, `name`, `description`) VALUES (4, 'Rude they scheduled an interview and then said they weren\'t hiring', 'Who are you? we aren\'t hiring...', 'This company basically told me to screw off I even wore my bussines sweatpants and wife beater.... ');
INSERT INTO `interview_question` (`id`, `title`, `name`, `description`) VALUES (5, 'Basic interview question', 'Tell us about yourself', 'just a basic question I think they were looking for me to sell them on why I am a good fit');
INSERT INTO `interview_question` (`id`, `title`, `name`, `description`) VALUES (6, 'Basic interview question', 'Tell us about a time you failed', 'I told them how I used to fail at showing up on time but now I set 13 alarms to make sure I get up and get to work on time. Pretty sure they liked my answer!! still waiting to hear back...');
INSERT INTO `interview_question` (`id`, `title`, `name`, `description`) VALUES (7, 'Basic interview question', 'Tell us about a time you had a disagreement with a co-worker', 'Told them about when I had a disagreement and resolved it through mediation');
INSERT INTO `interview_question` (`id`, `title`, `name`, `description`) VALUES (8, 'Basic interview question', 'Why should we hire you?', 'Told them I was the best thing since sliced bread and they hired me on the spot');
INSERT INTO `interview_question` (`id`, `title`, `name`, `description`) VALUES (9, 'Pretty sure this question is illegal....', 'What is your political affliation?', 'I mean I don\'t even know who the president is how would I know what political party I belong to');
INSERT INTO `interview_question` (`id`, `title`, `name`, `description`) VALUES (10, 'Stay Away they want you to work 24/7', 'Do you have a problem working nights and weekends?', 'I said yes expecting them to be reasonable and in the job offer they wanted me to work 168 hours per week.');
INSERT INTO `interview_question` (`id`, `title`, `name`, `description`) VALUES (11, 'Straight and to the point, I like it!', 'What are your salary expectations?', 'I told them as much as possible.');
INSERT INTO `interview_question` (`id`, `title`, `name`, `description`) VALUES (12, 'This question made me cry...', 'When can you start?', 'I really needed this job I am so thankful and I love my boss!!');
INSERT INTO `interview_question` (`id`, `title`, `name`, `description`) VALUES (13, 'This company expects you to be a genius', 'If you had to build facebook how would you do it? ', 'If I knew how to build facebook I probably wouldn\'t be at this interview....');
INSERT INTO `interview_question` (`id`, `title`, `name`, `description`) VALUES (14, 'inappropriate question', 'What are some good stocks I should buy?', 'Definitely buy an S&P 500 ETF index fund but what does that have to do with a janitor position?..');

COMMIT;


-- -----------------------------------------------------
-- Data for table `interview_has_interview_question`
-- -----------------------------------------------------
START TRANSACTION;
USE `open_officedb`;
INSERT INTO `interview_has_interview_question` (`interview_id`, `interview_question_id`) VALUES (1, 1);
INSERT INTO `interview_has_interview_question` (`interview_id`, `interview_question_id`) VALUES (1, 2);
INSERT INTO `interview_has_interview_question` (`interview_id`, `interview_question_id`) VALUES (1, 3);
INSERT INTO `interview_has_interview_question` (`interview_id`, `interview_question_id`) VALUES (1, 8);
INSERT INTO `interview_has_interview_question` (`interview_id`, `interview_question_id`) VALUES (10, 4);
INSERT INTO `interview_has_interview_question` (`interview_id`, `interview_question_id`) VALUES (2, 1);
INSERT INTO `interview_has_interview_question` (`interview_id`, `interview_question_id`) VALUES (2, 4);
INSERT INTO `interview_has_interview_question` (`interview_id`, `interview_question_id`) VALUES (3, 1);
INSERT INTO `interview_has_interview_question` (`interview_id`, `interview_question_id`) VALUES (4, 2);
INSERT INTO `interview_has_interview_question` (`interview_id`, `interview_question_id`) VALUES (4, 6);
INSERT INTO `interview_has_interview_question` (`interview_id`, `interview_question_id`) VALUES (4, 7);
INSERT INTO `interview_has_interview_question` (`interview_id`, `interview_question_id`) VALUES (4, 8);
INSERT INTO `interview_has_interview_question` (`interview_id`, `interview_question_id`) VALUES (5, 10);
INSERT INTO `interview_has_interview_question` (`interview_id`, `interview_question_id`) VALUES (5, 4);
INSERT INTO `interview_has_interview_question` (`interview_id`, `interview_question_id`) VALUES (5, 6);
INSERT INTO `interview_has_interview_question` (`interview_id`, `interview_question_id`) VALUES (5, 7);
INSERT INTO `interview_has_interview_question` (`interview_id`, `interview_question_id`) VALUES (5, 8);
INSERT INTO `interview_has_interview_question` (`interview_id`, `interview_question_id`) VALUES (5, 9);
INSERT INTO `interview_has_interview_question` (`interview_id`, `interview_question_id`) VALUES (6, 5);
INSERT INTO `interview_has_interview_question` (`interview_id`, `interview_question_id`) VALUES (6, 9);
INSERT INTO `interview_has_interview_question` (`interview_id`, `interview_question_id`) VALUES (7, 10);
INSERT INTO `interview_has_interview_question` (`interview_id`, `interview_question_id`) VALUES (7, 3);
INSERT INTO `interview_has_interview_question` (`interview_id`, `interview_question_id`) VALUES (7, 5);
INSERT INTO `interview_has_interview_question` (`interview_id`, `interview_question_id`) VALUES (7, 6);
INSERT INTO `interview_has_interview_question` (`interview_id`, `interview_question_id`) VALUES (8, 1);
INSERT INTO `interview_has_interview_question` (`interview_id`, `interview_question_id`) VALUES (8, 6);
INSERT INTO `interview_has_interview_question` (`interview_id`, `interview_question_id`) VALUES (9, 5);

COMMIT;

