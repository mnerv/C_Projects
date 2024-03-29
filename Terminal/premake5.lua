TERMINAL_INCLUDE = path.getabsolute("src/include")

project "Terminal" -- Set the project name
    kind "StaticLib"
    language "C"
    staticruntime "on"
    cdialect "C11"

    targetdir("%{wks.location}/bin/%{cfg.buildcfg}/%{prj.name}")
    objdir("%{wks.location}/obj/%{cfg.buildcfg}/%{prj.name}")

    files {
        "src/**.h",
        "src/Terminal/**.c",
    }

    includedirs {
        TERMINAL_INCLUDE,
        "src"
    }

    defines {
        -- Define here
    }

    libdirs {
        -- lib directory 
    }

    links {
        -- link library here
    }

    if os.host() ~= "windows" then
        defines {
            "__UNIX_"
        }

        links {
            "ncurses"
        }
    end

    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        runtime "Release"
        optimize "On"

    filter "system:macosx"
        systemversion "latest"
        system "macosx"

    filter "system:linux"
        system "linux"
        systemversion "latest"

    filter "system:Windows"
        system "Windows"
        systemversion "latest"