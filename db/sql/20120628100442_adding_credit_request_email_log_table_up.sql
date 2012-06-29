
CREATE TABLE [credit_request_emails] (
 [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
 [emailId] INT,
 [emailDate] DATETIME,
 [emailFrom] VARCHAR(255) NOT NULL,
 [messagenumber] INT,
 [emailReplyto] VARCHAR(255),
 [emailSubject] VARCHAR(255),
 [emailTo] VARCHAR(255),
 [emailSize] INT,
 [isProcessed] INT,
 [createdat] DATETIME,
 [updatedat] DATETIME,
 [deletedat] DATETIME
);
