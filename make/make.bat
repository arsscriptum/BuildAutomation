    @echo off
setlocal EnableDelayedExpansion

:: ==============================================================================
:: 
::   make.bat
::
::   This script is part of ars scriptum build wrappers.
:: 
::   Example:  To build in Debug, x64:
::             .\make.bat /t Build /c Debug /p x64
::
::   VERSION:  1.0.1
::
:: ==============================================================================
::   arsccriptum - made in quebec 2020 <guillaumeplante.qc@gmail.com>
:: ==============================================================================

goto :init

:header
    echo. %__script_name% v%__script_version%
    echo.    This script is part of ars scriptum build wrappers.
    echo.
    goto :eof

:usage
    echo. Usage:
    echo. %__script_name% [flags] 
    echo.
    echo.      /?, --help           shows this help
    echo.      /e, --verbose        shows detailed output
    echo.      -l, --log file       specifies a log file to use
    echo.      -i, --ini file       specifies a configuration file to use
    echo.      /t, --target         build target (Build,Rebuild, Clean)
    echo.      /c, --config         build config (Debug, Release,...)
    echo.      /p, --platform       build platform (x86, x64)
    echo.
    goto :eof

:notes
    echo Notes:
    echo     - This file should not be edited, there's a configuration file in the
    echo       cfg directory for that purpose. If you need to debug, use the verbose
    echo       option (/v) and check the output.
    echo.
    echo.
    goto :eof


:missing_argument
    call :header
    call :usage
    call :error_missing_arguments
    echo.
    goto :eof

:init
    set "__script_name=%~n0"
    set "__script_version=1.0"

    set "__script_file=%~0"
    set "__script_path=%~dp0"

    set "__opt_help="
    set "__opt_version="
    set "__opt_verbose="
    set "__path_cd=%cd%"

    set "__scripts_root=%AutomationScriptsRoot%"
    call :read_script_root development\build-automation  BuildAutomation
   

    set "__iniconfig_file="
    set "__log_path=%__script_path%log"
    set "__bin_path=%cd%\bin"
    set __log_file=""
    
    set "__lib_out=%__scripts_root%\batlibs\out.bat"
    set "__lib_date=%__scripts_root%\batlibs\date.bat"
	for /f %%i in ('C:\\Programs\\Git\\cmd\\git.exe rev-parse HEAD') do (
            set "__current_git_revision=%%i"
        )

:parse
    if "%~1"=="" goto :checklibs

    if /i "%~1"=="/?"         call :header & call :usage & call :notes "%~2" & goto :end
    if /i "%~1"=="-?"         call :header & call :usage & call :notes "%~2" & goto :end
    if /i "%~1"=="/h"         call :header & call :usage & call :notes "%~2" & goto :end
    if /i "%~1"=="-h"         call :header & call :usage & call :notes "%~2" & goto :end
    if /i "%~1"=="--help"     call :header & call :usage & call :notes "%~2" & goto :end

    if /i "%~1"=="/v"         set "__opt_verbose=yes"  & shift & goto :parse
    if /i "%~1"=="-v"         set "__opt_verbose=yes"  & shift & goto :parse
    if /i "%~1"=="--verbose"  set "__opt_verbose=yes"  & shift & goto :parse

    if /i "%~1"=="-i"         set "__iniconfig_file=%~2"   & shift & shift & goto :parse
    if /i "%~1"=="/i"         set "__iniconfig_file=%~2"   & shift & shift & goto :parse
    if /i "%~1"=="--ini"      set "__iniconfig_file=%~2"   & shift & shift & goto :parse

    if /i "%~1"=="-l"         set "__log_file=%~2"   & shift & shift & goto :parse
    if /i "%~1"=="/l"         set "__log_file=%~2"   & shift & shift & goto :parse
    if /i "%~1"=="--log"      set "__log_file=%~2"   & shift & shift & goto :parse

    if /i "%~1"=="-t"         set "__target=%~2"   & shift & shift & goto :parse
    if /i "%~1"=="/t"         set "__target=%~2"   & shift & shift & goto :parse
    if /i "%~1"=="--target"   set "__target=%~2"   & shift & shift & goto :parse

    if /i "%~1"=="-p"         set "__platform=%~2"   & shift & shift & goto :parse
    if /i "%~1"=="/p"         set "__platform=%~2"   & shift & shift & goto :parse
    if /i "%~1"=="--platform" set "__platform=%~2"   & shift & shift & goto :parse

    if /i "%~1"=="-x"         set "__exportpath=%~2"   & shift & shift & goto :parse
    if /i "%~1"=="/x"         set "__exportpath=%~2"   & shift & shift & goto :parse
    if /i "%~1"=="--export"   set "__exportpath=%~2"   & shift & shift & goto :parse

    if /i "%~1"=="-c"         set "__configuration=%~2"   & shift & shift & goto :parse
    if /i "%~1"=="/c"         set "__configuration=%~2"   & shift & shift & goto :parse
    if /i "%~1"=="--config"   set "__configuration=%~2"   & shift & shift & goto :parse

    shift
    goto :parse

