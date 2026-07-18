--// CrimsonCore Window System v2.1
--// Transparent Glass Edition

local Window = {}

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

local Player = Players.LocalPlayer



local function Tween(Object, Time, Properties)

	local TweenInfoData = TweenInfo.new(
		Time,
		Enum.EasingStyle.Quint,
		Enum.EasingDirection.Out
	)


	local TweenObject =
		TweenService:Create(
			Object,
			TweenInfoData,
			Properties
		)


	TweenObject:Play()

	return TweenObject

end



function Window:Create(
	config,
	Theme,
	Utility,
	Drag,
	Floating,
	Tab,
	Section,
	Components
)


	config = config or {}



	-- blur

	if Theme.Blur then

		local Blur = Instance.new("BlurEffect")

		Blur.Name = "CrimsonCoreBlur"

		Blur.Size = Theme.BlurSize or 12

		Blur.Parent = Lighting

	end



	local ScreenGui = Instance.new("ScreenGui")

	ScreenGui.Name = "CrimsonCore"

	ScreenGui.ResetOnSpawn = false

	ScreenGui.IgnoreGuiInset = true

	ScreenGui.Parent =
		Player:WaitForChild("PlayerGui")



	local Main = Instance.new("Frame")

	Main.Name = "MainWindow"

	Main.Size =
		UDim2.fromOffset(
			760,
			500
		)

	Main.Position =
		UDim2.fromScale(
			.5,
			.5
		)

	Main.AnchorPoint =
		Vector2.new(
			.5,
			.5
		)


	Main.BackgroundColor3 =
		Theme.Background


	Main.BackgroundTransparency =
		Theme.MainTransparency


	Main.Parent = ScreenGui



	Utility:Corner(
		Main,
		18
	)


	Utility:Stroke(
		Main,
		Theme.Crimson,
		2
	)



	local Scale =
		Instance.new("UIScale")


	Scale.Scale = .85

	Scale.Parent = Main



	Tween(
		Scale,
		.45,
		{
			Scale = 1
		}
	)



	-- top bar

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
		Theme.PanelTransparency


	Top.Parent = Main



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
			.5,
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


	Title.Parent = Top



	local function TopButton(Text, Offset)

		local Button =
			Instance.new("TextButton")


		Button.Size =
			UDim2.fromOffset(
				35,
				35
			)


		Button.Position =
			UDim2.new(
				1,
				Offset,
				.5,
				-17
			)


		Button.BackgroundColor3 =
			Theme.Crimson


		Button.BackgroundTransparency =
			.15


		Button.Text = Text


		Button.TextColor3 =
			Theme.Text


		Button.Font =
			Enum.Font.BuilderSansBold


		Button.TextSize = 18


		Button.AutoButtonColor = false


		Button.Parent = Top



		Utility:Corner(
			Button,
			10
		)



		return Button

	end



	local Minimize =
		TopButton("-", -135)


	local Maximize =
		TopButton("+", -90)


	local Close =
		TopButton("X", -45)



	local RestoreButton



	if Floating then

		RestoreButton =
			Floating:Create(
				ScreenGui,
				Main,
				Theme,
				Utility
			)


		RestoreButton.Visible = false

	end



	Minimize.MouseButton1Click:Connect(function()


		Tween(
			Scale,
			.25,
			{
				Scale = .85
			}
		)


		task.wait(.2)


		Main.Visible = false


		if RestoreButton then

			RestoreButton.Visible = true

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
		Theme.CardTransparency


	Content.Parent = Main



	Utility:Corner(
		Content,
		14
	)



	local Sidebar = Instance.new("Frame")

	Sidebar.Size =
		UDim2.fromOffset(
			160,
			380
		)


	Sidebar.BackgroundTransparency = 1


	Sidebar.Parent = Content



	local Pages = Instance.new("Frame")


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


	Pages.Parent = Content



	local Object = {}


	Object.ScreenGui = ScreenGui

	Object.Main = Main



	function Object:Notify(data)

		if Components.Notification then

			return Components.Notification:Create(
				ScreenGui,
				data,
				Theme,
				Utility
			)

		end

	end



	function Object:CreateTab(Name)

		local TabSystem =
			Tab:Create(
				Pages,
				Sidebar,
				Theme,
				Utility,
				Section,
				Components
			)


		return TabSystem:New(Name)

	end



	print("CrimsonCore Glass Window Loaded")


	return Object

end


return Window
