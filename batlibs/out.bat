@echo off
call %*
goto :EOF
:: ==============================================================================
:: 
::   out.bat
:: 
:: ==============================================================================
::   arsccriptum - made in quebec 2020 <guillaumeplante.qc@gmail.com>
:: ==============================================================================

:: ===========
:: status
:__out_status
    call :write "[33m%~1[0m"
    goto :eof

:: ==============================================================================
::   My display functions using colors like in 1989
:: ==============================================================================
:: ===========
:: blacker than black
:__out_n_d_blk
    call :write "[30m%~1[0m"
    goto :eof
:: ===========
:: dark red
:__out_n_d_red
    call :write "[31m%~1[0m"
    goto :eof


:: ===========
:: dark red
:__out_n_d_red_u
    call :write "[4m[91m%~1[0m[0m"
    goto :eof


:: ===========
:: dark green
:__out_n_d_grn
    call :write "[32m%~1[0m"
    goto :eof
:: ===========
:: dark yellow
:__out_n_d_yel
    call :write "[33m%~1[0m"
    goto :eof

:: ===========
:: dark yellow
:__out_n_d_yel_u
    call :write "[4m[33m%~1[0m[0m"
    goto :eof

:: ===========
:: dark blue
:__out_n_d_blu
    call :write "[34m%~1[0m"
    goto :eof
:: ===========
:: dark magena
:__out_n_d_mag
    call :write "[35m%~1[0m"
    goto :eof
:: ===========
:: dark cyan
:__out_n_d_cya
    call :write "[36m%~1[0m"
    goto :eof
:: ===========
:: dark white, bit darker than gray
:__out_n_d_whi
    call :write "[37m%~1[0m"
    goto :eof

:: ===========
:: light gray
:__out_n_l_gry
    call :write "[90m%~1[0m"
    goto :eof
:: ===========
:: light red
:__out_n_l_red
    call :write "[91m%~1[0m"
    goto :eof
:: ===========
:: light green
:__out_n_l_grn
    call :write "[92m%~1[0m"
    goto :eof
:: ===========
:: light yellow
:__out_n_l_yel
    call :write "[93m%~1[0m"
    goto :eof
:: ===========
:: light blue
:__out_n_l_blu
    call :write "[94m%~1[0m"
    goto :eof
:: ===========
:: light magenta
:__out_n_l_mag
    call :write "[95m%~1[0m"
    goto :eof
:: ===========
:: light cyan
:__out_n_l_cya
    call :write "[96m%~1[0m"
    goto :eof
:: ===========
:: white
:__out_n_l_whi
    call :write "[97m%~1[0m"
    goto :eof

