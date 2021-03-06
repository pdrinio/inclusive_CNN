USE [master]
GO
/****** Object:  Database [pdm]    Script Date: 08/26/2011 10:49:51 ******/
CREATE DATABASE [pdm] ON  PRIMARY 
( NAME = N'pdm', FILENAME = N'D:\ptc\Windchill_9.1\SQLServer\datafiles\pdm.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'pdm_log', FILENAME = N'D:\ptc\Windchill_9.1\SQLServer\datafiles\pdm_log.ldf' , SIZE = 1024KB , MAXSIZE = 1024MB , FILEGROWTH = 10%)
 COLLATE SQL_Latin1_General_CP1_CI_AS
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pdm].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO

ALTER DATABASE [pdm] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [pdm] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [pdm] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [pdm] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [pdm] SET ARITHABORT OFF 
GO

ALTER DATABASE [pdm] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [pdm] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [pdm] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [pdm] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [pdm] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [pdm] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [pdm] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [pdm] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [pdm] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [pdm] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [pdm] SET  ENABLE_BROKER 
GO

ALTER DATABASE [pdm] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [pdm] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [pdm] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [pdm] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [pdm] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [pdm] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [pdm] SET READ_WRITE 
GO

ALTER DATABASE [pdm] SET RECOVERY FULL 
GO

ALTER DATABASE [pdm] SET MULTI_USER 
GO

ALTER DATABASE [pdm] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [pdm] SET DB_CHAINING OFF 
GO

/****** Object:  Login [pdm]    Script Date: 08/26/2011 10:44:22 ******/
CREATE LOGIN [pdm] WITH PASSWORD=N'mango11.', DEFAULT_DATABASE=[pdm], DEFAULT_LANGUAGE=[Español], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

USE [pdm]
GO
/****** Object:  User [pdm]    Script Date: 08/26/2011 10:44:22 ******/
CREATE USER [pdm] FOR LOGIN [pdm] WITH DEFAULT_SCHEMA=[dbo]
GO

EXEC sp_addrolemember 'db_datareader', 'pdm'
EXEC sp_addrolemember 'db_datawriter', 'pdm'

