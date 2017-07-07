use FoodWars

GO

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