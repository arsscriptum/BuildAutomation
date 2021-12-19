@echo off
setlocal EnableDelayedExpansion

:: ==============================================================================
:: 
::   run_compiler.bat
::
::   VERSION:  1.0.1
::
:: ==============================================================================
::   codecastor - made in quebec 2020 <codecastor@icloud.com>
:: ==============================================================================

:: determine path to compiler
call "%~dp0get_compiler.bat"

set __verbosity_opt=/verbosity:minimal

:: ==============================================================================
:: Option /maxcpucount:n
:: Setting n to more than 1 enables building and analyzing of n number of projects in parallel. 
:: ==============================================================================
:: Call compiler (msbuild or else), passing in any supplied parameters

%__compiler_exe% /m /nologo %__verbosity_opt% %*

exit /b %errorlevel%
