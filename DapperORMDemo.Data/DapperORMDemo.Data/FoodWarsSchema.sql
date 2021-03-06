USE [FoodWars]
GO
/****** Object:  Table [dbo].[Food]    Script Date: 7/9/2017 10:59:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FK_FoodTypeId] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Calories] [int] NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateUpdated] [datetime2](7) NOT NULL,
	[AllergenRisk] [bit] NULL,
	[Description] [varchar](255) NULL,
 CONSTRAINT [PK_Food] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FoodType]    Script Date: 7/9/2017 10:59:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[DateAdded] [datetime2](7) NULL,
 CONSTRAINT [PK_FoodType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([Id], [FK_FoodTypeId], [Name], [Calories], [DateCreated], [DateUpdated], [AllergenRisk], [Description]) VALUES (1, 1, N'Orange', 60, CAST(N'2017-07-04T15:17:22.6400000' AS DateTime2), CAST(N'2017-07-09T22:35:38.6100000' AS DateTime2), 0, N'A delicious citrus fruit that is rich in vitamin C')
INSERT [dbo].[Food] ([Id], [FK_FoodTypeId], [Name], [Calories], [DateCreated], [DateUpdated], [AllergenRisk], [Description]) VALUES (2, 2, N'Spaghetti', 250, CAST(N'2017-07-04T15:18:55.4300000' AS DateTime2), CAST(N'2017-07-04T15:18:55.4300000' AS DateTime2), 0, N'A pasta dish that originated in Italy and a staple in the homeland which contains base tomato sauce covering noodle or stringy typical milled wheat')
INSERT [dbo].[Food] ([Id], [FK_FoodTypeId], [Name], [Calories], [DateCreated], [DateUpdated], [AllergenRisk], [Description]) VALUES (3, 3, N'Milk', 200, CAST(N'2017-07-04T15:18:55.4300000' AS DateTime2), CAST(N'2017-07-06T22:54:21.5170000' AS DateTime2), 1, N'A white liquid consumption that are harvested from cows that provides a good source of vitamin D')
INSERT [dbo].[Food] ([Id], [FK_FoodTypeId], [Name], [Calories], [DateCreated], [DateUpdated], [AllergenRisk], [Description]) VALUES (4, 4, N'Ice Cream', 250, CAST(N'2017-07-04T15:18:55.4300000' AS DateTime2), CAST(N'2017-07-04T15:18:55.4300000' AS DateTime2), 1, N'Best served during the summer, a byproduct of milk mixed with sugar and different types of flavor to bring treats that serves as a dessert or a treat')
INSERT [dbo].[Food] ([Id], [FK_FoodTypeId], [Name], [Calories], [DateCreated], [DateUpdated], [AllergenRisk], [Description]) VALUES (5, 5, N'Tomato Bistro', 200, CAST(N'2017-07-04T15:18:55.4300000' AS DateTime2), CAST(N'2017-07-04T15:18:55.4300000' AS DateTime2), 1, N'Soup form of tomatoes, best served with cheese croutons. Delicious!')
SET IDENTITY_INSERT [dbo].[Food] OFF
SET IDENTITY_INSERT [dbo].[FoodType] ON 

INSERT [dbo].[FoodType] ([Id], [Name], [DateAdded]) VALUES (1, N'Fruit', CAST(N'2017-07-09T21:46:09.9600000' AS DateTime2))
INSERT [dbo].[FoodType] ([Id], [Name], [DateAdded]) VALUES (2, N'Pasta', CAST(N'2017-07-09T21:46:09.9600000' AS DateTime2))
INSERT [dbo].[FoodType] ([Id], [Name], [DateAdded]) VALUES (3, N'Drink', CAST(N'2017-07-09T21:46:09.9600000' AS DateTime2))
INSERT [dbo].[FoodType] ([Id], [Name], [DateAdded]) VALUES (4, N'Dessert', CAST(N'2017-07-09T21:46:09.9600000' AS DateTime2))
INSERT [dbo].[FoodType] ([Id], [Name], [DateAdded]) VALUES (5, N'Soup', CAST(N'2017-07-09T21:46:09.9600000' AS DateTime2))
INSERT [dbo].[FoodType] ([Id], [Name], [DateAdded]) VALUES (6, N'Meat', CAST(N'2017-07-09T21:46:09.9600000' AS DateTime2))
INSERT [dbo].[FoodType] ([Id], [Name], [DateAdded]) VALUES (7, N'Cheese', CAST(N'2017-07-09T21:46:09.9600000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[FoodType] OFF
ALTER TABLE [dbo].[Food] ADD  CONSTRAINT [DF_Food_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Food] ADD  CONSTRAINT [DF_Food_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
ALTER TABLE [dbo].[FoodType] ADD  CONSTRAINT [DF_FoodType_DateAdded]  DEFAULT (getdate()) FOR [DateAdded]
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
/****** Object:  StoredProcedure [dbo].[spDeleteFood]    Script Date: 7/9/2017 10:59:00 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetAllFood]    Script Date: 7/9/2017 10:59:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[spGetAllFood]
AS
BEGIN

	SELECT f.*, ft.*
	FROM Food f
	JOIN FoodType ft on f.FK_FoodTypeId = ft.Id

END



GO
/****** Object:  StoredProcedure [dbo].[spGetAllFoodTypes]    Script Date: 7/9/2017 10:59:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[spGetAllFoodTypes]
AS
BEGIN

	SELECT * FROM FoodType

END


GO
/****** Object:  StoredProcedure [dbo].[spGetFoodById]    Script Date: 7/9/2017 10:59:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[spGetFoodById]
(
	@foodId int
)
AS

BEGIN

	SELECT *
	FROM Food f
	JOIN FoodType ft on f.FK_FoodTypeId = ft.Id
	WHERE f.Id = @foodId

END


GO
/****** Object:  StoredProcedure [dbo].[spGetFoodTypeById]    Script Date: 7/9/2017 10:59:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[spGetFoodTypeById]
(
	@foodTypeId int
)
AS
BEGIN
	SELECT * FROM dbo.FoodType WHERE Id = @foodTypeId
END

GO
/****** Object:  StoredProcedure [dbo].[spInsertFood]    Script Date: 7/9/2017 10:59:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[spInsertFood] 
	@foodTypeId int,
	@name varchar(255),
	@calories int,
	@allergenRisk bit = 0,
	@description varchar(255)
AS
BEGIN 
	
	SET NOCOUNT ON;

	INSERT FOOD (FK_FoodTypeId, Name, Calories, DateCreated, DateUpdated, AllergenRisk, Description)
	VALUES (@foodTypeId, @name, @calories, GETDATE(), GETDATE(), @allergenRisk, @description)

END



GO
/****** Object:  StoredProcedure [dbo].[spInsertFoodType]    Script Date: 7/9/2017 10:59:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[spInsertFoodType]
(
	@name varchar(255)
)
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM FoodType WHERE Name = @name)
	BEGIN
		INSERT FoodType(Name) VALUES (@name)
	END
	ELSE		
	BEGIN
		RAISERROR('Food Type exists in database', 16, 1)
	END		
END


GO
/****** Object:  StoredProcedure [dbo].[spUpdateFoodById]    Script Date: 7/9/2017 10:59:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[spUpdateFoodById]
(
	@foodId int,
	@name varchar(255) NULL,
	@calories int NULL,
	@allergenRisk bit NULL, 
	@description varchar(255) NULL
)
AS

BEGIN 
	IF @name IS NULL
	BEGIN
		SET @name = (SELECT name FROM Food WHERE Id = @foodId)
	END

	IF @allergenRisk IS NULL
	BEGIN
		SET @allergenRisk = (SELECT AllergenRisk FROM Food WHERE Id = @foodId)
	END

	IF @description IS NULL
	BEGIN
		SET @description = (SELECT [Description] FROM Food WHERE Id = @foodId)
	END

	IF @calories IS NULL
	BEGIN
		SET @calories = (SELECT Calories FROM Food WHERE Id = @foodId)
	END
	
	UPDATE Food SET Name = @name, Calories = @calories, DateUpdated = GETDATE(), AllergenRisk = @allergenRisk, [Description] = @description WHERE id = @foodId

END



GO
