DROP TABLE IF EXISTS dbo.person_event;
CREATE TABLE  dbo.person_event 
(
  person_event_id INT IDENTITY(1,1) PRIMARY KEY,
  person_id INT,
  event_id INT 
)

GO