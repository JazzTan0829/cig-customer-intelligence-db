USE [CustomerIntelligence]
GO

DECLARE @RoleName sysname
set @RoleName = N'CorpBIEtl'

IF @RoleName <> N'public' and (select is_fixed_role from sys.database_principals where name = @RoleName) = 0
BEGIN
    DECLARE @RoleMemberName sysname
    DECLARE Member_Cursor CURSOR FOR
    select [name]
    from sys.database_principals 
    where principal_id in ( 
        select member_principal_id
        from sys.database_role_members
        where role_principal_id in (
            select principal_id
            FROM sys.database_principals where [name] = @RoleName AND type = 'R'))

    OPEN Member_Cursor;

    FETCH NEXT FROM Member_Cursor
    into @RoleMemberName
    
    DECLARE @SQL NVARCHAR(4000)

    WHILE @@FETCH_STATUS = 0
    BEGIN
        
        SET @SQL = 'ALTER ROLE '+ QUOTENAME(@RoleName,'[') +' DROP MEMBER '+ QUOTENAME(@RoleMemberName,'[')
        EXEC(@SQL)
        
        FETCH NEXT FROM Member_Cursor
        into @RoleMemberName
    END;

    CLOSE Member_Cursor;
    DEALLOCATE Member_Cursor;
END
/****** Object:  DatabaseRole [CorpBIEtl]    Script Date: 04-Jul-18 13:28:28 ******/
DROP ROLE IF EXISTS [CorpBIEtl]
GO
/****** Object:  DatabaseRole [CorpBIEtl]    Script Date: 04-Jul-18 13:28:28 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'CorpBIEtl' AND type = 'R')
CREATE ROLE [CorpBIEtl]
GO
