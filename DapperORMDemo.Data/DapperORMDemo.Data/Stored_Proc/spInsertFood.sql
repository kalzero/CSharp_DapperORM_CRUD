USE [FoodWars]
GO

/****** Object:  StoredProcedure [dbo].[spInsertFood]    Script Date: 7/9/2017 10:20:15 PM ******/
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


