--// CrimsonCore Window System v1.3

local Window = {}

local Players = game:GetService("Players")

local Player = Players.LocalPlayer



function Window:Create(config, Theme, Utility, Drag, Floating)

	config = config or {}


	local ScreenGui = Instance.new("ScreenGui")

	ScreenGui.Name = "CrimsonCore"

	ScreenGui.ResetOnSpawn = false

	ScreenGui.IgnoreGuiInset = true

	ScreenGui.Parent = Player:WaitForChild("PlayerGui")



	local Main = Instance.new("Frame")

	Main.Size = UDim2.fromOffset(760,500)

	Main.Position = UDim2.fromScale(.5,.5)

	Main.AnchorPoint = Vector2.new(.5,.5)

	Main.BackgroundColor3 = Theme.Background

	Main.Parent = ScreenGui


	Utility:Corner(Main,18)

	Utility:Stroke(Main,Theme.Crimson,2)



	local Top = Instance.new("Frame")

	Top.Size = UDim2.new(1,0,0,55)

	Top.BackgroundColor3 = Theme.Panel

	Top.Parent = Main


	Utility:Corner(Top,18)



	if Drag then
		Drag:Enable(Main,Top)
	end



	local Title = Instance.new("TextLabel")

	Title.Size = UDim2.new(.5,0,1,0)

	Title.Position = UDim2.fromOffset(20,0)

	Title.BackgroundTransparency = 1

	Title.Text = config.Name or "CrimsonCore"

	Title.TextColor3 = Theme.Text

	Title.Font = Enum.Font.BuilderSansBold

	Title.TextSize = 24

	Title.TextXAlignment = Enum.TextXAlignment.Left

	Title.Parent = Top



	local function CreateTopButton(text, offset)

		local Button = Instance.new("TextButton")

		Button.Size = UDim2.fromOffset(35,35)

		Button.Position = UDim2.new(1,offset,0.5,-17)

		Button.Text = text

		Button.TextColor3 = Theme.Text

		Button.BackgroundColor3 = Theme.Crimson

		Button.Font = Enum.Font.BuilderSansBold

		Button.TextSize = 18

		Button.Parent = Top


		Utility:Corner(Button,10)

		return Button

	end



	local Minimize = CreateTopButton("-", -135)

	local Maximize = CreateTopButton("+", -90)

	local Close = CreateTopButton("X", -45)



	local OriginalSize = Main.Size

	local Hidden = false


	Minimize.MouseButton1Click:Connect(function()

		Hidden = not Hidden

		if Hidden then

			Main.Size = UDim2.fromOffset(760,55)

		else

			Main.Size = OriginalSize

		end

	end)



	local Full = false


	Maximize.MouseButton1Click:Connect(function()

		Full = not Full

		if Full then

			Main.Size = UDim2.fromScale(.9,.8)

		else

			Main.Size = OriginalSize

		end

	end)



	Close.MouseButton1Click:Connect(function()

		ScreenGui:Destroy()

	end)



	if Floating then

		Floating:Create(
			ScreenGui,
			Main,
			Theme,
			Utility
		)

	end



	print("CrimsonCore Window Created")



	return {

		ScreenGui = ScreenGui,

		Main = Main,

		Top = Top

	}

end



return Window
