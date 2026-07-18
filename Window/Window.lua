--// CrimsonCore Window System v2.7
--// Glass + Smooth Resize Edition

local Window = {}

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local Player = Players.LocalPlayer



function Window:Create(config, Theme, Utility, Drag, Floating, Tab, Section, Components)

	config = config or {}



	-- remove old UI

	local Old = Player.PlayerGui:FindFirstChild("CrimsonCore")

	if Old then
		Old:Destroy()
	end



	local ScreenGui = Instance.new("ScreenGui")

	ScreenGui.Name = "CrimsonCore"

	ScreenGui.ResetOnSpawn = false

	ScreenGui.IgnoreGuiInset = true

	ScreenGui.Parent =
		Player:WaitForChild("PlayerGui")



	local Main = Instance.new("Frame")

	Main.Size =
		UDim2.fromOffset(
			760,
			500
		)

	Main.Position =
		UDim2.fromScale(
			0.5,
			0.5
		)

	Main.AnchorPoint =
		Vector2.new(
			0.5,
			0.5
		)

	Main.BackgroundColor3 =
		Theme.Background

	Main.BackgroundTransparency =
		Theme.MainTransparency or .35

	Main.Parent =
		ScreenGui



	Utility:Corner(
		Main,
		18
	)


	Utility:Stroke(
		Main,
		Theme.Crimson,
		2
	)



	local OriginalSize =
		Main.Size



	local Top = Instance.new("Frame")

	Top.Size =
		UDim2.new(
			1,
			0,
			0,
			55
		)

	Top.BackgroundColor3 =
		Theme.Panel

	Top.BackgroundTransparency =
		0.45

	Top.Parent =
		Main



	Utility:Corner(
		Top,
		18
	)



	if Drag then
		Drag:Enable(
			Main,
			Top
		)
	end



	local Title = Instance.new("TextLabel")

	Title.Size =
		UDim2.new(
			0.5,
			0,
			1,
			0
		)

	Title.Position =
		UDim2.fromOffset(
			20,
			0
		)

	Title.BackgroundTransparency = 1

	Title.Text =
		config.Name or "CrimsonCore"

	Title.TextColor3 =
		Theme.Text

	Title.Font =
		Enum.Font.BuilderSansBold

	Title.TextSize = 24

	Title.TextXAlignment =
		Enum.TextXAlignment.Left

	Title.Parent =
		Top



	local function TopButton(text, offset)

		local Button = Instance.new("TextButton")

		Button.Size =
			UDim2.fromOffset(
				35,
				35
			)

		Button.Position =
			UDim2.new(
				1,
				offset,
				0.5,
				-17
			)

		Button.Text =
			text

		Button.TextColor3 =
			Theme.Text

		Button.BackgroundColor3 =
			Theme.Crimson

		Button.Font =
			Enum.Font.BuilderSansBold

		Button.TextSize = 18

		Button.Parent =
			Top


		Utility:Corner(
			Button,
			10
		)


		return Button

	end



	local Minimize =
		TopButton(
			"-",
			-135
		)


	local Maximize =
		TopButton(
			"+",
			-90
		)


	local Close =
		TopButton(
			"X",
			-45
		)



	local RestoreButton



	if Floating then

		RestoreButton =
			Floating:Create(
				ScreenGui,
				Main,
				Theme,
				Utility
			)

		if RestoreButton then
			RestoreButton.Visible = false
		end

	end



	Minimize.MouseButton1Click:Connect(function()

		Main.Visible = false

		if RestoreButton then
			RestoreButton.Visible = true
		end

	end)



	if RestoreButton then

		RestoreButton.MouseButton1Click:Connect(function()

			Main.Visible = true

			RestoreButton.Visible = false

		end)

	end



	local Full = false



	Maximize.MouseButton1Click:Connect(function()

		Full = not Full


		if Full then

			TweenService:Create(

				Main,

				TweenInfo.new(
					0.35,
					Enum.EasingStyle.Quint,
					Enum.EasingDirection.Out
				),

				{
					Size =
						UDim2.fromScale(
							0.85,
							0.8
						)
				}

			):Play()


		else

			TweenService:Create(

				Main,

				TweenInfo.new(
					0.35,
					Enum.EasingStyle.Quint,
					Enum.EasingDirection.Out
				),

				{
					Size = OriginalSize
				}

			):Play()

		end

	end)



	Close.MouseButton1Click:Connect(function()

		ScreenGui:Destroy()

	end)



	local Content = Instance.new("Frame")

	Content.Size =
		UDim2.new(
			1,
			-40,
			1,
			-80
		)

	Content.Position =
		UDim2.fromOffset(
			20,
			65
		)

	Content.BackgroundColor3 =
		Theme.Panel

	Content.BackgroundTransparency =
		0.75

	Content.Parent =
		Main



	Utility:Corner(
		Content,
		14
	)



	local Sidebar = Instance.new("Frame")

	Sidebar.Name = "Sidebar"

	Sidebar.Size =
		UDim2.fromOffset(
			160,
			380
		)

	Sidebar.Position =
		UDim2.fromOffset(
			10,
			20
		)

	Sidebar.BackgroundTransparency = 1

	Sidebar.Parent =
		Content



	local SideLayout =
		Instance.new("UIListLayout")

	SideLayout.Padding =
		UDim.new(
			0,
			8
		)

	SideLayout.Parent =
		Sidebar



	local Pages = Instance.new("Frame")

	Pages.Name = "Pages"

	Pages.Size =
		UDim2.new(
			1,
			-180,
			1,
			-40
		)

	Pages.Position =
		UDim2.fromOffset(
			180,
			20
		)

	Pages.BackgroundTransparency = 1

	Pages.Parent =
		Content



	local Object = {}

	Object.ScreenGui = ScreenGui

	Object.Main = Main



	function Object:Notify(config)

		if Components.Notification then

			return Components.Notification:Create(
				ScreenGui,
				config,
				Theme,
				Utility
			)

		end

	end



	function Object:CreateTab(name)

		local TabSystem =
			Tab:Create(
				Pages,
				Sidebar,
				Theme,
				Utility,
				Section,
				Components
			)


		return TabSystem:New(name)

	end



	print(
		"CrimsonCore Window v2.7 Loaded"
	)



	return Object

end


return Window
