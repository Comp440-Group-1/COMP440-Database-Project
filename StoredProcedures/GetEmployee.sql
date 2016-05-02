-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Erik>
-- Create date: <5/2/2016>
-- Description:	<GetEmployee>
-- =============================================

CREATE PROCEDURE GetEmployee
	-- Add the parameters for the stored procedure here
	@Employee_Id varchar(50),
	@FirstName varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT FirstName FROM Employee WHERE Employee_Id = Employee_Id
	END TRY

	BEGIN CATCH
		RAISERROR('Error getting employee name',1,1);
	END CATCH
END
GO
