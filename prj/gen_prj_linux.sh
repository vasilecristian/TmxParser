#!/bin/bash

chmod +x ../tools/premake/release/premake5_linux
../tools/premake/release/premake5_linux --arch=x32 --to=gmake gmake
