--// CrimsonCore Section System v2.4
--// Full Glass Section Edition

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
			70
		)

	Holder.AutomaticSize =
		Enum.AutomaticSize.Y

	Holder.ClipsDescendants = false


	-- GLASS SECTION

	Holder.BackgroundColor3 =
		Theme.Panel

	Holder.BackgroundTransparency =
		0.80


	Holder.Parent = Page



	Utility:Corner(
		Holder,
		14
	)


	Utility:Stroke(
		Holder,
		Theme.Crimson,
		1
	)



	local Title = Instance.new("TextLabel")

	Title.Size =
		UDim2.new(
			1,
			-20,
			0,
			30
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

	Container.Name =
		"Components"


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
			40
		)


	Container.AutomaticSize =
		Enum.AutomaticSize.Y


	Container.BackgroundTransparency = 1


	Container.ClipsDescendants = false


	Container.Parent = Holder



	local Layout = Instance.new("UIListLayout")


	Layout.Padding =
		UDim.new(
			0,
			8
		)


	Layout.SortOrder =
		Enum.SortOrder.LayoutOrder


	Layout.Parent = Container



	Layout:GetPropertyChangedSignal(
		"AbsoluteContentSize"
	):Connect(function()


		Holder.Size =
			UDim2.new(
				1,
				-10,
				0,
				Layout.AbsoluteContentSize.Y + 55
			)


	end)



	-- smooth glass fade

	Holder.BackgroundTransparency = 1


	TweenService:Create(

		Holder,

		TweenInfo.new(
			0.35,
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.Out
		),

		{
			BackgroundTransparency = 0.80
		}

	):Play()



	-- COMPONENT LINKS


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
