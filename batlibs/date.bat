@echo off
call %*
goto :EOF

:: ==============================================================================
:: 
::   date.bat
:: 
:: ==============================================================================
::   arsccriptum - made in quebec 2020 <guillaumeplante.qc@gmail.com>
:: ==============================================================================

:init
    for /f "tokens=2 delims==" %%G in ('wmic os get localdatetime /value') do set datetime=%%G

    set year=%datetime:~0,4%
    set month=%datetime:~4,2%
    set day=%datetime:~6,2%
    set hour=%datetime:~8,2%
    set minute=%datetime:~10,2%
    set second=%datetime:~12,2%
    goto :eof


:getbuilddate
    call :init
    set __build_date=" %day%/%month% %year% at %hour%:%minute%:%second%"
    set "__current_date_string=%day%/%month% %year% at %hour%:%minute%:%second%"
    goto :eof
    
:getuniqueid
    echo %year%%month%%day%_%hour%%minute%%second%
    goto :eof

:printbuilddate
    call :init
    set __build_date=" %day%/%month% %year% at %hour%:%minute%:%second%"
    echo %__build_date%
    goto :eof