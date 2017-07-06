USE [FoodWars]
GO

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


