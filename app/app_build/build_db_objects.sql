
-- setting -------------------------------------------------------------------------------------------------------
-- USE THE PATH FOR DATABASE SQL FILES. EG 
-- :setvar dir "C:\......\pytest\app\database"
-- :connect myserver
-- use [mydb]

:setvar dir	"..."
:connect ...
use [...]
-----------------------------------------------------------------------------------------------------------------------------
--SET NOEXEC ON;

Select getdate() as 'Script_Started'

-- dbo 
:r $(dir)\dbo\tables\"person.sql"
:r $(dir)\dbo\tables\"event.sql"
:r $(dir)\dbo\tables\"person_event.sql"
:r $(dir)\dbo\tables\"data_source.sql"


-- end of execution
SELECT 'OK' As End_Of_Execution

Select getdate() as 'Script_Finished'
