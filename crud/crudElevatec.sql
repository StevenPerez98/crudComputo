CREATE DATABASE CRUDELEVATEC;

USE CRUDELEVATEC;

CREATE TABLE computerInfo(
idInfo INT not null,
Computadora VARCHAR(50),
salida DATETIME,
entrada DATETIME,
proyecto VARCHAR(50),
tecnico VARCHAR(50),
observacion VARCHAR (200),
PRIMARY KEY(idInfo)
);
DROP procedure sp_computerList
/*Se crea tabla para llenar comboBox con nombre de los proyectos*/
CREATE TABLE proyecto(
idProyecto INT NOT NULL,
nombreProyecto VARCHAR(100),
PRIMARY KEY (idProyecto)
);

/*Se crea tabla para llenar el otro comboBox con los nombres de las computadoras*/
CREATE TABLE computadora(
idCompu INT NOT NULL,
nombreCompu VARCHAR(100),
PRIMARY KEY (idCompu)
);

/*Se crea tabla para llenar el otro comboBox con los nombres de las computadoras*/
CREATE TABLE tecnico(
idtecnico INT NOT NULL,
nombretecnico VARCHAR(100),
PRIMARY KEY (idtecnico)
);


/*Se insertan datos a tabla proyecto */
INSERT INTO proyecto (idProyecto,nombreProyecto) VALUES(1,'A-4');
INSERT INTO proyecto (idProyecto,nombreProyecto) VALUES(2,'Apartamentos Reforma');
INSERT INTO proyecto (idProyecto,nombreProyecto) VALUES(3,'Banco Inmobiliario');
INSERT INTO proyecto (idProyecto,nombreProyecto) VALUES(4,'Bresciani');
INSERT INTO proyecto (idProyecto,nombreProyecto) VALUES(5,'Casa Abril');
INSERT INTO proyecto (idProyecto,nombreProyecto) VALUES(6,'Casa San Pedrito');
INSERT INTO proyecto (idProyecto,nombreProyecto) VALUES(7,'Clínica Londres 1');
INSERT INTO proyecto (idProyecto,nombreProyecto) VALUES(8,'Clínica Londres 2');
INSERT INTO proyecto (idProyecto,nombreProyecto) VALUES(9,'Defensa Pública Penal');
INSERT INTO proyecto (idProyecto,nombreProyecto) VALUES(10,'Design Center');
INSERT INTO proyecto (idProyecto,nombreProyecto) VALUES(11,'Dollacity');
INSERT INTO proyecto (idProyecto,nombreProyecto) VALUES(12,'Cortijo Reforma	');

/*Se insertan datos a tabla computadora*/
INSERT INTO computadora(idCompu,nombreCompu) VALUES (1,'IMS ORIGINAL 1');
INSERT INTO computadora(idCompu,nombreCompu) VALUES (2,'IMS ORIGINAL 2');
INSERT INTO computadora(idCompu,nombreCompu) VALUES (3,'DMC1 ORIGINAL Actualizado');
INSERT INTO computadora(idCompu,nombreCompu) VALUES (4,'Programas Hyuandi, PLC y varios');
INSERT INTO computadora(idCompu,nombreCompu) VALUES (5,'IMS Virtual 1');
INSERT INTO computadora(idCompu,nombreCompu) VALUES (6,'IMS Virtual 2');
INSERT INTO computadora(idCompu,nombreCompu) VALUES (7,'Programa Mitsubishi MTII ');
INSERT INTO computadora(idCompu,nombreCompu) VALUES (8,'Programa Mitsubishi MTII  2');


/*Se insertan datos a tabla tecnico*/
INSERT INTO tecnico(idTecnico,nombretecnico) VALUES (1,'Josbel Lara');
INSERT INTO tecnico(idTecnico,nombretecnico) VALUES (2,'David Lorenzana');
INSERT INTO tecnico(idTecnico,nombretecnico) VALUES (3,'Juan Zuñiga');
INSERT INTO tecnico(idTecnico,nombretecnico) VALUES (4,'Hugo Hernandez');
INSERT INTO tecnico(idTecnico,nombretecnico) VALUES (5,'Osman Mejicanos');
INSERT INTO tecnico(idTecnico,nombretecnico) VALUES (6,'Pablo Car');
INSERT INTO tecnico(idTecnico,nombretecnico) VALUES (7,'Alex Toquer');
INSERT INTO tecnico(idTecnico,nombretecnico) VALUES (8,'Julio Hernandez');
SELECT *FROM computerInfo

/*INTER ITEMS*/
Create PROCEDURE sp_computerInsert
@id int,
@computadora VARCHAR(50),
@entrada DATETIME,
@salida DATETIME,
@proyecto VARCHAR(50),
@tecnico VARCHAR(50),
@observacion VARCHAR(200)
as
begin
INSERT INTO computerInfo(idInfo,Computadora,salida,entrada,proyecto,tecnico,observacion)
VALUES(@id,@computadora,@salida,@entrada,@proyecto,@tecnico,@observacion)
END

/*READ ITEMS*/
Create PROCEDURE sp_computerList
as
begin
SELECT * FROM computerInfo
END

/*UPDATE ITEMS*/
ALTER PROCEDURE sp_computerUPDATE
@id int,
@computadora VARCHAR(50),
@entrada DATETIME,
@salida DATETIME,
@proyecto VARCHAR(50),
@tecnico VARCHAR(50),
@observacion VARCHAR(200)
as
begin
UPDATE computerInfo SET idInfo=@id,computadora=@computadora,entrada=@entrada,salida=@salida,proyecto=@proyecto,tecnico = @tecnico, observacion=@observacion WHERE idInfo = @id
END

/*DELETE ITEMS*/
CREATE PROCEDURE sp_computerDELETE
@id int
as
begin
DELETE computerInfo  WHERE idInfo = @id
END


/*Search ITEMS*/
CREATE PROCEDURE sp_computerSearch
@id int
as
begin
SELECT * FROM  computerInfo  WHERE idInfo = @id
END