# BuildAutomation Project

This is a a collection of batch scripts used to build different projects born out of the need
of having common and simple build scripts that I use across my projects.

## How it works ?

You clone this repository and run the script Setup.ps1.
Setup.ps1 will configure the global environment settings and you only need to run it once (regular user).

Copy the the 2 files in the project root, edit buildcfg.ini to have the corresponding project names and VOILA!
- templates/buildcfg.ini
- templates/Build.bat


## Nuts and Bolts for the programmers

Running Build.bat will do the following:
Read the registry to get the location of the BuildAutomation Scripts
Use the build scripts to identify the Visual Studio version, compiler version and compile the project
identified in buildcfg.ini.

### Little visual demo

https://github.com/arsscriptum/BuildAutomation/blob/main/doc/Build.gif


