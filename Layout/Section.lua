--// CrimsonCore Section System v2.2
--// Full Component Support

local Section = {}

local TweenService = game:GetService("TweenService")


function Section:Create(Page, title, Theme, Utility, Components)

	local Object = {}


	local Holder = Instance.new("Frame")

	Holder.Name = title or "Section"

	Holder.Size =
		UDim2.new(
			1,
			-10,
			0,
			60
		)


	Holder.BackgroundColor3 =
		Theme.Panel


	Holder.BackgroundTransparency =
		Theme.CardTransparency or .25


	Holder.Parent = Page



	Utility:Corner(
		Holder,
		14
	)


	Utility:Stroke(
		Holder,
		Theme.Crimson,
		1.5
	)



	local Title = Instance.new("TextLabel")

	Title.Size =
		UDim2.new(
			1,
			-20,
			0,
			35
		)


	Title.Position =
		UDim2.fromOffset(
			10,
			5
		)


	Title.BackgroundTransparency = 1


	Title.Text =
		title or "Section"


	Title.TextColor3 =
		Theme.Text


	Title.Font =
		Enum.Font.BuilderSansBold


	Title.TextSize = 18


	Title.TextXAlignment =
		Enum.TextXAlignment.Left


	Title.Parent = Holder



	local Container = Instance.new("Frame")

	Container.Size =
		UDim2.new(
			1,
			-20,
			0,
			0
		)


	Container.Position =
		UDim2.fromOffset(
			10,
			45
		)


	Container.BackgroundTransparency = 1


	Container.AutomaticSize =
		Enum.AutomaticSize.Y


	Container.Parent = Holder



	local Layout = Instance.new("UIListLayout")

	Layout.Padding =
		UDim.new(
			0,
			8
		)


	Layout.Parent = Container



	Layout:GetPropertyChangedSignal(
		"AbsoluteContentSize"
	):Connect(function()


		Holder.Size =
			UDim2.new(
				1,
				-10,
				0,
				Layout.AbsoluteContentSize.Y + 60
			)


	end)



	-- animation

	Holder.BackgroundTransparency = 1


	TweenService:Create(

		Holder,

		TweenInfo.new(
			.35,
			Enum.EasingStyle.Quint
		),

		{
			BackgroundTransparency =
				Theme.CardTransparency or .25
		}

	):Play()



	-- Components


	function Object:CreateButton(config)

		return Components.Button:Create(
			Container,
			config,
			Theme,
			Utility
		)

	end



	function Object:CreateToggle(config)

		return Components.Toggle:Create(
			Container,
			config,
			Theme,
			Utility
		)

	end



	function Object:CreateSlider(config)

		return Components.Slider:Create(
			Container,
			config,
			Theme,
			Utility
		)

	end



	function Object:CreateDropdown(config)

		return Components.Dropdown:Create(
			Container,
			config,
			Theme,
			Utility
		)

	end



	function Object:CreateTextbox(config)

		return Components.Textbox:Create(
			Container,
			config,
			Theme,
			Utility
		)

	end



	function Object:CreateKeybind(config)

		return Components.Keybind:Create(
			Container,
			config,
			Theme,
			Utility
		)

	end



	function Object:CreateLabel(config)

		return Components.Label:Create(
			Container,
			config,
			Theme,
			Utility
		)

	end



	function Object:CreateDivider(config)

		return Components.Divider:Create(
			Container,
			config,
			Theme,
			Utility
		)

	end



	return Object

end


return Section
