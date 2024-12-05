@echo off
SET /P appPath="Enter the full path of the application: "
SET "shortcutName=%~n1"
SET script="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

:: Create a VBScript file to make the shortcut
echo Set oWS = WScript.CreateObject("WScript.Shell") > %script%
echo sLinkFile = "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\" ^& "%shortcutName%.lnk" >> %script%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %script%
echo oLink.TargetPath = ^"%appPath%" >> %script%
echo oLink.WindowStyle = 3 >> %script%
echo oLink.Save >> %script%

:: Run the VBScript to create the shortcut
cscript /nologo %script%
del %script%

:: Run the application with high priority
start "" /max /high "%appPath%"