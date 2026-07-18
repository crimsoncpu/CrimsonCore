--// CrimsonCore Main Loader v1.0

local CrimsonCore = {}


local BaseURL =
"https://raw.githubusercontent.com/crimsoncpu/CrimsonCore/main/"



local function Load(path)

	local Source = game:HttpGet(BaseURL .. path)

	local Success, Result = pcall(function()
		return loadstring(Source)()
	end)


	if not Success then
		error(
			"CrimsonCore failed loading "..path.."\n"..tostring(Result)
		)
	end


	return Result

end



-- Core

CrimsonCore.Theme =
	Load("Core/Theme.lua")


CrimsonCore.Utility =
	Load("Core/Utility.lua")


CrimsonCore.Config =
	Load("Core/Config.lua")



-- Window

CrimsonCore.Window =
	Load("Window/Window.lua")





function CrimsonCore:CreateWindow(config)

	return CrimsonCore.Window:Create(
		config,
		CrimsonCore.Theme,
		CrimsonCore.Utility
	)

end



print("CrimsonCore Loaded v1.0")


return CrimsonCore
