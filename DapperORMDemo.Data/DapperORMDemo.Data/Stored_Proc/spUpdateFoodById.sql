use FoodWars

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[spUpdateFoodById]
(
	@foodId int,
	@name varchar(max),
	@calories int
)
AS

BEGIN 
	
	UPDATE Food SET Name = @name, Calories = @calories, DateUpdated = GETDATE() WHERE id = @foodId

END

GO