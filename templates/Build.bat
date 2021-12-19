@echo off
setlocal EnableDelayedExpansion

:: ==============================================================================
:: 
::      make.bat
::
::   This script is part of codecastor build wrappers.
:: 
::   Example:  To build in Debug, x64:
::             .\make.bat /t Build /c Debug /p x64
::
:: ==============================================================================
::   codecastor - made in quebec 2020 <codecastor@icloud.com>
:: ==============================================================================

goto :init

:init
    set "__script_file=%~0"
    set "__script_path=%~dp0"
    set "__makefile=%__script_path%\make.bat"
    set "__lib_out=%__script_path%batlibs\out.bat"
    set "__lib_out=%__script_path%batlibs\out.bat"
    set "__ini_agent=%__script_path%cfg\agent.ini"
    set "__ini_ctrl=%__script_path%cfg\svcctrl.ini"
    set "__build_cancelled=0"
    goto :build_all_debug

:: ==============================================================================
::   Build an external library, located in /externals/... corelib, netlib
:: ==============================================================================
:build_external
    set lib=%1
    set config=%2
    set platform=%3
    pushd ..\..\externals\%lib%\scripts
    call make.bat /t Build /c %config% /p %platform%
    popd
    goto :eof

:: ==============================================================================
::   Build main project files: agent, svcctrl
:: ==============================================================================
:build_projects
    set config=%1
    set platform=%2
    call %__makefile% /i %__ini_agent% /t Build /c %config% /p %platform%
    call %__makefile% /i %__ini_ctrl% /t Build /c %config% /p %platform%
    goto :finished

:: ==============================================================================
::   Build everything
:: ==============================================================================
:build_all_debug
    call :build_external corelib Debug x86
    call :build_external netlib Debug x86
    call :build_projects Debug x86

:finished
    call %__lib_out% :__out_d_grn "*   *   *   *   *   build complete   *   *   *   *   *"
