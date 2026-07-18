--// CrimsonCore Button Component v2.0
--// Premium Hybrid Edition

local Button = {}

local TweenService = game:GetService("TweenService")


function Button:Create(parent, config, Theme, Utility)

	config = config or {}



	local MainButton = Instance.new("TextButton")

	MainButton.Name = config.Name or "Button"

	MainButton.Size = UDim2.new(1,-10,0,42)

	MainButton.BackgroundColor3 = Theme.Panel

	MainButton.Text = config.Text or "Button"

	MainButton.TextColor3 = Theme.Text

	MainButton.Font = Enum.Font.BuilderSansBold

	MainButton.TextSize = 16

	MainButton.AutoButtonColor = false

	MainButton.Parent = parent



	Utility:Corner(MainButton,12)

	Utility:Stroke(
		MainButton,
		Theme.Crimson,
		1.5
	)



	local Scale = Instance.new("UIScale")

	Scale.Scale = 1

	Scale.Parent = MainButton



	-- hover

	MainButton.MouseEnter:Connect(function()

		TweenService:Create(
			MainButton,
			TweenInfo.new(.2),
			{
				BackgroundColor3 = Theme.Crimson
			}
		):Play()



		TweenService:Create(
			Scale,
			TweenInfo.new(.15),
			{
				Scale = 1.04
			}
		):Play()

	end)



	MainButton.MouseLeave:Connect(function()

		TweenService:Create(
			MainButton,
			TweenInfo.new(.2),
			{
				BackgroundColor3 = Theme.Panel
			}
		):Play()



		TweenService:Create(
			Scale,
			TweenInfo.new(.15),
			{
				Scale = 1
			}
		):Play()

	end)



	-- click animation

	MainButton.MouseButton1Down:Connect(function()

		TweenService:Create(
			Scale,
			TweenInfo.new(.1),
			{
				Scale = .95
			}
		):Play()

	end)



	MainButton.MouseButton1Up:Connect(function()

		TweenService:Create(
			Scale,
			TweenInfo.new(.15),
			{
				Scale = 1.04
			}
		):Play()



		if config.Callback then

			config.Callback()

		end

	end)



	return MainButton

end


return Button
