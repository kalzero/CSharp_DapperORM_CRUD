use FoodWars

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