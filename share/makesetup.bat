@echo off

set MAKENSIS="C:\Program Files (x86)\NSIS\makensis.exe"
if not exist %MAKENSIS% goto nonsis
%MAKENSIS% makesetup.nsi
goto end

:nonsis
echo Error: %MAKENSIS% not found
echo Please download and install NSIS 2.46 from:
echo   http://nsis.sourceforge.net/download

:end