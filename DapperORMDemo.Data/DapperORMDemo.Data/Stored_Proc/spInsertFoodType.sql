use FoodWars

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

	INSERT FoodType(Name) VALUES (@name)

END

GO