-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema second_opinions
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema second_opinions
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `second_opinions` DEFAULT CHARACTER SET utf8 ;
USE `second_opinions` ;

-- -----------------------------------------------------
-- Table `second_opinions`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `second_opinions`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(60) NULL,
  `phone_number` VARCHAR(10) NULL,
  `organization_name` VARCHAR(100) NULL,
  `street_address` VARCHAR(100) NULL,
  `state` VARCHAR(50) NULL,
  `zip_code` VARCHAR(10) NULL,
  `created_at` DATETIME NULL DEFAULT NOW(),
  `updated_at` DATETIME NULL DEFAULT NOW(),
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `second_opinions`.`files`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `second_opinions`.`files` (
  `users_id` INT NOT NULL,
  `file_id` INT NOT NULL AUTO_INCREMENT,
  `file_name` VARCHAR(255) NULL,
  `file_location` VARCHAR(2048) NULL,
  `created_at` DATETIME NULL DEFAULT NOW(),
  `updated_at` DATETIME NULL DEFAULT NOW(),
  INDEX `fk_files_users_idx` (`users_id` ASC) VISIBLE,
  PRIMARY KEY (`file_id`),
  CONSTRAINT `fk_files_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `second_opinions`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
