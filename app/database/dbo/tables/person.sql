DROP TABLE IF EXISTS dbo.person
CREATE TABLE  dbo.person (
    person_id INT IDENTITY (1, 1) PRIMARY KEY,
    name     VARCHAR (50),
    nhs_no VARCHAR (10)
);
GO