:checklibs
     if not exist %__lib_out%  call :error_missing_lib %__lib_out% & goto :end
     if not exist %__lib_date% call :error_missing_lib %__lib_date% & goto :end

:setdefaults
    if "" == "%TEMP%" set "TEMP=%SYSTEMDRIVE%\Windows\Temp"

:set_default_logfile
    :: THIS IS NOT USED - IT WAS TO SE A DEFAULT LOG FILE BUT NOT REQUIRED AT THE MOMENT
    ::if not exist %__log_path% (
    ::    echo. Created %__log_path%
    ::    mkdir %__log_path%
    ::    )
    ::if "" == "%__log_file%" set "__log_file=make.log"

:: ==============================================================================
::   read_ini_config
:: ==============================================================================
:read_ini_config

    FOR /F "tokens=1,2 delims==" %%i in ('findstr /I "PROJECT_NAME" %__iniconfig_file%')     do set PROJECT_NAME=%%j
    FOR /F "tokens=1,2 delims==" %%i in ('findstr /I "PROJECT_FILE" %__iniconfig_file%')     do set PROJECT_FILE=%%j
    FOR /F "tokens=1,2 delims==" %%i in ('findstr /I "PROJECT_PATH" %__iniconfig_file%')     do set PROJECT_PATH=%%j  
    FOR /F "tokens=1,2 delims==" %%i in ('findstr /I "EXPORT_PATH" %__iniconfig_file%')      do set EXPORT_PATH=%%j  
    FOR /F "tokens=1,2 delims==" %%i in ('findstr /I "COMPILE_SCRIPT" %__iniconfig_file%')   do set COMPILE_SCRIPT=%%j  

    if not defined __target (
        FOR /F "tokens=1,2 delims==" %%i in ('findstr /I "DEFAULT_BUILD_TARGET" %__iniconfig_file%')   do set __target=%%j  
        call %__lib_out% :__out_n_l_gry "[WARNING] TARGET Not specified on cmd line: Using default build TARGET from ini file."
    )
    if not defined __configuration (
        FOR /F "tokens=1,2 delims==" %%i in ('findstr /I "DEFAULT_BUILD_CONFIGURATION" %__iniconfig_file%')   do set __configuration=%%j  
        call %__lib_out% :__out_n_l_gry "[WARNING] Build CONFIGURATION Not specified on cmd line: Using default build CONFIGURATION from ini file."
        )
    if not defined __platform (
        FOR /F "tokens=1,2 delims==" %%i in ('findstr /I "DEFAULT_BUILD_PLATFORM" %__iniconfig_file%')   do set __platform=%%j  
        call %__lib_out% :__out_n_l_gry "[WARNING] PLATFORM Not specified on cmd line: Using default build PLATFORM from ini file."
        )
    if %__log_file% == "" (
        FOR /F "tokens=1,2 delims==" %%i in ('findstr /I "BUILD_LOG_FILE" %__iniconfig_file%')   do set __log_file=%%j  
        )
:validate
    if not exist %__iniconfig_file%  call :error_missing_iniconfig & goto :end
    if not defined __configuration   call :header & call :usage && call :error_missing_configuration & goto :end
    if not defined __target          call :header & call :usage && call :error_missing_target & goto :end
    if not defined __platform        call :header & call :usage && call :error_missing_platform & goto :end
    goto :build

