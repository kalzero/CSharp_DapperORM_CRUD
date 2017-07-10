USE [FoodWars]
GO

/****** Object:  StoredProcedure [dbo].[spUpdateFoodById]    Script Date: 7/9/2017 10:27:13 PM ******/
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


