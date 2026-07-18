--// CrimsonCore Window System v1.7

local Window = {}

local Players = game:GetService("Players")
local Player = Players.LocalPlayer


function Window:Create(config, Theme, Utility, Drag, Floating, Tab, Section, Components)

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

	Main.Parent = Main.Parent or ScreenGui


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



	local function TopButton(text,offset)

		local Button = Instance.new("TextButton")

		Button.Size = UDim2.fromOffset(35,35)

		Button.Position = UDim2.new(1,offset,.5,-17)

		Button.Text = text

		Button.TextColor3 = Theme.Text

		Button.BackgroundColor3 = Theme.Crimson

		Button.Font = Enum.Font.BuilderSansBold

		Button.TextSize = 18

		Button.Parent = Top


		Utility:Corner(Button,10)

		return Button

	end



	local Minimize = TopButton("-", -135)

	local Maximize = TopButton("+", -90)

	local Close = TopButton("X", -45)



	--// Floating C

	local RestoreButton

	if Floating then

		RestoreButton = Floating:Create(
			ScreenGui,
			Main,
			Theme,
			Utility
		)

		-- hide until minimize is pressed
		RestoreButton.Visible = false

	end



	Minimize.MouseButton1Click:Connect(function()

		Main.Visible = false

		if RestoreButton then

			RestoreButton.Visible = true

		end

	end)



	local Full = false

	local OriginalSize = Main.Size



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



	local Content = Instance.new("Frame")

	Content.Size = UDim2.new(1,-40,1,-80)

	Content.Position = UDim2.fromOffset(20,65)

	Content.BackgroundColor3 = Theme.Panel

	Content.Parent = Main


	Utility:Corner(Content,14)



	local Sidebar = Instance.new("Frame")

	Sidebar.Size = UDim2.fromOffset(160,380)

	Sidebar.Position = UDim2.fromOffset(10,20)

	Sidebar.BackgroundTransparency = 1

	Sidebar.Parent = Content



	local SideLayout = Instance.new("UIListLayout")

	SideLayout.Padding = UDim.new(0,8)

	SideLayout.Parent = Sidebar



	local Pages = Instance.new("Frame")

	Pages.Size = UDim2.new(1,-180,1,-40)

	Pages.Position = UDim2.fromOffset(180,20)

	Pages.BackgroundTransparency = 1

	Pages.Parent = Content



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



	print("CrimsonCore Window Created")


	return Object

end


return Window
