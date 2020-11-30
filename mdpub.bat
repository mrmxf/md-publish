@echo off
REM md-publish makedoc script - Linux
REM -------------------------------------------------------------------

REM _SETTINGS contains default settings. CONFIG folder is user overrides
set SCRIPT_FOLDER=%~dp0
set CONFIG_FOLDER=%CD%

REM set up some colors to make the output pretty
set Coff=[0m     & set Cbold=[1m   & set Cunderline=[4m & set CInverse=[7m  & set Cnormal=93m
set  Cblack=[30m & set  Cred=[31m  & set  Cgreen=[32m  & set  Cyellow=[33m  & set  Cblue=[34m  & set  Cmagenta=[35m & set  Ccyan=[36m  & set  Cwhite=[37m  & set  Cgray=[90m
set CSblack=[90m & set CSred=[91m  & set CSgreen=[92m  & set CSyellow=[93m  & set CSblue=[94m  & set CSmagenta=[95m & set CScyan=[96m  & set CSwhite=[97m  & set CSgray=[37m
set  Bblack=[40  & set  Bred=[41m  & set  Bgreen=[42m  & set  Byellow=[43m  & set  Bblue=[44m  & set  Bmagenta=[45  & set  Bcyan=[46m  & set  Bwhite=[47m  & set  Bgray=[100m
set BSblack=[100 & set BS=red[101m & set BSgreen=[102m & set BSyellow=[103m & set BSblue=[104m & set BSmagenta=[105 & set BScyan=[106m & set BSwhite=[107m & set BSgray=[47m
set Ccmd=%Cgreen% & set Curl=%Ccyan% & set Ctxt=%Cyellow% & set Cinfo=%Cgray%  & set Cerror=%Cred%   & set Cwarning=%CSmagenta% & set Cfile=%Cwhite% & set Cheading=%CScyan%
set   CC=%Ccmd%   & set   CU=%Curl%  & set   CT=%Ctxt%    & set    CI=%Cinfo%  & set     CE=%Cerror% & set       CW=%Cwarning%  & set    CF=%Cfile%  & set       CH= %Cheading1% &  set CX=%Coff%

REM pull in the default settings & optional config
for /f "delims=" %%x in (%SCRIPT_FOLDER%_SETTINGS) do (set %%x)

if [%MDPUB_VERBOSE%] NEQ [] (
  echo %Ctxt%                ^>^>^>%Cheading% %MDPUB_TITLE% %Coff%
  echo %Ctxt%load _SETTINGS from%Cfile%%SCRIPT_FOLDER%_SETTINGS %Coff%
  echo %Ctxt%load    CONFIG from%Cfile%%CONFIG_FOLDER%\CONFIG   %Coff%
  echo %Ctxt%     script version%Cinfo% %MDPUB_SCRIPT_VERSION% %Coff%
  echo %Ctxt%      output folder%Cinfo% %OUTPUT_FOLDER% %Coff%
  echo %Ctxt%      default files%Cinfo% %FILE_GLOB_WIN% %Coff%

)

rem iterate over all yml files in the root folder and run pandoc
for /r  . %%f in (%FILE_GLOB_WIN%) do (
  echo %Cheading%-------------------^>%Ctxt%defaults=%FILE_GLOB_WIN% %Cfile% %f% %Coff%
  pandoc --lua-filter xr/filter/smpte-st-numbering.lua --defaults=%%f
)
