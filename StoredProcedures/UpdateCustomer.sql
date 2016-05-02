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
-- Description:	<UpdateCustomer>
-- =============================================
CREATE PROCEDURE UpdateCustomer
@flag bit output,-- return 0 for fail,1 for success
@Customer_ID int,
@Customer_Name vachar(50),
@Customer_Email vachar(50),
@Customer_Phone int,
@Customer_Address vachar(50),
@Customer_City vachar(50),
@Customer_State vachar(2),
@Customer_Zip int

AS BEGIN
BEGIN TRANSACTION 
BEGIN TRY
 Update Customer set Customer_Name=@Customer_Name, Customer_Email=@Customer_Email, 
 Customer_Phone=@Customer_Phone, Customer_Address=@Customer_Address, Customer_City=@Customer_City,
 Customer_State=@Customer_State, Customer_Zip=@Customer_Zip
Where Customer_ID = @Customer_ID 
 set @flag=1; 
IF @@TRANCOUNT > 0
 BEGIN commit TRANSACTION;
 END
END TRY
BEGIN CATCH
IF @@TRANCOUNT > 0
 BEGIN rollback TRANSACTION; 
 END
 set @flag=0;
 END CATCH
 END 

