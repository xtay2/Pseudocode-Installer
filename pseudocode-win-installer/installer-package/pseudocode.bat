@echo off
java -jar --enable-preview "%~dp0Interpreter.jar" "%~dp0lib" "%~1"
pause