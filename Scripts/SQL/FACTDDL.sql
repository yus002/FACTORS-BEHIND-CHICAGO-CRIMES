
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema finalproject
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `finalproject` ;

-- -----------------------------------------------------
-- Schema finalproject
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `finalproject` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema finalproject
-- -----------------------------------------------------
USE `finalproject` ;

-- -----------------------------------------------------
-- Table `finalproject`.`crime`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `finalproject`.`crime` ;

CREATE TABLE IF NOT EXISTS `finalproject`.`crime` (
  `CRIME_ID` INT NOT NULL,
  `CASE_NUMBER` VARCHAR(45) NOT NULL,
  `DATE` DATETIME NULL,
  `BLOCK` VARCHAR(45) NULL,
  `PRIMARY_TYPE` VARCHAR(45) NULL,
  `DESCRIPTION` VARCHAR(100) NULL,
  `LOCATION_DESCRIPTION` VARCHAR(100) NULL,
  `ARREST` VARCHAR(45) NULL,
  `DOMESTIC` VARCHAR(45) NULL,
  `LATITUDE` DOUBLE NULL,
  `LONGITUDE` DOUBLE NULL,
  `LOCATION` VARCHAR(50) NULL,
  PRIMARY KEY (`CRIME_ID`))
ENGINE = InnoDB;

CREATE INDEX `casenumber` ON `finalproject`.`crime` (`CASE_NUMBER` ASC) ;

CREATE INDEX `crimedate` ON `finalproject`.`crime` (`DATE` ASC) ;


-- -----------------------------------------------------
-- Table `finalproject`.`police_district`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `finalproject`.`police_district` ;

CREATE TABLE IF NOT EXISTS `finalproject`.`police_district` (
  `DISTRICT_ID` INT UNSIGNED NOT NULL,
  `DISTRICT_NAME` VARCHAR(45) NOT NULL,
  `ADDRESS` VARCHAR(100) NULL,
  `ZIP` INT NOT NULL,
  `WEBSITE` VARCHAR(100) NULL,
  `PHONE` VARCHAR(45) NULL,
  `FAX` VARCHAR(45) NULL,
  `TTY` VARCHAR(45) NULL,
  `LATITUDE` DOUBLE NULL,
  `LONGITUDE` DOUBLE NULL,
  `LOCATION` VARCHAR(50) NULL,
  PRIMARY KEY (`DISTRICT_ID`))
ENGINE = InnoDB;

CREATE INDEX `zipcode` ON `finalproject`.`police_district` (`ZIP` ASC) ;


-- -----------------------------------------------------
-- Table `finalproject`.`community`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `finalproject`.`community` ;

