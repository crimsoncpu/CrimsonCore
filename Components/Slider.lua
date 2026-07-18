--// CrimsonCore Slider Component v2.0
--// Premium Hybrid Edition

local Slider = {}

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")


function Slider:Create(parent, config, Theme, Utility)

	config = config or {}



	local Min = config.Min or 0

	local Max = config.Max or 100

	local Default = config.Default or Min



	local Holder = Instance.new("Frame")

	Holder.Name = config.Name or "Slider"

	Holder.Size = UDim2.new(1,-10,0,60)

	Holder.BackgroundColor3 = Theme.Panel

	Holder.Parent = parent



	Utility:Corner(Holder,12)

	Utility:Stroke(
		Holder,
		Theme.Crimson,
		1.5
	)



	local Label = Instance.new("TextLabel")

	Label.Size = UDim2.new(.7,0,0,25)

	Label.Position = UDim2.fromOffset(15,5)

	Label.BackgroundTransparency = 1

	Label.TextColor3 = Theme.Text

	Label.Font = Enum.Font.BuilderSansBold

	Label.TextSize = 15

	Label.TextXAlignment = Enum.TextXAlignment.Left

	Label.Text = (config.Text or "Slider") .. ": " .. Default

	Label.Parent = Holder



	local Bar = Instance.new("Frame")

	Bar.Size = UDim2.new(1,-30,0,8)

	Bar.Position = UDim2.fromOffset(15,40)

	Bar.BackgroundColor3 = Color3.fromRGB(50,50,50)

	Bar.Parent = Holder



	Utility:Corner(Bar,100)



	local Fill = Instance.new("Frame")

	Fill.BackgroundColor3 = Theme.Crimson

	Fill.Size = UDim2.fromScale(0,1)

	Fill.Parent = Bar



	Utility:Corner(Fill,100)



	local Knob = Instance.new("Frame")

	Knob.Size = UDim2.fromOffset(18,18)

	Knob.BackgroundColor3 = Theme.Text

	Knob.AnchorPoint = Vector2.new(.5,.5)

	Knob.Position = UDim2.fromScale(0,.5)

	Knob.Parent = Bar



	Utility:Corner(Knob,100)



	local Value = Default

	local Dragging = false



	local function SetValue(inputX)


		local Relative =
			math.clamp(
				inputX - Bar.AbsolutePosition.X,
				0,
				Bar.AbsoluteSize.X
			)



		local Percent =
			Relative / Bar.AbsoluteSize.X



		Value =
			math.floor(
				Min +
				(Max-Min) *
				Percent
			)



		TweenService:Create(
			Fill,
			TweenInfo.new(.15),
			{
				Size =
					UDim2.fromScale(
						Percent,
						1
					)
			}
		):Play()



		TweenService:Create(
			Knob,
			TweenInfo.new(.15),
			{
				Position =
					UDim2.fromScale(
						Percent,
						.5
					)
			}
		):Play()



		Label.Text =
			(config.Text or "Slider")
			.. ": "
			.. Value



		if config.Callback then

			config.Callback(Value)

		end

	end



	Bar.InputBegan:Connect(function(input)


		if input.UserInputType ==
			Enum.UserInputType.MouseButton1
		or input.UserInputType ==
			Enum.UserInputType.Touch then


			Dragging = true

			SetValue(input.Position.X)

		end

	end)



	UserInputService.InputChanged:Connect(function(input)


		if Dragging and
		(
			input.UserInputType ==
			Enum.UserInputType.MouseMovement
			or
			input.UserInputType ==
			Enum.UserInputType.Touch
		) then


			SetValue(input.Position.X)

		end


	end)



	UserInputService.InputEnded:Connect(function(input)


		if input.UserInputType ==
			Enum.UserInputType.MouseButton1
		or input.UserInputType ==
			Enum.UserInputType.Touch then


			Dragging = false


		end


	end)



	SetValue(
		Bar.AbsolutePosition.X +
		(
			(Default-Min)/(Max-Min)
			*
			Bar.AbsoluteSize.X
		)
	)



	return {

		Set = function(_,number)

			Value = number

			SetValue(
				Bar.AbsolutePosition.X +
				(
					(number-Min)/(Max-Min)
					*
					Bar.AbsoluteSize.X
				)
			)

		end,


		Get = function()

			return Value

		end

	}

end


return Slider
