USE [C25]
GO
/****** Object:  StoredProcedure [dbo].[People_SelectAllWithASPRoles]    Script Date: 3/14/2017 2:44:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[People_SelectAllWithASPRoles]
			@CurrentPage int 
			,@ResultsPerPage int = 24
			,@Name nvarchar(50) = ''
			,@PersonType nvarchar(50) -- Agent, Client, Resource, Broker
			,@RoleId int = null

AS

/*---------TEST CODE------
DECLARE @CurrentPage int = 0

EXECUTE dbo.People_SelectAllWithASPRoles
		@CurrentPage = 0
		,@RoleId = 102
		,@PersonType = 'Resource'
		,@ResultsPerPage = 1000
		,@Name = ''
*/


BEGIN

SELECT p.[Id]
      ,p.[FirstName]
      ,p.[LastName]
      ,p.[PhoneCell]
      ,p.[PhoneHome]
      ,p.[PhoneWork]
      ,p.[EmailPublic]
      ,p.[Preapproved]
      ,p.[Address1]
      ,p.[Address2]
      ,p.[City]
      ,p.[StateProvince]
      ,p.[ZipCode]
      ,p.[Country]
      ,p.[ContactPreference]
      ,p.[CompanyName]
      ,p.[Tags]
      ,p.[Ratings]
      ,p.[Languages]
      ,p.[KeyName]
      ,p.[AgentProfileKey]
      ,p.[Website]
      ,p.[LicenseStatus]
      ,p.[BannerFileKey]
      ,p.[LogoFileKey]
      ,p.[AboutMe]
      ,p.[Address1Business]
      ,p.[Address2Business]
      ,p.[CityBusiness]
      ,p.[StateProvinceBusiness]
      ,p.[ZipCodeBusiness]
      ,p.[VerificationStatusId]
	  INTO #Result
	  FROM People p
	  LEFT JOIN AspNetUserRoles anur
		ON P.ComplexUserId = anur.UserId
		LEFT JOIN AspNetRoles anr
			ON anur.RoleId = anr.Id
	  WHERE (p.FirstName like '%' + @Name + '%' OR p.LastName like '%' + @Name + '%')
		AND (
		(@PersonType = 'Resource' AND exists (SELECT 1 FROM PersonRoles WHERE PersonId = P.Id))
		OR
		(@PersonType != 'Resource' AND anr.Name like @PersonType) )
		AND
		(@RoleId is null OR @RoleId in (SELECT RoleId FROM PersonRoles WHERE PersonId = P.Id) )
	  ORDER BY p.LastName
	  OFFSET (@CurrentPage * @ResultsPerPage) ROWS FETCH NEXT @ResultsPerPage ROWS ONLY

	SELECT * FROM #Result

 SELECT  p.Id as personId, r.Id, r.Name
  FROM People p
	 JOIN ASPNETUsers U
		ON u.Id = p.ComplexUserId
		 JOIN ASPNETUserRoles UR
			ON ur.UserId = u.Id
			 JOIN ASPNETRoles r
				ON ur.RoleId = r.Id
				JOIN #Result res
					ON p.Id = res.Id

SELECT pr.PersonId, pr.RoleId, r.Name AS RoleName, r.Code AS RoleCode
	FROM PersonRoles pr 
		JOIN Roles r 
			ON pr.RoleId = r.Id
			JOIN #Result res
				ON pr.PersonId = res.Id

END