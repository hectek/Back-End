/* ---------------------------------------------------------------
	MUST CREATE A TYPE TABLE TO JOIN WITH "TABLE" YOU WANT TO UPDATE 
	UPDATE RECORDS USING 'ID' TO UPDATE 'COLUMN2'
	@ORDERING IS A TABLE VARIABLE CREATED IN C#

	CREATE TYPE dbo.IntIdPairTable AS TABLE  
			 ( One int, Two int ) 

*/ ---------------------------------------------------------------

	ALTER PROCEDURE [dbo].[MultipleUpdateRecords]
	 @Ordering [dbo].[IntIdPairTable] READONLY

	AS

	BEGIN

		UPDATE [dbo].[Table]
		SET    [Column2] = Two
		From dbo.Table t inner join @Ordering o
					on t.Id = o.One

	END
