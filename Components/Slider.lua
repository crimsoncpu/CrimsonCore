--// CrimsonCore Slider Component v1.1 (Mobile Support)

local Slider = {}

local UserInputService = game:GetService("UserInputService")


function Slider:Create(Parent, config, Theme, Utility)

	config = config or {}


	local Min = config.Min or 0
	local Max = config.Max or 100
	local Value = config.Default or Min


	local Frame = Instance.new("Frame")

	Frame.Size = UDim2.new(1,-10,0,55)

	Frame.BackgroundColor3 = Theme.Secondary

	Frame.Parent = Parent


	Utility:Corner(Frame,10)



	local Label = Instance.new("TextLabel")

	Label.Size = UDim2.new(1,-20,0,25)

	Label.Position = UDim2.fromOffset(10,5)

	Label.BackgroundTransparency = 1

	Label.TextColor3 = Theme.Text

	Label.Font = Enum.Font.BuilderSansBold

	Label.TextSize = 14

	Label.TextXAlignment = Enum.TextXAlignment.Left

	Label.Text = (config.Name or "Slider")..": "..Value

	Label.Parent = Frame



	local Bar = Instance.new("Frame")

	Bar.Size = UDim2.new(.9,0,0,8)

	Bar.Position = UDim2.fromScale(.05,.65)

	Bar.BackgroundColor3 = Theme.Panel

	Bar.Parent = Frame


	Utility:Corner(Bar,10)



	local Fill = Instance.new("Frame")

	Fill.BackgroundColor3 = Theme.Crimson

	Fill.Size = UDim2.new(
		(Value-Min)/(Max-Min),
		0,
		1,
		0
	)

	Fill.Parent = Bar


	Utility:Corner(Fill,10)



	local Dragging = false



	local function Update(input)

		local Percent = math.clamp(
			(input.Position.X - Bar.AbsolutePosition.X)
			/ Bar.AbsoluteSize.X,
			0,
			1
		)


		Value = math.floor(
			Min + ((Max-Min) * Percent)
		)


		Fill.Size = UDim2.new(
			Percent,
			0,
			1,
			0
		)


		Label.Text =
			(config.Name or "Slider")..": "..Value



		if config.Callback then
			config.Callback(Value)
		end

	end



	Bar.InputBegan:Connect(function(input)

		if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then

			Dragging = true

			Update(input)

		end

	end)



	UserInputService.InputChanged:Connect(function(input)

		if Dragging then

			if input.UserInputType == Enum.UserInputType.MouseMovement
			or input.UserInputType == Enum.UserInputType.Touch then

				Update(input)

			end

		end

	end)



	UserInputService.InputEnded:Connect(function(input)

		if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then

			Dragging = false

		end

	end)



	return {

		Get = function()

			return Value

		end

	}

end


return Slider
