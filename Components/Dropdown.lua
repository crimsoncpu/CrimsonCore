--// CrimsonCore Dropdown Component v1.0

local Dropdown = {}


function Dropdown:Create(Parent, config, Theme, Utility)

	config = config or {}


	local Open = false

	local Selected = config.Default or "Select"



	local Frame = Instance.new("Frame")

	Frame.Size = UDim2.new(1,-10,0,38)

	Frame.BackgroundColor3 = Theme.Secondary

	Frame.ClipsDescendants = true

	Frame.Parent = Parent


	Utility:Corner(Frame,10)



	local Button = Instance.new("TextButton")

	Button.Size = UDim2.new(1,0,0,38)

	Button.BackgroundTransparency = 1

	Button.TextColor3 = Theme.Text

	Button.Font = Enum.Font.BuilderSansBold

	Button.TextSize = 14

	Button.Text = (config.Name or "Dropdown")..": "..Selected

	Button.Parent = Frame



	local Options = Instance.new("Frame")

	Options.Size = UDim2.new(1,0,0,0)

	Options.Position = UDim2.fromOffset(0,38)

	Options.BackgroundTransparency = 1

	Options.Parent = Frame



	local Layout = Instance.new("UIListLayout")

	Layout.Padding = UDim.new(0,5)

	Layout.Parent = Options



	local function Select(value)

		Selected = value

		Button.Text =
			(config.Name or "Dropdown")..": "..value


		if config.Callback then
			config.Callback(value)
		end

	end



	for _,option in pairs(config.Options or {}) do


		local Option = Instance.new("TextButton")

		Option.Size = UDim2.new(1,0,0,32)

		Option.BackgroundColor3 = Theme.Panel

		Option.TextColor3 = Theme.Text

		Option.Font = Enum.Font.BuilderSansBold

		Option.TextSize = 13

		Option.Text = tostring(option)

		Option.Parent = Options


		Utility:Corner(Option,8)



		Option.MouseButton1Click:Connect(function()

			Select(option)

			Open = false

			Frame.Size = UDim2.new(1,-10,0,38)

		end)


	end



	Button.MouseButton1Click:Connect(function()

		Open = not Open


		if Open then

			local Height =
				(#(config.Options or {}) * 37) + 45


			Utility:Tween(Frame,.2,{
				Size = UDim2.new(1,-10,0,Height)
			})


		else

			Utility:Tween(Frame,.2,{
				Size = UDim2.new(1,-10,0,38)
			})

		end

	end)



	return {

		Get = function()
			return Selected
		end

	}

end


return Dropdown
