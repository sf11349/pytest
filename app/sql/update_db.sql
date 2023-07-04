-- build person
MERGE INTO [dbo].[person] p
USING [dbo].[data_source] s
ON p.nhs_no = s.nhs_no
WHEN MATCHED THEN
	UPDATE SET
	   [name] = s.name
WHEN NOT MATCHED BY TARGET THEN
	INSERT ([name]
            ,[nhs_no]
)
     VALUES
          (s.name
          ,s.nhs_no
);

-- build person_event
WITH stg 
 AS
  (
     SELECT 
          person_id = p.person_id,
          event_id= e.event_id,
          event_date = ds.event_date
     FROM dbo.data_source ds 
     INNER JOIN dbo.person p ON ds.nhs_no = p.nhs_no 
     INNER JOIN dbo.event e ON ds.event = e.event_name
  )

MERGE INTO [dbo].[person_event] pe
USING stg ON     
     pe.event_id = stg.event_id AND 
     pe.person_id = stg.person_id

WHEN MATCHED THEN
	UPDATE SET
	   [event_date] = stg.event_date
WHEN NOT MATCHED BY TARGET THEN
	INSERT (person_id,
             event_id,
             event_date
          )
     VALUES
          (stg.person_id,
          stg.event_id,
          stg.event_date
);



