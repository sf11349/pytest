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


