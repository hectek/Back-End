USE [C32_LashGirl]
GO
/****** Object:  StoredProcedure [dbo].[Comments_SelectPaginate]    Script Date: 6/9/2017 2:22:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[Comments_SelectPaginate]
	@PageIndex int
	,@PageSize int 



/* ----------------- TEST CODE ---------------------------

	Declare @PageIndex int =0
			,@PageSize int = 10


	Execute dbo.Comments_SelectPaginate   @PageIndex
										 ,@PageSize

	select * from dbo.
*/-------------------------------------------------------
AS

BEGIN
	DECLARE @Offset int = @PageIndex*@PageSize

	SELECT   [ID]
			,[EntityID]
			,[ParentID]
			,[TypeID]
            ,[Title]
			,[Description]
			,[CreatedBy]
			,[CreatedDate]
			,[ModifiedBy]
			,[ModifiedDate]
			,[TotalCount] = COUNT(1) OVER()
	  FROM [dbo].[Comments] AS C
      ORDER BY C.CreatedDate DESC
	  OFFSET @Offset ROWS 
	  FETCH NEXT @PageSize ROWS ONLY;
END