CREATE TABLE IF NOT EXISTS `finalproject`.`community` (
  `AREA_NUMBER` INT NOT NULL,
  `NAME` VARCHAR(45) NOT NULL,
  `SHAPE_AREA` DOUBLE NULL,
  `SHAPE_LEN` DOUBLE NULL,
  PRIMARY KEY (`AREA_NUMBER`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finalproject`.`fact_table`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `finalproject`.`fact_table` ;

CREATE TABLE IF NOT EXISTS `finalproject`.`fact_table` (
  `FACT_ID` INT NOT NULL AUTO_INCREMENT,
  `crime_CRIME_ID` INT NOT NULL,
  `police_district_DISTRICT_ID` INT UNSIGNED NOT NULL,
  `community_COMMUNITY_AREA_NUMBER` INT NOT NULL,
  PRIMARY KEY (`FACT_ID`),
  CONSTRAINT `fk_fact_table_crime`
    FOREIGN KEY (`crime_CRIME_ID`)
    REFERENCES `finalproject`.`crime` (`CRIME_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fact_table_police_district1`
    FOREIGN KEY (`police_district_DISTRICT_ID`)
    REFERENCES `finalproject`.`police_district` (`DISTRICT_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fact_table_community1`
    FOREIGN KEY (`community_COMMUNITY_AREA_NUMBER`)
    REFERENCES `finalproject`.`community` (`AREA_NUMBER`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `fact_id_UNIQUE` ON `finalproject`.`fact_table` (`FACT_ID` ASC) ;

CREATE INDEX `fk_fact_table_crime_idx` ON `finalproject`.`fact_table` (`crime_CRIME_ID` ASC) ;

CREATE INDEX `fk_fact_table_police_district1_idx` ON `finalproject`.`fact_table` (`police_district_DISTRICT_ID` ASC) ;

CREATE INDEX `fk_fact_table_community1_idx` ON `finalproject`.`fact_table` (`community_COMMUNITY_AREA_NUMBER` ASC) ;


-- -----------------------------------------------------
-- Table `finalproject`.`education`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `finalproject`.`education` ;

CREATE TABLE IF NOT EXISTS `finalproject`.`education` (
  `EDUCATION_KEY` INT NOT NULL,
  `community_AREA_NUMBER` INT NOT NULL,
  `EDUCATED_WITHOUTDEGREE` DOUBLE NULL,
  `EDUCATED_WITHDEGREE` DOUBLE NULL,
  PRIMARY KEY (`EDUCATION_KEY`, `community_AREA_NUMBER`),
  CONSTRAINT `fk_education_community1`
    FOREIGN KEY (`community_AREA_NUMBER`)
    REFERENCES `finalproject`.`community` (`AREA_NUMBER`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_education_community1_idx` ON `finalproject`.`education` (`community_AREA_NUMBER` ASC) ;


-- -----------------------------------------------------
-- Table `finalproject`.`income`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `finalproject`.`income` ;

CREATE TABLE IF NOT EXISTS `finalproject`.`income` (
  `INCOME_KEY` INT NOT NULL,
  `community_AREA_NUMBER` INT NOT NULL,
  `EARNINGLT50K` DOUBLE NULL,
  `EARNING50TO100K` DOUBLE NULL,
  `EARNINGMT100K` DOUBLE NULL,
  PRIMARY KEY (`INCOME_KEY`, `community_AREA_NUMBER`),
  CONSTRAINT `fk_income_community1`
    FOREIGN KEY (`community_AREA_NUMBER`)
    REFERENCES `finalproject`.`community` (`AREA_NUMBER`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_income_community1_idx` ON `finalproject`.`income` (`community_AREA_NUMBER` ASC) ;


-- -----------------------------------------------------
-- Table `finalproject`.`poverty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `finalproject`.`poverty` ;

CREATE TABLE IF NOT EXISTS `finalproject`.`poverty` (
  `POVERTY_KEY` INT NOT NULL,
  `community_AREA_NUMBER` INT NOT NULL,
  `POVERTYPOPULATION_2000` DOUBLE NULL,
  `POVERTYPOPULATION_2010` DOUBLE NULL,
  PRIMARY KEY (`POVERTY_KEY`, `community_AREA_NUMBER`),
  CONSTRAINT `fk_poverty_community1`
    FOREIGN KEY (`community_AREA_NUMBER`)
    REFERENCES `finalproject`.`community` (`AREA_NUMBER`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_poverty_community1_idx` ON `finalproject`.`poverty` (`community_AREA_NUMBER` ASC) ;


-- -----------------------------------------------------
-- Table `finalproject`.`cta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `finalproject`.`cta` ;

CREATE TABLE IF NOT EXISTS `finalproject`.`cta` (
  `STOP_ID` INT NOT NULL,
  `DIRECTION` VARCHAR(45) NULL,
  `STOP_NAME` VARCHAR(100) NULL,
  `STATION_NAME` VARCHAR(100) NULL,
  `STATION_DESCRIPTIVE_NAME` VARCHAR(100) NULL,
  `MAP_ID` INT NULL,
  `LATITUDE` DOUBLE NULL,
  `LONGITUDE` DOUBLE NULL,
  `LOCATION` VARCHAR(50) NULL,
  PRIMARY KEY (`STOP_ID`))
ENGINE = InnoDB;

CREATE INDEX `direction` ON `finalproject`.`cta` (`DIRECTION` ASC) ;


-- -----------------------------------------------------
-- Table `finalproject`.`affordable_rental_housing`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `finalproject`.`affordable_rental_housing` ;

CREATE TABLE IF NOT EXISTS `finalproject`.`affordable_rental_housing` (
  `HOUSING_KEY` INT NOT NULL AUTO_INCREMENT,
  `COMMUNITY_AREA_NAME` VARCHAR(45) NULL,
  `community_AREA_NUMBER` INT NOT NULL,
  `PROPERTY_TYPE` VARCHAR(45) NULL,
  `PROPERTY_NAME` VARCHAR(50) NULL,
  `ADDRESS` VARCHAR(100) NULL,
  `ZIP` INT NULL,
  `PHONE` VARCHAR(45) NULL,
  `MANAGEMENT_COMPANY` VARCHAR(45) NULL,
  `UNITS` INT NULL,
  `LATITUDE` DOUBLE NULL,
  `LONGITUDE` DOUBLE NULL,
  `LOCATION` VARCHAR(50) NULL,
  PRIMARY KEY (`HOUSING_KEY`),
  CONSTRAINT `fk_affordable_rental_housing_community1`
    FOREIGN KEY (`community_AREA_NUMBER`)
    REFERENCES `finalproject`.`community` (`AREA_NUMBER`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_affordable_rental_housing_community1_idx` ON `finalproject`.`affordable_rental_housing` (`community_AREA_NUMBER` ASC) ;

CREATE INDEX `zipcode` ON `finalproject`.`affordable_rental_housing` (`ZIP` ASC) ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
