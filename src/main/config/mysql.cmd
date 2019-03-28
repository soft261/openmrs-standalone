@echo off
for /f "tokens=1" %%a in ('findstr connection.password openmrs-standalone-runtime.properties') do (set "password=%%a")
set "password=%password:~20%"
database\bin\mysql -u openmrs --password="%password%" --socket=temp\openmrs.sock --max_allowed_packet=96M --port=3316

