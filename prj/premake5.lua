include "../tools/premake/common/"


-------------------------------------------------------------------------------
--
-------------------------------------------------------------------------------
solution "TmxParser"
    addCommonConfig()
    startproject "TmxParser_TEST"
    
--external "TmxParser_TEST"
--    location  ( GetPathFromPlatform() )

	
--external "TmxParser"
--    location  ( GetPathFromPlatform())
--    uuid "81CE8DAF-EBB2-4761-8E45-B71ABCCA8C68"

	
	
	
-------------------------------------------------------------------------------
--
-------------------------------------------------------------------------------    
project "TmxParser"
    files
    {
        "../src/**",
        "../include/**",
    }
    includedirs
    {
        "../include/",
		"../include/TmxParser",
        "../src/",
		
        "../../tinyxml2/include",
		"../../zlib/include"
    }
    kind "StaticLib"
    targetdir("../lib/" .. GetPathFromPlatform())
    if (IsWin32()) then
        defines {"WIN32"}
    end
    
    if IsWin8StoreApp() then
        -- WinRT
        removeflags { 'StaticRuntime' }
        flags { 'DisableWinRT' }
    end

    if IsIos() then
        defines {"OS_IPHONE"}
        buildoptions { "-std=c++11 -stdlib=libc++ -x objective-c++ -Wno-error" }
		-- kind "WindowedApp"
		-- files { GetPathFromPlatform() .. "/Info.plist" }
	else
		-- kind "ConsoleApp"
	end

	if IsXCode() then
        addCommonXcodeBuildSettings()	
        
        xcodebuildsettings 
        {
            ["ONLY_ACTIVE_ARCH"] = "NO"
        }
        
        xcodebuildresources
        {
            "../data/**",
        }

        files 
        {
            "../data/**",
        }
        defines {"OS_IPHONE"}
	buildoptions { "-std=c++11 -stdlib=libc++ -x objective-c++ -Wno-error" }
		
	-- kind "WindowedApp"
	-- files { GetPathFromPlatform() .. "/Info.plist" }
    end

	
	
-------------------------------------------------------------------------------
--
-------------------------------------------------------------------------------	
project "TmxParser_TEST"
    files
    {
        "../tests/**"
    }
    includedirs
    {
        "../include/"
    }
    kind "ConsoleApp"
    targetdir("../bin/" .. GetPathFromPlatform())
    if (IsWin32()) then
        defines {"WIN32"}
    end
	
	
	links {"TmxParser"}
    
    if IsWin8StoreApp() then
        -- WinRT
        removeflags { 'StaticRuntime' }
        flags { 'DisableWinRT' }
    end

    if IsIos() then
        defines {"OS_IPHONE"}
        buildoptions { "-std=c++11 -stdlib=libc++ -x objective-c++ -Wno-error" }
		-- kind "WindowedApp"
		-- files { GetPathFromPlatform() .. "/Info.plist" }
	else
		-- kind "ConsoleApp"
	end

	if IsXCode() then
        addCommonXcodeBuildSettings()	
        
        xcodebuildsettings 
        {
            ["ONLY_ACTIVE_ARCH"] = "NO"
        }
        
        xcodebuildresources
        {
            "../data/**",
        }

        files 
        {
            "../data/**",
        }
        defines {"OS_IPHONE"}
	buildoptions { "-std=c++11 -stdlib=libc++ -x objective-c++ -Wno-error" }
		
	-- kind "WindowedApp"
	-- files { GetPathFromPlatform() .. "/Info.plist" }
    end
