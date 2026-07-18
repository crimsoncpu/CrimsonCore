--// CrimsonCore Label Component v1.0

local Label = {}


function Label:Create(parent, config, Theme, Utility)

	config = config or {}


	local Holder = Instance.new("Frame")

	Holder.Name = config.Text or "Label"

	Holder.Size =
		UDim2.new(
			1,
			-10,
			0,
			40
		)


	Holder.BackgroundColor3 =
		Theme.Panel


	Holder.Parent = parent



	Utility:Corner(
		Holder,
		10
	)


	Utility:Stroke(
		Holder,
		Theme.Crimson,
		1
	)



	local Text = Instance.new("TextLabel")

	Text.Size =
		UDim2.new(
			1,
			-20,
			1,
			0
		)


	Text.Position =
		UDim2.fromOffset(
			10,
			0
		)


	Text.BackgroundTransparency = 1


	Text.Text =
		config.Text or "Label"


	Text.TextColor3 =
		Theme.SubText


	Text.Font =
		Enum.Font.BuilderSans


	Text.TextSize = 14


	Text.TextXAlignment =
		Enum.TextXAlignment.Left


	Text.Parent = Holder



	return {

		Set = function(_,value)

			Text.Text = value

		end,


		Get = function()

			return Text.Text

		end

	}

end


return Label
