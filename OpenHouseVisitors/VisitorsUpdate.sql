USE [C25]
GO
/****** Object:  StoredProcedure [dbo].[OpenHouseVisitors_Update]    Script Date: 3/14/2017 3:23:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[OpenHouseVisitors_Update]
		    @firstName nvarchar(50)
		   ,@lastName nvarchar(50)
		   ,@email nvarchar(100)
		   ,@phoneNumber nvarchar(50)
		   ,@lookingForAgent bit
		   ,@wantsUpdates bit
		   ,@sendSimilar bit
		   ,@id int

as
/*
DECLARE @id int = 1

DECLARE @firstName nvarchar(50) = 'Bill'
	   ,@lastName nvarchar(50) = 'Jones'
	   ,@email nvarchar(100) = 'billjones@email.com'
	   ,@phoneNumber nvarchar(50) = '(121)234-5678'
	   ,@lookingForAgent bit = 0
	   ,@wantsUpdates bit = 1
	   ,@sendSimilar bit = 1

SELECT * FROM dbo.OpenHouseVisitors
	WHERE Id = @id

EXECUTE dbo.OpenHouseVisitors_Update
	    @firstName
	   ,@lastName
	   ,@email
	   ,@phoneNumber
	   ,@lookingForAgent
	   ,@wantsUpdates
	   ,@sendSimilar
	   ,@id

SELECT * FROM dbo.OpenHouseVisitors
	WHERE Id = @id
*/
BEGIN

UPDATE dbo.OpenHouseVisitors
	SET [FirstName] = @firstName
	   ,[LastName] = @lastName
	   ,[Email] = @email
	   ,[PhoneNumber] = @phoneNumber
	   ,[LookingForAgent] = @lookingForAgent
	   ,[WantsUpdates] = @wantsUpdates
	   ,[SendSimilar] = @sendSimilar
	WHERE [Id] = @id

END