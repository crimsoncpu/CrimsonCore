--// CrimsonCore Config System v2.0
--// Premium Hybrid Edition

local Config = {}


-- Window

Config.Window = {

	Width = 760,

	Height = 500,

	CornerRadius = 18,

	Draggable = true,

	Resizable = true

}



-- Animation

Config.Animation = {

	OpenTime = .45,

	CloseTime = .3,

	HoverTime = .15,

	SnapTime = .45

}



-- Floating Button

Config.Floating = {

	Enabled = true,

	Size = 62,

	Snap = true

}



-- Notifications

Config.Notification = {

	Enabled = true,

	Duration = 4,

	Position = "BottomRight"

}



-- Components

Config.Components = {

	Buttons = true,

	Toggles = true,

	Sliders = true

}



-- Debug

Config.Debug = false



return Config
