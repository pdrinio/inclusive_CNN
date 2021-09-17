-- GrupoHito Propias
insert into GrupoHito (nombre, orden, grupoPropias, grupoFranquicias) values ('De Inicio a Publicado Interiorismo', 1, 1, 0)
insert into GrupoHito (nombre, orden, grupoPropias, grupoFranquicias) values ('De Equipo Interiorismo asignado a Entrega del Proyecto', 2, 1, 0)
insert into GrupoHito (nombre, orden, grupoPropias, grupoFranquicias) values ('De Presupuesto Materiales a Contrato Constructora', 3, 1, 0)
insert into GrupoHito (nombre, orden, grupoPropias, grupoFranquicias) values ('De Pedidos a Proveedores a Inauguración', 4, 1, 0)

-- GrupoHito Franquicias
insert into GrupoHito (nombre, orden, grupoPropias, grupoFranquicias) values ('De Inicio a Publicado Interiorismo', 1, 0, 1)
insert into GrupoHito (nombre, orden, grupoPropias, grupoFranquicias) values ('De Equipo Interiorismo asignado a Entrega del Proyecto', 2, 0, 1)
insert into GrupoHito (nombre, orden, grupoPropias, grupoFranquicias) values ('De Presupuesto Materiales a Montaje Coordinado', 3, 0, 1)
insert into GrupoHito (nombre, orden, grupoPropias, grupoFranquicias) values ('De Comienzo de la Obra a Inauguración', 4, 0, 1)


-- Hito Propias
insert into Hito (nombre, diasInicio, orden, aviso, idGrupoHito) values ('Tienda en Proyecto/Proyecto en Curso', 2)
insert into Hito (nombre, idGrupoHito) values ('En Revisión', 2)
insert into Hito (nombre, idGrupoHito) values ('Solicitado Levantamiento de Planos', 2)
insert into Hito (nombre, idGrupoHito) values ('Recepción Levantamiento de Planos', 2)
insert into Hito (nombre, idGrupoHito) values ('Publicado Interiorismo,', 2)
insert into Hito (nombre, idGrupoHito) values ('Equipo Interiorismo Asignado', 2)
insert into Hito (nombre, idGrupoHito) values ('Inicio Proyecto Interiorismo', 2)
insert into Hito (nombre, idGrupoHito) values ('Planta Distribución Finalizada', 2 )
insert into Hito (nombre, idGrupoHito) values ('Validación Plano Arq. Zona' ,2)
insert into Hito (nombre, idGrupoHito) values ('Pedido Lanzado a Gest. Materiales', 2)
insert into Hito (nombre, idGrupoHito) values ('Validaciones Plano por Proveedor Realizadas', 2)
insert into Hito (nombre, idGrupoHito) values ('Plano Tienda Finalizado', 2)
insert into Hito (nombre, idGrupoHito) values ('Capacidad Comercial Decidida', 2)
insert into Hito (nombre, idGrupoHito) values ('OK Superivsor', 2)
insert into Hito (nombre, idGrupoHito) values ('Entrega del Proyecto', 2)
insert into Hito (nombre, idGrupoHito) values ('Presupuesto Materiales Pedido', 3)
insert into Hito (nombre, idGrupoHito) values ('Proyecto Activo', 3)
insert into Hito (nombre, idGrupoHito) values ('Confección Presupuesto Materiales', 3)
insert into Hito (nombre, idGrupoHito) values ('Presupuesto Materiales Aprobado', 3)
insert into Hito (nombre, idGrupoHito) values ('Presupuesto Materiales Incluído en Presup. Obras', 3)
insert into Hito (nombre, idGrupoHito) values ('Proyecto Ingeniería Finalizado', 3)
insert into Hito (nombre, idGrupoHito) values ('Solicitud Presupuestos Constructoras', 3)
insert into Hito (nombre, idGrupoHito) values ('Presupuestos Construcotras Recibidos', 3)
insert into Hito (nombre, idGrupoHito) values ('Presupuesto Obra Aprobado', 3)
insert into Hito (nombre, idGrupoHito) values ('Planning Obra Solicitado', 3)
insert into Hito (nombre, idGrupoHito) values ('Planning Obra Recibido', 3)
insert into Hito (nombre, idGrupoHito) values ('Contrato Enviado a Constructora', 3)
insert into Hito (nombre, idGrupoHito) values ('Contrato Constructora Firmado', 3)
insert into Hito (nombre, idGrupoHito) values ('Pedidos Proveedores Realizados', 3)
insert into Hito (nombre, idGrupoHito) values ('Timming Solicitado', 3)
insert into Hito (nombre, idGrupoHito) values ('Timming Confirmado', 3)
insert into Hito (nombre, idGrupoHito) values ('Envíos Coordinados', 3)
insert into Hito (nombre, idGrupoHito) values ('Mercancías Enviadas', 3)
insert into Hito (nombre, idGrupoHito) values ('Mercancías Recibidas', 3)
insert into Hito (nombre, idGrupoHito) values ('Comienzo de la Obra', 4)
insert into Hito (nombre, idGrupoHito) values ('Modificaciones a la Tienda', 4)
insert into Hito (nombre, idGrupoHito) values ('Envío Mobiliario Planificado', 4)
insert into Hito (nombre, idGrupoHito) values ('Obra Finalizada', 4)
insert into Hito (nombre, idGrupoHito) values ('Obra Validada', 4)
insert into Hito (nombre, idGrupoHito) values ('Documentación Obra Enviada', 4)
insert into Hito (nombre, idGrupoHito) values ('Montaje Tienda Iniciado', 4)
insert into Hito (nombre, idGrupoHito) values ('Montaje Tienda Finalizado', 4)
insert into Hito (nombre, idGrupoHito) values ('Tienda Inaugurada', 4)

