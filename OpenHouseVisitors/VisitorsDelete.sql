USE [C25]
GO
/****** Object:  StoredProcedure [dbo].[OpenHouseVisitors_Delete]    Script Date: 3/14/2017 3:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[OpenHouseVisitors_Delete]
			@id int

as
/*
DECLARE @id = 1

EXECUTE dbo.OpenHouseVisitors_Delete
			@id

SELECT * FROM dbo.OpenHouseVisitors
*/
BEGIN

DELETE dbo.OpenHouseVisitors
	WHERE Id = @id

END