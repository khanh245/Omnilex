/********************************************************************************
        GENERAL PURPOSE SCRIPTS - SETTING UP ENVIRONMENT
*********************************************************************************/
SET NOCOUNT ON;
GO

USE master;
GO

IF EXISTS (SELECT * FROM sysdatabases WHERE name = N'OmnilexDb') 
  DROP DATABASE OmnilexDb;
IF NOT EXISTS (SELECT * FROM sysdatabases WHERE name = N'OmnilexDb') 
  CREATE DATABASE [OmnilexDb];
GO

USE [OmnilexDb];
GO

/********************************************************************************
                            LATIN ALPHABET RELATION
*********************************************************************************/
IF EXISTS (SELECT * FROM sys.default_constraints WHERE name = N'PK_AlphaID') 
  ALTER TABLE LatinAlphabet DROP CONSTRAINT [PK_AlphaID];
IF EXISTS (SELECT * FROM information_schema.tables WHERE table_name = N'LatinAlphabet') 
  DROP TABLE LatinAlphabet;
CREATE TABLE LatinAlphabet (
  Alpha_ID   int IDENTITY(1,1),
  Letter  nvarchar(5) NOT NULL,
  CONSTRAINT [PK_AlphaID] PRIMARY KEY (Alpha_ID ASC),
  CONSTRAINT [CHK_Char] CHECK (DATALENGTH(Letter) > 0)
);

INSERT INTO LatinAlphabet (Letter) VALUES ('A');
INSERT INTO LatinAlphabet (Letter) VALUES ('B');
INSERT INTO LatinAlphabet (Letter) VALUES ('C');
INSERT INTO LatinAlphabet (Letter) VALUES ('D');
INSERT INTO LatinAlphabet (Letter) VALUES ('E');
INSERT INTO LatinAlphabet (Letter) VALUES ('F');
INSERT INTO LatinAlphabet (Letter) VALUES ('G');
INSERT INTO LatinAlphabet (Letter) VALUES ('H');
INSERT INTO LatinAlphabet (Letter) VALUES ('I');
INSERT INTO LatinAlphabet (Letter) VALUES ('J');
INSERT INTO LatinAlphabet (Letter) VALUES ('K');
INSERT INTO LatinAlphabet (Letter) VALUES ('L');
INSERT INTO LatinAlphabet (Letter) VALUES ('M');
INSERT INTO LatinAlphabet (Letter) VALUES ('N');
INSERT INTO LatinAlphabet (Letter) VALUES ('O');
INSERT INTO LatinAlphabet (Letter) VALUES ('P');
INSERT INTO LatinAlphabet (Letter) VALUES ('Q');
INSERT INTO LatinAlphabet (Letter) VALUES ('R');
INSERT INTO LatinAlphabet (Letter) VALUES ('S');
INSERT INTO LatinAlphabet (Letter) VALUES ('T');
INSERT INTO LatinAlphabet (Letter) VALUES ('U');
INSERT INTO LatinAlphabet (Letter) VALUES ('V');
INSERT INTO LatinAlphabet (Letter) VALUES ('W');
INSERT INTO LatinAlphabet (Letter) VALUES ('X');
INSERT INTO LatinAlphabet (Letter) VALUES ('Y');
INSERT INTO LatinAlphabet (Letter) VALUES ('Z');

/********************************************************************************
                            CYRILLIC ALPHABET RELATION
*********************************************************************************/
IF EXISTS (SELECT * FROM sys.default_constraints WHERE name = N'PK_CyrAlphaID') 
  ALTER TABLE CyrillicAlphabet DROP CONSTRAINT [PK_CyrAlphaID];
IF EXISTS (SELECT * FROM information_schema.tables WHERE table_name = N'CyrillicAlphabet') 
  DROP TABLE CyrillicAlphabet;
CREATE TABLE CyrillicAlphabet (
  Alpha_ID   int IDENTITY(1,1),
  Letter  nvarchar(5) NOT NULL,
  CONSTRAINT [PK_CyrAlphaID] PRIMARY KEY (Alpha_ID ASC),
  CONSTRAINT [CHK_CyrChar] CHECK (DATALENGTH(Letter) > 0)
);

