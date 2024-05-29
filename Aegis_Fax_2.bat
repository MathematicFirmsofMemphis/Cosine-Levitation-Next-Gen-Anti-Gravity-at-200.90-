@echo off
title AEGIS FAX II Management System
color 1F

:: Initialize variables
set cargo=0
set fuel=100
set engine_status=off

:main_menu
cls
echo ==================================================
echo            Welcome to AEGIS FAX II Management
echo ==================================================
echo 1. Login
echo 2. Exit
echo ==================================================
set /p choice="Please choose an option (1-2): "

if %choice%==1 goto login
if %choice%==2 goto exit
goto main_menu

:login
cls
set /p user="Enter Pilot Name: "
set /p pass="Enter Password: "
echo Authenticating...
:: Simulating a database check for username and password
if "%user%"=="pilot" if "%pass%"=="evepassword" (
    echo Authentication successful!
    pause
    goto ship_menu
) else (
    echo Invalid username or password. Please try again.
    pause
    goto main_menu
)

:ship_menu
cls
echo ==================================================
echo                Control Panel
echo ==================================================
echo 1. Check Cargo
echo 2. Load Container
echo 3. Unload Container
echo 4. Engine Management
echo 5. Enable Welding Laser
echo 6. Disable Welding Laser
echo 7. Log Out
echo ==================================================
set /p ship_choice="Please choose an option (1-7): "

if %ship_choice%==1 goto check_cargo
if %ship_choice%==2 goto load_container
if %ship_choice%==3 goto unload_container
if %ship_choice%==4 goto engine_management
if %ship_choice%==5 goto enable_welding_laser
if %ship_choice%==6 goto disable_welding_laser
if %ship_choice%==7 goto main_menu
goto ship_menu

:enable_welding_laser
cls
echo Enabling welding laser...
echo Welding laser enabled.
pause
goto ship_menu

:disable_welding_laser
cls
echo Disabling welding laser...
echo Welding laser disabled.
pause
goto ship_menu

:check_cargo
cls
echo Current cargo: %cargo% containers
pause
goto ship_menu

:load_container
cls
set /a cargo+=1
echo Loading container...
echo Container loaded. Current cargo: %cargo% containers
pause
goto ship_menu

:unload_container
cls
if %cargo% LEQ 0 (
    echo No containers to unload.
) else (
    set /a cargo-=1
    echo Unloading container...
    echo Container unloaded. Current cargo: %cargo% containers
)
pause
goto ship_menu

:engine_management
cls
echo ==================================================
echo                Engine Management
echo ==================================================
echo 1. Check Fuel Level
echo 2. Refuel
echo 3. Start Engine
echo 4. Stop Engine
echo 5. Back to Control Panel
echo ==================================================
set /p engine_choice="Please choose an option (1-5): "

if %engine_choice%==1 goto check_fuel
if %engine_choice%==2 goto refuel
if %engine_choice%==3 goto start_engine
if %engine_choice%==4 goto stop_engine
if %engine_choice%==5 goto ship_menu
goto engine_management

:check_fuel
cls
echo Current fuel level: %fuel% units
pause
goto engine_management

:refuel
cls
set /a fuel=100
echo Refueling...
echo Fuel tank is now full. Current fuel level: %fuel% units
pause
goto engine_management

:start_engine
cls
if %engine_status%==on (
    echo Engine is already running.
) else (
    if %fuel% LEQ 0 (
        echo Insufficient fuel to start the engine.
    ) else (
        set engine_status=on
        echo Starting engine...
        echo Engine started. Current fuel level: %fuel% units
    )
)
pause
goto engine_management

:stop_engine
cls
if %engine_status%==off (
    echo Engine is already stopped.
) else (
    set engine_status=off
    echo Stopping engine...
    echo Engine stopped.
)
pause
goto engine_management

:exit
cls
echo Thank you for using the AEGIS FAX II Management System. Fly safe!
pause
exit
