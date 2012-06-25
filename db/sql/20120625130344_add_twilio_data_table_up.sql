
CREATE TABLE [twilio_log] (
 [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
 [type] VARCHAR(255),
 [data] TEXT,
 [createdat] DATETIME,
 [updatedat] DATETIME,
 [deletedat] DATETIME
);
