USE [FoodWars]

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