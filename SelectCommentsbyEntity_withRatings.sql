
--    Select Comments for the current Entiity and Type  --------
--    Must input Entity and typeID			--------------------

ALTER PROCEDURE [dbo].[Comments_SelectbyEntityType_withRatings]
		 @EntityId nvarchar(250)
		, @TypeId int
AS

/* ---------------------------------  Test ------------------------

	DECLARE @EntityId nvarchar(250) = 3
			,@TypeId int = 4

	Execute dbo.Comments_SelectbyEntityType_withRatings @EntityId
	                                                   ,@TypeId


*/ -------------------------------------------------------------------

BEGIN

		SELECT   C.[ID]
				,C.[EntityID]
				,C.[ParentID]
				,C.[TypeID]
				,C.[Title]
				,C.[Description]
				,C.[CreatedBy]
				,C.[CreatedDate]
				,C.[ModifiedBy]
				,C.[ModifiedDate]
				,R.[ID]
				,R.[Rating]
				,R.[CreatedDate]
		 FROM	[dbo].[Comments] AS C Left join dbo.Ratings as R
		 ON	C.EntityID = R.EntityID AND C.TypeID = R.TypeID AND C.CreatedBy = R.CreatedBy
		 WHERE  C.EntityID = @EntityId AND C.TypeID = @TypeId
		 ORDER BY C.ID

END