-- Hito Franquicias
insert into Hito (nombre, diasInicio, orden) values ('Planos Completos', 5, 1)
insert into Hito (nombre, diasInicio, orden) values ('Derechos Entrada Pagados', 10, 2)
insert into Hito (nombre, diasInicio, orden) values ('Tienda en Proyecto/Proyecto en Curso', 15, 3)
insert into Hito (nombre, diasInicio, orden) values ('En Revisión', 20, 4)
insert into Hito (nombre, diasInicio, orden) values ('OK Interiorismo', 25, 5)
insert into Hito (nombre, diasInicio, orden) values ('Publicado Interiorismo', 30, 6)
insert into Hito (nombre, diasInicio, orden) values ('Presupuesto Materiales Pedido', 110, 23)
insert into Hito (nombre, diasInicio, orden) values ('Proyecto Activo', 115, 24)
insert into Hito (nombre, diasInicio, orden) values ('Confección Presupuesto Materiales', 120, 25)
insert into Hito (nombre, diasInicio, orden) values ('Presupuesto Materiales Aprobado', 125, 26)
insert into Hito (nombre, diasInicio, orden) values ('Presupuesto Materiales Enviado Expansión', 130, 27)
insert into Hito (nombre, diasInicio, orden) values ('Presupuesto Materiales Validado Expansión', 135, 28)
insert into Hito (nombre, diasInicio, orden) values ('Presupuesto Materiales Enviado Franquiciado', 140, 29)
insert into Hito (nombre, diasInicio, orden) values ('Presupuesto Materiales Aceptado Franquiciado', 145, 30)
insert into Hito (nombre, diasInicio, orden) values ('Pedidos Proveedores Realizados', 150, 31)
insert into Hito (nombre, diasInicio, orden) values ('Timming Solicitado', 155, 32)
insert into Hito (nombre, diasInicio, orden) values ('Timming Confirmado Franquiciado', 160, 33)
insert into Hito (nombre, diasInicio, orden) values ('Envíos Coordinados', 165, 34)
insert into Hito (nombre, diasInicio, orden) values ('Mercancías Repartidas', 170, 35)
insert into Hito (nombre, diasInicio, orden) values ('Montaje Coordinado', 175, 36)
insert into Hito (nombre, diasInicio, orden) values ('Comienzo de la Obra', 180, 37)
insert into Hito (nombre, diasInicio, orden) values ('Modificaciones a la Tienda', 185, 38)
insert into Hito (nombre, diasInicio, orden) values ('Envío Mobiliario Planificado', 190, 39 )
insert into Hito (nombre, diasInicio, orden) values ('OK Envío Ropa', 195, 40)
insert into Hito (nombre, diasInicio, orden) values ('Obra Finalizada', 200, 41)
insert into Hito (nombre, diasInicio, orden) values ('Obra Validada', 205, 42)
insert into Hito (nombre, diasInicio, orden) values ('Fin Obra Recibido', 210, 43)
insert into Hito (nombre, diasInicio, orden) values ('Montaje Tienda Iniciado', 215, 44)
insert into Hito (nombre, diasInicio, orden) values ('Montaje Tienda Finalizado', 220, 45)
insert into Hito (nombre, diasInicio, orden) values ('Tienda Inaugurada', 225, 46)

