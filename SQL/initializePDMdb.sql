-- GrupoHito Propias
insert into GrupoHito (nombre, orden, grupoPropias, grupoFranquicias) values ('De Inicio a Publicado Interiorismo', 1, 1, 0)
insert into GrupoHito (nombre, orden, grupoPropias, grupoFranquicias) values ('De Equipo Interiorismo asignado a Entrega del Proyecto', 2, 1, 0)
insert into GrupoHito (nombre, orden, grupoPropias, grupoFranquicias) values ('De Presupuesto Materiales a Contrato Constructora', 3, 1, 0)
insert into GrupoHito (nombre, orden, grupoPropias, grupoFranquicias) values ('De Pedidos a Proveedores a Inauguraci�n', 4, 1, 0)

-- GrupoHito Franquicias
insert into GrupoHito (nombre, orden, grupoPropias, grupoFranquicias) values ('De Inicio a Publicado Interiorismo', 1, 0, 1)
insert into GrupoHito (nombre, orden, grupoPropias, grupoFranquicias) values ('De Equipo Interiorismo asignado a Entrega del Proyecto', 2, 0, 1)
insert into GrupoHito (nombre, orden, grupoPropias, grupoFranquicias) values ('De Presupuesto Materiales a Montaje Coordinado', 3, 0, 1)
insert into GrupoHito (nombre, orden, grupoPropias, grupoFranquicias) values ('De Comienzo de la Obra a Inauguraci�n', 4, 0, 1)

-- Hito Propias
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Recepci�n Ofertas', 5, 1, '', 1)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Solicitud Estudio Previo',10,2,'',1)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('En Negociaci�n',15,3,'',1)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Pendiente de Firma',20,4,'',1)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Negociaci�n de Contrato',25,5,'',1)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Firmada',30,6,'',1)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Tienda en Proyecto/Proyecto en curso',35,7,'',1)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('En Revisi�n',40,8,'',1)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Solicitado Levantamiento de Planos',45,9,'',1)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Recepci�n Levantamiento de Planos',50,10,'',1)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('OK Interiorismo',55,11,'',1)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Publicado Interiorismo',60,12,'',1)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Equipo Interiorismo Asignado',65,13,'',2)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Inicio Proyecto Interiorismo',70,14,'',2)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Planta Distribuci�n Finalizada',75,15,'',2)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Validaci�n Plano Arq. Zona',80,16,'',2)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Pedido Lanzado a Gest. Materiales',85,17,'',2)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Validaciones Plano por Proveedor Realizadas',90,18,'',2)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Plano Tienda Finalizado',95,19,'',2)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Capacidad Comercial Decidida',100,20,'',2)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('OK Superivsor',105,21,'',2)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Entrega del Proyecto',110,22,'',2)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Presupuesto Materiales Pedido',115,23,'',3)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Proyecto Activo',120,24,'',3)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Confecci�n Presupuesto Materiales',125,25,'',3)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Presupuesto Materiales Aprobado',130,26,'',3)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Presupuesto Materiales Inclu�do en Presup. Obras',135,27,'',3)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Proyecto Ingenier�a Finalizado',140,28,'',3)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Solicitud Presupuestos Constructoras',145,29,'',3)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Presupuestos Constructoras Recibidos',150,30,'',3)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Presupuesto Obra Aprobado',155,31,'',3)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Planning Obra Solicitado',160,32,'',3)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Planning Obra Recibido',165,33,'',3)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Contrato Enviado a Constructora',170,34,'',3)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Contrato Constructora Firmado',175,35,'',3)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Pedidos Proveedores Realizados',180,36,'',4)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Timming Solicitado',185,37,'',4)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Timming Confirmado',190,38,'',4)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Env�os Coordinados',195,39,'',4)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Mercanc�as Enviadas',200,40,'',4)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Mercanc�as Recibidas',205,41,'',4)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Comienzo de la Obra',210,42,'',4)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Modificaciones a la Tienda',215,43,'',4)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Env�o Mobiliario Planificado',220,44,'',4)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Obra Finalizada',225,45,'',4)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Obra Validada',230,46,'',4)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Documentaci�n Obra Enviada',235,47,'',4)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Montaje Tienda Iniciado',240,48,'',4)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Montaje Tienda Finalizado',245,49,'',4)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Tienda Inaugurada',250,50,'',4)

