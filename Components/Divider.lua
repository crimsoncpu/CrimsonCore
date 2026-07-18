--// CrimsonCore Divider Component v1.0

local Divider = {}


function Divider:Create(parent, config, Theme, Utility)

	config = config or {}


	local Holder = Instance.new("Frame")

	Holder.Name = "Divider"

	Holder.Size =
		UDim2.new(
			1,
			-10,
			0,
			25
		)


	Holder.BackgroundTransparency = 1

	Holder.Parent = parent



	local Line = Instance.new("Frame")

	Line.Size =
		UDim2.new(
			1,
			0,
			0,
			1
		)


	Line.Position =
		UDim2.new(
			0,
			0,
			.5,
			0
		)


	Line.BackgroundColor3 =
		Theme.Crimson


	Line.BackgroundTransparency =
		.35


	Line.Parent = Holder



	if config.Text then


		local Text = Instance.new("TextLabel")


		Text.Size =
			UDim2.fromOffset(
				120,
				20
			)


		Text.Position =
			UDim2.new(
				.5,
				-60,
				.5,
				-10
			)


		Text.BackgroundColor3 =
			Theme.Panel


		Text.BackgroundTransparency =
			.1


		Text.Text =
			config.Text


		Text.TextColor3 =
			Theme.SubText


		Text.Font =
			Enum.Font.BuilderSansBold


		Text.TextSize = 12


		Text.Parent = Holder



		Utility:Corner(
			Text,
			8
		)

	end



	return Holder

end


return Divider
