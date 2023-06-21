DROP TABLE IF EXISTS dbo.person
CREATE TABLE  dbo.person (
    person_id INT IDENTITY (1, 1) PRIMARY KEY,
    fname     VARCHAR (50),
    lname     VARCHAR (50),
    postcode  VARCHAR (10)
);
GO