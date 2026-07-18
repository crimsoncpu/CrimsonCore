--// CrimsonCore Notification Component v1.4

local Notification = {}

local TweenService = game:GetService("TweenService")


function Notification:Create(ScreenGui, config, Theme, Utility)

	config = config or {}


	local Holder = ScreenGui:FindFirstChild("Notifications")


	if not Holder then

		Holder = Instance.new("Frame")

		Holder.Name = "Notifications"

		Holder.Size = UDim2.fromOffset(350,250)

		-- Roblox style bottom-right, slightly above bottom
		Holder.Position = UDim2.new(1,-370,1,-300)

		Holder.BackgroundTransparency = 1

		Holder.Parent = ScreenGui


		local Layout = Instance.new("UIListLayout")

		Layout.Padding = UDim.new(0,12)

		Layout.VerticalAlignment = Enum.VerticalAlignment.Bottom

		Layout.Parent = Holder

	end



	local Box = Instance.new("Frame")

	Box.Size = UDim2.fromOffset(320,70)

	Box.BackgroundColor3 = Theme.Panel

	Box.BackgroundTransparency = 1

	Box.Position = UDim2.fromOffset(60,0)

	Box.Parent = Holder



	Utility:Corner(Box,14)

	Utility:Stroke(Box,Theme.Crimson,1)



	local Text = Instance.new("TextLabel")

	Text.Size = UDim2.new(1,-25,1,0)

	Text.Position = UDim2.fromOffset(15,0)

	Text.BackgroundTransparency = 1

	Text.TextColor3 = Theme.Text

	Text.TextTransparency = 1

	Text.Font = Enum.Font.BuilderSansBold

	Text.TextSize = 15

	Text.TextXAlignment = Enum.TextXAlignment.Left

	Text.Text = config.Text or "Notification"

	Text.Parent = Box



	-- fade + slide in

	TweenService:Create(
		Box,
		TweenInfo.new(
			0.45,
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.Out
		),
		{
			BackgroundTransparency = 0,
			Position = UDim2.fromOffset(0,0)
		}
	):Play()



	TweenService:Create(
		Text,
		TweenInfo.new(
			0.35,
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.Out
		),
		{
			TextTransparency = 0
		}
	):Play()



	task.delay(config.Duration or 3,function()

		TweenService:Create(
			Box,
			TweenInfo.new(
				0.35,
				Enum.EasingStyle.Quint,
				Enum.EasingDirection.In
			),
			{
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(70,0)
			}
		):Play()



		TweenService:Create(
			Text,
			TweenInfo.new(.25),
			{
				TextTransparency = 1
			}
		):Play()



		task.wait(.4)

		Box:Destroy()

	end)


	return Box

end


return Notification
