USE [control_calidad]
GO
/****** Object:  Table [dbo].[bitacora]    Script Date: 09/02/2022 02:37:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bitacora](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_lote] [int] NOT NULL,
	[cod_lote] [varchar](30) NOT NULL,
	[lote_objetivo] [varchar](30) NOT NULL,
	[comentario] [text] NOT NULL,
 CONSTRAINT [PK_bitacora] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[id_lote] ASC,
	[cod_lote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bitacora_propiedad]    Script Date: 09/02/2022 02:37:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bitacora_propiedad](
	[id_bitacora] [int] NOT NULL,
	[id_lote] [int] NOT NULL,
	[cod_lote] [varchar](30) NOT NULL,
	[id_propiedad] [int] NOT NULL,
 CONSTRAINT [PK_bitacora_propiedad] PRIMARY KEY CLUSTERED 
(
	[id_bitacora] ASC,
	[id_lote] ASC,
	[cod_lote] ASC,
	[id_propiedad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[color]    Script Date: 09/02/2022 02:37:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[color](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cod_sap] [varchar](20) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[comentario] [text] NULL,
 CONSTRAINT [PK_color] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[cod_sap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[color_formula]    Script Date: 09/02/2022 02:37:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[color_formula](
	[id_color] [int] NOT NULL,
	[sap_color] [varchar](20) NOT NULL,
	[id_formula] [int] NOT NULL,
 CONSTRAINT [PK_color_formula] PRIMARY KEY CLUSTERED 
(
	[id_color] ASC,
	[sap_color] ASC,
	[id_formula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fin_adicion]    Script Date: 09/02/2022 02:37:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fin_adicion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[num_empleado] [varchar](15) NOT NULL,
	[id_lote] [int] NOT NULL,
	[cod_lote] [varchar](30) NOT NULL,
	[id_lote_pasta] [int] NOT NULL,
	[cantidad] [float] NOT NULL,
	[comentario] [text] NULL,
 CONSTRAINT [PK_fin_adicion_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[id_usuario] ASC,
	[num_empleado] ASC,
	[id_lote] ASC,
	[cod_lote] ASC,
	[id_lote_pasta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fin_calidad]    Script Date: 09/02/2022 02:37:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fin_calidad](
	[id_usuario] [int] NOT NULL,
	[num_empleado] [varchar](15) NOT NULL,
	[id_lote] [int] NOT NULL,
	[cod_lote] [varchar](30) NOT NULL,
	[fecha] [varchar](30) NOT NULL,
	[comentario] [text] NULL,
 CONSTRAINT [PK_fin_calidad] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC,
	[num_empleado] ASC,
	[id_lote] ASC,
	[cod_lote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fin_entonado]    Script Date: 09/02/2022 02:37:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fin_entonado](
	[id_usuario] [int] NOT NULL,
	[num_empleado] [varchar](15) NOT NULL,
	[id_lote] [int] NOT NULL,
	[cod_lote] [varchar](30) NOT NULL,
	[fecha] [varchar](30) NOT NULL,
	[comentario] [text] NULL,
 CONSTRAINT [PK_fin_entonado] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC,
	[num_empleado] ASC,
	[id_lote] ASC,
	[cod_lote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fin_eval_terminado]    Script Date: 09/02/2022 02:37:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fin_eval_terminado](
	[id_usuario] [int] NOT NULL,
	[num_empleado] [varchar](15) NOT NULL,
	[id_lote] [int] NOT NULL,
	[cod_lote] [varchar](30) NOT NULL,
	[fecha] [varchar](30) NOT NULL,
	[comentario] [text] NULL,
 CONSTRAINT [PK_fin_eval_terminado] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC,
	[num_empleado] ASC,
	[id_lote] ASC,
	[cod_lote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[formula]    Script Date: 09/02/2022 02:37:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[formula](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bom] [varchar](30) NOT NULL,
	[comentario] [text] NULL,
 CONSTRAINT [PK_formula] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inicio_adicion]    Script Date: 09/02/2022 02:37:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inicio_adicion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[num_empleado] [varchar](15) NOT NULL,
	[id_lote] [int] NOT NULL,
	[cod_lote] [varchar](30) NOT NULL,
	[pasta] [varchar](30) NOT NULL,
	[cantidad] [float] NOT NULL,
	[comentario] [text] NULL,
 CONSTRAINT [PK_inicio_adicion] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[id_usuario] ASC,
	[num_empleado] ASC,
	[id_lote] ASC,
	[cod_lote] ASC,
	[pasta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inicio_calidad]    Script Date: 09/02/2022 02:37:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inicio_calidad](
	[id_usuario] [int] NOT NULL,
	[num_empleado] [varchar](15) NOT NULL,
	[id_lote] [int] NOT NULL,
	[cod_lote] [varchar](30) NOT NULL,
	[fecha] [varchar](30) NOT NULL,
	[comentario] [text] NULL,
 CONSTRAINT [PK_inicio_calidad] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC,
	[num_empleado] ASC,
	[id_lote] ASC,
	[cod_lote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inicio_entonado]    Script Date: 09/02/2022 02:37:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inicio_entonado](
	[id_usuario] [int] NOT NULL,
	[num_empleado] [varchar](15) NOT NULL,
	[id_lote] [int] NOT NULL,
	[cod_lote] [varchar](30) NOT NULL,
	[fecha] [varchar](30) NOT NULL,
	[comentario] [text] NULL,
 CONSTRAINT [PK_inicio_entonado] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC,
	[num_empleado] ASC,
	[id_lote] ASC,
	[cod_lote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inicio_eval_terminado]    Script Date: 09/02/2022 02:37:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inicio_eval_terminado](
	[id_usuario] [int] NOT NULL,
	[num_empleado] [varchar](15) NOT NULL,
	[id_lote] [int] NOT NULL,
	[cod_lote] [varchar](30) NOT NULL,
	[fecha] [varchar](30) NOT NULL,
	[comentario] [text] NULL,
 CONSTRAINT [PK_inicio_eval_terminado] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC,
	[num_empleado] ASC,
	[id_lote] ASC,
	[cod_lote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lote]    Script Date: 09/02/2022 02:37:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lote](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cod_lot] [varchar](30) NOT NULL,
	[id_color] [int] NOT NULL,
	[cod_sap_color] [varchar](20) NOT NULL,
	[cliente] [varchar](50) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[tecnologia] [varchar](30) NOT NULL,
	[tam_lote] [float] NOT NULL,
	[contenedor] [varchar](20) NOT NULL,
	[comentario] [text] NULL,
 CONSTRAINT [PK_lote] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[cod_lot] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lote_pasta]    Script Date: 09/02/2022 02:37:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lote_pasta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cod_lote] [varchar](30) NOT NULL,
	[comentario] [text] NULL,
 CONSTRAINT [PK_lote_pasta_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pasta]    Script Date: 09/02/2022 02:37:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pasta](
	[cod_sap] [varchar](30) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[tecnologia] [varchar](30) NOT NULL,
 CONSTRAINT [PK_pasta] PRIMARY KEY CLUSTERED 
(
	[cod_sap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pasta_formula]    Script Date: 09/02/2022 02:37:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pasta_formula](
	[id_formula] [int] NOT NULL,
	[cod_sap] [varchar](30) NOT NULL,
	[cantidad] [float] NULL,
 CONSTRAINT [PK_pasta_formula] PRIMARY KEY CLUSTERED 
(
	[id_formula] ASC,
	[cod_sap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pasta_lote_pasta]    Script Date: 09/02/2022 02:37:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pasta_lote_pasta](
	[cod_sap] [varchar](30) NOT NULL,
	[id_lote] [int] NOT NULL,
 CONSTRAINT [PK_pasta_lote_pasta] PRIMARY KEY CLUSTERED 
(
	[cod_sap] ASC,
	[id_lote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[propiedad]    Script Date: 09/02/2022 02:37:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[propiedad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[valor] [float] NOT NULL,
	[ajuste] [varchar](30) NOT NULL,
	[valor_ajuste] [float] NOT NULL,
	[porcentaje] [float] NOT NULL,
	[resultado] [float] NOT NULL,
	[comentario] [text] NULL,
 CONSTRAINT [PK_propiedad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prueba]    Script Date: 09/02/2022 02:37:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prueba](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cod_sap] [varchar](30) NOT NULL,
	[id_lote] [int] NOT NULL,
	[cod_lote] [varchar](30) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[num_empleado] [varchar](15) NOT NULL,
	[comentario] [text] NULL,
 CONSTRAINT [PK_prueba] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[cod_sap] ASC,
	[id_lote] ASC,
	[cod_lote] ASC,
	[id_usuario] ASC,
	[num_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_usuario]    Script Date: 09/02/2022 02:37:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NULL,
 CONSTRAINT [PK_tipo_usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 09/02/2022 02:37:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[num_empleado] [varchar](15) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[ap_paterno] [varchar](30) NOT NULL,
	[ap_materno] [varchar](30) NOT NULL,
	[departamento] [varchar](30) NOT NULL,
	[tipo_usuario] [int] NOT NULL,
	[email] [varchar](50) NOT NULL,
	[contrasena] [varchar](100) NOT NULL,
	[telefono] [varchar](30) NULL,
	[img_perfil] [image] NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[num_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[color] ON 

INSERT [dbo].[color] ([id], [cod_sap], [descripcion], [comentario]) VALUES (1, N'01301998', N'Color 01301998', N'El color 01301998 es una prueba de la funcionalidad de la aplicación para registrar colores nuevos')
INSERT [dbo].[color] ([id], [cod_sap], [descripcion], [comentario]) VALUES (2, N'25370130', N'Color 25370130', N'Comentarios del color 25370130')
INSERT [dbo].[color] ([id], [cod_sap], [descripcion], [comentario]) VALUES (3, N'32453213455', N'Color 32453212455', N'Comentarios del color 32453213455')
SET IDENTITY_INSERT [dbo].[color] OFF
GO
INSERT [dbo].[color_formula] ([id_color], [sap_color], [id_formula]) VALUES (1, N'01301998', 1)
INSERT [dbo].[color_formula] ([id_color], [sap_color], [id_formula]) VALUES (2, N'25370130', 2)
INSERT [dbo].[color_formula] ([id_color], [sap_color], [id_formula]) VALUES (3, N'32453213455', 3)
INSERT [dbo].[color_formula] ([id_color], [sap_color], [id_formula]) VALUES (3, N'32453213455', 4)
GO
SET IDENTITY_INSERT [dbo].[formula] ON 

INSERT [dbo].[formula] ([id], [bom], [comentario]) VALUES (1, N'Y01301998', N'Comentario para la formula Y01301998 como primera formula del color 01301998')
INSERT [dbo].[formula] ([id], [bom], [comentario]) VALUES (2, N'25370130', N'Comentarios de la formula 25370130')
INSERT [dbo].[formula] ([id], [bom], [comentario]) VALUES (3, N'Y32453213455', N'Comentarios de la formula Y32453213455')
INSERT [dbo].[formula] ([id], [bom], [comentario]) VALUES (4, N'Y987650', N'Comentarios de la formula Y987650')
SET IDENTITY_INSERT [dbo].[formula] OFF
GO
SET IDENTITY_INSERT [dbo].[lote_pasta] ON 

INSERT [dbo].[lote_pasta] ([id], [cod_lote], [comentario]) VALUES (1, N'12345', N'Este es el primer lote de la pasta')
INSERT [dbo].[lote_pasta] ([id], [cod_lote], [comentario]) VALUES (2, N'2017', N'Lote de prueba 2 ')
INSERT [dbo].[lote_pasta] ([id], [cod_lote], [comentario]) VALUES (3, N'630961', N'')
INSERT [dbo].[lote_pasta] ([id], [cod_lote], [comentario]) VALUES (4, N'5678', N'Lote de prueba')
SET IDENTITY_INSERT [dbo].[lote_pasta] OFF
GO
INSERT [dbo].[pasta] ([cod_sap], [descripcion], [tecnologia]) VALUES (N'061074', N'Pasta 061074', N'Base Agua')
INSERT [dbo].[pasta] ([cod_sap], [descripcion], [tecnologia]) VALUES (N'12345', N'Pasta 12345', N'Base Agua')
INSERT [dbo].[pasta] ([cod_sap], [descripcion], [tecnologia]) VALUES (N'1722338', N'Pasta 1722338', N'Base Solvente')
INSERT [dbo].[pasta] ([cod_sap], [descripcion], [tecnologia]) VALUES (N'32453213455', N'Pasta 32453213455', N'Base Solvente')
INSERT [dbo].[pasta] ([cod_sap], [descripcion], [tecnologia]) VALUES (N'456789', N'Pasta 456789', N'Base Agua')
INSERT [dbo].[pasta] ([cod_sap], [descripcion], [tecnologia]) VALUES (N'565435', N'Pasta 565435', N'Base Solvente')
INSERT [dbo].[pasta] ([cod_sap], [descripcion], [tecnologia]) VALUES (N'987650', N'Pasta 987650', N'Base Agua')
GO
INSERT [dbo].[pasta_formula] ([id_formula], [cod_sap], [cantidad]) VALUES (1, N'061074', 1.62)
INSERT [dbo].[pasta_formula] ([id_formula], [cod_sap], [cantidad]) VALUES (1, N'12345', 3.5)
INSERT [dbo].[pasta_formula] ([id_formula], [cod_sap], [cantidad]) VALUES (1, N'565435', 2.784)
INSERT [dbo].[pasta_formula] ([id_formula], [cod_sap], [cantidad]) VALUES (2, N'12345', 1.236)
INSERT [dbo].[pasta_formula] ([id_formula], [cod_sap], [cantidad]) VALUES (2, N'456789', 2.38)
INSERT [dbo].[pasta_formula] ([id_formula], [cod_sap], [cantidad]) VALUES (3, N'32453213455', 4.32)
INSERT [dbo].[pasta_formula] ([id_formula], [cod_sap], [cantidad]) VALUES (4, N'1722338', 1.413)
INSERT [dbo].[pasta_formula] ([id_formula], [cod_sap], [cantidad]) VALUES (4, N'32453213455', 2.47)
INSERT [dbo].[pasta_formula] ([id_formula], [cod_sap], [cantidad]) VALUES (4, N'987650', 5.9)
GO
INSERT [dbo].[pasta_lote_pasta] ([cod_sap], [id_lote]) VALUES (N'061074', 1)
INSERT [dbo].[pasta_lote_pasta] ([cod_sap], [id_lote]) VALUES (N'061074', 2)
INSERT [dbo].[pasta_lote_pasta] ([cod_sap], [id_lote]) VALUES (N'061074', 3)
INSERT [dbo].[pasta_lote_pasta] ([cod_sap], [id_lote]) VALUES (N'12345', 4)
GO
SET IDENTITY_INSERT [dbo].[tipo_usuario] ON 

INSERT [dbo].[tipo_usuario] ([id], [nombre]) VALUES (1, N'Administrador')
INSERT [dbo].[tipo_usuario] ([id], [nombre]) VALUES (2, N'Moderador')
INSERT [dbo].[tipo_usuario] ([id], [nombre]) VALUES (3, N'Acceso Limitado')
INSERT [dbo].[tipo_usuario] ([id], [nombre]) VALUES (4, N'Solo Vista')
SET IDENTITY_INSERT [dbo].[tipo_usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[usuario] ON 

INSERT [dbo].[usuario] ([id], [num_empleado], [nombre], [ap_paterno], [ap_materno], [departamento], [tipo_usuario], [email], [contrasena], [telefono], [img_perfil]) VALUES (1, N'0', N'Irvin Yoariht', N'Macedo', N'Cruz', N'Entonado', 4, N'imacedoc1600@alumno.ipn.com', N'$2a$10$yxalQ7XhMV/8sEYrtF7OzuzzX3CB0CmAN8AZyjUpowV1eb2Lnb7da', N'5516369353', NULL)
INSERT [dbo].[usuario] ([id], [num_empleado], [nombre], [ap_paterno], [ap_materno], [departamento], [tipo_usuario], [email], [contrasena], [telefono], [img_perfil]) VALUES (2, N'0', N'Irvin Yoariht', N'Macedo', N'Cruz', N'Entonado', 3, N'irvin.macedo25@hotmail.com', N'$2a$10$Pgfy3DQcTrk6a51.AOBoQOTa3Qqyqx/Q7kIcjV5wXj6GFo7HLIj3C', N'5516369353', NULL)
INSERT [dbo].[usuario] ([id], [num_empleado], [nombre], [ap_paterno], [ap_materno], [departamento], [tipo_usuario], [email], [contrasena], [telefono], [img_perfil]) VALUES (3, N'0', N'Irvin Yoariht', N'Macedo', N'Cruz', N'Entonado', 1, N'irvin.macedo@partners.basf.com', N'$2a$10$5W0pe4vpIBKAlHXg/zUDxe6Qwkgxu4II1UTjnGeDq26C05qU9MtYa', N'5516369353', NULL)
INSERT [dbo].[usuario] ([id], [num_empleado], [nombre], [ap_paterno], [ap_materno], [departamento], [tipo_usuario], [email], [contrasena], [telefono], [img_perfil]) VALUES (4, N'0', N'Irvin Yoariht', N'Macedo', N'Cruz', N'Entonado', 2, N'yoariht.mc37@gmail.com', N'$2a$10$5c.5/oHWqaaY9ldmK1OFx.t55mbxRFEguUPGpjnvetKcC3pwkdipS', N'5516369353', NULL)
SET IDENTITY_INSERT [dbo].[usuario] OFF
GO
ALTER TABLE [dbo].[bitacora]  WITH CHECK ADD  CONSTRAINT [FK_bitacora_lote] FOREIGN KEY([id_lote], [cod_lote])
REFERENCES [dbo].[lote] ([id], [cod_lot])
GO
ALTER TABLE [dbo].[bitacora] CHECK CONSTRAINT [FK_bitacora_lote]
GO
ALTER TABLE [dbo].[bitacora_propiedad]  WITH CHECK ADD  CONSTRAINT [FK_bitacora_propiedad_bitacora] FOREIGN KEY([id_bitacora], [id_lote], [cod_lote])
REFERENCES [dbo].[bitacora] ([id], [id_lote], [cod_lote])
GO
ALTER TABLE [dbo].[bitacora_propiedad] CHECK CONSTRAINT [FK_bitacora_propiedad_bitacora]
GO
ALTER TABLE [dbo].[bitacora_propiedad]  WITH CHECK ADD  CONSTRAINT [FK_bitacora_propiedad_propiedad] FOREIGN KEY([id_propiedad])
REFERENCES [dbo].[propiedad] ([id])
GO
ALTER TABLE [dbo].[bitacora_propiedad] CHECK CONSTRAINT [FK_bitacora_propiedad_propiedad]
GO
ALTER TABLE [dbo].[color_formula]  WITH CHECK ADD  CONSTRAINT [FK_color_formula_color] FOREIGN KEY([id_color], [sap_color])
REFERENCES [dbo].[color] ([id], [cod_sap])
GO
ALTER TABLE [dbo].[color_formula] CHECK CONSTRAINT [FK_color_formula_color]
GO
ALTER TABLE [dbo].[color_formula]  WITH CHECK ADD  CONSTRAINT [FK_color_formula_formula] FOREIGN KEY([id_formula])
REFERENCES [dbo].[formula] ([id])
GO
ALTER TABLE [dbo].[color_formula] CHECK CONSTRAINT [FK_color_formula_formula]
GO
ALTER TABLE [dbo].[fin_adicion]  WITH CHECK ADD  CONSTRAINT [FK_fin_adicion_lote] FOREIGN KEY([id_lote], [cod_lote])
REFERENCES [dbo].[lote] ([id], [cod_lot])
GO
ALTER TABLE [dbo].[fin_adicion] CHECK CONSTRAINT [FK_fin_adicion_lote]
GO
ALTER TABLE [dbo].[fin_adicion]  WITH CHECK ADD  CONSTRAINT [FK_fin_adicion_lote_pasta1] FOREIGN KEY([id_lote_pasta])
REFERENCES [dbo].[lote_pasta] ([id])
GO
ALTER TABLE [dbo].[fin_adicion] CHECK CONSTRAINT [FK_fin_adicion_lote_pasta1]
GO
ALTER TABLE [dbo].[fin_adicion]  WITH CHECK ADD  CONSTRAINT [FK_fin_adicion_usuario] FOREIGN KEY([id_usuario], [num_empleado])
REFERENCES [dbo].[usuario] ([id], [num_empleado])
GO
ALTER TABLE [dbo].[fin_adicion] CHECK CONSTRAINT [FK_fin_adicion_usuario]
GO
ALTER TABLE [dbo].[fin_calidad]  WITH CHECK ADD  CONSTRAINT [FK_fin_calidad_lote] FOREIGN KEY([id_lote], [cod_lote])
REFERENCES [dbo].[lote] ([id], [cod_lot])
GO
ALTER TABLE [dbo].[fin_calidad] CHECK CONSTRAINT [FK_fin_calidad_lote]
GO
ALTER TABLE [dbo].[fin_calidad]  WITH CHECK ADD  CONSTRAINT [FK_fin_calidad_usuario] FOREIGN KEY([id_usuario], [num_empleado])
REFERENCES [dbo].[usuario] ([id], [num_empleado])
GO
ALTER TABLE [dbo].[fin_calidad] CHECK CONSTRAINT [FK_fin_calidad_usuario]
GO
ALTER TABLE [dbo].[fin_entonado]  WITH CHECK ADD  CONSTRAINT [FK_fin_entonado_lote] FOREIGN KEY([id_lote], [cod_lote])
REFERENCES [dbo].[lote] ([id], [cod_lot])
GO
ALTER TABLE [dbo].[fin_entonado] CHECK CONSTRAINT [FK_fin_entonado_lote]
GO
ALTER TABLE [dbo].[fin_entonado]  WITH CHECK ADD  CONSTRAINT [FK_fin_entonado_usuario] FOREIGN KEY([id_usuario], [num_empleado])
REFERENCES [dbo].[usuario] ([id], [num_empleado])
GO
ALTER TABLE [dbo].[fin_entonado] CHECK CONSTRAINT [FK_fin_entonado_usuario]
GO
ALTER TABLE [dbo].[fin_eval_terminado]  WITH CHECK ADD  CONSTRAINT [FK_fin_eval_terminado_lote] FOREIGN KEY([id_lote], [cod_lote])
REFERENCES [dbo].[lote] ([id], [cod_lot])
GO
ALTER TABLE [dbo].[fin_eval_terminado] CHECK CONSTRAINT [FK_fin_eval_terminado_lote]
GO
ALTER TABLE [dbo].[fin_eval_terminado]  WITH CHECK ADD  CONSTRAINT [FK_fin_eval_terminado_usuario] FOREIGN KEY([id_usuario], [num_empleado])
REFERENCES [dbo].[usuario] ([id], [num_empleado])
GO
ALTER TABLE [dbo].[fin_eval_terminado] CHECK CONSTRAINT [FK_fin_eval_terminado_usuario]
GO
ALTER TABLE [dbo].[inicio_adicion]  WITH CHECK ADD  CONSTRAINT [FK_inicio_adicion_lote] FOREIGN KEY([id_lote], [cod_lote])
REFERENCES [dbo].[lote] ([id], [cod_lot])
GO
ALTER TABLE [dbo].[inicio_adicion] CHECK CONSTRAINT [FK_inicio_adicion_lote]
GO
ALTER TABLE [dbo].[inicio_adicion]  WITH CHECK ADD  CONSTRAINT [FK_inicio_adicion_pasta] FOREIGN KEY([pasta])
REFERENCES [dbo].[pasta] ([cod_sap])
GO
ALTER TABLE [dbo].[inicio_adicion] CHECK CONSTRAINT [FK_inicio_adicion_pasta]
GO
ALTER TABLE [dbo].[inicio_adicion]  WITH CHECK ADD  CONSTRAINT [FK_inicio_adicion_usuario] FOREIGN KEY([id_usuario], [num_empleado])
REFERENCES [dbo].[usuario] ([id], [num_empleado])
GO
ALTER TABLE [dbo].[inicio_adicion] CHECK CONSTRAINT [FK_inicio_adicion_usuario]
GO
ALTER TABLE [dbo].[inicio_calidad]  WITH CHECK ADD  CONSTRAINT [FK_inicio_calidad_lote] FOREIGN KEY([id_lote], [cod_lote])
REFERENCES [dbo].[lote] ([id], [cod_lot])
GO
ALTER TABLE [dbo].[inicio_calidad] CHECK CONSTRAINT [FK_inicio_calidad_lote]
GO
ALTER TABLE [dbo].[inicio_calidad]  WITH CHECK ADD  CONSTRAINT [FK_inicio_calidad_usuario] FOREIGN KEY([id_usuario], [num_empleado])
REFERENCES [dbo].[usuario] ([id], [num_empleado])
GO
ALTER TABLE [dbo].[inicio_calidad] CHECK CONSTRAINT [FK_inicio_calidad_usuario]
GO
ALTER TABLE [dbo].[inicio_entonado]  WITH CHECK ADD  CONSTRAINT [FK_inicio_entonado_lote] FOREIGN KEY([id_lote], [cod_lote])
REFERENCES [dbo].[lote] ([id], [cod_lot])
GO
ALTER TABLE [dbo].[inicio_entonado] CHECK CONSTRAINT [FK_inicio_entonado_lote]
GO
ALTER TABLE [dbo].[inicio_entonado]  WITH CHECK ADD  CONSTRAINT [FK_inicio_entonado_usuario] FOREIGN KEY([id_usuario], [num_empleado])
REFERENCES [dbo].[usuario] ([id], [num_empleado])
GO
ALTER TABLE [dbo].[inicio_entonado] CHECK CONSTRAINT [FK_inicio_entonado_usuario]
GO
ALTER TABLE [dbo].[inicio_eval_terminado]  WITH CHECK ADD  CONSTRAINT [FK_inicio_eval_terminado_lote] FOREIGN KEY([id_lote], [cod_lote])
REFERENCES [dbo].[lote] ([id], [cod_lot])
GO
ALTER TABLE [dbo].[inicio_eval_terminado] CHECK CONSTRAINT [FK_inicio_eval_terminado_lote]
GO
ALTER TABLE [dbo].[inicio_eval_terminado]  WITH CHECK ADD  CONSTRAINT [FK_inicio_eval_terminado_usuario] FOREIGN KEY([id_usuario], [num_empleado])
REFERENCES [dbo].[usuario] ([id], [num_empleado])
GO
ALTER TABLE [dbo].[inicio_eval_terminado] CHECK CONSTRAINT [FK_inicio_eval_terminado_usuario]
GO
ALTER TABLE [dbo].[lote]  WITH CHECK ADD  CONSTRAINT [FK_lote_color] FOREIGN KEY([id_color], [cod_sap_color])
REFERENCES [dbo].[color] ([id], [cod_sap])
GO
ALTER TABLE [dbo].[lote] CHECK CONSTRAINT [FK_lote_color]
GO
ALTER TABLE [dbo].[pasta_formula]  WITH CHECK ADD  CONSTRAINT [FK_pasta_formula_formula] FOREIGN KEY([id_formula])
REFERENCES [dbo].[formula] ([id])
GO
ALTER TABLE [dbo].[pasta_formula] CHECK CONSTRAINT [FK_pasta_formula_formula]
GO
ALTER TABLE [dbo].[pasta_formula]  WITH CHECK ADD  CONSTRAINT [FK_pasta_formula_pasta] FOREIGN KEY([cod_sap])
REFERENCES [dbo].[pasta] ([cod_sap])
GO
ALTER TABLE [dbo].[pasta_formula] CHECK CONSTRAINT [FK_pasta_formula_pasta]
GO
ALTER TABLE [dbo].[pasta_lote_pasta]  WITH CHECK ADD  CONSTRAINT [FK_pasta_lote_pasta_lote_pasta] FOREIGN KEY([id_lote])
REFERENCES [dbo].[lote_pasta] ([id])
GO
ALTER TABLE [dbo].[pasta_lote_pasta] CHECK CONSTRAINT [FK_pasta_lote_pasta_lote_pasta]
GO
ALTER TABLE [dbo].[pasta_lote_pasta]  WITH CHECK ADD  CONSTRAINT [FK_pasta_lote_pasta_pasta] FOREIGN KEY([cod_sap])
REFERENCES [dbo].[pasta] ([cod_sap])
GO
ALTER TABLE [dbo].[pasta_lote_pasta] CHECK CONSTRAINT [FK_pasta_lote_pasta_pasta]
GO
ALTER TABLE [dbo].[prueba]  WITH CHECK ADD  CONSTRAINT [FK_prueba_lote] FOREIGN KEY([id_lote], [cod_lote])
REFERENCES [dbo].[lote] ([id], [cod_lot])
GO
ALTER TABLE [dbo].[prueba] CHECK CONSTRAINT [FK_prueba_lote]
GO
ALTER TABLE [dbo].[prueba]  WITH CHECK ADD  CONSTRAINT [FK_prueba_pasta] FOREIGN KEY([cod_sap])
REFERENCES [dbo].[pasta] ([cod_sap])
GO
ALTER TABLE [dbo].[prueba] CHECK CONSTRAINT [FK_prueba_pasta]
GO
ALTER TABLE [dbo].[prueba]  WITH CHECK ADD  CONSTRAINT [FK_prueba_usuario] FOREIGN KEY([id_usuario], [num_empleado])
REFERENCES [dbo].[usuario] ([id], [num_empleado])
GO
ALTER TABLE [dbo].[prueba] CHECK CONSTRAINT [FK_prueba_usuario]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_tipo_usuario] FOREIGN KEY([tipo_usuario])
REFERENCES [dbo].[tipo_usuario] ([id])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_tipo_usuario]
GO
