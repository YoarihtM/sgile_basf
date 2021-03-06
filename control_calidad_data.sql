USE [control_calidad]
GO
/****** Object:  Table [dbo].[bitacora]    Script Date: 17/02/2022 12:21:13 p. m. ******/
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
/****** Object:  Table [dbo].[bitacora_propiedad]    Script Date: 17/02/2022 12:21:13 p. m. ******/
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
/****** Object:  Table [dbo].[color]    Script Date: 17/02/2022 12:21:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[color](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cod_sap] [varchar](20) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[tipo] [varchar](30) NULL,
	[comentario] [text] NULL,
 CONSTRAINT [PK_color] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[cod_sap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[color_formula]    Script Date: 17/02/2022 12:21:13 p. m. ******/
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
/****** Object:  Table [dbo].[fin_adicion]    Script Date: 17/02/2022 12:21:13 p. m. ******/
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
	[id_lote_pigmento] [int] NOT NULL,
	[cantidad] [float] NOT NULL,
	[comentario] [text] NULL,
 CONSTRAINT [PK_fin_adicion_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[id_usuario] ASC,
	[num_empleado] ASC,
	[id_lote] ASC,
	[cod_lote] ASC,
	[id_lote_pigmento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fin_calidad]    Script Date: 17/02/2022 12:21:13 p. m. ******/
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
/****** Object:  Table [dbo].[fin_entonado]    Script Date: 17/02/2022 12:21:13 p. m. ******/
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
/****** Object:  Table [dbo].[fin_eval_terminado]    Script Date: 17/02/2022 12:21:13 p. m. ******/
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
/****** Object:  Table [dbo].[formula]    Script Date: 17/02/2022 12:21:13 p. m. ******/
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
/****** Object:  Table [dbo].[inicio_adicion]    Script Date: 17/02/2022 12:21:13 p. m. ******/
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
	[pigmento] [varchar](30) NOT NULL,
	[cantidad] [float] NOT NULL,
	[comentario] [text] NULL,
 CONSTRAINT [PK_inicio_adicion] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[id_usuario] ASC,
	[num_empleado] ASC,
	[id_lote] ASC,
	[cod_lote] ASC,
	[pigmento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inicio_calidad]    Script Date: 17/02/2022 12:21:13 p. m. ******/
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
/****** Object:  Table [dbo].[inicio_entonado]    Script Date: 17/02/2022 12:21:13 p. m. ******/
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
/****** Object:  Table [dbo].[inicio_eval_terminado]    Script Date: 17/02/2022 12:21:13 p. m. ******/
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
/****** Object:  Table [dbo].[lote]    Script Date: 17/02/2022 12:21:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lote](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cod_lote] [varchar](30) NOT NULL,
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
	[cod_lote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lote_pigmento]    Script Date: 17/02/2022 12:21:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lote_pigmento](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cod_lote] [varchar](30) NOT NULL,
	[comentario] [text] NULL,
 CONSTRAINT [PK_lote_pigmento_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pigmento]    Script Date: 17/02/2022 12:21:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pigmento](
	[cod_sap] [varchar](30) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[tecnologia] [varchar](30) NOT NULL,
	[tipo] [varchar](30) NOT NULL,
 CONSTRAINT [PK_pigmento] PRIMARY KEY CLUSTERED 
(
	[cod_sap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pigmento_formula]    Script Date: 17/02/2022 12:21:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pigmento_formula](
	[id_formula] [int] NOT NULL,
	[cod_sap] [varchar](30) NOT NULL,
	[cantidad] [float] NULL,
 CONSTRAINT [PK_pigmento_formula] PRIMARY KEY CLUSTERED 
(
	[id_formula] ASC,
	[cod_sap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pigmento_lote_pigmento]    Script Date: 17/02/2022 12:21:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pigmento_lote_pigmento](
	[cod_sap] [varchar](30) NOT NULL,
	[id_lote] [int] NOT NULL,
 CONSTRAINT [PK_pigmento_lote_pigmento] PRIMARY KEY CLUSTERED 
(
	[cod_sap] ASC,
	[id_lote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[propiedad]    Script Date: 17/02/2022 12:21:13 p. m. ******/
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
/****** Object:  Table [dbo].[prueba]    Script Date: 17/02/2022 12:21:13 p. m. ******/
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
/****** Object:  Table [dbo].[tipo_usuario]    Script Date: 17/02/2022 12:21:13 p. m. ******/
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
/****** Object:  Table [dbo].[usuario]    Script Date: 17/02/2022 12:21:13 p. m. ******/
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

INSERT [dbo].[color] ([id], [cod_sap], [descripcion], [tipo], [comentario]) VALUES (1, N'01301998', N'Color 01301998', N'Liso', N'gshfga')
INSERT [dbo].[color] ([id], [cod_sap], [descripcion], [tipo], [comentario]) VALUES (2, N'32453213455', N'Color 32453212455', N'Metalico,Mica', N'Comentario color metalico')
SET IDENTITY_INSERT [dbo].[color] OFF
GO
INSERT [dbo].[color_formula] ([id_color], [sap_color], [id_formula]) VALUES (1, N'01301998', 1)
INSERT [dbo].[color_formula] ([id_color], [sap_color], [id_formula]) VALUES (1, N'01301998', 2)
INSERT [dbo].[color_formula] ([id_color], [sap_color], [id_formula]) VALUES (1, N'01301998', 3)
INSERT [dbo].[color_formula] ([id_color], [sap_color], [id_formula]) VALUES (2, N'32453213455', 4)
GO
INSERT [dbo].[fin_calidad] ([id_usuario], [num_empleado], [id_lote], [cod_lote], [fecha], [comentario]) VALUES (2, N'0', 1, N'0210218815', N'2022-02-16T13:22', NULL)
INSERT [dbo].[fin_calidad] ([id_usuario], [num_empleado], [id_lote], [cod_lote], [fecha], [comentario]) VALUES (2, N'0', 2, N'5678', N'2022-02-17T10:57', NULL)
GO
INSERT [dbo].[fin_entonado] ([id_usuario], [num_empleado], [id_lote], [cod_lote], [fecha], [comentario]) VALUES (2, N'0', 1, N'0210218815', N'2022-02-16T13:22', NULL)
INSERT [dbo].[fin_entonado] ([id_usuario], [num_empleado], [id_lote], [cod_lote], [fecha], [comentario]) VALUES (2, N'0', 2, N'5678', N'2022-02-17T10:57', NULL)
GO
INSERT [dbo].[fin_eval_terminado] ([id_usuario], [num_empleado], [id_lote], [cod_lote], [fecha], [comentario]) VALUES (2, N'0', 1, N'0210218815', N'2022-02-16T13:22', N'')
INSERT [dbo].[fin_eval_terminado] ([id_usuario], [num_empleado], [id_lote], [cod_lote], [fecha], [comentario]) VALUES (2, N'0', 2, N'5678', N'2022-02-17T10:54', N'')
GO
SET IDENTITY_INSERT [dbo].[formula] ON 

INSERT [dbo].[formula] ([id], [bom], [comentario]) VALUES (1, N'Y01301998', N'asfgaadga')
INSERT [dbo].[formula] ([id], [bom], [comentario]) VALUES (2, N'Y25370130', N'')
INSERT [dbo].[formula] ([id], [bom], [comentario]) VALUES (3, N'56876234', N'')
INSERT [dbo].[formula] ([id], [bom], [comentario]) VALUES (4, N'48736829', N'')
SET IDENTITY_INSERT [dbo].[formula] OFF
GO
INSERT [dbo].[inicio_calidad] ([id_usuario], [num_empleado], [id_lote], [cod_lote], [fecha], [comentario]) VALUES (2, N'0', 1, N'0210218815', N'2022-02-16T13:22', NULL)
INSERT [dbo].[inicio_calidad] ([id_usuario], [num_empleado], [id_lote], [cod_lote], [fecha], [comentario]) VALUES (2, N'0', 2, N'5678', N'2022-02-17T10:56', NULL)
GO
INSERT [dbo].[inicio_entonado] ([id_usuario], [num_empleado], [id_lote], [cod_lote], [fecha], [comentario]) VALUES (2, N'0', 1, N'0210218815', N'2022-02-16T13:22', NULL)
INSERT [dbo].[inicio_entonado] ([id_usuario], [num_empleado], [id_lote], [cod_lote], [fecha], [comentario]) VALUES (2, N'0', 2, N'5678', N'2022-02-17T10:56', NULL)
GO
INSERT [dbo].[inicio_eval_terminado] ([id_usuario], [num_empleado], [id_lote], [cod_lote], [fecha], [comentario]) VALUES (2, N'0', 1, N'0210218815', N'2022-02-16T13:18', N'')
INSERT [dbo].[inicio_eval_terminado] ([id_usuario], [num_empleado], [id_lote], [cod_lote], [fecha], [comentario]) VALUES (2, N'0', 2, N'5678', N'2022-02-17T10:53', N'')
GO
SET IDENTITY_INSERT [dbo].[lote] ON 

INSERT [dbo].[lote] ([id], [cod_lote], [id_color], [cod_sap_color], [cliente], [descripcion], [tecnologia], [tam_lote], [contenedor], [comentario]) VALUES (1, N'0210218815', 1, N'01301998', N'Cliente 12345', N'Pasta 12345', N'Base Agua', 0.003, N'Tina', N'')
INSERT [dbo].[lote] ([id], [cod_lote], [id_color], [cod_sap_color], [cliente], [descripcion], [tecnologia], [tam_lote], [contenedor], [comentario]) VALUES (2, N'5678', 2, N'32453213455', N'Cliente 12345', N'Lote 5678', N'Base Agua', 46, N'Tanque', N'')
SET IDENTITY_INSERT [dbo].[lote] OFF
GO
SET IDENTITY_INSERT [dbo].[lote_pigmento] ON 

INSERT [dbo].[lote_pigmento] ([id], [cod_lote], [comentario]) VALUES (1, N'12345', N'')
INSERT [dbo].[lote_pigmento] ([id], [cod_lote], [comentario]) VALUES (2, N'0210218815', N'')
INSERT [dbo].[lote_pigmento] ([id], [cod_lote], [comentario]) VALUES (3, N'5678', N'')
INSERT [dbo].[lote_pigmento] ([id], [cod_lote], [comentario]) VALUES (4, N'L1451451', N'')
SET IDENTITY_INSERT [dbo].[lote_pigmento] OFF
GO
INSERT [dbo].[pigmento] ([cod_sap], [descripcion], [tecnologia], [tipo]) VALUES (N'0130', N'Pasta 0130', N'0.002', N'No Aplica')
INSERT [dbo].[pigmento] ([cod_sap], [descripcion], [tecnologia], [tipo]) VALUES (N'12345', N'Pasta 12345', N'Base Agua', N'Aluminio')
INSERT [dbo].[pigmento] ([cod_sap], [descripcion], [tecnologia], [tipo]) VALUES (N'1451451', N'Pasta 1451451', N'Base Agua', N'Pasta')
INSERT [dbo].[pigmento] ([cod_sap], [descripcion], [tecnologia], [tipo]) VALUES (N'1722338', N'Pasta 1722338', N'Base Solvente', N'Pasta')
INSERT [dbo].[pigmento] ([cod_sap], [descripcion], [tecnologia], [tipo]) VALUES (N'32453213455', N'Pasta 32453213455', N'Base Agua', N'Mica')
INSERT [dbo].[pigmento] ([cod_sap], [descripcion], [tecnologia], [tipo]) VALUES (N'50274767', N'Lote12345', N'No Aplica', N'Mica')
INSERT [dbo].[pigmento] ([cod_sap], [descripcion], [tecnologia], [tipo]) VALUES (N'53052670', N'Pasta 53052670', N'No Aplica', N'Aluminio')
INSERT [dbo].[pigmento] ([cod_sap], [descripcion], [tecnologia], [tipo]) VALUES (N'565435', N'Pasta 565435', N'Base Agua', N'Pasta')
INSERT [dbo].[pigmento] ([cod_sap], [descripcion], [tecnologia], [tipo]) VALUES (N'987650', N'Pasta 987650', N'No Aplica', N'Aluminio')
GO
INSERT [dbo].[pigmento_formula] ([id_formula], [cod_sap], [cantidad]) VALUES (3, N'1722338', 0.003)
INSERT [dbo].[pigmento_formula] ([id_formula], [cod_sap], [cantidad]) VALUES (3, N'50274767', 0.001)
INSERT [dbo].[pigmento_formula] ([id_formula], [cod_sap], [cantidad]) VALUES (3, N'987650', 0.002)
INSERT [dbo].[pigmento_formula] ([id_formula], [cod_sap], [cantidad]) VALUES (4, N'0130', NULL)
INSERT [dbo].[pigmento_formula] ([id_formula], [cod_sap], [cantidad]) VALUES (4, N'1451451', 0.006)
INSERT [dbo].[pigmento_formula] ([id_formula], [cod_sap], [cantidad]) VALUES (4, N'53052670', 0.003)
INSERT [dbo].[pigmento_formula] ([id_formula], [cod_sap], [cantidad]) VALUES (4, N'565435', 0.003)
GO
INSERT [dbo].[pigmento_lote_pigmento] ([cod_sap], [id_lote]) VALUES (N'12345', 1)
INSERT [dbo].[pigmento_lote_pigmento] ([cod_sap], [id_lote]) VALUES (N'12345', 3)
INSERT [dbo].[pigmento_lote_pigmento] ([cod_sap], [id_lote]) VALUES (N'1451451', 4)
INSERT [dbo].[pigmento_lote_pigmento] ([cod_sap], [id_lote]) VALUES (N'32453213455', 2)
GO
SET IDENTITY_INSERT [dbo].[tipo_usuario] ON 

INSERT [dbo].[tipo_usuario] ([id], [nombre]) VALUES (1, N'Administrador')
INSERT [dbo].[tipo_usuario] ([id], [nombre]) VALUES (2, N'Moderador')
INSERT [dbo].[tipo_usuario] ([id], [nombre]) VALUES (3, N'Acceso Limitado')
INSERT [dbo].[tipo_usuario] ([id], [nombre]) VALUES (4, N'Solo Vista')
SET IDENTITY_INSERT [dbo].[tipo_usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[usuario] ON 

INSERT [dbo].[usuario] ([id], [num_empleado], [nombre], [ap_paterno], [ap_materno], [departamento], [tipo_usuario], [email], [contrasena], [telefono], [img_perfil]) VALUES (1, N'3', N'Irvin Yoariht', N'Macedo', N'Cruz', N'Entonado', 4, N'imacedoc1600@alumno.ipn.mx', N'$2a$10$qzlDIXIBPEz610QeuhSO5uLu.ZhClVYICJ5sTJlYz8DqVLJeiXd/q', N'5516369353', NULL)
INSERT [dbo].[usuario] ([id], [num_empleado], [nombre], [ap_paterno], [ap_materno], [departamento], [tipo_usuario], [email], [contrasena], [telefono], [img_perfil]) VALUES (2, N'0', N'Irvin Yoariht', N'Macedo', N'Cruz', N'Entonado', 1, N'irvin.macedo@partners.basf.com', N'$2a$10$F.7K6SoiJi23bX/VT73/Ve48dQq.WP4mXNCTfaoij8NidCs3X4G76', N'5516369353', NULL)
INSERT [dbo].[usuario] ([id], [num_empleado], [nombre], [ap_paterno], [ap_materno], [departamento], [tipo_usuario], [email], [contrasena], [telefono], [img_perfil]) VALUES (3, N'0', N'Irvin Yoariht', N'Macedo', N'Cruz', N'Entonado', 2, N'yoariht.mc37@gmail.com', N'$2a$10$RhTjJRrYuSwT6bj5G2RYoe/Sfg9S5T/GArmLy/G8YZLBUP5EpynLm', N'5516369353', NULL)
INSERT [dbo].[usuario] ([id], [num_empleado], [nombre], [ap_paterno], [ap_materno], [departamento], [tipo_usuario], [email], [contrasena], [telefono], [img_perfil]) VALUES (4, N'5', N'Irvin Yoariht', N'Macedo', N'Cruz', N'Entonado', 3, N'irvin.macedo25@hotmail.com', N'$2a$10$7LGxHm80vHeFlUm0G8veBOcnI1YGZBJLtYHotDwW4pLeQD95zwcvu', N'5516369353', NULL)
INSERT [dbo].[usuario] ([id], [num_empleado], [nombre], [ap_paterno], [ap_materno], [departamento], [tipo_usuario], [email], [contrasena], [telefono], [img_perfil]) VALUES (5, N'36120911', N'Edgar', N'Moran', N'Lazcano', N'Calidad', 1, N'edgar-alexis.moran@basf.com', N'$2a$10$xNTmPo77Dou8515/z2vXqe6h7zTxxD1CMdoa7kiI/DA26fnF4kZUK', N'', NULL)
SET IDENTITY_INSERT [dbo].[usuario] OFF
GO
ALTER TABLE [dbo].[bitacora]  WITH CHECK ADD  CONSTRAINT [FK_bitacora_lote] FOREIGN KEY([id_lote], [cod_lote])
REFERENCES [dbo].[lote] ([id], [cod_lote])
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
REFERENCES [dbo].[lote] ([id], [cod_lote])
GO
ALTER TABLE [dbo].[fin_adicion] CHECK CONSTRAINT [FK_fin_adicion_lote]
GO
ALTER TABLE [dbo].[fin_adicion]  WITH CHECK ADD  CONSTRAINT [FK_fin_adicion_lote_pigmento1] FOREIGN KEY([id_lote_pigmento])
REFERENCES [dbo].[lote_pigmento] ([id])
GO
ALTER TABLE [dbo].[fin_adicion] CHECK CONSTRAINT [FK_fin_adicion_lote_pigmento1]
GO
ALTER TABLE [dbo].[fin_adicion]  WITH CHECK ADD  CONSTRAINT [FK_fin_adicion_usuario] FOREIGN KEY([id_usuario], [num_empleado])
REFERENCES [dbo].[usuario] ([id], [num_empleado])
GO
ALTER TABLE [dbo].[fin_adicion] CHECK CONSTRAINT [FK_fin_adicion_usuario]
GO
ALTER TABLE [dbo].[fin_calidad]  WITH CHECK ADD  CONSTRAINT [FK_fin_calidad_lote] FOREIGN KEY([id_lote], [cod_lote])
REFERENCES [dbo].[lote] ([id], [cod_lote])
GO
ALTER TABLE [dbo].[fin_calidad] CHECK CONSTRAINT [FK_fin_calidad_lote]
GO
ALTER TABLE [dbo].[fin_calidad]  WITH CHECK ADD  CONSTRAINT [FK_fin_calidad_usuario] FOREIGN KEY([id_usuario], [num_empleado])
REFERENCES [dbo].[usuario] ([id], [num_empleado])
GO
ALTER TABLE [dbo].[fin_calidad] CHECK CONSTRAINT [FK_fin_calidad_usuario]
GO
ALTER TABLE [dbo].[fin_entonado]  WITH CHECK ADD  CONSTRAINT [FK_fin_entonado_lote] FOREIGN KEY([id_lote], [cod_lote])
REFERENCES [dbo].[lote] ([id], [cod_lote])
GO
ALTER TABLE [dbo].[fin_entonado] CHECK CONSTRAINT [FK_fin_entonado_lote]
GO
ALTER TABLE [dbo].[fin_entonado]  WITH CHECK ADD  CONSTRAINT [FK_fin_entonado_usuario] FOREIGN KEY([id_usuario], [num_empleado])
REFERENCES [dbo].[usuario] ([id], [num_empleado])
GO
ALTER TABLE [dbo].[fin_entonado] CHECK CONSTRAINT [FK_fin_entonado_usuario]
GO
ALTER TABLE [dbo].[fin_eval_terminado]  WITH CHECK ADD  CONSTRAINT [FK_fin_eval_terminado_lote] FOREIGN KEY([id_lote], [cod_lote])
REFERENCES [dbo].[lote] ([id], [cod_lote])
GO
ALTER TABLE [dbo].[fin_eval_terminado] CHECK CONSTRAINT [FK_fin_eval_terminado_lote]
GO
ALTER TABLE [dbo].[fin_eval_terminado]  WITH CHECK ADD  CONSTRAINT [FK_fin_eval_terminado_usuario] FOREIGN KEY([id_usuario], [num_empleado])
REFERENCES [dbo].[usuario] ([id], [num_empleado])
GO
ALTER TABLE [dbo].[fin_eval_terminado] CHECK CONSTRAINT [FK_fin_eval_terminado_usuario]
GO
ALTER TABLE [dbo].[inicio_adicion]  WITH CHECK ADD  CONSTRAINT [FK_inicio_adicion_lote] FOREIGN KEY([id_lote], [cod_lote])
REFERENCES [dbo].[lote] ([id], [cod_lote])
GO
ALTER TABLE [dbo].[inicio_adicion] CHECK CONSTRAINT [FK_inicio_adicion_lote]
GO
ALTER TABLE [dbo].[inicio_adicion]  WITH CHECK ADD  CONSTRAINT [FK_inicio_adicion_pigmento] FOREIGN KEY([pigmento])
REFERENCES [dbo].[pigmento] ([cod_sap])
GO
ALTER TABLE [dbo].[inicio_adicion] CHECK CONSTRAINT [FK_inicio_adicion_pigmento]
GO
ALTER TABLE [dbo].[inicio_adicion]  WITH CHECK ADD  CONSTRAINT [FK_inicio_adicion_usuario] FOREIGN KEY([id_usuario], [num_empleado])
REFERENCES [dbo].[usuario] ([id], [num_empleado])
GO
ALTER TABLE [dbo].[inicio_adicion] CHECK CONSTRAINT [FK_inicio_adicion_usuario]
GO
ALTER TABLE [dbo].[inicio_calidad]  WITH CHECK ADD  CONSTRAINT [FK_inicio_calidad_lote] FOREIGN KEY([id_lote], [cod_lote])
REFERENCES [dbo].[lote] ([id], [cod_lote])
GO
ALTER TABLE [dbo].[inicio_calidad] CHECK CONSTRAINT [FK_inicio_calidad_lote]
GO
ALTER TABLE [dbo].[inicio_calidad]  WITH CHECK ADD  CONSTRAINT [FK_inicio_calidad_usuario] FOREIGN KEY([id_usuario], [num_empleado])
REFERENCES [dbo].[usuario] ([id], [num_empleado])
GO
ALTER TABLE [dbo].[inicio_calidad] CHECK CONSTRAINT [FK_inicio_calidad_usuario]
GO
ALTER TABLE [dbo].[inicio_entonado]  WITH CHECK ADD  CONSTRAINT [FK_inicio_entonado_lote] FOREIGN KEY([id_lote], [cod_lote])
REFERENCES [dbo].[lote] ([id], [cod_lote])
GO
ALTER TABLE [dbo].[inicio_entonado] CHECK CONSTRAINT [FK_inicio_entonado_lote]
GO
ALTER TABLE [dbo].[inicio_entonado]  WITH CHECK ADD  CONSTRAINT [FK_inicio_entonado_usuario] FOREIGN KEY([id_usuario], [num_empleado])
REFERENCES [dbo].[usuario] ([id], [num_empleado])
GO
ALTER TABLE [dbo].[inicio_entonado] CHECK CONSTRAINT [FK_inicio_entonado_usuario]
GO
ALTER TABLE [dbo].[inicio_eval_terminado]  WITH CHECK ADD  CONSTRAINT [FK_inicio_eval_terminado_lote] FOREIGN KEY([id_lote], [cod_lote])
REFERENCES [dbo].[lote] ([id], [cod_lote])
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
ALTER TABLE [dbo].[pigmento_formula]  WITH CHECK ADD  CONSTRAINT [FK_pigmento_formula_formula] FOREIGN KEY([id_formula])
REFERENCES [dbo].[formula] ([id])
GO
ALTER TABLE [dbo].[pigmento_formula] CHECK CONSTRAINT [FK_pigmento_formula_formula]
GO
ALTER TABLE [dbo].[pigmento_formula]  WITH CHECK ADD  CONSTRAINT [FK_pigmento_formula_pigmento] FOREIGN KEY([cod_sap])
REFERENCES [dbo].[pigmento] ([cod_sap])
GO
ALTER TABLE [dbo].[pigmento_formula] CHECK CONSTRAINT [FK_pigmento_formula_pigmento]
GO
ALTER TABLE [dbo].[pigmento_lote_pigmento]  WITH CHECK ADD  CONSTRAINT [FK_pigmento_lote_pigmento_lote_pigmento] FOREIGN KEY([id_lote])
REFERENCES [dbo].[lote_pigmento] ([id])
GO
ALTER TABLE [dbo].[pigmento_lote_pigmento] CHECK CONSTRAINT [FK_pigmento_lote_pigmento_lote_pigmento]
GO
ALTER TABLE [dbo].[pigmento_lote_pigmento]  WITH CHECK ADD  CONSTRAINT [FK_pigmento_lote_pigmento_pigmento] FOREIGN KEY([cod_sap])
REFERENCES [dbo].[pigmento] ([cod_sap])
GO
ALTER TABLE [dbo].[pigmento_lote_pigmento] CHECK CONSTRAINT [FK_pigmento_lote_pigmento_pigmento]
GO
ALTER TABLE [dbo].[prueba]  WITH CHECK ADD  CONSTRAINT [FK_prueba_lote] FOREIGN KEY([id_lote], [cod_lote])
REFERENCES [dbo].[lote] ([id], [cod_lote])
GO
ALTER TABLE [dbo].[prueba] CHECK CONSTRAINT [FK_prueba_lote]
GO
ALTER TABLE [dbo].[prueba]  WITH CHECK ADD  CONSTRAINT [FK_prueba_pigmento] FOREIGN KEY([cod_sap])
REFERENCES [dbo].[pigmento] ([cod_sap])
GO
ALTER TABLE [dbo].[prueba] CHECK CONSTRAINT [FK_prueba_pigmento]
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
