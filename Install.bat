@echo off

rem Get the "Documents" directory.
FOR /F "tokens=2* delims= " %%A IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Personal"') DO SET Documents=%%B
set OUTPUT=%Documents%\maya\modules\zDsonImport.mod
set INSTALL_DIR=%cd%

rem Create the global modules directory if it doesn't exist.
if not exist %Documents%\maya\modules mkdir %Documents%\maya\modules

rem Create the .mod file in the user's Maya modules directory.
echo + zDsonImport 1.0 %INSTALL_DIR% > %OUTPUT%
echo MAYA_CUSTOM_TEMPLATE_PATH +:= scripts/NETemplates >> %OUTPUT%

echo Installed
pause
