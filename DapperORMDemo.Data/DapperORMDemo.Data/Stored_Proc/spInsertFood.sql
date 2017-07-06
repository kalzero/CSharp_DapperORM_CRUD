use FoodWars
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[spInsertFood] 
(
	@foodTypeId int,
	@name varchar(255),
	@calories int
)
AS
BEGIN 
	
	SET NOCOUNT ON;

	INSERT FOOD (FK_FoodTypeId, Name, Calories, DateCreated, DateUpdated)
	VALUES (@foodTypeId, @name, @calories, GETDATE(), GETDATE())

END

GO