-- DepartamentoHito

-- Departamentos:
--	Gestión Inmobiliaria		wt.org.WTGroup:8925
--	Coordinación Interiorismo	wt.org.WTGroup:8929
--	Obras						wt.org.WTGroup:8933
--	Interiorismo				wt.org.WTGroup:8937
--	Gestión Materiales			wt.org.WTGroup:8941
--	Expansión					wt.org.WTGroup:8945

select * from DepartamentoHito

insert into DepartamentoHito
	select idHito, 'wt.org.WTGroup:8925'
	from Hito
	where idHito between 1 and 6

insert into DepartamentoHito
	select idHito, 'wt.org.WTGroup:8929'
	from Hito
	where idHito = 7

insert into DepartamentoHito
	select idHito, 'wt.org.WTGroup:8941'
	from Hito
	where idHito = 7

insert into DepartamentoHito
	select idHito, 'wt.org.WTGroup:8929'
	from Hito
	where idHito = 8

insert into DepartamentoHito
	select idHito, 'wt.org.WTGroup:8933'
	from Hito
	where idHito between 9 and 10

insert into DepartamentoHito
	select idHito, 'wt.org.WTGroup:8929'
	from Hito
	where idHito = 11

insert into DepartamentoHito
	select idHito, 'wt.org.WTGroup:8937'
	from Hito
	where idHito between 12 and 21

insert into DepartamentoHito
	select idHito, 'wt.org.WTGroup:8941'
	from Hito
	where idHito between 22 and 26

insert into DepartamentoHito
	select idHito, 'wt.org.WTGroup:8933'
	from Hito
	where idHito between 27 and 34

insert into DepartamentoHito
	select idHito, 'wt.org.WTGroup:8941'
	from Hito
	where idHito between 35 and 40

insert into DepartamentoHito
	select idHito, 'wt.org.WTGroup:8937'
	from Hito
	where idHito between 41 and 45

insert into DepartamentoHito
	select idHito, 'wt.org.WTGroup:8933'
	from Hito
	where idHito = 46

insert into DepartamentoHito
	select idHito, 'wt.org.WTGroup:8937'
	from Hito
	where idHito between 47 and 49

insert into DepartamentoHito
	select idHito, 'wt.org.WTGroup:8945', 'Expansión'
	from Hito
	where idHito in (50, 53, 75)

insert into DepartamentoHito
	select idHito, 'wt.org.WTGroup:8929', 'Coordinación Interiorismo'
	from Hito
	where idHito = 50

insert into DepartamentoHito
	select idHito, 'wt.org.WTGroup:8929', 'Coordinación Interiorismo'
	from Hito
	where idHito between 53 and 57

insert into DepartamentoHito
	select idHito, 'wt.org.WTGroup:8941', 'Gestión Materiales'
	from Hito
	where idHito = 54

insert into DepartamentoHito
	select idHito, 'wt.org.WTGroup:8941', 'Gestión Materiales'
	from Hito
	where idHito between 58 and 71

insert into DepartamentoHito
	select idHito, 'wt.org.WTGroup:8945', 'Expansión'
	from Hito
	where idHito in (63)

insert into DepartamentoHito
	select idHito, 'wt.org.WTGroup:8937', 'Interiorismo'
	from Hito
	where idHito between 72 and 74

insert into DepartamentoHito
	select idHito, 'wt.org.WTGroup:8937', 'Interiorismo'
	from Hito
	where idHito between 76 and 81

insert into DepartamentoHito
	select idHito, 'wt.org.WTGroup:8941', 'Gestión Materiales'
	from Hito
	where idHito between 79 and 80