:: ==============================================================================
::   build
:: ==============================================================================
:build
    echo.
	call %__lib_out% :__out_d_blu " ==================================================================" 
	call %__lib_out% :__out_n_d_cya "  CURRENT GIT REVISION  "
	call %__lib_out% :__out_d_whi "  %__current_git_revision% "
	call %__lib_out% :__out_n_d_cya "  COMPILATION STARTED "
	call %__lib_out% :__out_d_whi "    %__current_date_string% "
	call %__lib_out% :__out_d_blu " ================================================================== "    
    pushd %PROJECT_PATH%
    set PROJECT_FILE_PATH=%cd%
    set PROJECT_FULL_PATH=%PROJECT_FILE_PATH%\%PROJECT_FILE%
    popd

    call :prebuild_header
    if %__log_file% == "" (
        :: log undefined
        call %COMPILE_SCRIPT% %PROJECT_FULL_PATH% %__target% %__configuration% %__platform%
    ) else (
        :: vuild output in log file
        call %COMPILE_SCRIPT% %PROJECT_FULL_PATH% %__target% %__configuration% %__platform% >> %__log_file%
    )

    if %errorlevel% neq 0 (
        call :error_msbuild_failed %errorlevel%
        goto :eof
        )
    if not "%__exportpath%" == "" ( 
        call :export 
    )
    call :update_compilation_filetag
    call :build_success
    goto :eof

:prebuild_header
    set SPACE_SP=" "
    If %__log_file% == "" (
        call %__lib_date% :getbuilddate
        call %__lib_out% :__out_underline_yel "Target: %__target% Platform: %__platform% Configuration: %__configuration%"
        goto :eof
    ) else (
        :: vuild output in log file
        call %__lib_date% :getbuilddate
        call %__lib_out% :__out_underline_yel "%__target% %__platform% / %__configuration%"
        goto :eof
    )
    goto :eof

:read_script_root
    set regpath=%OrganizationHKCU::=%
    for /f "tokens=2,*" %%A in ('REG.exe query %regpath%\%1 /v %2') do (
            set "__scripts_root=%%B"
        )
    goto :eof

:update_compilation_filetag
    set "source_bin=%__bin_path%\%__platform%\%__configuration%"
    set "tag_file=%source_bin%\BUILD.NFO"

    if not exist %source_bin%  (
    	goto :eof
    	)	
	echo ========================================================== > %tag_file%
	echo CURRENT GIT REVISION %__current_git_revision%  >> %tag_file%
	echo COMPILATION COMPLETED ON %__current_date_string% >> %tag_file%
	echo ========================================================== >> %tag_file%      

    goto :eof


:export
    ::if not exist %__exportpath%  (md %__exportpath%)
    set source_bin=%__bin_path%\%__platform%\%__configuration%
    
    If %__log_file% == "" (
        call %__lib_out% :__out_underline_red "EXPORT %source_bin% to %__exportpath%"
    ) else (
        echo " =======================================================================" >> %__log_file%
        echo " EXPORT %source_bin% to %__exportpath%" >> %__log_file%
        echo " =======================================================================" >> %__log_file%
    )
    copy %source_bin%\*.exe %__exportpath%
    goto :eof

:: ==============================================================================
::   errors
:: ==============================================================================
:error_missing_arguments
    echo.
    call %__lib_out% :__out_l_red "   make error"
    call %__lib_out% :__out_d_yel "   Missing aguments"
    echo.
    goto :end

:error_missing_iniconfig
    echo.
    call %__lib_out% :__out_l_red "   make error"
    call %__lib_out% :__out_d_yel "   Missing config: %__iniconfig_file%."
    echo.
    goto :end

:error_missing_configuration
    echo.
    call %__lib_out% :__out_l_red "   make error"
    call %__lib_out% :__out_d_yel "   Missing build configuration. Specify using /c. Type /h for usage."
    echo.
    goto :end

:error_missing_target
    echo.
    call %__lib_out% :__out_l_red "   make error"
    call %__lib_out% :__out_d_yel "   Missing build target. Specify using /t. Type /h for usage."
    echo.
    goto :end

:error_missing_platform
    echo.
    call %__lib_out% :__out_l_red "   make error"
    call %__lib_out% :__out_d_yel "   Missing build platform. Specify using /p. Type /h for usage."
    echo.
    goto :end

:error_msbuild_failed
    echo.
    call %__lib_out% :__out_l_red "   make error: build failed with error %~1"
    if not %__log_file% == "" (
        echo "   make error: build failed with error %~1" >> %__log_file%
        )
    echo.
    goto :end

:error_missing_lib
    echo.
    call %__lib_out% :__out_l_red "   Error"
    call %__lib_out% :__out_d_yel "   Missing bat lib: %~1"
    echo.
    goto :end


:build_success
    echo.
    call %__lib_out% :__out_l_grn "Build Completed!"
    echo.
    goto :end

:end
    exit /B


 