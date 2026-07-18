--// CrimsonCore Main Loader v2.2
--// Full Core Component Edition

local CrimsonCore = {}

local BaseURL =
	"https://raw.githubusercontent.com/crimsoncpu/CrimsonCore/main/"



local function Load(path)

	local Source = game:HttpGet(
		BaseURL .. path
	)


	local Success, Result = pcall(function()

		return loadstring(Source)()

	end)


	if not Success then

		error(
			"CrimsonCore failed loading: "
			.. path
			.. "\n"
			.. tostring(Result)
		)

	end


	return Result

end



--// Core

local Theme =
	Load("Core/Theme.lua")


local Utility =
	Load("Core/Utility.lua")


local Config =
	Load("Core/Config.lua")



--// Window

local Window =
	Load("Window/Window.lua")


local Drag =
	Load("Window/Drag.lua")


local Floating =
	Load("Window/Floating.lua")



--// Layout

local Tab =
	Load("Layout/Tab.lua")


local Section =
	Load("Layout/Section.lua")



--// Components

local Components = {

	Button =
		Load("Components/Button.lua"),


	Toggle =
		Load("Components/Toggle.lua"),


	Slider =
		Load("Components/Slider.lua"),


	Dropdown =
		Load("Components/Dropdown.lua"),


	Textbox =
		Load("Components/Textbox.lua"),


	Keybind =
		Load("Components/Keybind.lua"),


	Label =
		Load("Components/Label.lua"),


	Divider =
		Load("Components/Divider.lua"),


	Notification =
		Load("Components/Notification.lua")

}



function CrimsonCore:CreateWindow(config)


	return Window:Create(

		config or {},

		Theme,

		Utility,

		Drag,

		Floating,

		Tab,

		Section,

		Components

	)

end



CrimsonCore.Theme = Theme

CrimsonCore.Utility = Utility

CrimsonCore.Config = Config



print(
	"=== CrimsonCore v2.2 Core Loaded ==="
)



return CrimsonCore
