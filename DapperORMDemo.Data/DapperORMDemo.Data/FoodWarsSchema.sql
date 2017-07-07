USE [FoodWars]
GO
/****** Object:  Table [dbo].[Food]    Script Date: 7/5/2017 11:25:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FK_FoodTypeId] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Calories] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
 CONSTRAINT [PK_Food] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FoodType]    Script Date: 7/5/2017 11:25:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_FoodType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([Id], [FK_FoodTypeId], [Name], [Calories], [DateCreated], [DateUpdated]) VALUES (1, 1, N'Orange', 50, CAST(N'2017-07-04T15:17:22.640' AS DateTime), CAST(N'2017-07-04T15:17:22.640' AS DateTime))
INSERT [dbo].[Food] ([Id], [FK_FoodTypeId], [Name], [Calories], [DateCreated], [DateUpdated]) VALUES (2, 2, N'Spagetti', 250, CAST(N'2017-07-04T15:18:55.430' AS DateTime), CAST(N'2017-07-04T15:18:55.430' AS DateTime))
INSERT [dbo].[Food] ([Id], [FK_FoodTypeId], [Name], [Calories], [DateCreated], [DateUpdated]) VALUES (3, 3, N'Milk', 80, CAST(N'2017-07-04T15:18:55.430' AS DateTime), CAST(N'2017-07-04T15:18:55.430' AS DateTime))
INSERT [dbo].[Food] ([Id], [FK_FoodTypeId], [Name], [Calories], [DateCreated], [DateUpdated]) VALUES (4, 4, N'Ice Cream', 250, CAST(N'2017-07-04T15:18:55.430' AS DateTime), CAST(N'2017-07-04T15:18:55.430' AS DateTime))
INSERT [dbo].[Food] ([Id], [FK_FoodTypeId], [Name], [Calories], [DateCreated], [DateUpdated]) VALUES (5, 5, N'Tomato Bistro', 200, CAST(N'2017-07-04T15:18:55.430' AS DateTime), CAST(N'2017-07-04T15:18:55.430' AS DateTime))
SET IDENTITY_INSERT [dbo].[Food] OFF
SET IDENTITY_INSERT [dbo].[FoodType] ON 

INSERT [dbo].[FoodType] ([Id], [Name]) VALUES (1, N'Fruit')
INSERT [dbo].[FoodType] ([Id], [Name]) VALUES (2, N'Pasta')
INSERT [dbo].[FoodType] ([Id], [Name]) VALUES (3, N'Drink')
INSERT [dbo].[FoodType] ([Id], [Name]) VALUES (4, N'Dessert')
INSERT [dbo].[FoodType] ([Id], [Name]) VALUES (5, N'Soup')
SET IDENTITY_INSERT [dbo].[FoodType] OFF
ALTER TABLE [dbo].[Food] ADD  CONSTRAINT [DF_Food_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Food] ADD  CONSTRAINT [DF_Food_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD  CONSTRAINT [FK_Food_FoodType] FOREIGN KEY([FK_FoodTypeId])
REFERENCES [dbo].[FoodType] ([Id])
GO
ALTER TABLE [dbo].[Food] CHECK CONSTRAINT [FK_Food_FoodType]
GO
ALTER TABLE [dbo].[FoodType]  WITH CHECK ADD  CONSTRAINT [FK_FoodType_FoodType] FOREIGN KEY([Id])
REFERENCES [dbo].[FoodType] ([Id])
GO
ALTER TABLE [dbo].[FoodType] CHECK CONSTRAINT [FK_FoodType_FoodType]
GO
/****** Object:  StoredProcedure [dbo].[spDeleteFood]    Script Date: 7/5/2017 11:25:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[spDeleteFood]
(
	@foodId int
)
AS
BEGIN

	DELETE Food WHERE id = @foodId

END


GO
/****** Object:  StoredProcedure [dbo].[spGetAllFood]    Script Date: 7/5/2017 11:25:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[spGetAllFood]
AS
BEGIN

	SELECT * FROM Food

END

GO
/****** Object:  StoredProcedure [dbo].[spInsertFood]    Script Date: 7/5/2017 11:25:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[spInsertFood] 
	@foodTypeId int,
	@name varchar(255),
	@calories int
AS
BEGIN 
	
	SET NOCOUNT ON;

	INSERT FOOD (FK_FoodTypeId, Name, Calories, DateCreated, DateUpdated)
	VALUES (@foodTypeId, @name, @calories, GETDATE(), GETDATE())

END


GO
