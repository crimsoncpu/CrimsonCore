--// CrimsonCore Textbox Component v1.0

local Textbox = {}



function Textbox:Create(parent, config, Theme, Utility)

	config = config or {}



	local Holder = Instance.new("Frame")

	Holder.Name = config.Text or "Textbox"

	Holder.Size = UDim2.new(1,-10,0,45)

	Holder.BackgroundColor3 = Theme.Panel

	Holder.Parent = parent



	Utility:Corner(
		Holder,
		12
	)


	Utility:Stroke(
		Holder,
		Theme.Crimson,
		1.5
	)



	local Box = Instance.new("TextBox")

	Box.Size =
		UDim2.new(
			1,-20,
			1,
			0
		)


	Box.Position =
		UDim2.fromOffset(
			10,
			0
		)


	Box.BackgroundTransparency = 1


	Box.TextColor3 =
		Theme.Text


	Box.PlaceholderColor3 =
		Theme.SubText


	Box.PlaceholderText =
		config.Placeholder or "Enter text..."


	Box.Text =
		config.Default or ""


	Box.Font =
		Enum.Font.BuilderSansBold


	Box.TextSize = 15


	Box.TextXAlignment =
		Enum.TextXAlignment.Left


	Box.ClearTextOnFocus = false


	Box.Parent = Holder



	Box.FocusLost:Connect(function()

		if config.Callback then

			config.Callback(
				Box.Text
			)

		end

	end)



	return {

		Set = function(_,value)

			Box.Text = value

		end,


		Get = function()

			return Box.Text

		end

	}

end



return Textbox
