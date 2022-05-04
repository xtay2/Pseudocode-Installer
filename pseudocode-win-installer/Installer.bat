@echo off
set mypath=%~dp0
cd %mypath%

echo Administrative permissions required. Detecting permissions...
    
net session >nul 2>&1
if %errorLevel% == 0 (
	echo Success: Administrative permissions confirmed.
	goto start
) else (
	echo Failure: Current permissions inadequate.
	pause >nul
	exit
)

:start
for /F "tokens=*" %%g IN ('javac -version') do (set version=%%g)
if "%version:~6,2%" neq "18" goto invalidJava
goto success


:invalidJava
echo "Your system needs to install Java 18 to run this software."
echo Do you want to install jdk18 from the official Oracle website?
choice /c yn
if %errorlevel%==1 goto install
if %errorlevel%==2 goto abort


:abort
echo Aborted installation. Please install/update Java to use this software.
pause
exit

:install
curl.exe -o jdk18_installer.msi https://download.oracle.com/java/18/latest/jdk-18_windows-x64_bin.msi
start jdk18_installer.msi
echo Please continue, when the installation has finished.
pause
echo Setting JAVA_HOME
set JAVA_HOME=C:\Program Files\Java\jdk-18
echo setting PATH
set PATH=C:\Program Files\Java\jdk-18\bin;%PATH%
java -version
del jdk18_installer.msi
goto success


:success
rmdir "%ProgramFiles%\Pseudocode" /s /q
xcopy "%mypath%\installer-package" "%ProgramFiles%\Pseudocode" /E/H/C/I
xcopy "%mypath%\pseudocode.cmd" "%windir%\pseudocode.cmd"*
echo ---------------------------------------
echo Installation did successfully finish!
echo ---------------------------------------
echo Do you want to automatically update the Pseudocode interpreter on startup?
echo (This isn't very memory/network-intensive and should take less than 10 seconds.)
choice /c yn
if %errorlevel%==2 goto end
SCHTASKS /CREATE /SC ONSTART /TN "Pseudocode Update" /TR "%ProgramFiles%\Pseudocode"

:end
pause