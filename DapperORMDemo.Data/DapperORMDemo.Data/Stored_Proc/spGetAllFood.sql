USE [FoodWars]
GO

/****** Object:  StoredProcedure [dbo].[spGetAllFood]    Script Date: 7/9/2017 10:19:00 PM ******/
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


