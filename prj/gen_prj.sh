#!/bin/sh
#
chmod +x ../tools/premake/release/premake5
../tools/premake/release/premake5 --arch=ios --to=xcode4/ios xcode4
../tools/premake/release/premake5 --arch=macosx --to=xcode4/macosx xcode4