:: blacker than black
:__out_d_blk
    echo [30m%~1[0m
    goto :eof
:: ===========
:: dark red
:__out_d_red
    echo [31m%~1[0m
    goto :eof
:: ===========
:: dark green
:__out_d_grn
    echo [32m%~1[0m
    goto :eof
:: ===========
:: dark yellow
:__out_d_yel
    echo [33m%~1[0m
    goto :eof
:: ===========
:: dark blue
:__out_d_blu
    echo [34m%~1[0m
    goto :eof
:: ===========
:: dark magena
:__out_d_mag
    echo [35m%~1[0m
    goto :eof
:: ===========
:: dark cyan
:__out_d_cya
    echo [36m%~1[0m
    goto :eof
:: ===========
:: dark white, bit darker than gray
:__out_d_whi
    echo [37m%~1[0m
    goto :eof

:: ===========
:: light gray
:__out_l_gry
    echo [90m%~1[0m
    goto :eof
:: ===========
:: light red
:__out_l_red
    echo [91m%~1[0m
    goto :eof
:: ===========
:: light green
:__out_l_grn
    echo [92m%~1[0m
    goto :eof
:: ===========
:: light yellow
:__out_l_yel
    echo [93m%~1[0m
    goto :eof
:: ===========
:: light blue
:__out_l_blu
    echo [94m%~1[0m
    goto :eof
:: ===========
:: light magenta
:__out_l_mag
    echo [95m%~1[0m
    goto :eof
:: ===========
:: light cyan
:__out_l_cya
    echo [96m%~1[0m
    goto :eof
:: ===========
:: white
:__out_l_whi
    echo [97m%~1[0m
    goto :eof


:: ===========
:: misc: underline no text
:__out_line
    echo [4m                                                                                       [0m
    goto :eof
:: ===========
:: misc: underline
:__out_underline
    echo [4m%~1[0m
    goto :eof

:: ===========
:: misc: underline
:__out_underline_blu
    echo [4m[94m%~1[0m[0m
    goto :eof

:: ===========
:: misc: underline
:__out_underline_red
    echo [4m[91m%~1[0m[0m
    goto :eof

:: ===========
:: misc: underline
:__out_underline_cya
    echo [4m[36m%~1[0m[0m
    goto :eof


:: ===========
:: misc: underline
:__out_underline_mag
    echo [4m[95m%~1[0m[0m
    goto :eof


:: ===========
:: misc: underline
:__out_underline_yel
    echo [4m[33m%~1[0m[0m
    goto :eof

:: ==============================================================================
::   Test colors..
:: ==============================================================================
:test_colors
    echo.
    call :__out_line
    call :__out_d_red "    __out_d_red THIS IS A TEST OF THE OUTPUT COLORS.... 1 2 3 4 5 6 7 8 9"
    call :__out_d_grn "    __out_d_grn THIS IS A TEST OF THE OUTPUT COLORS.... 1 2 3 4 5 6 7 8 9"
    call :__out_d_yel "    __out_d_yel THIS IS A TEST OF THE OUTPUT COLORS.... 1 2 3 4 5 6 7 8 9"
    call :__out_d_blu "    __out_d_blu THIS IS A TEST OF THE OUTPUT COLORS.... 1 2 3 4 5 6 7 8 9"
    call :__out_d_mag "    __out_d_mag THIS IS A TEST OF THE OUTPUT COLORS.... 1 2 3 4 5 6 7 8 9"
    call :__out_d_cya "    __out_d_cya THIS IS A TEST OF THE OUTPUT COLORS.... 1 2 3 4 5 6 7 8 9"
    call :__out_d_whi "    __out_d_whi THIS IS A TEST OF THE OUTPUT COLORS.... 1 2 3 4 5 6 7 8 9"

    call :__out_l_red "    __out_l_red THIS IS A TEST OF THE OUTPUT COLORS.... 1 2 3 4 5 6 7 8 9"
    call :__out_l_grn "    __out_l_grn THIS IS A TEST OF THE OUTPUT COLORS.... 1 2 3 4 5 6 7 8 9"
    call :__out_l_yel "    __out_l_yel THIS IS A TEST OF THE OUTPUT COLORS.... 1 2 3 4 5 6 7 8 9"
    call :__out_l_blu "    __out_l_blu THIS IS A TEST OF THE OUTPUT COLORS.... 1 2 3 4 5 6 7 8 9"
    call :__out_l_mag "    __out_l_mag THIS IS A TEST OF THE OUTPUT COLORS.... 1 2 3 4 5 6 7 8 9"
    call :__out_l_cya "    __out_l_cya THIS IS A TEST OF THE OUTPUT COLORS.... 1 2 3 4 5 6 7 8 9"
    call :__out_l_whi "    __out_l_whi THIS IS A TEST OF THE OUTPUT COLORS.... 1 2 3 4 5 6 7 8 9"
    call :__out_underline "    THIS IS A TEST OF THE OUTPUT COLORS.... 1 2 3 4 5 6 7 8 9"
    echo.
    goto :eof


::
:: Write the literal string Str to stdout without a terminating
:: carriage return or line feed. Enclosing quotes are stripped.
::
:: This routine works by calling :writeVar
::
:write  Str
  setlocal disableDelayedExpansion
  set "str=%~1"
  call :writeVar str
  exit /b

:writeCl  Str
  setlocal disableDelayedExpansion
  set "str=%~1"
  echo [92m
  call :writeVar str
  echo [0m
  exit /b

::
:: Writes the value of variable StrVar to stdout without a terminating
:: carriage return or line feed.
::
:: The routine relies on variables defined by :writeInitialize. If the
:: variables are not yet defined, then it calls :writeInitialize to
:: temporarily define them. Performance can be improved by explicitly
:: calling :writeInitialize once before the first call to :writeVar
::
:writeVar  StrVar
    if not defined %~1 exit /b
    setlocal enableDelayedExpansion
    if not defined $write.sub call :writeInitialize
    set $write.special=1
    if "!%~1:~0,1!" equ "^!" set "$write.special="
    for /f delims^=^ eol^= %%A in ("!%~1:~0,1!") do (
      if "%%A" neq "=" if "!$write.problemChars:%%A=!" equ "!$write.problemChars!" set "$write.special="
    )
    if not defined $write.special (
      <nul set /p "=!%~1!"
      exit /b
    )
    set string=%~1
    set string=%string:"=%
    set %~1=%string%
    >"%$write.temp%_1.txt" (echo !str!!$write.sub!)
    copy "%$write.temp%_1.txt" /a "%$write.temp%_2.txt" /b >nul
    type "%$write.temp%_2.txt"
    del "%$write.temp%_1.txt" "%$write.temp%_2.txt"
    set "str2=!str:*%$write.sub%=%$write.sub%!"
    if "!str2!" neq "!str!" <nul set /p "=!str2!"
    exit /b


::
:: Defines 3 variables needed by the :write and :writeVar routines
::
::   $write.temp - specifies a base path for temporary files
::
::   $write.sub  - contains the SUB character, also known as <CTRL-Z> or 0x1A
::
::   $write.problemChars - list of characters that cause problems for SET /P
::      <carriageReturn> <formFeed> <space> <tab> <0xFF> <equal> <quote>
::      Note that <lineFeed> and <equal> also causes problems, but are handled elsewhere
::
:writeInitialize
    set "$write.temp=%temp%\writeTemp%random%"
    copy nul "%$write.temp%.txt" /a >nul
    for /f "usebackq" %%A in ("%$write.temp%.txt") do set "$write.sub=%%A"
    del "%$write.temp%.txt"
    for /f %%A in ('copy /z "%~f0" nul') do for /f %%B in ('cls') do (
      set "$write.problemChars=%%A%%B    ""
      REM the characters after %%B above should be <space> <tab> <0xFF>
    )
    exit /b

:: ==============================================================================
::   The end game end / exit
:: ==============================================================================
:end
    exit /B
