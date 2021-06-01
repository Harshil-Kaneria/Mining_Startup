@echo off

Set "DRIVE=D:"
Set "DEST=D:\Mining_Directory\"
Set "FILE=ethermine.bat"

SETLOCAL EnableExtensions DisableDelayedExpansion
for /F %%a in ('echo prompt $E ^| cmd') do (
  set "ESC=%%a"
)
SETLOCAL EnableDelayedExpansion

echo %ESC%[33mPlease Wait We Are Checking Internet Connection%ESC%[0m && echo. && timeout 5

:loop
Ping www.google.com -n 1 -w 1000
cls
if errorlevel 1 (echo %ESC%[31mNot connected to internet%ESC%[0m && echo. && echo %ESC%[33mPlease Wait We Are Checking Internet Connection%ESC%[0m && echo. && timeout 5) else (echo %ESC%[32mConnected to internet%ESC%[0m && echo. && echo %ESC%[36mPlease Wait We Are Starting Mining%ESC%[0m && echo. && timeout 5 && %DRIVE% && cd %DEST% && start /max %FILE% && exit)
goto loop