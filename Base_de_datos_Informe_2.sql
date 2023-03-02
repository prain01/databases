-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Ramo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ramo` (
  `idRamo` VARCHAR(6) NOT NULL,
  `profesor` VARCHAR(45) NULL,
  `nombre_ramo` VARCHAR(255) NULL,
  `nivel` INT NULL,
  PRIMARY KEY (`idRamo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Sala`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sala` (
  `idSala` INT NOT NULL,
  `departamento` VARCHAR(45) NULL,
  `piso` INT NULL,
  `capacidad_personas` INT NULL,
  `espacio_abierto` TINYINT NULL,
  PRIMARY KEY (`idSala`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Horario` (
  `idHorario` INT NOT NULL,
  `dia` VARCHAR(45) NULL,
  `hora_comienzo` VARCHAR(45) NULL,
  `hora_finalizacion` VARCHAR(45) NULL,
  PRIMARY KEY (`idHorario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Direccion` (
  `idDireccion` INT NOT NULL,
  `pais` VARCHAR(45) NULL,
  `ciudad` VARCHAR(45) NULL,
  `comuna` VARCHAR(45) NULL,
  `poblacion` VARCHAR(45) NULL,
  `calle` VARCHAR(45) NULL,
  `numero` VARCHAR(45) NULL,
  PRIMARY KEY (`idDireccion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Facultad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Facultad` (
  `idFacultad` INT NOT NULL,
  `nombre` VARCHAR(255) NULL,
  `Direccion_idDireccion` INT NOT NULL,
  PRIMARY KEY (`idFacultad`),
  INDEX `fk_Facultad_Direccion1_idx` (`Direccion_idDireccion` ASC) VISIBLE,
  CONSTRAINT `fk_Facultad_Direccion1`
    FOREIGN KEY (`Direccion_idDireccion`)
    REFERENCES `mydb`.`Direccion` (`idDireccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Departamento` (
  `idDepartamento` INT NOT NULL,
  `nombre` VARCHAR(255) NULL,
  `Direccion_idDireccion` INT NOT NULL,
  `Facultad_idFacultad` INT NOT NULL,
  PRIMARY KEY (`idDepartamento`),
  INDEX `fk_Departamento_Direccion1_idx` (`Direccion_idDireccion` ASC) VISIBLE,
  INDEX `fk_Departamento_Facultad1_idx` (`Facultad_idFacultad` ASC) VISIBLE,
  CONSTRAINT `fk_Departamento_Direccion1`
    FOREIGN KEY (`Direccion_idDireccion`)
    REFERENCES `mydb`.`Direccion` (`idDireccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Departamento_Facultad1`
    FOREIGN KEY (`Facultad_idFacultad`)
    REFERENCES `mydb`.`Facultad` (`idFacultad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Carrera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Carrera` (
  `idCarrera` VARCHAR(4) NOT NULL,
  `nombre` VARCHAR(255) NULL,
  `Departamento_idDepartamento` INT NOT NULL,
  PRIMARY KEY (`idCarrera`),
  INDEX `fk_Carrera_Departamento1_idx` (`Departamento_idDepartamento` ASC) VISIBLE,
  CONSTRAINT `fk_Carrera_Departamento1`
    FOREIGN KEY (`Departamento_idDepartamento`)
    REFERENCES `mydb`.`Departamento` (`idDepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tutor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tutor` (
  `idTutor` VARCHAR(11) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `fecha_nacimiento` DATE NULL,
  `sexo` VARCHAR(45) NULL,
  `Direccion_idDireccion` INT NOT NULL,
  `Carrera_idCarrera` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`idTutor`),
  INDEX `fk_Tutor_Carrera1_idx` (`Carrera_idCarrera` ASC) VISIBLE,
  INDEX `fk_Tutor_Direccion1_idx` (`Direccion_idDireccion` ASC) VISIBLE,
  CONSTRAINT `fk_Tutor_Carrera1`
    FOREIGN KEY (`Carrera_idCarrera`)
    REFERENCES `mydb`.`Carrera` (`idCarrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tutor_Direccion1`
    FOREIGN KEY (`Direccion_idDireccion`)
    REFERENCES `mydb`.`Direccion` (`idDireccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tutoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tutoria` (
  `idTutoria` INT NOT NULL,
  `modalidad` VARCHAR(45) NULL,
  `medio_comunicacion` VARCHAR(45) NULL,
  `numero_grupo` INT NULL,
  `Ramo_idRamo` VARCHAR(6) NOT NULL,
  `Sala_idSala` INT NOT NULL,
  `Horario_idHorario` INT NOT NULL,
  `Tutor_idTutor` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`idTutoria`),
  INDEX `fk_Tutoría_Ramo1_idx` (`Ramo_idRamo` ASC) VISIBLE,
  INDEX `fk_Tutoría_Sala1_idx` (`Sala_idSala` ASC) VISIBLE,
  INDEX `fk_Tutoría_Horario1_idx` (`Horario_idHorario` ASC) VISIBLE,
  INDEX `fk_Tutoría_Tutor1_idx` (`Tutor_idTutor` ASC) VISIBLE,
  CONSTRAINT `fk_Tutoría_Ramo1`
    FOREIGN KEY (`Ramo_idRamo`)
    REFERENCES `mydb`.`Ramo` (`idRamo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tutoría_Sala1`
    FOREIGN KEY (`Sala_idSala`)
    REFERENCES `mydb`.`Sala` (`idSala`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tutoría_Horario1`
    FOREIGN KEY (`Horario_idHorario`)
    REFERENCES `mydb`.`Horario` (`idHorario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tutoría_Tutor1`
    FOREIGN KEY (`Tutor_idTutor`)
    REFERENCES `mydb`.`Tutor` (`idTutor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tutorado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tutorado` (
  `idTutorado` VARCHAR(11) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `fecha_nac` DATE NULL,
  `sexo` VARCHAR(45) NULL,
  `fecha_ingreso` DATE NULL,
  `fono` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `nacionalidad` VARCHAR(45) NULL,
  `direccion_idDireccion` INT NOT NULL,
  `Carrera_idCarrera` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`idTutorado`),
  INDEX `fk_Tutorado_direccion1_idx` (`direccion_idDireccion` ASC) VISIBLE,
  INDEX `fk_Tutorado_Carrera1_idx` (`Carrera_idCarrera` ASC) VISIBLE,
  CONSTRAINT `fk_Tutorado_direccion1`
    FOREIGN KEY (`direccion_idDireccion`)
    REFERENCES `mydb`.`Direccion` (`idDireccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tutorado_Carrera1`
    FOREIGN KEY (`Carrera_idCarrera`)
    REFERENCES `mydb`.`Carrera` (`idCarrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ramo_has_Carrera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ramo_has_Carrera` (
  `Ramo_idRamo` VARCHAR(6) NOT NULL,
  `Carrera_idCarrera` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`Ramo_idRamo`, `Carrera_idCarrera`),
  INDEX `fk_Ramo_has_Carrera_Carrera1_idx` (`Carrera_idCarrera` ASC) VISIBLE,
  INDEX `fk_Ramo_has_Carrera_Ramo_idx` (`Ramo_idRamo` ASC) VISIBLE,
  CONSTRAINT `fk_Ramo_has_Carrera_Ramo`
    FOREIGN KEY (`Ramo_idRamo`)
    REFERENCES `mydb`.`Ramo` (`idRamo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ramo_has_Carrera_Carrera1`
    FOREIGN KEY (`Carrera_idCarrera`)
    REFERENCES `mydb`.`Carrera` (`idCarrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Inscripcion_tutoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Inscripcion_tutoria` (
  `Tutorado_idTutorado` VARCHAR(11) NOT NULL,
  `Tutoría_idTutoria` INT NOT NULL,
  `fecha_inscripcion` DATETIME NULL,
  PRIMARY KEY (`Tutorado_idTutorado`, `Tutoría_idTutoria`),
  INDEX `fk_Tutorado_has_Tutoría_Tutoría1_idx` (`Tutoría_idTutoria` ASC) VISIBLE,
  INDEX `fk_Tutorado_has_Tutoría_Tutorado1_idx` (`Tutorado_idTutorado` ASC) VISIBLE,
  CONSTRAINT `fk_Tutorado_has_Tutoría_Tutorado1`
    FOREIGN KEY (`Tutorado_idTutorado`)
    REFERENCES `mydb`.`Tutorado` (`idTutorado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tutorado_has_Tutoría_Tutoría1`
    FOREIGN KEY (`Tutoría_idTutoria`)
    REFERENCES `mydb`.`Tutoria` (`idTutoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Realizacion_Tutoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Realizacion_Tutoria` (
  `idRealizacion_Tutoria` INT NOT NULL,
  `topicos` VARCHAR(255) NULL,
  `fecha_realizacion` DATETIME NULL,
  `duracion_horas` INT NULL,
  `Tutoría_idTutoria` INT NOT NULL,
  PRIMARY KEY (`idRealizacion_Tutoria`),
  INDEX `fk_Realizacion_Tutoria_Tutoría1_idx` (`Tutoría_idTutoria` ASC) VISIBLE,
  CONSTRAINT `fk_Realizacion_Tutoria_Tutoría1`
    FOREIGN KEY (`Tutoría_idTutoria`)
    REFERENCES `mydb`.`Tutoria` (`idTutoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Asistencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Asistencia` (
  `idAsistencia` INT NOT NULL,
  `Realizacion_Tutoria_idRealizacion_Tutoria` INT NOT NULL,
  `Tutorado_idTutorado` VARCHAR(11) NOT NULL,
  `Asistencia` TINYINT NULL,
  PRIMARY KEY (`idAsistencia`),
  INDEX `fk_Asistencia_Realizacion_Tutoria1_idx` (`Realizacion_Tutoria_idRealizacion_Tutoria` ASC) VISIBLE,
  INDEX `fk_Asistencia_Tutorado1_idx` (`Tutorado_idTutorado` ASC) VISIBLE,
  CONSTRAINT `fk_Asistencia_Realizacion_Tutoria1`
    FOREIGN KEY (`Realizacion_Tutoria_idRealizacion_Tutoria`)
    REFERENCES `mydb`.`Realizacion_Tutoria` (`idRealizacion_Tutoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Asistencia_Tutorado1`
    FOREIGN KEY (`Tutorado_idTutorado`)
    REFERENCES `mydb`.`Tutorado` (`idTutorado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`feedback_bidireccional`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Feedback_bidireccional` (
  `idfeedback_bidireccional` INT NOT NULL,
  `feedback_tutorado_a_tutor` INT NULL,
  `feedback_tutor_a_tutorado` INT NULL,
  `Realizacion_Tutoria_idRealizacion_Tutoria` INT NOT NULL,
  `Tutorado_idTutorado` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`idfeedback_bidireccional`),
  INDEX `fk_feedback_bidireccional_Realizacion_Tutoria1_idx` (`Realizacion_Tutoria_idRealizacion_Tutoria` ASC) VISIBLE,
  INDEX `fk_feedback_bidireccional_Tutorado1_idx` (`Tutorado_idTutorado` ASC) VISIBLE,
  CONSTRAINT `fk_feedback_bidireccional_Realizacion_Tutoria1`
    FOREIGN KEY (`Realizacion_Tutoria_idRealizacion_Tutoria`)
    REFERENCES `mydb`.`Realizacion_Tutoria` (`idRealizacion_Tutoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_feedback_bidireccional_Tutorado1`
    FOREIGN KEY (`Tutorado_idTutorado`)
    REFERENCES `mydb`.`Tutorado` (`idTutorado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- Insertar Dirección facultades
INSERT INTO Direccion VALUES(1, "Chile", "Temuco", "Temuco", "Sector Las Encinas", "Uruguay", "123");
INSERT INTO Direccion VALUES(2, "Chile", "Temuco", "Temuco", "Sector Portal", "Av. Alemania", "124");
INSERT INTO Direccion VALUES(3, "Chile", "Temuco", "Temuco", "Sector Las Encinas", "Uruguay", "123");
INSERT INTO Direccion VALUES(4, "Chile", "Temuco", "Temuco", "Sector Las Encinas", "Uruguay", "123");
INSERT INTO Direccion VALUES(5, "Chile", "Temuco", "Temuco", "Sector Las Encinas", "Montevideo", "125");
INSERT INTO Direccion VALUES(6, "Chile", "Temuco", "Temuco", "Sector Las Encinas", "Uruguay", "123");
-- Insertar Dirección departamentos
INSERT INTO Direccion VALUES(7, "Chile", "Temuco", "Temuco", "Sector Las Encinas", "Montevideo", "126");
INSERT INTO Direccion VALUES(8, "Chile", "Temuco", "Temuco", "Sector Las Encinas", "Montevideo", "127");
INSERT INTO Direccion VALUES(9, "Chile", "Temuco", "Temuco", "Sector Portal", "Av. Alemania", "128");
INSERT INTO Direccion VALUES(10, "Chile", "Temuco", "Temuco", "Sector Las Encinas", "Av. Francisco Salazar", "129");
INSERT INTO Direccion VALUES(11, "Chile", "Temuco", "Temuco", "Sector Las Encinas", "Av. Francisco Salazar", "130");
INSERT INTO Direccion VALUES(12, "Chile", "Temuco", "Temuco", "Sector Las Encinas", "Av. Francisco Salazar", "131");
-- Insertar Dirección tutorados (17);
INSERT INTO Direccion VALUES(13, "Chile", "Temuco", "Temuco", "Pedro de Valdivia", "Camina", "132");
INSERT INTO Direccion VALUES(14, "Chile", "Lautaro", "Lautaro", "Zona Norte", "Martin Lutero", "133");
INSERT INTO Direccion VALUES(15, "Chile", "Victoria", "Victoria", "Zona Noroeste", "Calvino", "134");
INSERT INTO Direccion VALUES(16, "Chile", "Temuco", "Temuco", "Pedro de Valdivia", "Arthur Pink", "135");
INSERT INTO Direccion VALUES(17, "Chile", "Temuco", "Temuco", "Padre las Casas", "William Tyndale", "136");
INSERT INTO Direccion VALUES(18, "Chile", "Lautaro", "Lautaro", "Sector Las Encinas", "John Hus", "137");
INSERT INTO Direccion VALUES(19, "Chile", "Temuco", "Temuco", "Padre las Casas", "John Wycliffe", "138");
INSERT INTO Direccion VALUES(20, "Chile", "Temuco", "Temuco", "Portal La Frontera", "John Bunyan", "139");
INSERT INTO Direccion VALUES(21, "Chile", "Temuco", "Temuco", "Amanecer", "Charles Hadeon Spurgeon", "140");
INSERT INTO Direccion VALUES(22, "Chile", "Temuco", "Temuco", "Padre las Casas", "Joel Beeke", "140");
INSERT INTO Direccion VALUES(23, "Chile", "Temuco", "Temuco", "Amanecer", "Peter Masters", "140");
INSERT INTO Direccion VALUES(24, "Chile", "Temuco", "Temuco", "Padre las Casas", "Thomas Goodwin", "140");
INSERT INTO Direccion VALUES(25, "Chile", "Lautaro", "Lautaro", "Zona Este", "Thomas Watson", "140");
INSERT INTO Direccion VALUES(26, "Chile", "Temuco", "Temuco", "Amanecer", "Jonathan Edwards", "140");
INSERT INTO Direccion VALUES(27, "Chile", "Victoria", "Victoria", "Zona Oeste", "John Wesley", "140");
INSERT INTO Direccion VALUES(28, "Chile", "Temuco", "Temuco", "Pedro de Valdivia", "Charles Wesley", "140");
INSERT INTO Direccion VALUES(29, "Chile", "Temuco", "Temuco", "Portal La Frontera", "George Whitefield", "140");
-- Insertar Dirección tutores
INSERT INTO Direccion VALUES(30, "Chile", "Temuco", "Temuco", "Padre las Casas", "John Owen", "140");
INSERT INTO Direccion VALUES(31, "Chile", "Temuco", "Temuco", "Amanecer", "John Angell James", "140");
INSERT INTO Direccion VALUES(32, "Chile", "Temuco", "Temuco", "Padre las Casas", "Joel Webbon", "140");
INSERT INTO Direccion VALUES(33, "Chile", "Lautaro", "Lautaro", "Zona Este", "Sproul", "140");
INSERT INTO Direccion VALUES(34, "Chile", "Temuco", "Temuco", "Portal La Frontera", "Thomas Hooker", "140");


-- Insertar salas
INSERT INTO Sala VALUES(1, "DIFEM", 1, 6, 1);
INSERT INTO Sala VALUES(2, "DIFEM", 2, 6, 0);
INSERT INTO Sala VALUES(3, "DIFEM", 2, 6, 1);
INSERT INTO Sala VALUES(4, "DIFEM", 2, 6, 1);
INSERT INTO Sala VALUES(5, "DIFEM", 1, 6, 0);
INSERT INTO Sala VALUES(6, "DIBRI", 1, 6, 1);
INSERT INTO Sala VALUES(7, "DIBRI", 1, 6, 0);
INSERT INTO Sala VALUES(8, "DIBRI", 2, 6, 0);
INSERT INTO Sala VALUES(9, "DIBRI", 2, 6, 1);
INSERT INTO Sala VALUES(10, "DIBRI", 1, 6, 1);

-- Insertar ramos
INSERT INTO Ramo(idRamo,profesor,nombre_ramo,nivel) VALUES('IME050','Juanito Perez','Calculo de una variable','2');
INSERT INTO Ramo(idRamo,profesor,nombre_ramo,nivel) VALUES('IME056','Ernesto Jones','Algebra lineal','2');
INSERT INTO Ramo(idRamo,profesor,nombre_ramo,nivel) VALUES('MBA160','Somito Gonzalez','Bases morfologicas 2','4');
INSERT INTO Ramo(idRamo,profesor,nombre_ramo,nivel) VALUES('IME186','Luis Casas','Calculo multivariable','3');
INSERT INTO Ramo(idRamo,profesor,nombre_ramo,nivel) VALUES('MBA264','Benedicto Perez','Histologia','3');
INSERT INTO Ramo(idRamo,profesor,nombre_ramo,nivel) VALUES('IME028','Cesar Cesario','Introduccion al algebra','1');
INSERT INTO Ramo(idRamo,profesor,nombre_ramo,nivel) VALUES('IME279','Juanito Perez','Calculo','1');
INSERT INTO Ramo(idRamo,profesor,nombre_ramo,nivel) VALUES('IME181','Manolo Lama','Algebra y trigonometria','3');
INSERT INTO Ramo(idRamo,profesor,nombre_ramo,nivel) VALUES('ICF190','Ibai LLanos','Fisica 2','3');
INSERT INTO Ramo(idRamo,profesor,nombre_ramo,nivel) VALUES('ICF058','Mike Myers','Fisica 1','2');
INSERT INTO Ramo(idRamo,profesor,nombre_ramo,nivel) VALUES('IME188','Bukayo Saka','Ecuaciones Diferenciales','3');
INSERT INTO Ramo(idRamo,profesor,nombre_ramo,nivel) VALUES('ICQ050','Tania Tapia','Introduccion a la quimica','1');
INSERT INTO Ramo(idRamo,profesor,nombre_ramo,nivel) VALUES('MBA166','Yasuri Yamileth','Fundamentos de procesos biologicos 2','2');
INSERT INTO Ramo(idRamo,profesor,nombre_ramo,nivel) VALUES('ICQ103','Tania  Tapia','Quimica Organica','3');
INSERT INTO Ramo(idRamo,profesor,nombre_ramo,nivel) VALUES('JAE662','Mauricio Isla','Contabilidad 2','3');
INSERT INTO Ramo(idRamo,profesor,nombre_ramo,nivel) VALUES('DER150','Saul Goodman','Derecho Civil 1','3');
INSERT INTO Ramo(idRamo,profesor,nombre_ramo,nivel) VALUES('DER200','Saul Goodman','Derecho Procesal','5');
INSERT INTO Ramo(idRamo,profesor,nombre_ramo,nivel) VALUES('IME045','Juanito Perez','Calculo diferencial','2');
INSERT INTO Ramo(idRamo,profesor,nombre_ramo,nivel) VALUES('IME048','Isaac Newton','Calculo integral','3');
INSERT INTO Ramo(idRamo,profesor,nombre_ramo,nivel) VALUES('EPS156','Carl Jung','Sistemas psicologicos','8');
INSERT INTO Ramo(idRamo,profesor,nombre_ramo,nivel) VALUES('IME183','Michio Kaku','Bases matematicas','4');
INSERT INTO Ramo(idRamo,profesor,nombre_ramo,nivel) VALUES('ELL643','Marylin Manson','Fonetica y fonologia','8');
INSERT INTO Ramo(idRamo,profesor,nombre_ramo,nivel) VALUES('MBA008','Tj Miller','Bioquimica','4');
INSERT INTO Ramo(idRamo,profesor,nombre_ramo,nivel) VALUES('ICC233','Samuel Sepulveda','Programacion','3');

-- Insertar facultades
INSERT INTO Facultad VALUES(1, "FACULTAD DE INGENIERIA Y CIENCIAS", 1);
INSERT INTO Facultad VALUES(2, "FACULTAD DE MEDICINA", 2);
INSERT INTO Facultad VALUES(3, "FACULTAD DE ODONTOLOGIA", 3);
INSERT INTO Facultad VALUES(4, "FACULTAD DE EDUCACION,C. SOCIALES Y HUM.", 4);
INSERT INTO Facultad VALUES(5, "FACULTAD CIENCIAS AGROP. Y MEDIOAMBIENTE", 5);
INSERT INTO Facultad VALUES(6, "FACULTAD DE CS.JURIDICAS Y EMPRESARIALES", 6);

-- Insertar departamentos
INSERT INTO Departamento VALUES(1, "Departamento de Ciencias de la Computación e Informatica", 7, 1);
INSERT INTO Departamento VALUES(2, "Departamento de Anatomia Patologica", 8, 2);
INSERT INTO Departamento VALUES(3, "Departamento de Odontopediatria y Ortodoncia", 9, 3);
INSERT INTO Departamento VALUES(4, "Departamento de Lenguas, Literatura y Comunicacion", 10, 4);
INSERT INTO Departamento VALUES(5, "Departamento de Ciencias Agronomicas y Recursos Naturales", 11, 5);
INSERT INTO Departamento VALUES(6, "Departamento de Administracion y Economia", 12, 6);

-- Insertar carreras 
INSERT INTO Carrera VALUES("3095", "INGENIERIA CIVIL INFORMATICA", 1);
INSERT INTO Carrera VALUES("3026", "MEDICINA", 2);
INSERT INTO Carrera VALUES("3033", "ODONTOLOGIA", 3);
INSERT INTO Carrera VALUES("3044", "PEDAGOGIA EN CASTELLANO Y COMUNICACION", 4);
INSERT INTO Carrera VALUES("3070", "AGRONOMIA", 5);
INSERT INTO Carrera VALUES("3000", "CONTADOR PUBLICO Y AUDITOR", 6);

-- Insertar ramo_has_carrera
INSERT INTO Ramo_has_Carrera VALUES('IME050', "3095");
INSERT INTO Ramo_has_Carrera VALUES('IME056', "3095");
INSERT INTO Ramo_has_Carrera VALUES('MBA160', "3026");
INSERT INTO Ramo_has_Carrera VALUES('IME186', "3095");
INSERT INTO Ramo_has_Carrera VALUES('MBA264', "3026");
INSERT INTO Ramo_has_Carrera VALUES('IME028', "3095");
INSERT INTO Ramo_has_Carrera VALUES('IME279', "3095");
INSERT INTO Ramo_has_Carrera VALUES('IME181', "3095");
INSERT INTO Ramo_has_Carrera VALUES('ICF190', "3095");
INSERT INTO Ramo_has_Carrera VALUES('ICF058', "3095");
INSERT INTO Ramo_has_Carrera VALUES('IME188', "3095");
INSERT INTO Ramo_has_Carrera VALUES('ICQ050', "3095");
INSERT INTO Ramo_has_Carrera VALUES('MBA166', "3026");
INSERT INTO Ramo_has_Carrera VALUES('ICQ103', "3026");
INSERT INTO Ramo_has_Carrera VALUES('JAE662', "3000");
INSERT INTO Ramo_has_Carrera VALUES('DER150', "3000");
INSERT INTO Ramo_has_Carrera VALUES('DER200', "3000");
INSERT INTO Ramo_has_Carrera VALUES('IME045', "3095");
INSERT INTO Ramo_has_Carrera VALUES('IME048', "3095");
INSERT INTO Ramo_has_Carrera VALUES('EPS156', "3044");
INSERT INTO Ramo_has_Carrera VALUES('IME183', "3095");
INSERT INTO Ramo_has_Carrera VALUES('ELL643', "3026");
INSERT INTO Ramo_has_Carrera VALUES('MBA008', "3026");
INSERT INTO Ramo_has_Carrera VALUES('ICC233', "3095");

-- Insertar Tutorados
INSERT INTO Tutorado VALUES("10000000001", "Juan", "Perez", "2000-02-01", "M", "2021-04-12", "11111111", "juanperez@gmail.com", "chileno",13,"3095");
INSERT INTO Tutorado VALUES("10000000002", "Pedro", "Moraga", "2001-02-01", "M", "2020-04-12", "11111112", "Pedro@gmail.com", "chileno",14,"3095");
INSERT INTO Tutorado VALUES("10000000003", "Manuel", "Sarmiento", "2002-02-01", "M", "2022-04-12", "11111113", "Manuel@gmail.com", "chileno",15,"3095");
INSERT INTO Tutorado VALUES("10000000004", "Diego", "Candia", "1999-02-01", "M", "2020-04-12", "11111114", "Diego@gmail.com", "chileno",16,"3095");
INSERT INTO Tutorado VALUES("10000000005", "Pablo", "Juri", "1998-02-01", "M", "2019-04-12", "11111115", "Pablo@gmail.com", "chileno",17,"3095");
INSERT INTO Tutorado VALUES("10000000006", "Felipe", "Castro", "2000-02-01", "M", "2019-04-12", "11111116", "Felipe@gmail.com", "chileno",18,"3095");
INSERT INTO Tutorado VALUES("10000000007", "Simon", "Villaroel", "2000-02-01", "M", "2021-04-12", "11111117", "Simon@gmail.com", "chileno",19,"3095");
INSERT INTO Tutorado VALUES("10000000008", "Vicente", "Nunez", "2001-02-01", "M", "2020-04-12", "11111118", "Vicente@gmail.com", "chileno",20,"3095");
INSERT INTO Tutorado VALUES("10000000009", "Esteban", "Unda", "2002-02-01", "M", "2022-04-12", "11111119", "Esteban@gmail.com", "chileno",21,"3095");
INSERT INTO Tutorado VALUES("10000000010", "Gabriel", "Calleja", "2001-02-01", "M", "2021-04-12", "11111121", "Gabriel@gmail.com", "chileno",22,"3095");
INSERT INTO Tutorado VALUES("10000000011", "Camila", "Redel", "2000-02-01", "F", "2022-04-12", "11111111", "Camila@gmail.com", "chileno",23,"3095");
INSERT INTO Tutorado VALUES("10000000012", "Victoria", "Riedemann", "1999-02-01", "F", "2022-04-12", "11111122", "Victoria@gmail.com", "chileno",24,"3095");
INSERT INTO Tutorado VALUES("10000000013", "Ella", "Contreras", "1995-02-01", "F", "2022-04-12", "11111123", "Ella@gmail.com", "chileno",25,"3095");
INSERT INTO Tutorado VALUES("10000000014", "Josefa", "Quezada", "1999-02-01", "F", "2020-04-12", "11111124", "Josefa@gmail.com", "chileno",26,"3095");
INSERT INTO Tutorado VALUES("10000000015", "Catalina", "Espinoza", "2003-02-01", "F", "2019-04-12", "11111125", "Catalina@gmail.com", "chileno",27,"3095");
INSERT INTO Tutorado VALUES("10000000016", "Cesia", "Gutierrez", "2003-02-01", "F", "2018-04-12", "111111126", "Cesia@gmail.com", "chileno",28,"3095");
INSERT INTO Tutorado VALUES("10000000017", "Yolanda", "Vasquez", "2002-02-01", "F", "2020-04-12", "11111127", "Yolanda@gmail.com", "chileno",29,"3095");

-- Insertar tutores
INSERT INTO Tutor VALUES('20111222119', 'TOMAS FELIPE', 'SARMIENTO CANDIA', '1999-10-02', 'M', 30, "3095");
INSERT INTO Tutor VALUES('20111222219', 'GERARD ABRAHAM', 'INZUNZA CISTERNA', '2000-05-12', 'M', 31, "3095");
INSERT INTO Tutor VALUES('20111222319', 'JUAN FELIPE', 'LAGOS GATICA', '1999-02-05', 'M', 32, "3095");
INSERT INTO Tutor VALUES('20111222419', 'KATARI SOL', 'CEA CANCINO', '1998-01-01', 'F', 33, "3095");
INSERT INTO Tutor VALUES('20111222519', 'HADA CECILIA', 'OLAVE MELLA ', '2000-05-10', 'F', 34, "3095");

-- Insertar horarios
INSERT INTO Horario VALUES(1, 'LUNES', '10:50', '13:00');
INSERT INTO Horario VALUES(2, 'MARTES', '10:50', '13:00');
INSERT INTO Horario VALUES(3, 'MIERCOLES', '10:50', '13:00');
INSERT INTO Horario VALUES(4, 'JUEVES', '10:50', '13:00');
INSERT INTO Horario VALUES(5, 'VIERNES', '10:50', '13:00');

-- Insertar tutorias
INSERT INTO Tutoria(idTutoria,modalidad,medio_comunicacion,numero_grupo,Ramo_idRamo,Sala_idSala,Horario_idHorario,Tutor_idTutor) VALUES(1,'presencial','correo',3,'IME183',1,2,'20111222119');
INSERT INTO Tutoria(idTutoria,modalidad,medio_comunicacion,numero_grupo,Ramo_idRamo,Sala_idSala,Horario_idHorario,Tutor_idTutor) VALUES(2,'remoto','whastapp',3,'ICC233',2,1,'20111222219');
INSERT INTO Tutoria(idTutoria,modalidad,medio_comunicacion,numero_grupo,Ramo_idRamo,Sala_idSala,Horario_idHorario,Tutor_idTutor) VALUES(3,'presencial','discord',2,'IME048',3,3,'20111222319');
INSERT INTO Tutoria(idTutoria,modalidad,medio_comunicacion,numero_grupo,Ramo_idRamo,Sala_idSala,Horario_idHorario,Tutor_idTutor) VALUES(4,'presencial','correo',1,'IME056',4,4,'20111222419');
INSERT INTO Tutoria(idTutoria,modalidad,medio_comunicacion,numero_grupo,Ramo_idRamo,Sala_idSala,Horario_idHorario,Tutor_idTutor) VALUES(5,'remoto','slack',4,'IME186',5,5,'20111222519');

-- Insertar inscripciones
INSERT INTO Inscripcion_tutoria VALUES('10000000001', 1, '2022-08-11');
INSERT INTO Inscripcion_tutoria VALUES('10000000002', 1, '2022-08-11');
INSERT INTO Inscripcion_tutoria VALUES('10000000003', 1, '2022-08-12');
INSERT INTO Inscripcion_tutoria VALUES('10000000004', 1, '2022-08-13');
INSERT INTO Inscripcion_tutoria VALUES('10000000005', 2, '2022-08-12');
INSERT INTO Inscripcion_tutoria VALUES('10000000006', 2, '2022-08-15');
INSERT INTO Inscripcion_tutoria VALUES('10000000007', 2, '2022-08-16');
INSERT INTO Inscripcion_tutoria VALUES('10000000008', 2, '2022-08-18');
INSERT INTO Inscripcion_tutoria VALUES('10000000009', 3, '2022-08-11');
INSERT INTO Inscripcion_tutoria VALUES('10000000010', 3, '2022-08-12');
INSERT INTO Inscripcion_tutoria VALUES('10000000011', 3, '2022-08-10');
INSERT INTO Inscripcion_tutoria VALUES('10000000012', 4, '2022-08-19');
INSERT INTO Inscripcion_tutoria VALUES('10000000013', 4, '2022-08-14');
INSERT INTO Inscripcion_tutoria VALUES('10000000014', 4, '2022-08-14');
INSERT INTO Inscripcion_tutoria VALUES('10000000015', 5, '2022-08-12');
INSERT INTO Inscripcion_tutoria VALUES('10000000016', 5, '2022-08-13');
INSERT INTO Inscripcion_tutoria VALUES('10000000017', 5, '2022-08-11');


-- Insertar realización tutorías
INSERT INTO Realizacion_Tutoria VALUES(1,"Ecuaciones lineales","2022-05-12 10:00:00",2,1);
INSERT INTO Realizacion_Tutoria VALUES(2,"Potencias y series numéricas","2022-05-19 10:00:00",1,1);
INSERT INTO Realizacion_Tutoria VALUES(3,"Polimorfismo","2022-05-13 10:00:00",2,2);
INSERT INTO Realizacion_Tutoria VALUES(4,"Pruebas unitarias","2022-05-20 10:00:00",1,2);
INSERT INTO Realizacion_Tutoria VALUES(5,"Suma de Riemann","2022-05-14 10:00:00",2,3);
INSERT INTO Realizacion_Tutoria VALUES(6,"Integrales impropias y funciones gamma y beta","2022-05-21 10:00:00",2,3);
INSERT INTO Realizacion_Tutoria VALUES(7,"Diagonalización","2022-05-15 10:00:00",2,4);
INSERT INTO Realizacion_Tutoria VALUES(8,"Ortogonalización","2022-05-22 10:00:00",1,4);
INSERT INTO Realizacion_Tutoria VALUES(9,"Superficies y derivadas parciales","2022-05-16 10:00:00",2,5);
INSERT INTO Realizacion_Tutoria VALUES(10,"Introducción al cálculo vectorial: Teorema de Stokes y Teorema de Green","2022-05-23 10:00:00",2,5);

-- Insertar asistencia
INSERT INTO Asistencia VALUES(1, 1, '10000000001', 1);
INSERT INTO Asistencia VALUES(2, 1, '10000000002', 1);
INSERT INTO Asistencia VALUES(3, 1, '10000000003', 1);
INSERT INTO Asistencia VALUES(4, 1, '10000000004', 0);
INSERT INTO Asistencia VALUES(5, 2, '10000000001', 1);
INSERT INTO Asistencia VALUES(6, 2, '10000000002', 0);
INSERT INTO Asistencia VALUES(7, 2, '10000000003', 1);
INSERT INTO Asistencia VALUES(8, 2, '10000000004', 1);
INSERT INTO Asistencia VALUES(9, 3, '10000000005', 1);
INSERT INTO Asistencia VALUES(10, 3, '10000000006', 1);
INSERT INTO Asistencia VALUES(11, 3, '10000000007', 1);
INSERT INTO Asistencia VALUES(12, 3, '10000000008', 0);
INSERT INTO Asistencia VALUES(13, 4, '10000000005', 0);
INSERT INTO Asistencia VALUES(14, 4, '10000000006', 1);
INSERT INTO Asistencia VALUES(15, 4, '10000000007', 1);
INSERT INTO Asistencia VALUES(16, 4, '10000000008', 1);
INSERT INTO Asistencia VALUES(17, 5, '10000000009', 1);
INSERT INTO Asistencia VALUES(18, 5, '10000000010', 1);
INSERT INTO Asistencia VALUES(19, 5, '10000000011', 1);
INSERT INTO Asistencia VALUES(20, 6, '10000000009', 1);
INSERT INTO Asistencia VALUES(21, 6, '10000000010', 0);
INSERT INTO Asistencia VALUES(22, 6, '10000000011', 1);
INSERT INTO Asistencia VALUES(23, 7, '10000000012', 1);
INSERT INTO Asistencia VALUES(24, 7, '10000000013', 0);
INSERT INTO Asistencia VALUES(25, 7, '10000000014', 0);
INSERT INTO Asistencia VALUES(26, 8, '10000000012', 1);
INSERT INTO Asistencia VALUES(27, 8, '10000000013', 0);
INSERT INTO Asistencia VALUES(28, 8, '10000000014', 1);
INSERT INTO Asistencia VALUES(29, 9, '10000000015', 1);
INSERT INTO Asistencia VALUES(30, 9, '10000000016', 0);
INSERT INTO Asistencia VALUES(31, 9, '10000000017', 1);
INSERT INTO Asistencia VALUES(32, 10, '10000000015', 1);
INSERT INTO Asistencia VALUES(33, 10, '10000000016', 1);
INSERT INTO Asistencia VALUES(34, 10, '10000000017', 1);

-- Insertar feedback bidireccional
INSERT INTO Feedback_bidireccional VALUES(1, 6, 7, 1, '10000000001');
INSERT INTO Feedback_bidireccional VALUES(2, 5, 9, 1, '10000000002');
INSERT INTO Feedback_bidireccional VALUES(3, 4, 5, 1, '10000000003');
INSERT INTO Feedback_bidireccional VALUES(4, 8, 5, 1, '10000000004');
INSERT INTO Feedback_bidireccional VALUES(5, 8, 8, 2, '10000000001');
INSERT INTO Feedback_bidireccional VALUES(6, 8, 9, 2, '10000000002');
INSERT INTO Feedback_bidireccional VALUES(7, 6, 8, 2, '10000000003');
INSERT INTO Feedback_bidireccional VALUES(8, 4, 3, 2, '10000000004');
INSERT INTO Feedback_bidireccional VALUES(9, 9, 10, 3, '10000000005');
INSERT INTO Feedback_bidireccional VALUES(10, 10, 8, 3, '10000000006');
INSERT INTO Feedback_bidireccional VALUES(11, 7, 8, 3, '10000000007');
INSERT INTO Feedback_bidireccional VALUES(12, 9, 6, 3, '10000000008');
INSERT INTO Feedback_bidireccional VALUES(13, 6, 6, 4, '10000000005');
INSERT INTO Feedback_bidireccional VALUES(14, 10, 8, 4, '10000000006');
INSERT INTO Feedback_bidireccional VALUES(15, 9, 7, 4, '10000000007');
INSERT INTO Feedback_bidireccional VALUES(16, 2, 5, 4, '10000000008');
INSERT INTO Feedback_bidireccional VALUES(17, 7, 4, 5, '10000000009');
INSERT INTO Feedback_bidireccional VALUES(18, 5, 3, 5, '10000000010');
INSERT INTO Feedback_bidireccional VALUES(19, 7, 8, 5, '10000000011');
INSERT INTO Feedback_bidireccional VALUES(20, 5, 6, 6, '10000000009');
INSERT INTO Feedback_bidireccional VALUES(21, 10, 10, 6, '10000000010');
INSERT INTO Feedback_bidireccional VALUES(22, 8, 3, 6, '10000000011');
INSERT INTO Feedback_bidireccional VALUES(23, 2, 4, 7, '10000000012');
INSERT INTO Feedback_bidireccional VALUES(24, 8, 7, 7, '10000000013');
INSERT INTO Feedback_bidireccional VALUES(25, 9, 9, 7, '10000000014');
INSERT INTO Feedback_bidireccional VALUES(26, 10, 7, 8, '10000000012');
INSERT INTO Feedback_bidireccional VALUES(27, 7, 7, 8, '10000000013');
INSERT INTO Feedback_bidireccional VALUES(28, 5, 8, 8, '10000000014');
INSERT INTO Feedback_bidireccional VALUES(29, 5, 6, 9, '10000000015');
INSERT INTO Feedback_bidireccional VALUES(30, 4, 6, 9, '10000000016');
INSERT INTO Feedback_bidireccional VALUES(31, 7, 3, 9, '10000000017');
INSERT INTO Feedback_bidireccional VALUES(32, 3, 8, 10, '10000000015');
INSERT INTO Feedback_bidireccional VALUES(33, 8, 9, 10, '10000000016');
INSERT INTO Feedback_bidireccional VALUES(34, 9, 10, 10, '10000000017');
