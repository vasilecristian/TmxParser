@echo off 
SET MAKETOOL=..\..\..\..\..\premake\release\premake5.exe

%MAKETOOL% vs2013
%MAKETOOL% marmaladesdk
%MAKETOOL% --arch=ios xcode4

%MAKETOOL% --arch=wp80app vs2012
%MAKETOOL% --arch=w81app vs2013
%MAKETOOL% --arch=wp81app vs2013
%MAKETOOL% --arch=x32 --to=qmake qmake
