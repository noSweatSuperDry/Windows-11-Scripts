echo This manages the physical sector size for nvme devices. By setting the ForcedPhysicalSectorSizeInBytes value to 4095, you are forcing the system to emulate a sector size of 4095 bytes, which can help resolve compatibility issues with certain applications, such as SQL Server.

echo Patch made by Zahid Abdullah.

REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters\Device" /v "ForcedPhysicalSectorSizeInBytes" /t REG_MULTI_SZ /d "* 4095" /f

REG QUERY "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters\Device" /v "ForcedPhysicalSectorSizeInBytes"

REM Ask for permission to restart
set /p restart=Do you want to restart the PC? (y/n): 
if /i "%restart%"=="y" (
    shutdown /r /t 0
) else (
    echo Restart canceled.
)
