/*
   4 Ocak 2023 Çarşamba22:41:06
   User: 
   Server: NINJACLUB\CNYTMSSQLSERVER
   Database: SatisVT
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
EXECUTE sp_rename N'dbo.TBLSEHIR.SEHIRAD', N'Tmp_ULKE_2', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.TBLSEHIR.Tmp_ULKE_2', N'ULKE', 'COLUMN' 
GO
ALTER TABLE dbo.TBLSEHIR SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.TBLSEHIR', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.TBLSEHIR', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.TBLSEHIR', 'Object', 'CONTROL') as Contr_Per 