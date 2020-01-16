:: Backing up my work related files
set backupfolder="J:\TSD\Julian Orchard\C Backup"
if not exist %backupfolder% (mkdir %backupfolder%)

:: Loop through backup folder 
for /f "usebackq tokens=*" %%a in ("bkps.txt") do (
  robocopy /e %%a %backupfolder%
)