/****** Object:  Table [dbo].[GrupoHito]    Script Date: 08/26/2011 10:44:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GrupoHito](
	[idGrupoHito] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](250) NOT NULL,
	[orden] [int] NOT NULL,
	[grupoPropias] [bit] NOT NULL,
	[grupoFranquicias] [bit] NOT NULL,
 CONSTRAINT [PK_GrupoHito] PRIMARY KEY CLUSTERED 
(
	[idGrupoHito] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Hito]    Script Date: 08/26/2011 10:44:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hito](
	[idHito] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[diasInicio] [int] NULL,
	[orden] [int] NOT NULL,
	[aviso] [varchar](500) NULL,
	[idGrupoHito] [int] NULL,
 CONSTRAINT [PK_Hito] PRIMARY KEY CLUSTERED 
(
	[idHito] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HitoProyecto_Pruebas]    Script Date: 08/26/2011 10:44:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GrupoUsuario]    Script Date: 08/26/2011 10:44:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GrupoUsuario](
	[idGrupoUsuario] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[idGrupo] [varchar](50) NOT NULL,
	[nombreGrupo] [varchar](50) NOT NULL,
	[idUsuario] [varchar](50) NOT NULL,
	[loginUsuario] [varchar](50) NOT NULL,
	[nombreUsuario] [varchar](100) NOT NULL,
	[emailUsuario] [varchar](50) NULL,
 CONSTRAINT [PK_GrupoUsuario] PRIMARY KEY CLUSTERED 
(
	[idGrupoUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 08/26/2011 10:44:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[idUserWC] [varchar](50) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[diasPendientes] [int] NULL,
	[idDepartamento] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HitoProyecto]    Script Date: 08/26/2011 10:44:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HitoProyecto](
	[idHitoProyecto] [int] IDENTITY(1,1) NOT NULL,
	[fechaPrevista] [datetime] NOT NULL,
	[fechaReal] [datetime] NOT NULL,
	[diasAviso] [int] NULL,
	[aviso] [varchar](500) NULL,
	[notas] [varchar](500) NULL,
	[idHito] [int] NOT NULL,
	[idProyecto] [varchar](50) NOT NULL,
	[descripcionEntidadPadre] [varchar](200) NULL,
	[finalizado] [bit] NOT NULL,
 CONSTRAINT [PK_HitoProyecto] PRIMARY KEY CLUSTERED 
(
	[idHitoProyecto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DepartamentoHito]    Script Date: 08/26/2011 10:44:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DepartamentoHito](
	[idDepartamentoHito] [int] IDENTITY(1,1) NOT NULL,
	[idHito] [int] NOT NULL,
	[idDepartamento] [varchar](50) NOT NULL,
	[nombreDepartamento] [varchar](100) NOT NULL,
 CONSTRAINT [PK_DepartamentoHito] PRIMARY KEY CLUSTERED 
(
	[idDepartamentoHito] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AvisoHitoProyecto]    Script Date: 08/26/2011 10:44:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AvisoHitoProyecto](
	[idAvisoHitoProyecto] [int] IDENTITY(1,1) NOT NULL,
	[revisado] [bit] NOT NULL,
	[idHitoProyecto] [int] NOT NULL,
	[idUser] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AvisoHitoProyecto] PRIMARY KEY CLUSTERED 
(
	[idAvisoHitoProyecto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario_Proyecto]    Script Date: 08/26/2011 10:44:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario_Proyecto](
	[idUsuario] [int] NOT NULL,
	[idProyecto] [varchar](50) NOT NULL,
	[esJefe] [bit] NOT NULL,
	[diasAntelacion] [int] NOT NULL,
 CONSTRAINT [PK_Usuario_Proyecto] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC,
	[idProyecto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[initHitosProyecto]    Script Date: 08/26/2011 10:44:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[initHitosProyecto]
	-- Parameters
	@idProyecto varchar(50) = null,
	@esPropia bit = 1, 
	@diasAviso int = 0,
	@descrEnt varchar (200) = null
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @fecha as datetime

	-- Recuperamos la fecha actual. Sólo recuperamos la fecha
	SET @fecha = DateAdd(dd, 0, DateDiff(dd, 0, getDate()))

	IF @esPropia = 1
	BEGIN	
		INSERT INTO HitoProyecto (fechaPrevista, fechaReal, diasAviso, aviso, idHito, idProyecto , descripcionEntidadPadre)
			SELECT DateAdd(d, diasInicio, @fecha), DateAdd(d, diasInicio, @fecha), @diasAviso, ISNULL(h.aviso, h.nombre), h.idHito, @idProyecto, @descrEnt
			FROM Hito h inner join GrupoHito gh on h.idGrupoHito = gh.idGrupoHito
			WHERE gh.grupoPropias = 1;
	END
	ELSE
	BEGIN
		INSERT INTO HitoProyecto (fechaPrevista, fechaReal, diasAviso, aviso, idHito, idProyecto , descripcionEntidadPadre)
			SELECT DateAdd(d, diasInicio, @fecha), DateAdd(d, diasInicio, @fecha), @diasAviso, ISNULL(h.aviso, h.nombre), h.idHito, @idProyecto, @descrEnt
			FROM Hito h inner join GrupoHito gh on h.idGrupoHito = gh.idGrupoHito
			WHERE gh.grupoFranquicias = 1;
	END

	INSERT INTO AvisoHitoProyecto (revisado, idHitoProyecto, idUser)
			SELECT 0, HP.idHitoProyecto, GU.loginUsuario 
			FROM (HitoProyecto HP inner join DepartamentoHito DH on HP.idHito = DH.idHito)
				inner join GrupoUsuario GU on DH.idDepartamento = GU.idGrupo
			where HP.idProyecto = @idProyecto;
END
GO
/****** Object:  StoredProcedure [dbo].[recalcularHitosProyecto]    Script Date: 08/26/2011 10:44:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[recalcularHitosProyecto]
	-- Parameters
	@idProyecto varchar(50) = null,
	@fechaIni datetime,
	@difDias int = 0
	AS
BEGIN
	SET NOCOUNT ON;

    -- Statements of procedure
	UPDATE HitoProyecto
	SET fechaReal = DateAdd(day, @difDias , fechaReal)
	WHERE idProyecto = @idProyecto AND finalizado = 0 AND fechaReal > @fechaIni
END
GO
/****** Object:  Default [DF_AvisoHitoProyecto_revisado]    Script Date: 08/26/2011 10:44:22 ******/
ALTER TABLE [dbo].[AvisoHitoProyecto] ADD  CONSTRAINT [DF_AvisoHitoProyecto_revisado]  DEFAULT ((0)) FOR [revisado]
GO
/****** Object:  Default [DF_GrupoHito_grupoPropias]    Script Date: 08/26/2011 10:44:22 ******/
ALTER TABLE [dbo].[GrupoHito] ADD  CONSTRAINT [DF_GrupoHito_grupoPropias]  DEFAULT ((1)) FOR [grupoPropias]
GO
/****** Object:  Default [DF_GrupoHito_grupoFranquicias]    Script Date: 08/26/2011 10:44:22 ******/
ALTER TABLE [dbo].[GrupoHito] ADD  CONSTRAINT [DF_GrupoHito_grupoFranquicias]  DEFAULT ((0)) FOR [grupoFranquicias]
GO
/****** Object:  Default [DF_HitoProyecto_finalizado]    Script Date: 08/26/2011 10:44:22 ******/
ALTER TABLE [dbo].[HitoProyecto] ADD  CONSTRAINT [DF_HitoProyecto_finalizado]  DEFAULT ((0)) FOR [finalizado]
GO
/****** Object:  Default [DF_Usuario_Proyecto_esJefe]    Script Date: 08/26/2011 10:44:22 ******/
ALTER TABLE [dbo].[Usuario_Proyecto] ADD  CONSTRAINT [DF_Usuario_Proyecto_esJefe]  DEFAULT ((0)) FOR [esJefe]
GO
/****** Object:  Default [DF_Usuario_Proyecto_diasAntelacion]    Script Date: 08/26/2011 10:44:22 ******/
ALTER TABLE [dbo].[Usuario_Proyecto] ADD  CONSTRAINT [DF_Usuario_Proyecto_diasAntelacion]  DEFAULT ((0)) FOR [diasAntelacion]
GO
/****** Object:  ForeignKey [FK_AvisoHitoProyecto_HitoProyecto]    Script Date: 08/26/2011 10:44:22 ******/
ALTER TABLE [dbo].[AvisoHitoProyecto]  WITH CHECK ADD  CONSTRAINT [FK_AvisoHitoProyecto_HitoProyecto] FOREIGN KEY([idHitoProyecto])
REFERENCES [dbo].[HitoProyecto] ([idHitoProyecto])
GO
ALTER TABLE [dbo].[AvisoHitoProyecto] CHECK CONSTRAINT [FK_AvisoHitoProyecto_HitoProyecto]
GO
/****** Object:  ForeignKey [FK_DepartamentoHito_Hito]    Script Date: 08/26/2011 10:44:22 ******/
ALTER TABLE [dbo].[DepartamentoHito]  WITH CHECK ADD  CONSTRAINT [FK_DepartamentoHito_Hito] FOREIGN KEY([idHito])
REFERENCES [dbo].[Hito] ([idHito])
GO
ALTER TABLE [dbo].[DepartamentoHito] CHECK CONSTRAINT [FK_DepartamentoHito_Hito]
GO
/****** Object:  ForeignKey [FK_HitoProyecto_Hito]    Script Date: 08/26/2011 10:44:22 ******/
ALTER TABLE [dbo].[HitoProyecto]  WITH CHECK ADD  CONSTRAINT [FK_HitoProyecto_Hito] FOREIGN KEY([idHito])
REFERENCES [dbo].[Hito] ([idHito])
GO
ALTER TABLE [dbo].[HitoProyecto] CHECK CONSTRAINT [FK_HitoProyecto_Hito]
GO
/****** Object:  ForeignKey [FK_Usuario_Proyecto_Usuario]    Script Date: 08/26/2011 10:44:22 ******/
ALTER TABLE [dbo].[Usuario_Proyecto]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Proyecto_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Usuario_Proyecto] CHECK CONSTRAINT [FK_Usuario_Proyecto_Usuario]
GO
