--// CrimsonCore Toggle Component v2.0
--// Premium Hybrid Edition

local Toggle = {}

local TweenService = game:GetService("TweenService")


function Toggle:Create(parent, config, Theme, Utility)

	config = config or {}



	local Holder = Instance.new("Frame")

	Holder.Name = config.Name or "Toggle"

	Holder.Size = UDim2.new(1,-10,0,45)

	Holder.BackgroundColor3 = Theme.Panel

	Holder.Parent = parent



	Utility:Corner(Holder,12)

	Utility:Stroke(
		Holder,
		Theme.Crimson,
		1.5
	)



	local Label = Instance.new("TextLabel")

	Label.Size = UDim2.new(.65,0,1,0)

	Label.Position = UDim2.fromOffset(15,0)

	Label.BackgroundTransparency = 1

	Label.Text = config.Text or "Toggle"

	Label.TextColor3 = Theme.Text

	Label.Font = Enum.Font.BuilderSansBold

	Label.TextSize = 16

	Label.TextXAlignment = Enum.TextXAlignment.Left

	Label.Parent = Holder



	local Switch = Instance.new("TextButton")

	Switch.Size = UDim2.fromOffset(50,25)

	Switch.Position = UDim2.new(1,-65,.5,-12)

	Switch.BackgroundColor3 = Color3.fromRGB(60,60,60)

	Switch.Text = ""

	Switch.AutoButtonColor = false

	Switch.Parent = Holder



	Utility:Corner(Switch,100)



	local Circle = Instance.new("Frame")

	Circle.Size = UDim2.fromOffset(19,19)

	Circle.Position = UDim2.fromOffset(3,3)

	Circle.BackgroundColor3 = Color3.fromRGB(230,230,230)

	Circle.Parent = Switch



	Utility:Corner(Circle,100)



	local Enabled = false



	local function Update()

		if Enabled then


			TweenService:Create(
				Switch,
				TweenInfo.new(.25),
				{
					BackgroundColor3 = Theme.Crimson
				}
			):Play()



			TweenService:Create(
				Circle,
				TweenInfo.new(.25),
				{
					Position =
						UDim2.fromOffset(28,3)
				}
			):Play()


		else


			TweenService:Create(
				Switch,
				TweenInfo.new(.25),
				{
					BackgroundColor3 =
						Color3.fromRGB(60,60,60)
				}
			):Play()



			TweenService:Create(
				Circle,
				TweenInfo.new(.25),
				{
					Position =
						UDim2.fromOffset(3,3)
				}
			):Play()


		end

	end



	Switch.MouseButton1Click:Connect(function()


		Enabled = not Enabled


		Update()



		if config.Callback then

			config.Callback(Enabled)

		end


	end)



	return {

		Set = function(_,value)

			Enabled = value

			Update()

		end,


		Get = function()

			return Enabled

		end

	}

end


return Toggle
