/********************************************************************************
        GENERAL PURPOSE SCRIPTS - SETTING UP ENVIRONMENT
*********************************************************************************/

SET NOCOUNT ON;
GO

USE master;
GO

IF EXISTS (SELECT * FROM sysdatabases WHERE name = N'OmniLexDb') 
  DROP DATABASE OmniLexDb;
IF NOT EXISTS (SELECT * FROM sysdatabases WHERE name = N'OmniLexDb') 
  CREATE DATABASE [OmniLexDb];
GO

USE [OmniLexDb];
GO

/********************************************************************************
                            LANGUAGES RELATION
*********************************************************************************/
IF EXISTS (SELECT * FROM sys.default_constraints WHERE name = N'PK_LangID') 
  ALTER TABLE Languages DROP CONSTRAINT [PK_LangID];
IF EXISTS (SELECT * FROM information_schema.tables WHERE table_name = N'Languages') 
  DROP TABLE Languages;
CREATE TABLE Languages (
  Lang_ID   int IDENTITY(1,1),
  Lang      varchar(50) NOT NULL,
  CONSTRAINT [PK_LangID] PRIMARY KEY (Lang_ID ASC),
  CONSTRAINT [CHK_Lang] CHECK (DATALENGTH(Lang) > 0 AND DATALENGTH(Lang) > 0)
);

INSERT INTO Languages (Lang) VALUES ('English');
INSERT INTO Languages (Lang) VALUES ('French');
INSERT INTO Languages (Lang) VALUES ('Italian');
INSERT INTO Languages (Lang) VALUES ('Russian');
INSERT INTO Languages (Lang) VALUES ('Vietnamese');

/********************************************************************************
                            ALPHABETS RELATION
*********************************************************************************/
/* TODO: Make up alphabet list for different languages. */
IF EXISTS (SELECT * FROM sys.default_constraints WHERE name = N'PK_LangID') 
  ALTER TABLE Languages DROP CONSTRAINT [PK_LangID];
IF EXISTS (SELECT * FROM information_schema.tables WHERE table_name = N'Languages') 
  DROP TABLE Languages;
CREATE TABLE Languages (
  Lang_ID   int IDENTITY(1,1),
  Lang      varchar(50) NOT NULL,
  CONSTRAINT [PK_LangID] PRIMARY KEY (Lang_ID ASC),
  CONSTRAINT [CHK_Lang] CHECK (DATALENGTH(Lang) > 0 AND DATALENGTH(Lang) > 0)
);

INSERT INTO Languages (Lang) VALUES ('English');
INSERT INTO Languages (Lang) VALUES ('French');
INSERT INTO Languages (Lang) VALUES ('Italian');
INSERT INTO Languages (Lang) VALUES ('Russian');
INSERT INTO Languages (Lang) VALUES ('Vietnamese');