-- Hito Franquicias
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Planos Completos', 5,	1, '', 5)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Derechos Entrada Pagados',10,2,'',5)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Tienda en Proyecto/Proyecto en Curso',15,3,'',5)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('En Revisi�n',20,4,'',5)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('OK Interiorismo',25,5,'',5)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Publicado Interiorismo',30,6,'',5)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Equipo Interiorismo Asignado',35,7,'',6)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Inicio Proyecto Interiorismo',40,8,'',6)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Planta Distribuci�n Finalizada',45,9,'',6)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Validaci�n Plano Arq. Zona',50,10,'',6)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Pedido Lanzado a Gest. Materiales',55,11,'',6)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Validaciones Plano por Proveedor Realizadas',60,12,'',6)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Plano Tienda Finalizado',65,13,'',6)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Capacidad Comercial Decidida',70,14,'',6)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('OK Superivsor',75,15,'',6)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Entrega del Proyecto',80,16,'',6)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Presupuesto Materiales Pedido',85,17,'',7)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Proyecto Activo',90,18,'',7)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Confecci�n Presupuesto Materiales',95,19,'',7)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Presupuesto Materiales Aprobado',100,20,'',7)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Presupuesto Materiales Enviado Expansi�n',105,21,'',7)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Presupuesto Materiales Validado Expansi�n',110,22,'',7)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Presupuesto Materiales Enviado Franquiciado',115,23,'',7)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Presupuesto Materiales Aceptado Franquiciado',120,24,'',7)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Pedidos Proveedores Realizados',125,25,'',7)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Timming Solicitado',130,26,'',7)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Timming Confirmado Franquiciado',135,27,'',7)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Env�os Coordinados',140,28,'',7)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Mercanc�as Repartidas',145,29,'',7)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Montaje Coordinado',150,30,'',7)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Comienzo de la Obra',155,31,'',8)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Modificaciones a la Tienda',160,32,'',8)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Env�o Mobiliario Planificado',165,33,'',8)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('OK Env�o Ropa',170,34,'',8)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Obra Finalizada',175,35,'',8)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Obra Validada',180,36,'',8)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Fin Obra Recibido',185,37,'',8)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Montaje Tienda Iniciado',190,38,'',8)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Montaje Tienda Finalizado',195,39,'',8)
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Tienda Inaugurada',200,40,'',8)


-- DepartamentoHito
declare @id as int 
declare @idGrupo as varchar(50)

declare grupo cursor for select idA2A2 from wcadmin.wcadmin.WTGroup where name = 'Gesti�n Inmobiliaria'
open grupo
fetch next from grupo into @id
close grupo
deallocate grupo
set @idGrupo = 'wt.org.WTGroup:' + Convert(varchar, @id)
insert into DepartamentoHito
	select idHito, @idGrupo, 'Gesti�n Inmobiliaria'
	from Hito 
	where idGrupoHito = 1 and orden between 1 and 6

declare grupo cursor for select idA2A2 from wcadmin.wcadmin.WTGroup where name = 'Coordinaci�n Interiorismo'
open grupo
fetch next from grupo into @id
close grupo
deallocate grupo
set @idGrupo = 'wt.org.WTGroup:' + Convert(varchar, @id)
insert into DepartamentoHito
	select idHito, @idGrupo, 'Coordinaci�n Interiorismo'
	from Hito 
	where (idGrupoHito = 1 and orden in (7, 8, 11, 12)) or (idGrupoHito = 5 and orden between 1 and 6)
	
declare grupo cursor for select idA2A2 from wcadmin.wcadmin.WTGroup where name = 'Obras'
open grupo
fetch next from grupo into @id
close grupo
deallocate grupo
set @idGrupo = 'wt.org.WTGroup:' + Convert(varchar, @id)
insert into DepartamentoHito
	select idHito, @idGrupo, 'Obras'
	from Hito
	where (idGrupoHito = 1 and orden in (9, 10)) or (idGrupoHito = 3 and orden between 28 and 35) or (idGrupoHito = 4 and orden = 47)
	
declare grupo cursor for select idA2A2 from wcadmin.wcadmin.WTGroup where name = 'Interiorismo'
open grupo
fetch next from grupo into @id
close grupo
deallocate grupo
set @idGrupo = 'wt.org.WTGroup:' + Convert(varchar, @id)
insert into DepartamentoHito
	select idHito, @idGrupo, 'Interiorismo'
	from Hito
	where (idGrupoHito = 2) or (idGrupoHito = 4 and orden between 42 and 46) or (idGrupoHito = 4 and orden between 48 and 50) or
		  (idGrupoHito = 6) or (idGrupoHito = 8 and orden between 31 and 33) or (idGrupoHito = 8 and orden between 35 and 36) or (idGrupoHito = 8 and orden between 38 and 40)

declare grupo cursor for select idA2A2 from wcadmin.wcadmin.WTGroup where name = 'Gesti�n Materiales'
open grupo
fetch next from grupo into @id
close grupo
deallocate grupo
set @idGrupo = 'wt.org.WTGroup:' + Convert(varchar, @id)
insert into DepartamentoHito
	select idHito, @idGrupo, 'Gesti�n Materiales'
	from Hito
	where (idGrupoHito = 1 and orden = 7) or (idGrupoHito = 3 and orden between 23 and 27) or (idGrupoHito = 4 and orden between 36 and 41) or
		  (idGrupoHito = 5 and orden = 3) or (idGrupoHito = 7) or (idGrupoHito = 8 and orden between 37 and 39)	

declare grupo cursor for select idA2A2 from wcadmin.wcadmin.WTGroup where name = 'Expansi�n'
open grupo
fetch next from grupo into @id
close grupo
deallocate grupo
set @idGrupo = 'wt.org.WTGroup:' + Convert(varchar, @id)
insert into DepartamentoHito
	select idHito, @idGrupo, 'Expansi�n'
	from Hito
	where (idGrupoHito = 5 and orden in (1, 2)) or (idGrupoHito = 7 and orden = 22) or (idGrupoHito = 8 and orden = 34)