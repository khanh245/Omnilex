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
  CONSTRAINT [CHK_Lang] CHECK (DATALENGTH(Lang))
);

INSERT INTO Languages (Lang) VALUES ('English');
INSERT INTO Languages (Lang) VALUES ('French');
INSERT INTO Languages (Lang) VALUES ('Italian');
INSERT INTO Languages (Lang) VALUES ('Russian');
INSERT INTO Languages (Lang) VALUES ('Vietnamese');

/********************************************************************************
                            ALPHABETS RELATION
*********************************************************************************/
IF EXISTS (SELECT * FROM sys.default_constraints WHERE name = N'PK_AlphaID') 
  ALTER TABLE LatinAlphabet DROP CONSTRAINT [PK_AlphaID];
IF EXISTS (SELECT * FROM information_schema.tables WHERE table_name = N'LatinAlphabet') 
  DROP TABLE LatinAlphabet;
CREATE TABLE LatinAlphabet (
  Alpha_ID   int IDENTITY(1,1),
  Character  varchar(5) NOT NULL,
  CONSTRAINT [PK_AlphaID] PRIMARY KEY (Alpha_ID ASC),
  CONSTRAINT [CHK_Char] CHECK (DATALENGTH(Character))
);

INSERT INTO LatinAlphabet (Lang) VALUES ('A');
INSERT INTO LatinAlphabet (Lang) VALUES ('B');
INSERT INTO LatinAlphabet (Lang) VALUES ('C');
INSERT INTO LatinAlphabet (Lang) VALUES ('D');
INSERT INTO LatinAlphabet (Lang) VALUES ('D');
INSERT INTO LatinAlphabet (Lang) VALUES ('D');
INSERT INTO LatinAlphabet (Lang) VALUES ('D');
INSERT INTO LatinAlphabet (Lang) VALUES ('D');
INSERT INTO LatinAlphabet (Lang) VALUES ('D');
