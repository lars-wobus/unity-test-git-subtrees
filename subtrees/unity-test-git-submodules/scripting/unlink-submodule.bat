:: Example scripting\unlink-submodule DummyProject\Assets\com.company.product
SET SymlinkTarget=%1

IF [%SymlinkTarget%] == [] GOTO :missingTarget

rmdir %SymlinkTarget%
del %SymlinkTarget%.meta

CALL %~dp0\config.bat

SET SymlinkTarget=%SymlinkTarget:\=/%
type %GitignoreFile% | find /v "%SymlinkTarget%/*" | find /v "!%SymlinkTarget%/.keep" > %GitignoreFile%

GOTO :EOF


:missingTarget
ECHO "Missing target location"
GOTO :EOF