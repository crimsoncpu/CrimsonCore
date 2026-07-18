--// CrimsonCore Window System v1.0

local Window = {}

local Players = game:GetService("Players")

local Player = Players.LocalPlayer



function Window:Create(config, Theme, Utility, Drag)

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



	local function TopButton(text,x)

		local Button = Instance.new("TextButton")

		Button.Size = UDim2.fromOffset(35,35)

		Button.Position = UDim2.new(1,x,0.5,-17)

		Button.Text = text

		Button.TextColor3 = Theme.Text

		Button.Font = Enum.Font.BuilderSansBold

		Button.TextSize = 18

		Button.BackgroundColor3 = Theme.Crimson

		Button.Parent = Top


		Utility:Corner(Button,10)

		return Button

	end



	local Minimize = TopButton("-", -135)

	local Maximize = TopButton("+", -90)

	local Close = TopButton("X", -45)



	local OriginalSize = Main.Size

	local Minimized = false


	Minimize.MouseButton1Click:Connect(function()

		Minimized = not Minimized

		if Minimized then

			Utility:Tween(Main,.25,{
				Size = UDim2.fromOffset(760,55)
			})

		else

			Utility:Tween(Main,.25,{
				Size = OriginalSize
			})

		end

	end)



	local Full = false


	Maximize.MouseButton1Click:Connect(function()

		Full = not Full


		if Full then

			Utility:Tween(Main,.25,{
				Size = UDim2.fromScale(.9,.8),
				Position = UDim2.fromScale(.5,.5)
			})

		else

			Utility:Tween(Main,.25,{
				Size = OriginalSize,
				Position = UDim2.fromScale(.5,.5)
			})

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

	Sidebar.Size = UDim2.fromOffset(160,1)

	Sidebar.AutomaticSize = Enum.AutomaticSize.Y

	Sidebar.BackgroundTransparency = 1

	Sidebar.Parent = Content



	local SidebarLayout = Instance.new("UIListLayout")

	SidebarLayout.Padding = UDim.new(0,8)

	SidebarLayout.Parent = Sidebar



	local Pages = Instance.new("Frame")

	Pages.Size = UDim2.new(1,-180,1,0)

	Pages.Position = UDim2.fromOffset(180,0)

	Pages.BackgroundTransparency = 1

	Pages.Parent = Content



	print("CrimsonCore Window Created")



	return {

		ScreenGui = ScreenGui,

		Main = Main,

		Top = Top,

		Content = Content,

		Sidebar = Sidebar,

		Pages = Pages

	}

end



return Window
