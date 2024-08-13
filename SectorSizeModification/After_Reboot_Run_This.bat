@echo off
REG QUERY "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters\Device" /v "ForcedPhysicalSectorSizeInBytes"
echo Please check the value that if it is 4095
echo Patch made by Zahid Abdullah
PAUSE
