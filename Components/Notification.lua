--// CrimsonCore Notification System v2.0
--// Premium Hybrid Edition

local Notification = {}

local TweenService = game:GetService("TweenService")


function Notification:Create(ScreenGui, config, Theme, Utility)

	config = config or {}



	local Holder = ScreenGui:FindFirstChild("Notifications")


	if not Holder then

		Holder = Instance.new("Frame")

		Holder.Name = "Notifications"

		Holder.Size = UDim2.fromOffset(360,300)

		Holder.Position = UDim2.new(1,-380,1,-330)

		Holder.BackgroundTransparency = 1

		Holder.Parent = ScreenGui



		local Layout = Instance.new("UIListLayout")

		Layout.Padding = UDim.new(0,12)

		Layout.VerticalAlignment = Enum.VerticalAlignment.Bottom

		Layout.Parent = Holder

	end



	local Card = Instance.new("Frame")

	Card.Size = UDim2.fromOffset(330,75)

	Card.BackgroundColor3 = Theme.Panel

	Card.BackgroundTransparency = 1

	Card.Position = UDim2.fromOffset(80,0)

	Card.Parent = Holder



	Utility:Corner(Card,16)

	Utility:Stroke(Card,Theme.Crimson,2)



	local Title = Instance.new("TextLabel")

	Title.Size = UDim2.new(1,-25,1,0)

	Title.Position = UDim2.fromOffset(15,0)

	Title.BackgroundTransparency = 1

	Title.Text = config.Text or "Notification"

	Title.TextColor3 = Theme.Text

	Title.TextTransparency = 1

	Title.Font = Enum.Font.BuilderSansBold

	Title.TextSize = 16

	Title.TextXAlignment = Enum.TextXAlignment.Left

	Title.Parent = Card



	-- fade + slide in

	TweenService:Create(
		Card,
		TweenInfo.new(
			.45,
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.Out
		),
		{
			BackgroundTransparency = .1,
			Position = UDim2.fromOffset(0,0)
		}
	):Play()



	TweenService:Create(
		Title,
		TweenInfo.new(.35),
		{
			TextTransparency = 0
		}
	):Play()



	task.delay(config.Duration or 3,function()


		TweenService:Create(
			Card,
			TweenInfo.new(
				.35,
				Enum.EasingStyle.Quint,
				Enum.EasingDirection.In
			),
			{
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(90,0)
			}
		):Play()



		TweenService:Create(
			Title,
			TweenInfo.new(.25),
			{
				TextTransparency = 1
			}
		):Play()



		task.wait(.4)

		Card:Destroy()

	end)



	return Card

end


return Notification
