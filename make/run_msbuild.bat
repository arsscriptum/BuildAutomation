@echo off
setlocal EnableDelayedExpansion

:: ==============================================================================
:: 
::   run_msbuild.bat
:: 
::   VERSION:  1.0.1
::
::
:: ==============================================================================
::   codecastor - made in quebec 2020 <codecastor@icloud.com>
:: ==============================================================================

goto :init


:init
    set "__script_name=%~n0"
    set "__script_version=1.0"

    set "__script_file=%~0"
    set "__script_path=%~dp0"

	set "__solution_file=%1"
	set "__target=%2"
	set "__configuration=%3"
	set "__platform=%4"
	set "__project=%5"
	set "__target_opt=/t:%__project%:%__target%"
	if [%5]==[] set "__target_opt=/t:%__target%"

	set "__compiler=%__script_path%run_compiler.bat"
    set "__lib_out=%__script_path%out.bat"
    set "__lib_date=%__script_path%date.bat"
    goto :validate

:validate
	if not exist %__compiler% goto error_no_compiler_script %__compiler%

:build
	call %__compiler% %__solution_file% /property:Configuration=%__configuration% /property:Platform=%__platform% %__target_opt%
	echo Return code: %ERRORLEVEL%
	IF %ERRORLEVEL% NEQ 0 (
        call :error_build_failed %ERRORLEVEL%
	    goto :eof
        )
    goto :exit_with_success
    goto :eof

:error_no_compiler_script
    echo.
    call %__lib_out% :__out_l_red "   %__script_name% Error"
    call %__lib_out% :__out_d_yel  "   no compiler script: %~1"
    echo.
    goto :eof

:error_build_failed
    echo.
    call %__lib_out% :__out_l_red "   %__script_name% Error: compiler returned %~1"
    echo.
  	exit /B %ERRORLEVEL%
    goto :eof


:exit_with_success
    echo.
    call %__lib_out% :__out_d_grn  " %__script_name% build was completed with success: %__solution_file% %__configuration% %__platform%"
    echo.
	exit /B 0