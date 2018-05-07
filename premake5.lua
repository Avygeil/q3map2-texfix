-- premake5.lua

require "setup"

workspace "q3map2-texfix"
	configurations { "Debug", "Release" }
	architecture "x86"
	location "build"

project "q3map2"
	kind "ConsoleApp"
	language "C"
	targetdir "build/%{cfg.buildcfg}"

	files {
		"src/brush.c",
		"src/brush_primit.c",
		"src/bsp.c",
		"src/bsp_analyze.c",
		"src/bsp_info.c",
		"src/bsp_scale.c",
		"src/bspfile_abstract.c",
		"src/bspfile_ibsp.c",
		"src/bspfile_rbsp.c",
		"src/convert_ase.c",
		"src/convert_bsp.c",
		"src/convert_map.c",
		"src/decals.c",
		"src/exportents.c",
		"src/facebsp.c",
		"src/fixaas.c",
		"src/fog.c",
		"src/image.c",
		"src/leakfile.c",
		"src/light.c",
		"src/light_bounce.c",
		"src/light_trace.c",
		"src/light_ydnar.c",
		"src/lightmaps_ydnar.c",
		"src/main.c",
		"src/map.c",
		"src/mesh.c",
		"src/minimap.c",
		"src/model.c",
		"src/patch.c",
		"src/path_init.c",
		"src/portals.c",
		"src/prtfile.c",
		"src/shaders.c",
		"src/surface.c",
		"src/surface_extra.c",
		"src/surface_foliage.c",
		"src/surface_fur.c",
		"src/surface_meta.c",
		"src/tjunction.c",
		"src/tree.c",
		"src/vis.c",
		"src/visflow.c",
		"src/writebsp.c",
		"src/q3map2.rc"
	}
	
	defines {
		"_CRT_SECURE_NO_WARNINGS",
		"_CRT_SECURE_NO_DEPRECATE"
	}
	
	disablewarnings "4996"
	
	includedirs {
		"deps/gtk-2.24.10/include",
		"deps/gtk-2.24.10/include/glib-2.0",
		"deps/gtk-2.24.10/include/gdk-pixbuf-2.0",
		"deps/gtk-2.24.10/include/libpng14",
		"deps/gtk-2.24.10/lib/glib-2.0/include",
		"deps/libxml2-2.9.2/include",
		"deps/jpeg-9",
		"include",
		"include/quake3-common"
	}
	
	libdirs {
		"deps/gtk-2.24.10/lib",
		"deps/libxml2-2.9.2/win32/bin.msvc",
		"deps/jpeg-9/Release",
		"lib"
	}
	
	links {
		"Ws2_32",
		"glib-2.0",
		"libxml2_a",
		"jpeg",
		"libpng",
		"ddslib",
		"l_net",
		"mathlib",
		"md5lib",
		"picomodel",
		"quake3-common"
	}
	
	postbuildcommands {
		'xcopy "%{wks.location}\\..\\deps\\gtk-2.24.10\\bin\\libglib-2.0-0.dll" "%{wks.location}\\..\\build\\%{cfg.buildcfg}\\libglib-2.0-0.dll*" /Y',
		'xcopy "%{wks.location}\\..\\deps\\gtk-2.24.10\\bin\\libpng14-14.dll" "%{wks.location}\\..\\build\\%{cfg.buildcfg}\\libpng14-14.dll*" /Y',
		'xcopy "%{wks.location}\\..\\deps\\gtk-2.24.10\\bin\\intl.dll" "%{wks.location}\\..\\build\\%{cfg.buildcfg}\\intl.dll*" /Y',
		'xcopy "%{wks.location}\\..\\deps\\gtk-2.24.10\\bin\\zlib1.dll" "%{wks.location}\\..\\build\\%{cfg.buildcfg}\\zlib1.dll*" /Y'
	}

	filter "configurations:Debug"
		defines { "DEBUG" }
		symbols "On"

	filter "configurations:Release"
		defines { "NDEBUG" }
		optimize "On"