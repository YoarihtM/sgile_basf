USE [control_calidad]
GO
/****** Object:  Table [dbo].[bitacora]    Script Date: 01/02/2022 03:33:48 p. m. ******/
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
/****** Object:  Table [dbo].[bitacora_propiedad]    Script Date: 01/02/2022 03:33:48 p. m. ******/
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
/****** Object:  Table [dbo].[color]    Script Date: 01/02/2022 03:33:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[color](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cod_sap] [varchar](20) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[id_formula] [int] NULL,
	[comentario] [text] NULL,
 CONSTRAINT [PK_color] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[cod_sap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fin_adicion]    Script Date: 01/02/2022 03:33:48 p. m. ******/
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
/****** Object:  Table [dbo].[fin_calidad]    Script Date: 01/02/2022 03:33:48 p. m. ******/
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
/****** Object:  Table [dbo].[fin_entonado]    Script Date: 01/02/2022 03:33:48 p. m. ******/
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
/****** Object:  Table [dbo].[fin_eval_terminado]    Script Date: 01/02/2022 03:33:48 p. m. ******/
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
/****** Object:  Table [dbo].[formula]    Script Date: 01/02/2022 03:33:48 p. m. ******/
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
/****** Object:  Table [dbo].[inicio_adicion]    Script Date: 01/02/2022 03:33:48 p. m. ******/
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
/****** Object:  Table [dbo].[inicio_calidad]    Script Date: 01/02/2022 03:33:48 p. m. ******/
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
/****** Object:  Table [dbo].[inicio_entonado]    Script Date: 01/02/2022 03:33:48 p. m. ******/
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
/****** Object:  Table [dbo].[inicio_eval_terminado]    Script Date: 01/02/2022 03:33:48 p. m. ******/
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
/****** Object:  Table [dbo].[lote]    Script Date: 01/02/2022 03:33:48 p. m. ******/
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
	[tecnologia] [int] NOT NULL,
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
/****** Object:  Table [dbo].[lote_pasta]    Script Date: 01/02/2022 03:33:48 p. m. ******/
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
/****** Object:  Table [dbo].[pasta]    Script Date: 01/02/2022 03:33:48 p. m. ******/
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
/****** Object:  Table [dbo].[pasta_formula]    Script Date: 01/02/2022 03:33:48 p. m. ******/
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
/****** Object:  Table [dbo].[pasta_lote-pasta]    Script Date: 01/02/2022 03:33:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pasta_lote-pasta](
	[cod_sap] [varchar](30) NOT NULL,
	[id_lote] [int] NOT NULL,
 CONSTRAINT [PK_pasta_lote-pasta] PRIMARY KEY CLUSTERED 
(
	[cod_sap] ASC,
	[id_lote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[propiedad]    Script Date: 01/02/2022 03:33:48 p. m. ******/
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
/****** Object:  Table [dbo].[prueba]    Script Date: 01/02/2022 03:33:48 p. m. ******/
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
/****** Object:  Table [dbo].[tipo_usuario]    Script Date: 01/02/2022 03:33:48 p. m. ******/
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
/****** Object:  Table [dbo].[usuario]    Script Date: 01/02/2022 03:33:48 p. m. ******/
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
ALTER TABLE [dbo].[color]  WITH CHECK ADD  CONSTRAINT [FK_color_formula] FOREIGN KEY([id_formula])
REFERENCES [dbo].[formula] ([id])
GO
ALTER TABLE [dbo].[color] CHECK CONSTRAINT [FK_color_formula]
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
ALTER TABLE [dbo].[pasta_lote-pasta]  WITH CHECK ADD  CONSTRAINT [FK_pasta_lote-pasta_lote_pasta] FOREIGN KEY([id_lote])
REFERENCES [dbo].[lote_pasta] ([id])
GO
ALTER TABLE [dbo].[pasta_lote-pasta] CHECK CONSTRAINT [FK_pasta_lote-pasta_lote_pasta]
GO
ALTER TABLE [dbo].[pasta_lote-pasta]  WITH CHECK ADD  CONSTRAINT [FK_pasta_lote-pasta_pasta] FOREIGN KEY([cod_sap])
REFERENCES [dbo].[pasta] ([cod_sap])
GO
ALTER TABLE [dbo].[pasta_lote-pasta] CHECK CONSTRAINT [FK_pasta_lote-pasta_pasta]
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
