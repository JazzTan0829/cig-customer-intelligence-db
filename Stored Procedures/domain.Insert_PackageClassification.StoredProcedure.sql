USE [CustomerIntelligence]
GO
/****** Object:  StoredProcedure [domain].[Insert_PackageClassification]    Script Date: 24-sept.-18 14:29:53 ******/
DROP PROCEDURE IF EXISTS [domain].[Insert_PackageClassification]
GO
/****** Object:  StoredProcedure [domain].[Insert_PackageClassification]    Script Date: 24-sept.-18 14:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jennifer Vink
-- Create date: 30-03-2017
-- =============================================
CREATE PROCEDURE [domain].[Insert_PackageClassification] (
	@Environment nchar(3), @PackageCode nvarchar(50), @Edition nvarchar(18), @Product nvarchar(30), @Solution nvarchar(18)) 
AS

BEGIN
-- IF AcitvityType does not exist then insert
	IF (
		SELECT @Product
		FROM domain.PackageClassification
		WHERE PackageCode = @PackageCode AND Environment=@Environment) IS NULL

		INSERT INTO domain.PackageClassification (Environment, PackageCode, Edition, Product, Solution)
		VALUES  (@Environment, @PackageCode, @Edition, @Product, @Solution)
END


GO
