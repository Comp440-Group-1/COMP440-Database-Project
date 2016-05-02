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
-- Description:	<InsertProducts>
-- =============================================
CREATE PROCEDURE InsertProducts
	-- Add the parameters for the stored procedure here
	@Product_ID int = <Default_Value_For_Param1, , 0>, 
	@Product_Name varchar = <Default_Value_For_Param2, , 0>
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY
		INSERT INTO Product VALUES(@Product_ID,@Product_Name)
	END TRY

	BEGIN CATCH
		RAISERROR(N'Error inserting to Products',1, 1); 
	END CATCH

END
GO
