--// CrimsonCore Label Component v1.0

local Label = {}


function Label:Create(Parent, config, Theme, Utility)

	config = config or {}


	local Text = Instance.new("TextLabel")

	Text.Size = UDim2.new(1,-10,0,32)

	Text.BackgroundColor3 = Theme.Secondary

	Text.BackgroundTransparency = 0

	Text.TextColor3 = Theme.Text

	Text.Font = Enum.Font.BuilderSansBold

	Text.TextSize = 14

	Text.TextXAlignment = Enum.TextXAlignment.Left

	Text.Text = config.Text or "Label"

	Text.Parent = Parent



	Utility:Corner(Text,10)



	return {

		Object = Text,


		Set = function(value)

			Text.Text = value

		end

	}

end


return Label
