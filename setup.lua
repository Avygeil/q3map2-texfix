-- premake/setup.lua

premake.modules.setup = {}
local m = premake.modules.setup

local p = premake

newaction {
	trigger = "setup",
	description = "Downloads and extracts dependencies",

	execute = function()
		local deps = {
			'gtk-bundle-2.24.10-GtkRadiant.zip',
			'jpeg-9-MSVC2014-GtkRadiant.zip',
			'libxml2-2.9.2-GtkRadiant-2.zip'
		}
		
		-- download dependencies
		for i, dep in ipairs(deps) do
			local url = 'http://s3.amazonaws.com/GtkRadiant/' .. dep
			local file = 'deps/' .. dep
			
			print("Downloading dependency: " .. url)
			local resultStr, resultCode = http.download(url, file)
			
			if resultStr == 'OK' then
				print("Extracting...")
				zip.extract(file, 'deps')
			else
				if resultCode > 0 then print("HTTP error: " .. resultCode) end
				print(resultStr)
			end
		end
		
		
	end
}

return m