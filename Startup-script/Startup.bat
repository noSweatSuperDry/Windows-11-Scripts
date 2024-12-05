@echo off
SET script="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

:: Create a VBScript file to make the shortcut, xyz is the folder or program name.
echo Set oWS = WScript.CreateObject("WScript.Shell") > %script%
echo sLinkFile = "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\xyz.lnk" >> %script%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %script%
echo oLink.TargetPath = "C:\Program Files (x86)\xyz\xyz.exe" >> %script%
echo oLink.WindowStyle = 3 >> %script%
echo oLink.Save >> %script%

:: Run the VBScript to create the shortcut
cscript /nologo %script%
del %script%

:: Run the application with high priority
start "" /max /high "C:\Program Files (x86)\xyz\xyz.exe"