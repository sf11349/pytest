DROP TABLE IF EXISTS dbo.event
CREATE TABLE  dbo.event (
    event_id INT PRIMARY KEY,
    event_name   VARCHAR (50)
);
GO

INSERT INTO dbo.event (event_id,event_name)
SELECT 1,'CONTACT' UNION ALL
SELECT 2,'VACCINE'

GO