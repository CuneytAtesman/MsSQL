/*
   4 Ocak 2023 Çarşamba23:06:37
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
CREATE TABLE dbo.Tmp_TBLMUSTERI
	(
	MUSTERIID int NOT NULL IDENTITY (1, 1),
	MUSTERIAD varchar(50) NULL,
	MUSTERISOYAD varchar(50) NULL,
	MUSTERIULKE varchar(50) NULL,
	MUSTERIBAKIYE decimal(18, 2) NULL,
	MUSTERIEMAIL nvarchar(50) NOT NULL,
	MAKINAID nvarchar(50) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_TBLMUSTERI SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_TBLMUSTERI ON
GO
IF EXISTS(SELECT * FROM dbo.TBLMUSTERI)
	 EXEC('INSERT INTO dbo.Tmp_TBLMUSTERI (MUSTERIID, MUSTERIAD, MUSTERISOYAD, MUSTERIULKE, MUSTERIBAKIYE, MUSTERIEMAIL, MAKINAID)
		SELECT MUSTERIID, MUSTERIAD, MUSTERISOYAD, MUSTERIULKE, MUSTERIBAKIYE, [MUSTERI EMAIL], MAKINAID FROM dbo.TBLMUSTERI WITH (HOLDLOCK TABLOCKX)')
GO
COMMIT
