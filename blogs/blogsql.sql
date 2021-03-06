-- MySQL Script generated by MySQL Workbench
-- Mon Mar 26 10:58:10 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `address` VARCHAR(255) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `Userscol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`books` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `author` VARCHAR(45) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `bookscol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`favorite books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`favorite books` (
  `book_id` INT NOT NULL,
  `User_id` INT NOT NULL,
  `id` INT NULL,
  PRIMARY KEY (`book_id`, `User_id`),
  INDEX `fk_books_has_Users_Users1_idx` (`User_id` ASC),
  INDEX `fk_books_has_Users_books_idx` (`book_id` ASC),
  CONSTRAINT `fk_books_has_Users_books`
    FOREIGN KEY (`book_id`)
    REFERENCES `mydb`.`books` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_books_has_Users_Users1`
    FOREIGN KEY (`User_id`)
    REFERENCES `mydb`.`Users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NULL,
  `last_name` VARCHAR(255) NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(255) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `userscol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`blogs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`blogs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `blog_col` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`page_views`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`page_views` (
  `id` INT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `user_id` INT NOT NULL,
  `ip_address` VARCHAR(16) NULL,
  `views_length` DECIMAL NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `blog_id` INT NOT NULL,
  INDEX `fk_admins_users2_idx` (`user_id` ASC),
  INDEX `fk_page_views_blogs1_idx` (`blog_id` ASC),
  CONSTRAINT `fk_admins_users2`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_page_views_blogs1`
    FOREIGN KEY (`blog_id`)
    REFERENCES `mydb`.`blogs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`admins`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`admins` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `adminscol` VARCHAR(45) NULL,
  `user_id` INT NOT NULL,
  `blog_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_admins_users1_idx` (`user_id` ASC),
  INDEX `fk_admins_blogs1_idx` (`blog_id` ASC),
  CONSTRAINT `fk_admins_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_admins_blogs1`
    FOREIGN KEY (`blog_id`)
    REFERENCES `mydb`.`blogs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`posts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`posts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `context` TEXT NULL,
  `updated_at` DATETIME NULL,
  `created_at` DATETIME NULL,
  `post_col` VARCHAR(45) NULL,
  `blog_id` INT NOT NULL,
  `admin_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_posts_blogs1_idx` (`blog_id` ASC),
  INDEX `fk_posts_admins1_idx` (`admin_id` ASC),
  CONSTRAINT `fk_posts_blogs1`
    FOREIGN KEY (`blog_id`)
    REFERENCES `mydb`.`blogs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_posts_admins1`
    FOREIGN KEY (`admin_id`)
    REFERENCES `mydb`.`admins` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`comments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `context` TEXT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `commentscol` VARCHAR(45) NULL,
  `user_id` INT NOT NULL,
  `post_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comments_users1_idx` (`user_id` ASC),
  INDEX `fk_comments_posts1_idx` (`post_id` ASC),
  CONSTRAINT `fk_comments_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_posts1`
    FOREIGN KEY (`post_id`)
    REFERENCES `mydb`.`posts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`files`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`files` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `file_path` VARCHAR(255) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `post_id` INT NOT NULL,
  `admin_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_files_posts1_idx` (`post_id` ASC),
  INDEX `fk_files_admins1_idx` (`admin_id` ASC),
  CONSTRAINT `fk_files_posts1`
    FOREIGN KEY (`post_id`)
    REFERENCES `mydb`.`posts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_files_admins1`
    FOREIGN KEY (`admin_id`)
    REFERENCES `mydb`.`admins` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
