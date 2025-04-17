@echo off
setlocal ENABLEDELAYEDEXPANSION

echo Scanning for files larger than 50MB...

:: Loop through all files
for /R %%F in (*) do (
    set "file=%%F"
    for %%A in ("%%F") do set "size=%%~zA"
    
    :: Check if file is larger than 50MB (50 * 1024 * 1024 = 52428800)
    if !size! GTR 52428800 (
        set "ext=%%~xF"
        if not "!ext!"=="" (
            git lfs track "*!ext!"
        )
    )
)

echo Done tracking large files.
pause
