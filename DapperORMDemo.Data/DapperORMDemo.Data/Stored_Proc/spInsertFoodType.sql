USE [FoodWars]
GO

/****** Object:  StoredProcedure [dbo].[spInsertFoodType]    Script Date: 7/9/2017 10:27:00 PM ******/
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
	IF NOT EXISTS (SELECT * FROM FoodType WHERE Name = @name)
	BEGIN
		INSERT FoodType(Name) VALUES (@name)
	END
	ELSE		
	BEGIN
		RAISERROR('Food Type exists in database', 16, 1)
	END		
END


GO


