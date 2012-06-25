
CREATE TABLE [credit_requests] (
 [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
 [type] VARCHAR(255),
 [activityId] INT NOT NULL,
 [personId] INT,
 [attendeeId] INT,
 [name] VARCHAR(255) NOT NULL,
 [phone] VARCHAR(255),
 [email] VARCHAR(255),
 [code] VARCHAR(255),
 [recordHash] VARCHAR(255) NOT NULL,
 [createdat] DATETIME,
 [updatedat] DATETIME,
 [deletedat] DATETIME
);
CREATE UNIQUE INDEX [ix_request_recordHash] ON [credit_requests]([recordHash]);
