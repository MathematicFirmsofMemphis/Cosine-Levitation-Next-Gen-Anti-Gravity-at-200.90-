@echo off
setlocal enabledelayedexpansion

rem Simulate FPS counter by waiting 0.1 seconds between calculations
set waitTime=0.1

rem Loop through values from 1 to 400
for /L %%i in (1,1,400) do (
    rem Clear the screen
    cls

    rem Calculate the cosine using PowerShell
    for /f %%c in ('powershell -command "[math]::cos(%%i)"') do (
        set cosValue=%%c
    )

    rem Display the FPS counter and cosine value
    echo FPS: %%i
    echo Cosine of %%i = !cosValue!

    rem Wait for a short period to simulate FPS (100 milliseconds)
    powershell -command "Start-Sleep -Seconds %waitTime%"
)

rem Add 4 processes of cos(1:400)
for /L %%j in (1,1,4) do (
    rem Calculate the cosine using PowerShell
    for /L %%i in (1,1,400) do (
        for /f %%c in ('powershell -command "[math]::cos(%%i)"') do (
            set cosValue=%%c
        )
    )

    rem Display the FPS counter and cosine value
    echo FPS: %%i
    echo Cosine of %%i = !cosValue!

    rem Wait for a short period to simulate FPS (100 milliseconds)
    powershell -command "Start-Sleep -Seconds %waitTime%"
)

setlocal enabledelayedexpansion
echo.
echo Press any key to exit...
pause > nul
endlocal
