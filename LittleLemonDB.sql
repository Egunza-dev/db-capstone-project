-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemon
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemon
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemon` ;
USE `LittleLemon` ;

-- -----------------------------------------------------
-- Table `LittleLemon`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemon`.`Customer` (
  `CustomerID` INT NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `ContactNumber` INT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemon`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemon`.`Staff` (
  `StaffID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Salary` DECIMAL NULL,
  `Role` VARCHAR(45) NULL,
  `ContactNumber` INT NULL,
  `Email` VARCHAR(100) NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemon`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemon`.`Bookings` (
  `BookingID` INT NOT NULL,
  `TableNo` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `BookingSlot` DATETIME NOT NULL,
  `StaffID` INT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `fk_Bookings_1_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `fk_Bookings_2_idx` (`StaffID` ASC) VISIBLE,
  CONSTRAINT `fk_Bookings_1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemon`.`Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bookings_2`
    FOREIGN KEY (`StaffID`)
    REFERENCES `LittleLemon`.`Staff` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemon`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemon`.`MenuItems` (
  `ItemID` INT NOT NULL,
  `ItemName` VARCHAR(45) NULL,
  `ItemType` VARCHAR(45) NULL,
  `ItemPrice` DECIMAL NULL,
  PRIMARY KEY (`ItemID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemon`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemon`.`Menu` (
  `MenuID` INT NOT NULL,
  `ItemID` INT NOT NULL,
  `Cuisine` VARCHAR(45) NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `fk_Menu_1_idx` (`ItemID` ASC) VISIBLE,
  CONSTRAINT `fk_Menu_1`
    FOREIGN KEY (`ItemID`)
    REFERENCES `LittleLemon`.`MenuItems` (`ItemID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemon`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemon`.`Orders` (
  `OrderID` INT NOT NULL,
  `Quantity` INT NULL,
  `TotalCost` DECIMAL NULL,
  `BookingID` INT NULL,
  `MenuID` INT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `fk_Orders_1_idx` (`BookingID` ASC) VISIBLE,
  INDEX `fk_Orders_2_idx` (`MenuID` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_1`
    FOREIGN KEY (`BookingID`)
    REFERENCES `LittleLemon`.`Bookings` (`BookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_2`
    FOREIGN KEY (`MenuID`)
    REFERENCES `LittleLemon`.`Menu` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemon`.`Order delivery status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemon`.`Order delivery status` (
  `StatusID` INT NOT NULL,
  `DeliveryDate` DATETIME NULL,
  `DeliveryStatus` VARCHAR(45) NULL,
  `OrderID` INT NOT NULL,
  INDEX `fk_Order delivery status_1_idx` (`OrderID` ASC) VISIBLE,
  PRIMARY KEY (`StatusID`),
  CONSTRAINT `fk_Order delivery status_1`
    FOREIGN KEY (`OrderID`)
    REFERENCES `LittleLemon`.`Orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
