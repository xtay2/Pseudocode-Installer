@echo off

FOR /F "tokens=2* skip=2" %%a in ('reg query "HKLM\SOFTWARE\Pseudocode Language\Pseudocode Interpreter" /v "Path"') do set pcPath=%%b\Pseudocode

if "%1" == "run" goto execute
if "%1" == "format" goto execute

:help
echo:
echo ----------------------------------------------------------------------------------------------------------
echo Execution
echo   - To format and run a project, navigate to the project-dir and execute "pseudocode run".
echo   - To just format a project, navigate to the project-dir and execute "pseudocode format".
echo ----------------------------------------------------------------------------------------------------------
echo:
pause
exit

:execute
java -jar --enable-preview "%pcPath%/Interpreter.jar" "%pcPath%/lib" "%CD%" %1 %2 %3 %4 %5
exit
