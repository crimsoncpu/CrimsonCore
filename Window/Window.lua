--// CrimsonCore Window System v2.0
--// Hybrid Glass Edition

local Window = {}

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local Player = Players.LocalPlayer


local function Tween(obj,time,properties,style,direction)

	local info = TweenInfo.new(
		time,
		style or Enum.EasingStyle.Quint,
		direction or Enum.EasingDirection.Out
	)

	local tween = TweenService:Create(
		obj,
		info,
		properties
	)

	tween:Play()

	return tween
end



function Window:Create(config, Theme, Utility, Drag, Floating, Tab, Section, Components)

	config = config or {}



	local ScreenGui = Instance.new("ScreenGui")

	ScreenGui.Name = "CrimsonCore"

	ScreenGui.ResetOnSpawn = false

	ScreenGui.IgnoreGuiInset = true

	ScreenGui.Parent = Player:WaitForChild("PlayerGui")



	local Main = Instance.new("Frame")

	Main.Name = "MainWindow"

	Main.Size = UDim2.fromOffset(760,500)

	Main.Position = UDim2.fromScale(.5,.5)

	Main.AnchorPoint = Vector2.new(.5,.5)

	Main.BackgroundColor3 = Theme.Background

	Main.BackgroundTransparency = 1

	Main.Parent = ScreenGui



	Utility:Corner(Main,18)

	Utility:Stroke(Main,Theme.Crimson,2)



	local UIScale = Instance.new("UIScale")

	UIScale.Scale = .85

	UIScale.Parent = Main



	-- opening animation

	Tween(
		Main,
		.45,
		{
			BackgroundTransparency = 0
		}
	)


	Tween(
		UIScale,
		.45,
		{
			Scale = 1
		},
		Enum.EasingStyle.Back
	)



	-- top bar

	local Top = Instance.new("Frame")

	Top.Size = UDim2.new(1,0,0,55)

	Top.BackgroundColor3 = Theme.Panel

	Top.BackgroundTransparency = .1

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



	local function CreateButton(text,x)

		local Button = Instance.new("TextButton")

		Button.Size = UDim2.fromOffset(35,35)

		Button.Position = UDim2.new(1,x,.5,-17)

		Button.BackgroundColor3 = Theme.Crimson

		Button.Text = text

		Button.TextColor3 = Theme.Text

		Button.Font = Enum.Font.BuilderSansBold

		Button.TextSize = 18

		Button.AutoButtonColor = false

		Button.Parent = Top



		Utility:Corner(Button,10)



		Button.MouseEnter:Connect(function()

			Tween(
				Button,
				.15,
				{
					Size = UDim2.fromOffset(40,40)
				}
			)

		end)



		Button.MouseLeave:Connect(function()

			Tween(
				Button,
				.15,
				{
					Size = UDim2.fromOffset(35,35)
				}
			)

		end)



		return Button

	end



	local Minimize = CreateButton("-", -135)

	local Maximize = CreateButton("+", -90)

	local Close = CreateButton("X", -45)



	local RestoreButton


	if Floating then

		RestoreButton = Floating:Create(
			ScreenGui,
			Main,
			Theme,
			Utility
		)


		RestoreButton.Visible = false

	end



	Minimize.MouseButton1Click:Connect(function()


		Tween(
			Main,
			.3,
			{
				BackgroundTransparency = 1
			}
		)


		task.wait(.25)


		Main.Visible = false


		if RestoreButton then

			RestoreButton.Visible = true

		end

	end)



	local Full = false

	local OldSize = Main.Size



	Maximize.MouseButton1Click:Connect(function()


		Full = not Full


		if Full then

			Tween(
				Main,
				.35,
				{
					Size = UDim2.fromScale(.9,.8)
				}
			)

		else

			Tween(
				Main,
				.35,
				{
					Size = OldSize
				}
			)

		end

	end)



	Close.MouseButton1Click:Connect(function()


		Tween(
			Main,
			.25,
			{
				BackgroundTransparency = 1
			}
		)


		task.wait(.25)


		ScreenGui:Destroy()

	end)



	local Content = Instance.new("Frame")

	Content.Size = UDim2.new(1,-40,1,-80)

	Content.Position = UDim2.fromOffset(20,65)

	Content.BackgroundColor3 = Theme.Panel

	Content.BackgroundTransparency = .15

	Content.Parent = Main


	Utility:Corner(Content,14)



	local Sidebar = Instance.new("Frame")

	Sidebar.Size = UDim2.fromOffset(160,380)

	Sidebar.Position = UDim2.fromOffset(10,20)

	Sidebar.BackgroundTransparency = 1

	Sidebar.Parent = Content



	local Pages = Instance.new("Frame")

	Pages.Size = UDim2.new(1,-180,1,-40)

	Pages.Position = UDim2.fromOffset(180,20)

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



	function Object:CreateTab(name)

		local TabSystem = Tab:Create(
			Pages,
			Sidebar,
			Theme,
			Utility,
			Section,
			Components
		)

		return TabSystem:New(name)

	end



	print("CrimsonCore Window v2.0 Loaded")


	return Object

end


return Window