INSERT INTO CyrillicAlphabet (Letter) VALUES (N'А');
INSERT INTO CyrillicAlphabet (Letter) VALUES (N'Б');
INSERT INTO CyrillicAlphabet (Letter) VALUES (N'В');
INSERT INTO CyrillicAlphabet (Letter) VALUES (N'Г');
INSERT INTO CyrillicAlphabet (Letter) VALUES (N'Д');
INSERT INTO CyrillicAlphabet (Letter) VALUES (N'Е');
INSERT INTO CyrillicAlphabet (Letter) VALUES (N'Ё');
INSERT INTO CyrillicAlphabet (Letter) VALUES (N'Ж');
INSERT INTO CyrillicAlphabet (Letter) VALUES (N'З');
INSERT INTO CyrillicAlphabet (Letter) VALUES (N'И');
INSERT INTO CyrillicAlphabet (Letter) VALUES (N'Й');
INSERT INTO CyrillicAlphabet (Letter) VALUES (N'К');
INSERT INTO CyrillicAlphabet (Letter) VALUES (N'Л');
INSERT INTO CyrillicAlphabet (Letter) VALUES (N'М');
INSERT INTO CyrillicAlphabet (Letter) VALUES (N'Н');
INSERT INTO CyrillicAlphabet (Letter) VALUES (N'О');
INSERT INTO CyrillicAlphabet (Letter) VALUES (N'П');
INSERT INTO CyrillicAlphabet (Letter) VALUES (N'Р');
INSERT INTO CyrillicAlphabet (Letter) VALUES (N'С');
INSERT INTO CyrillicAlphabet (Letter) VALUES (N'Т');
INSERT INTO CyrillicAlphabet (Letter) VALUES (N'У');
INSERT INTO CyrillicAlphabet (Letter) VALUES (N'Ф');
INSERT INTO CyrillicAlphabet (Letter) VALUES (N'Х');
INSERT INTO CyrillicAlphabet (Letter) VALUES (N'Ц');
INSERT INTO CyrillicAlphabet (Letter) VALUES (N'Ч');
INSERT INTO CyrillicAlphabet (Letter) VALUES (N'Ш');
INSERT INTO CyrillicAlphabet (Letter) VALUES (N'Щ');
INSERT INTO CyrillicAlphabet (Letter) VALUES (N'Ы');
INSERT INTO CyrillicAlphabet (Letter) VALUES (N'Э');
INSERT INTO CyrillicAlphabet (Letter) VALUES (N'Ю');
INSERT INTO CyrillicAlphabet (Letter) VALUES (N'Я');

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
  CONSTRAINT [CHK_Lang] CHECK (DATALENGTH(Lang) > 0)
);

INSERT INTO Languages (Lang) VALUES ('English');
INSERT INTO Languages (Lang) VALUES ('French');
INSERT INTO Languages (Lang) VALUES ('Italian');
INSERT INTO Languages (Lang) VALUES ('Russian');
INSERT INTO Languages (Lang) VALUES ('Vietnamese');

/********************************************************************************
                                ALPHABETS RELATION
*********************************************************************************/
IF EXISTS (SELECT * FROM sys.default_constraints WHERE name = N'PK_AlphabetID') 
  ALTER TABLE Alphabets DROP CONSTRAINT [PK_AlphabetID];
IF EXISTS (SELECT * FROM information_schema.tables WHERE table_name = N'Alphabets') 
  DROP TABLE Alphabets;
CREATE TABLE Alphabets (
  Alphabet_ID         int IDENTITY(1,1),
  AlphabetFamily      varchar(50) NOT NULL,
  CONSTRAINT [PK_AlphabetID] PRIMARY KEY (Alphabet_ID ASC),
  CONSTRAINT [CHK_AlpFam] CHECK (DATALENGTH(AlphabetFamily) > 0)
);

INSERT INTO Alphabets (AlphabetFamily) VALUES ('Latin Alphabet');
INSERT INTO Alphabets (AlphabetFamily) VALUES ('Cyrillic Alphabet');

/********************************************************************************
                            LANGUAGE ALPHABET RELATION
*********************************************************************************/
IF EXISTS (SELECT * FROM sys.default_constraints WHERE name = N'PK_LangAlphaID') 
  ALTER TABLE LanguageAlphabet DROP CONSTRAINT [PK_LangAlphaID];
IF EXISTS (SELECT * FROM sys.default_constraints WHERE Name = N'FKLangAlphaLangID')
  ALTER TABLE LanguageAlphabet DROP CONSTRAINT [FKLangAlphaLangID];
IF EXISTS (SELECT * FROM sys.default_constraints WHERE Name = N'FKLangAlphaAlphaID')
  ALTER TABLE LanguageAlphabet DROP CONSTRAINT [FKLangAlphaAlphaID];
IF EXISTS (SELECT * FROM information_schema.tables WHERE table_name = N'LanguageAlphabet') 
  DROP TABLE LanguageAlphabet;
CREATE TABLE LanguageAlphabet (
  LangAlpha_ID		int IDENTITY(1,1),
  Lang_ID           int UNIQUE NOT NULL,
  Alphabet_ID       int NOT NULL,
  CONSTRAINT [PK_LangAlphaID] PRIMARY KEY (LangAlpha_ID ASC),
  CONSTRAINT [FKLangAlphaLangID] FOREIGN KEY (Lang_ID) REFERENCES Languages(Lang_ID) 
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT [FKLangAlphaAlphaID] FOREIGN KEY (Alphabet_ID) REFERENCES Alphabets(Alphabet_ID) 
    ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO LanguageAlphabet (Lang_ID, Alphabet_ID) VALUES (1, 1);
INSERT INTO LanguageAlphabet (Lang_ID, Alphabet_ID) VALUES (2, 1);
INSERT INTO LanguageAlphabet (Lang_ID, Alphabet_ID) VALUES (3, 1);
INSERT INTO LanguageAlphabet (Lang_ID, Alphabet_ID) VALUES (4, 2);
INSERT INTO LanguageAlphabet (Lang_ID, Alphabet_ID) VALUES (5, 1);