CREATE DATABASE [Eventos]
GO
USE [Eventos]

/****** Object:  Table [dbo].[EstadoEventos]    Script Date: 6/26/2024 4:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoEventos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Eventos]    Script Date: 6/26/2024 4:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Eventos](
	[IdEvento] [int] IDENTITY(1,1) NOT NULL,
	[NombreEvento] [varchar](100) NOT NULL,
	[FechaEvento] [datetime] NOT NULL,
	[CantidadPersonas] [int] NOT NULL,
	[IdPersonaAgasajada] [int] NOT NULL,
	[IdTipoEvento] [int] NOT NULL,
	[Visible] [bit] NOT NULL,
	[Borrado] [bit] NOT NULL,
	[IdEstadoEventos] [int] NOT NULL,
	[IdUsuario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEvento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventosServicios]    Script Date: 6/26/2024 4:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventosServicios](
	[IdEventoServicio] [int] IDENTITY(1,1) NOT NULL,
	[IdEvento] [int] NOT NULL,
	[IdServicio] [int] NOT NULL,
	[Borrado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEventoServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personas]    Script Date: 6/26/2024 4:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personas](
	[IdPersona] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Telefono] [varchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Borrado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicios]    Script Date: 6/26/2024 4:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicios](
	[IdServicio] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[PrecioServicio] [decimal](22, 2) NULL,
	[Borrado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposEventos]    Script Date: 6/26/2024 4:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposEventos](
	[IdTipoEvento] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[Borrado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTipoEvento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 6/26/2024 4:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[GoogleIdentificador] [nvarchar](100) NULL,
	[NombreCompleto] [nvarchar](100) NULL,
	[Nombre] [nvarchar](100) NULL,
	[Apellido] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Borrado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[EstadoEventos] ON 
GO
INSERT [dbo].[EstadoEventos] ([id], [descripcion]) VALUES (1, N'Aprobado')
GO
INSERT [dbo].[EstadoEventos] ([id], [descripcion]) VALUES (2, N'Rechazado')
GO
INSERT [dbo].[EstadoEventos] ([id], [descripcion]) VALUES (3, N'Pendiente de Aprobacion')
GO
SET IDENTITY_INSERT [dbo].[EstadoEventos] OFF
GO
SET IDENTITY_INSERT [dbo].[Eventos] ON 
GO
INSERT [dbo].[Eventos] ([IdEvento], [NombreEvento], [FechaEvento], [CantidadPersonas], [IdPersonaAgasajada], [IdTipoEvento], [Visible], [Borrado], [IdEstadoEventos], [IdUsuario]) VALUES (6, N'despedida de milton', CAST(N'2024-06-18T23:22:00.000' AS DateTime), 54, 17, 2, 1, 0, 2, 2)
GO
INSERT [dbo].[Eventos] ([IdEvento], [NombreEvento], [FechaEvento], [CantidadPersonas], [IdPersonaAgasajada], [IdTipoEvento], [Visible], [Borrado], [IdEstadoEventos], [IdUsuario]) VALUES (7, N'despedida de milei', CAST(N'2024-06-16T03:03:00.000' AS DateTime), 15, 18, 1, 1, 0, 2, 2)
GO
INSERT [dbo].[Eventos] ([IdEvento], [NombreEvento], [FechaEvento], [CantidadPersonas], [IdPersonaAgasajada], [IdTipoEvento], [Visible], [Borrado], [IdEstadoEventos], [IdUsuario]) VALUES (8, N'Despedida de Franco', CAST(N'2024-07-18T03:00:00.000' AS DateTime), 50, 22, 1, 1, 0, 2, 2)
GO
SET IDENTITY_INSERT [dbo].[Eventos] OFF
GO
SET IDENTITY_INSERT [dbo].[EventosServicios] ON 
GO
INSERT [dbo].[EventosServicios] ([IdEventoServicio], [IdEvento], [IdServicio], [Borrado]) VALUES (1, 7, 1, 0)
GO
INSERT [dbo].[EventosServicios] ([IdEventoServicio], [IdEvento], [IdServicio], [Borrado]) VALUES (2, 7, 4, 0)
GO
INSERT [dbo].[EventosServicios] ([IdEventoServicio], [IdEvento], [IdServicio], [Borrado]) VALUES (3, 7, 5, 0)
GO
INSERT [dbo].[EventosServicios] ([IdEventoServicio], [IdEvento], [IdServicio], [Borrado]) VALUES (9, 8, 1, 0)
GO
INSERT [dbo].[EventosServicios] ([IdEventoServicio], [IdEvento], [IdServicio], [Borrado]) VALUES (10, 8, 2, 0)
GO
INSERT [dbo].[EventosServicios] ([IdEventoServicio], [IdEvento], [IdServicio], [Borrado]) VALUES (11, 8, 4, 0)
GO
INSERT [dbo].[EventosServicios] ([IdEventoServicio], [IdEvento], [IdServicio], [Borrado]) VALUES (12, 8, 5, 0)
GO
INSERT [dbo].[EventosServicios] ([IdEventoServicio], [IdEvento], [IdServicio], [Borrado]) VALUES (13, 8, 6, 0)
GO
SET IDENTITY_INSERT [dbo].[EventosServicios] OFF
GO
SET IDENTITY_INSERT [dbo].[Personas] ON 
GO
INSERT [dbo].[Personas] ([IdPersona], [Nombre], [Apellido], [Direccion], [Telefono], [Email], [Borrado]) VALUES (1, N'Diego', N'Peppert', N'Avenida Chiclana 2952 - 3d', N'1130292806', N'diegopeppert@gmail.com', 0)
GO
INSERT [dbo].[Personas] ([IdPersona], [Nombre], [Apellido], [Direccion], [Telefono], [Email], [Borrado]) VALUES (3, N'Cristian', N'Medina', N'9 de julio 600', N'246522532', N'cristianmedina@yopmail.com', 1)
GO
INSERT [dbo].[Personas] ([IdPersona], [Nombre], [Apellido], [Direccion], [Telefono], [Email], [Borrado]) VALUES (4, N'Federico', N'Vicente', N'Echague', N'234554155', N'federicovicente@yopmail.com', 0)
GO
INSERT [dbo].[Personas] ([IdPersona], [Nombre], [Apellido], [Direccion], [Telefono], [Email], [Borrado]) VALUES (5, N'string', N'string', N'string', N'string', N'string', 0)
GO
INSERT [dbo].[Personas] ([IdPersona], [Nombre], [Apellido], [Direccion], [Telefono], [Email], [Borrado]) VALUES (6, N'Jorge', N'Flores', N'Matorras 155', N'1112341533', N'Jorge@gmail.com', 0)
GO
INSERT [dbo].[Personas] ([IdPersona], [Nombre], [Apellido], [Direccion], [Telefono], [Email], [Borrado]) VALUES (7, N'sdf', N'asd', N'asd', N'513', N'asd', 0)
GO
INSERT [dbo].[Personas] ([IdPersona], [Nombre], [Apellido], [Direccion], [Telefono], [Email], [Borrado]) VALUES (8, N'Jorge', N'Flores', N'Matorras 155', N'1112341533', N'Jorge@gmail.com', 0)
GO
INSERT [dbo].[Personas] ([IdPersona], [Nombre], [Apellido], [Direccion], [Telefono], [Email], [Borrado]) VALUES (9, N'Jorge', N'Flores', N'Matorras 155', N'1112341533', N'Jorge@gmail.com', 0)
GO
INSERT [dbo].[Personas] ([IdPersona], [Nombre], [Apellido], [Direccion], [Telefono], [Email], [Borrado]) VALUES (10, N'milton', N'eric', N'peru 444', N'11542234', N'milton@eric.com', 0)
GO
INSERT [dbo].[Personas] ([IdPersona], [Nombre], [Apellido], [Direccion], [Telefono], [Email], [Borrado]) VALUES (11, N'milton', N'eric', N'peru 444', N'1112341533', N'Jorge@gmail.com', 0)
GO
INSERT [dbo].[Personas] ([IdPersona], [Nombre], [Apellido], [Direccion], [Telefono], [Email], [Borrado]) VALUES (12, N'Jorge', N'eric', N'Matorras 155', N'11542234', N'milton@eric.com', 0)
GO
INSERT [dbo].[Personas] ([IdPersona], [Nombre], [Apellido], [Direccion], [Telefono], [Email], [Borrado]) VALUES (13, N'Jorge', N'Flores', N'peru 444', N'11542234', N'Jorge@gmail.com', 0)
GO
INSERT [dbo].[Personas] ([IdPersona], [Nombre], [Apellido], [Direccion], [Telefono], [Email], [Borrado]) VALUES (14, N'milton', N'Flores', N'peru 444', N'11542234', N'Jorge@gmail.com', 0)
GO
INSERT [dbo].[Personas] ([IdPersona], [Nombre], [Apellido], [Direccion], [Telefono], [Email], [Borrado]) VALUES (15, N'milton', N'Flores', N'peru 444', N'1112341533', N'Jorge@gmail.com', 0)
GO
INSERT [dbo].[Personas] ([IdPersona], [Nombre], [Apellido], [Direccion], [Telefono], [Email], [Borrado]) VALUES (16, N'Jorge', N'Flores', N'Matorras 155', N'1112341533', N'milton@eric.com', 0)
GO
INSERT [dbo].[Personas] ([IdPersona], [Nombre], [Apellido], [Direccion], [Telefono], [Email], [Borrado]) VALUES (17, N'Jorge', N'eric', N'Matorras 155', N'1112341533', N'milton@eric.com', 0)
GO
INSERT [dbo].[Personas] ([IdPersona], [Nombre], [Apellido], [Direccion], [Telefono], [Email], [Borrado]) VALUES (18, N'javeier', N'milei', N'Matorras 155', N'1112341533', N'milton@eric.com', 0)
GO
INSERT [dbo].[Personas] ([IdPersona], [Nombre], [Apellido], [Direccion], [Telefono], [Email], [Borrado]) VALUES (19, N'milton', N'milei', N'moreno 1857', N'11223466', N'ramon@gmail.com', 0)
GO
INSERT [dbo].[Personas] ([IdPersona], [Nombre], [Apellido], [Direccion], [Telefono], [Email], [Borrado]) VALUES (20, N'Franco', N'Amaolo', N'Moreno 1857', N'02926472493', N'Frankooa646@gmail.com', 0)
GO
INSERT [dbo].[Personas] ([IdPersona], [Nombre], [Apellido], [Direccion], [Telefono], [Email], [Borrado]) VALUES (21, N'Franco', N'Amaolo', N'Moreno 1857', N'02926472493', N'Frankooa646@gmail.com', 0)
GO
INSERT [dbo].[Personas] ([IdPersona], [Nombre], [Apellido], [Direccion], [Telefono], [Email], [Borrado]) VALUES (22, N'Franco', N'Amaolo', N'Moreno 1857', N'02926472493', N'Frankooa646@gmail.com', 0)
GO
SET IDENTITY_INSERT [dbo].[Personas] OFF
GO
SET IDENTITY_INSERT [dbo].[Servicios] ON 
GO
INSERT [dbo].[Servicios] ([IdServicio], [Descripcion], [PrecioServicio], [Borrado]) VALUES (1, N'Transporte a Mar de las Pampas', CAST(150000.00 AS Decimal(22, 2)), 0)
GO
INSERT [dbo].[Servicios] ([IdServicio], [Descripcion], [PrecioServicio], [Borrado]) VALUES (2, N'Barhopping', CAST(15000.00 AS Decimal(22, 2)), 0)
GO
INSERT [dbo].[Servicios] ([IdServicio], [Descripcion], [PrecioServicio], [Borrado]) VALUES (3, N'Servicio de Strippers', CAST(25000.00 AS Decimal(22, 2)), 1)
GO
INSERT [dbo].[Servicios] ([IdServicio], [Descripcion], [PrecioServicio], [Borrado]) VALUES (4, N'Entradas a Boliches', CAST(10000.00 AS Decimal(22, 2)), 0)
GO
INSERT [dbo].[Servicios] ([IdServicio], [Descripcion], [PrecioServicio], [Borrado]) VALUES (5, N'Lanzamiento de Enanos', CAST(100.00 AS Decimal(22, 2)), 0)
GO
INSERT [dbo].[Servicios] ([IdServicio], [Descripcion], [PrecioServicio], [Borrado]) VALUES (6, N'Toro Mecanico', CAST(50000.00 AS Decimal(22, 2)), 0)
GO
INSERT [dbo].[Servicios] ([IdServicio], [Descripcion], [PrecioServicio], [Borrado]) VALUES (7, N'Pelea de monos', CAST(150000.00 AS Decimal(22, 2)), 0)
GO
SET IDENTITY_INSERT [dbo].[Servicios] OFF
GO
SET IDENTITY_INSERT [dbo].[TiposEventos] ON 
GO
INSERT [dbo].[TiposEventos] ([IdTipoEvento], [Descripcion], [Borrado]) VALUES (1, N'Despedida de soltero', 0)
GO
INSERT [dbo].[TiposEventos] ([IdTipoEvento], [Descripcion], [Borrado]) VALUES (2, N'Despedida de soltera', 0)
GO
SET IDENTITY_INSERT [dbo].[TiposEventos] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 
GO
INSERT [dbo].[Usuarios] ([IdUsuario], [GoogleIdentificador], [NombreCompleto], [Nombre], [Apellido], [Email], [Borrado]) VALUES (2, N'100450427699781553629', N'Franco Amaolo', N'Franco', N'Amaolo', N'frankooa646@gmail.com', NULL)
GO
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Personas] ADD  DEFAULT ((0)) FOR [Borrado]
GO
ALTER TABLE [dbo].[Eventos]  WITH CHECK ADD  CONSTRAINT [FK_Eventos_EstadoEventos] FOREIGN KEY([IdEstadoEventos])
REFERENCES [dbo].[EstadoEventos] ([id])
GO
ALTER TABLE [dbo].[Eventos] CHECK CONSTRAINT [FK_Eventos_EstadoEventos]
GO
ALTER TABLE [dbo].[Eventos]  WITH CHECK ADD  CONSTRAINT [FK_Eventos_PersonasAgasajadas] FOREIGN KEY([IdPersonaAgasajada])
REFERENCES [dbo].[Personas] ([IdPersona])
GO
ALTER TABLE [dbo].[Eventos] CHECK CONSTRAINT [FK_Eventos_PersonasAgasajadas]
GO
ALTER TABLE [dbo].[Eventos]  WITH CHECK ADD  CONSTRAINT [FK_Eventos_TiposEventos] FOREIGN KEY([IdTipoEvento])
REFERENCES [dbo].[TiposEventos] ([IdTipoEvento])
GO
ALTER TABLE [dbo].[Eventos] CHECK CONSTRAINT [FK_Eventos_TiposEventos]
GO
ALTER TABLE [dbo].[Eventos]  WITH CHECK ADD  CONSTRAINT [FK_Eventos_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Eventos] CHECK CONSTRAINT [FK_Eventos_Usuarios]
GO
ALTER TABLE [dbo].[EventosServicios]  WITH CHECK ADD  CONSTRAINT [FK_EventosServicios_Eventos] FOREIGN KEY([IdEvento])
REFERENCES [dbo].[Eventos] ([IdEvento])
GO
ALTER TABLE [dbo].[EventosServicios] CHECK CONSTRAINT [FK_EventosServicios_Eventos]
GO
ALTER TABLE [dbo].[EventosServicios]  WITH CHECK ADD  CONSTRAINT [FK_EventosServicios_Servicios] FOREIGN KEY([IdServicio])
REFERENCES [dbo].[Servicios] ([IdServicio])
GO
ALTER TABLE [dbo].[EventosServicios] CHECK CONSTRAINT [FK_EventosServicios_Servicios]
GO
