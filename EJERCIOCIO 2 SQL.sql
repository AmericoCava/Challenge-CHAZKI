--CREACION DE BASE DATOS
create database "Prueba CHAZKI"

--Asignar notnull
ALTER TABLE "Indice General"
ALTER COLUMN subtype INT NOT NULL

ALTER TABLE Ordenes
ALTER COLUMN statusID INT NOT NULL

--Asignar llaves primaria
ALTER TABLE "Indice General"
ADD  CONSTRAINT [PK_"Indice General"] PRIMARY KEY CLUSTERED
([subtype] ASC)

--Asiganr llave foranea
alter table Ordenes
ADD FOREIGN KEY (statusID) references "indice general" (subtype)

--Selecionar tabla Ordenada
SELECT * FROM "Indice General" order by subtype

--Conteo de trackcode
select COUNT (trackCode) as "Cantidad de TrackCode" from Ordenes

--Conteo de trackcode por tipo
select statusID, COUNT (statusID) as "Cantidad de TrackCode" from Ordenes
group by statusID
order by  statusID

--Promedio de kilometros por ruta
select avg(distance) as "Promedio" from Ordenes

--Promedio de kilometros por ruta/trackcode
select trackCode, avg(distance) as "Promedio" from Ordenes
Group by trackCode
order by Promedio

--contar trackcode DELIVERED/FAILED DROP
select buscarv, COUNT(buscarv) as "Tipo" from Ordenes
where statusID = 166
group by buscarv

--contar trackcode FAILED DROP
select buscarv, COUNT(buscarv) as "Tipo" from Ordenes
where statusID = 169
group by buscarv