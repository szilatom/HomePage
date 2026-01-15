@echo off
echo.
echo === SMBNexIT HomePage HTTP Server ===
echo.
echo A weboldal elérhető lesz: http://localhost:8080
echo.
echo Nyomjon Ctrl+C-t a szerver leállításához.
echo.

REM Try different HTTP server options
if exist "%~dp0node_modules\.bin\http-server.cmd" (
    echo Npx http-server használata...
    "%~dp0node_modules\.bin\http-server.cmd" -p 8080 -o
) else (
    REM Try global http-server
    where /q http-server
    if %ERRORLEVEL% EQU 0 (
        echo HTTP-server használata...
        http-server -p 8080 -o
    ) else (
        REM Try Python
        where /q python
        if %ERRORLEVEL% EQU 0 (
            echo Python HTTP szerver használata...
            echo Weboldal elérhető: http://localhost:8080
            python -m http.server 8080
        ) else (
            REM Try Node.js with npx
            where /q npx
            if %ERRORLEVEL% EQU 0 (
                echo NPX http-server telepítése és indítása...
                npx http-server -p 8080 -o
            ) else (
                echo.
                echo HIBA: Nem található megfelelő HTTP szerver!
                echo.
                echo Kérjük telepítse az alábbiak egyikét:
                echo 1. Node.js: npm install -g http-server
                echo 2. Python 3.x
                echo.
                echo Vagy nyissa meg a mappát VS Code-ban és használja a Live Server bővítményt.
                echo.
                pause
            )
        )
    )
)