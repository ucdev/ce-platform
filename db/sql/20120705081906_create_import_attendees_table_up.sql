
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[ceschema].[credit_requests]') AND name = N'ix_request_recordHash')
		DROP INDEX [ix_request_recordHash] ON [ceschema].[credit_requests] WITH ( ONLINE = OFF );
CREATE TABLE [uploads] (
 [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
 [uploadtype] VARCHAR(255),
 [userId] INT,
 [modelName] VARCHAR(255) NOT NULL,
 [modelKey] INT,
 [serverDirectory] VARCHAR(255),
 [serverFile] VARCHAR(255),
 [serverFileExt] VARCHAR(255),
 [serverFileName] VARCHAR(255),
 [clientDirectory] VARCHAR(255),
 [clientFile] VARCHAR(255),
 [clientFileExt] VARCHAR(255),
 [clientFileName] VARCHAR(255),
 [contentType] VARCHAR(255),
 [contentSubType] VARCHAR(255),
 [createdat] DATETIME,
 [updatedat] DATETIME,
 [deletedat] DATETIME
);
