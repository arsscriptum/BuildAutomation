@echo off
call %*
goto :EOF
:: ==============================================================================
:: 
::   out.bat
:: 
:: ==============================================================================
::   codecastor - made in quebec 2020 <codecastor@icloud.com>
:: ==============================================================================


:: ==============================================================================
::   My display functions using colors like in 1989
:: ==============================================================================
:: ===========
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
    echo [4m                                                                [0m
    goto :eof
:: ===========
:: misc: underline
:__out_underline
    echo [4m%~1[0m
    goto :eof

:: ==============================================================================
::   Test colors..
:: ==============================================================================
:test_colors
    echo.
    call :__out_line
    call :__out_d_red "    THIS IS A TEST OF THE OUTPUT COLORS.... 1 2 3 4 5 6 7 8 9"
    call :__out_d_grn "    THIS IS A TEST OF THE OUTPUT COLORS.... 1 2 3 4 5 6 7 8 9"
    call :__out_d_yel "    THIS IS A TEST OF THE OUTPUT COLORS.... 1 2 3 4 5 6 7 8 9"
    call :__out_d_blu "    THIS IS A TEST OF THE OUTPUT COLORS.... 1 2 3 4 5 6 7 8 9"
    call :__out_d_mag "    THIS IS A TEST OF THE OUTPUT COLORS.... 1 2 3 4 5 6 7 8 9"
    call :__out_d_cya "    THIS IS A TEST OF THE OUTPUT COLORS.... 1 2 3 4 5 6 7 8 9"
    call :__out_d_whi "    THIS IS A TEST OF THE OUTPUT COLORS.... 1 2 3 4 5 6 7 8 9"

    call :__out_l_red "    THIS IS A TEST OF THE OUTPUT COLORS.... 1 2 3 4 5 6 7 8 9"
    call :__out_l_grn "    THIS IS A TEST OF THE OUTPUT COLORS.... 1 2 3 4 5 6 7 8 9"
    call :__out_l_yel "    THIS IS A TEST OF THE OUTPUT COLORS.... 1 2 3 4 5 6 7 8 9"
    call :__out_l_blu "    THIS IS A TEST OF THE OUTPUT COLORS.... 1 2 3 4 5 6 7 8 9"
    call :__out_l_mag "    THIS IS A TEST OF THE OUTPUT COLORS.... 1 2 3 4 5 6 7 8 9"
    call :__out_l_cya "    THIS IS A TEST OF THE OUTPUT COLORS.... 1 2 3 4 5 6 7 8 9"
    call :__out_l_whi "    THIS IS A TEST OF THE OUTPUT COLORS.... 1 2 3 4 5 6 7 8 9"
    call :__out_underline "    THIS IS A TEST OF THE OUTPUT COLORS.... 1 2 3 4 5 6 7 8 9"
    echo.
    goto :eof


:building
    echo.
    call %__lib_out% :__out_l grn " ,,                      ,,    ,,         ,,    ,,                        "
    call %__lib_out% :__out_l_grn "*MM                      db    MM        `7MM    db                        "
    call %__lib_out% :__out_l_grn " MM                            MM          MM                               "
    call %__lib_out% :__out_l_grn " MM,dMMb.    MM    MM    MM    MM    ,M""bMM  `7MM  `7MMpMMMb.   .PYbmmm  "
    call %__lib_out% :__out_l_grn " MM    `Mb   MM    MM    MM    MM  ,AP    MM    MM    MM    MM  :MI  I8    "
    call %__lib_out% :__out_l_grn " MM     M8   MM    MM    MM    MM  8MI    MM    MM    MM    MM   WmmmP    "
    call %__lib_out% :__out_l_grn " MM.   ,M9   MM    MM    MM    MM  `Mb    MM    MM    MM    MM  8M         " 
    call %__lib_out% :__out_l_grn " P^YbmdP'    `Mbod YML..JMML..JMML. `Wbmd  MML..JMML..JMML  JMML. YMMMMMb   " 
    call %__lib_out% :__out_l_grn "                                                                6     dP   "
    call %__lib_out% :__out_l_grn "                                                                Ybmmmd'    "
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
