DROP TABLE IF EXISTS dbo.data_source;
CREATE TABLE dbo.data_source
( 
    name VARCHAR(50),
    nhs_no VARCHAR(10) NOT NULL,
    event VARCHAR(20) NOT NULL,
    event_date DATE
);

INSERT INTO dbo.data_source (name,nhs_no,event,event_date)
SELECT 'Shawan','123456','CONTACT',GETDATE() UNION ALL
SELECT 'Joe','00000000','VACCINE',GETDATE();