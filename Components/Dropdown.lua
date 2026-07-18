--// CrimsonCore Dropdown Component v1.0
--// Premium Hybrid Edition

local Dropdown = {}

local TweenService = game:GetService("TweenService")


function Dropdown:Create(parent, config, Theme, Utility)

	config = config or {}

	local Options = config.Options or {
		"Option 1",
		"Option 2"
	}


	local Open = false


	local Holder = Instance.new("Frame")

	Holder.Name = config.Text or "Dropdown"

	Holder.Size = UDim2.new(1,-10,0,45)

	Holder.BackgroundColor3 = Theme.Panel

	Holder.Parent = parent


	Utility:Corner(Holder,12)

	Utility:Stroke(
		Holder,
		Theme.Crimson,
		1.5
	)



	local Button = Instance.new("TextButton")

	Button.Size = UDim2.new(1,0,0,45)

	Button.BackgroundTransparency = 1

	Button.Text =
		config.Text or "Dropdown"


	Button.TextColor3 = Theme.Text

	Button.Font = Enum.Font.BuilderSansBold

	Button.TextSize = 15

	Button.TextXAlignment = Enum.TextXAlignment.Left

	Button.Parent = Holder



	Utility:Padding(
		Button,
		15
	)



	local Arrow = Instance.new("TextLabel")

	Arrow.Size = UDim2.fromOffset(30,45)

	Arrow.Position = UDim2.new(1,-35,0,0)

	Arrow.BackgroundTransparency = 1

	Arrow.Text = "▼"

	Arrow.TextColor3 = Theme.Crimson

	Arrow.Font = Enum.Font.BuilderSansBold

	Arrow.TextSize = 16

	Arrow.Parent = Holder



	local List = Instance.new("Frame")

	List.Size = UDim2.new(1,0,0,0)

	List.Position = UDim2.fromOffset(0,50)

	List.BackgroundColor3 = Theme.Panel

	List.ClipsDescendants = true

	List.Visible = false

	List.Parent = Holder


	Utility:Corner(List,12)



	local Layout = Instance.new("UIListLayout")

	Layout.Padding = UDim.new(0,5)

	Layout.Parent = List



	local function Close()

		Open = false

		Arrow.Text = "▼"


		TweenService:Create(
			List,
			TweenInfo.new(.25),
			{
				Size = UDim2.new(1,0,0,0)
			}
		):Play()


		task.wait(.25)

		List.Visible = false

	end



	for _,option in ipairs(Options) do


		local OptionButton = Instance.new("TextButton")


		OptionButton.Size =
			UDim2.new(1,-10,0,35)


		OptionButton.BackgroundColor3 =
			Theme.Background


		OptionButton.Text =
			option


		OptionButton.TextColor3 =
			Theme.Text


		OptionButton.Font =
			Enum.Font.BuilderSans


		OptionButton.TextSize = 14


		OptionButton.Parent = List



		Utility:Corner(
			OptionButton,
			8
		)



		OptionButton.MouseButton1Click:Connect(function()


			Button.Text = option


			if config.Callback then

				config.Callback(option)

			end


			Close()

		end)


	end



	Button.MouseButton1Click:Connect(function()


		Open = not Open


		if Open then


			List.Visible = true

			Arrow.Text = "▲"


			TweenService:Create(
				List,
				TweenInfo.new(.25),
				{
					Size =
						UDim2.new(
							1,
							0,
							0,
							(#Options*40)+10
						)
				}
			):Play()


		else

			Close()

		end


	end)



	return Holder

end


return Dropdown
