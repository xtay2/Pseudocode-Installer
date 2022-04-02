@echo off
if "%1" == "help" goto help

if "%1" == "run" goto execute
if "%1" == "format" goto execute

if "%1" == "uninstall" goto uninstall

:invalid
echo Invalid command. Execute "pseudocode help" for help.
exit

:help
echo:
echo --------HELP--------
echo - To format and run a project, navigate to the project-dir and execute "pseudocode run".
echo - To delete pseudocode and all your libraries, execute "pseudocode uninstall".
echo --------------------
echo:
exit

:execute
java -jar --enable-preview "%ProgramFiles%/Pseudocode/interpreter.jar" "%ProgramFiles%/Pseudocode/lib" "%CD%" %1 %2 %3 %4 %5
exit

:uninstall
echo Administrative permissions required. Detecting permissions...
net session >nul 2>&1
if %errorLevel% == 0 (
	echo Success: Administrative permissions confirmed.
) else (
	echo Failure: Current permissions inadequate.
	pause >nul
    exit
)
echo Please confirm, that you want to uninstall pseudocode, including all your libraries.
choice /c yn
if %errorlevel%==1 goto confirmUninstall
if %errorlevel%==2 goto abortUninstall
exit

:confirmUninstall
rmdir "%ProgramFiles%/Pseudocode" /Q /S 
(goto) 2>nul & del "%~f0"
echo Successfully uninstalled pseudocode.
pause
exit

:abortUninstall
echo Aborted the uninstallation.
pause
exit
