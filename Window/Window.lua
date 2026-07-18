--// CrimsonCore Window System v1.0

local Window = {}

local Players = game:GetService("Players")

local Player = Players.LocalPlayer


function Window:Create(config, Theme, Utility)

	config = config or {}


	local ScreenGui = Instance.new("ScreenGui")

	ScreenGui.Name = "CrimsonCore"

	ScreenGui.ResetOnSpawn = false

	ScreenGui.Parent = Player:WaitForChild("PlayerGui")



	local Main = Instance.new("Frame")

	Main.Size = UDim2.fromOffset(760,500)

	Main.Position = UDim2.fromScale(0.5,0.5)

	Main.AnchorPoint = Vector2.new(0.5,0.5)

	Main.BackgroundColor3 = Theme.Background

	Main.Parent = ScreenGui



	Utility:Corner(Main,18)

	Utility:Stroke(Main,Theme.Crimson,2)



	local Top = Instance.new("Frame")

	Top.Size = UDim2.new(1,0,0,55)

	Top.BackgroundColor3 = Theme.Panel

	Top.Parent = Main


	Utility:Corner(Top,18)



	local Title = Instance.new("TextLabel")

	Title.Size = UDim2.new(1,-20,1,0)

	Title.Position = UDim2.fromOffset(20,0)

	Title.BackgroundTransparency = 1

	Title.Text = config.Name or "CrimsonCore"

	Title.TextColor3 = Theme.Text

	Title.Font = Enum.Font.BuilderSansBold

	Title.TextSize = 24

	Title.TextXAlignment = Enum.TextXAlignment.Left

	Title.Parent = Top



	print("CrimsonCore Window Created")



	return {
		ScreenGui = ScreenGui,
		Main = Main
	}

end


return Window
