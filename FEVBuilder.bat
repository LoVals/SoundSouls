@echo off
ds
title FEV Build Utility
:start
cls
color A
echo.
echo what version of FMOD Designer are you running?
echo A. V4.28
echo B. V4.44
echo.
echo.
set /p p=Make your choice:
IF '%p%' == '%p%' GOTO Item_%p%

:Item_A
echo what would you like to do? (USING FMOD 4.28)
echo 1. regenerate target FEV files
echo 2. regenerate all FEV files (recommended)
echo 3. Finish soundbank generation process without regenerating FEV files
echo.
echo.
set /p x=Make your choice:
IF '%x%' == '%x%' GOTO Item_%x%
ELSE GOTO Item_3

:Item_1
cls
:reset
echo Input the name of the target
set /p Input=Enter SoundBank:
%~dp0\FEVBuilder_4.28\fmod_designercl.exe %~dp0\SoundBones\%Input%.fdp -pc -b %~dp0\Build\FmodEvents
del /s /q "%~dp0\Build\FmodEvents\*.fsb
pause
:temp

CHOICE /C YN /M "Would you like to generate another target?" 
IF ERRORLEVEL 2 GOTO quit	
IF ERRORLEVEL 1 GOTO reset
:quit
echo process completed
pause
exit

:Item_2
del /s /q "%~dp0\Build\FmodEvents\*.*
cls
cd %~dp0\SoundBones\
echo Gathering SoundBones:
forfiles /c "cmd /c %~dp0\FEVBuilder_4.28\fmod_designercl.exe @fname.@ext -pc -b %~dp0\Build\FmodEvents

del /s /q "%~dp0\Build\FEVBuilder_4.28\*.fsb
pause
exit

:Item_3
exit

:Item_B
echo what would you like to do? (USING FMOD 4.44)
echo 1. regenerate target FEV files
echo 2. regenerate all FEV files (recommended)
echo 3. Finish soundbank generation process without regenerating FEV files
echo.
echo.
set /p x=Make your choice:
IF '%x%' == '%x%' GOTO Item_%x%
ELSE GOTO Item_3

:Item_1
cls
:reset
echo Input the name of the target
set /p Input=Enter SoundBank:
%~dp0\FEVBuilder_4.44\fmod_designercl.exe %~dp0\SoundBones\%Input%.fdp -pc -b %~dp0\Build\FmodEvents
del /s /q "%~dp0\Build\FmodEvents\*.fsb
pause
:temp

CHOICE /C YN /M "Would you like to generate another target?" 
IF ERRORLEVEL 2 GOTO quit	
IF ERRORLEVEL 1 GOTO reset
:quit
echo process completed
pause
exit

:Item_2
del /s /q "%~dp0\Build\FmodEvents\*.*
cls
cd %~dp0\SoundBones\
echo Gathering SoundBones:
forfiles /c "cmd /c %~dp0\FEVBuilder_4.44\fmod_designercl.exe @fname.@ext -pc -b %~dp0\Build\FmodEvents

del /s /q "%~dp0\Build\FEVBuilder_4.44\*.fsb
pause
exit

:Item_3
exit
