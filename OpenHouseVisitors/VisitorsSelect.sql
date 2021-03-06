USE [C25]
GO
/****** Object:  StoredProcedure [dbo].[OpenHouseVisitors_SelectByOpenHouseId]    Script Date: 3/14/2017 3:24:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[OpenHouseVisitors_SelectByOpenHouseId]
			@openHouseId int
as
/*
DECLARE @openHouseId int = 67623

EXECUTE dbo.OpenHouseVisitors_SelectByOpenHouseId
			@openHouseId
*/
BEGIN

SELECT OHV.[Id]
	  ,OHV.[OpenHouseId]
	  ,OHV.[FirstName]
	  ,OHV.[LastName]
	  ,OHV.[Email]
	  ,OHV.[PhoneNumber]
	  ,OHV.[LookingForAgent]
	  ,OHV.[WantsUpdates]
	  ,OHV.[SendSimilar]
	  FROM dbo.OpenHouseVisitors OHV
	WHERE OpenHouseId = @openHouseId

END