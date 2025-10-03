@echo off
start "" "(location of a SHORTCUT to the game, booting exe directly will cause some weird ass driver error)"

:: Wait a moment to ensure the game has launched
:: nul skips waiting 2 secs message
timeout /t 2 >nul 

:: Get the game's process PID
:: tokens=2 gets the second token - PID of the game and it's stored - every instance of shadow.exe gets overwritten by next one but there's hopefully at least one instance and only one instance
for /f "tokens=2" %%i in ('tasklist /fi "imagename eq shadow.exe" ^| find /i "shadow.exe"') do set GamePID=%%i

:: Start the AutoHotkey script (SOM_remap.ahk)
start "" "(path of .ahk remap file on your pc)"

:: Wait until the game process (shadow.exe) exits
:waitloop
timeout /t 1 >nul
tasklist /fi "pid eq %GamePID%" | find "%GamePID%" >nul
if not errorlevel 1 (
goto waitloop
)

:: Game closed — now kill the AHK script
taskkill /f /im AutoHotkey64.exe