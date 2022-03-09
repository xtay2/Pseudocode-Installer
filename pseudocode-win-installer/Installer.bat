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
)
    
    pause >nul

:start
for /F "tokens=*" %%g IN ('javac -version') do (set version=%%g)
if "%version:~6,2%" neq "17" goto invalidJava
goto success


:invalidJava
echo "Your system needs to install Java 17 to run this software."
echo Do you want to install jdk17 from the official Oracle website?
choice /c yn
if %errorlevel%==1 goto install
if %errorlevel%==2 goto abort


:abort
echo Aborted installation. Please install/update Java to use this software.
pause
exit

:install
curl.exe -o jdk17_installer.msi https://download.oracle.com/java/17/latest/jdk-17_windows-x64_bin.msi
start jdk17_installer.msi
echo Please continue, when the installation has finished.
pause
echo Setting JAVA_HOME
set JAVA_HOME=C:\Program Files\Java\jdk-17
echo setting PATH
set PATH=C:\Program Files\Java\jdk-17\bin;%PATH%
java -version
del jdk17_installer.msi
goto success


:success
rmdir "%ProgramFiles%\Pseudocode" /s /q
xcopy "%mypath%\installer-package" "%ProgramFiles%\Pseudocode" /E/H/C/I
setx path "%path%;%ProgramFiles%\Pseudocode\"
echo Installation did successfully finish!
pause