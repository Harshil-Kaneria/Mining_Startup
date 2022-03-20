@echo off
set count_val=10
set checktime=30
set /a count=0
:internetcall
color 03
Ping 8.8.8.8 -n 1 -w 1000
cls
echo Checking Internet Connection
if errorlevel 1 (color 04 && echo Not connected to internet && set /a count+=1 && echo %count% && if %count_val% LEQ %count% ( echo ShutDown PC && timeout 05 && start shutdown /s /t 05 && exit )) else (color 02 && echo Connected to internet && set /a count=0)
timeout %checktime%
goto :internetcall