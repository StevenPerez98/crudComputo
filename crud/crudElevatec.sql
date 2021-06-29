CREATE DATABASE CRUDELEVATEC;

USE CRUDELEVATEC;

CREATE TABLE computerInfo(
id INT identity(1,1),
Computadora VARCHAR(50),
entrada DATETIME,
salida DATETIME,
proyecto VARCHAR(50),
observacion VARCHAR (200),
PRIMARY KEY(id)
);
DROP TABLE proyecto
/*Se crea tabla para llenar comboBox con nombre de los proyectos*/
CREATE TABLE proyecto(
idProyecto INT NOT NULL,
nombreProyecto VARCHAR(100),
PRIMARY KEY (idProyecto)
);

/*Se crea tabla para lenar el otro comboBox con los nombres de las computadoras*/
CREATE TABLE computadora(
idCompu INT NOT NULL,
nombreCompu VARCHAR(100),
PRIMARY KEY (idCompu)
);


/*Se insertan datos a tabla proyecto y computadora*/
INSERT INTO proyecto (idProyecto,nombreProyecto) VALUES(2,'obelisco Reforma');
INSERT INTO computadora(idCompu,nombreCompu) VALUES (3,'DMCI Original');
SELECT *FROM proyecto

/*INTER ITEMS*/
Create PROCEDURE sp_computerInsert
@id int,
@computadora VARCHAR(50),
@entrada DATETIME,
@salida DATETIME,
@proyecto VARCHAR(50),
@observacion VARCHAR(200)
as
begin
INSERT INTO computerInfo(id,Computadora,entrada,salida,proyecto,observacion)
VALUES(@id,@computadora,@entrada,@salida,@proyecto,@observacion)
END

/*READ ITEMS*/
Create PROCEDURE sp_computerList
as
begin
SELECT * FROM computerInfo
END

/*UPDATE ITEMS*/
Create PROCEDURE sp_computerUPDATE
@id int,
@computadora VARCHAR(50),
@entrada DATETIME,
@salida DATETIME,
@proyecto VARCHAR(50),
@observacion VARCHAR(200)
as
begin
UPDATE computerInfo SET Computadora=@computadora,entrada=@entrada,salida=@salida,proyecto=@proyecto,observacion=@observacion WHERE id = @id
END

/*DELETE ITEMS*/
CREATE PROCEDURE sp_computerDELETE
@id int
as
begin
DELETE computerInfo  WHERE id = @id
END
