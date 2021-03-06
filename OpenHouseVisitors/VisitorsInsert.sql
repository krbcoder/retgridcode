USE [C25]
GO
/****** Object:  StoredProcedure [dbo].[OpenHouseVisitors_Insert]    Script Date: 3/14/2017 3:22:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[OpenHouseVisitors_Insert]
			@openHouseId int
		   ,@firstName nvarchar(50)
		   ,@lastName nvarchar(50)
		   ,@email nvarchar(100)
		   ,@phoneNumber nvarchar(50)
		   ,@lookingForAgent bit
		   ,@wantsUpdates bit
		   ,@sendSimilar bit
		   ,@id int OUTPUT

as
/*
DECLARE @id int = 0

DECLARE @openHouseId int = 3
	   ,@firstName nvarchar(50) = 'John'
	   ,@lastName nvarchar(50) = 'Jones'
	   ,@email nvarchar(100) = 'johnjones@email.com'
	   ,@phoneNumber nvarchar(50) = '(909)123-4567'
	   ,@lookingForAgent bit = 0
	   ,@wantsUpdates bit = 1
	   ,@sendSimilar bit = 1

EXECUTE dbo.OpenHouseVisitors_Insert
		 @openHouseId
		,@firstName
		,@lastName
		,@email
		,@phoneNumber
		,@lookingForAgent
		,@wantsUpdates
		,@sendSimilar
		,@id OUTPUT

SELECT @id

SELECT * FROM dbo.OpenHouseVisitors
*/
BEGIN

INSERT INTO dbo.OpenHouseVisitors
			([OpenHouseId]
			,[FirstName]
			,[LastName]
			,[Email]
			,[PhoneNumber]
			,[LookingForAgent]
			,[WantsUpdates]
			,[SendSimilar])
			VALUES
			(@openHouseId
			,@firstName
			,@lastName
			,@email
			,@phoneNumber
			,@lookingForAgent
			,@wantsUpdates
			,@sendSimilar)

SET @id = SCOPE_IDENTITY()

END