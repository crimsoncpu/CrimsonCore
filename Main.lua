--// CrimsonCore Main Loader v1.4

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


CrimsonCore.Drag =
	Load("Window/Drag.lua")


CrimsonCore.Floating =
	Load("Window/Floating.lua")



-- Layout

CrimsonCore.Tab =
	Load("Layout/Tab.lua")


CrimsonCore.Section =
	Load("Layout/Section.lua")



-- Components

CrimsonCore.Components = {

	Button =
		Load("Components/Button.lua"),

	Toggle =
		Load("Components/Toggle.lua"),

	Slider =
		Load("Components/Slider.lua"),

	Dropdown =
		Load("Components/Dropdown.lua"),

	Keybind =
		Load("Components/Keybind.lua"),

	Label =
		Load("Components/Label.lua"),

	Notification =
		Load("Components/Notification.lua")

}



function CrimsonCore:CreateWindow(config)

	return CrimsonCore.Window:Create(

		config,

		CrimsonCore.Theme,

		CrimsonCore.Utility,

		CrimsonCore.Drag,

		CrimsonCore.Floating,

		CrimsonCore.Tab,

		CrimsonCore.Section,

		CrimsonCore.Components

	)

end



print("CrimsonCore Loaded v1.4")


return CrimsonCore
