--// CrimsonCore Section System v1.0

local Section = {}


function Section:Create(Page, name, Theme, Utility, Components)

	local Frame = Instance.new("Frame")

	Frame.Size = UDim2.new(1,-20,0,80)

	Frame.AutomaticSize = Enum.AutomaticSize.Y

	Frame.BackgroundColor3 = Theme.Panel

	Frame.Parent = Page


	Utility:Corner(Frame,14)

	Utility:Stroke(Frame,Theme.Crimson,1)



	local Title = Instance.new("TextLabel")

	Title.Size = UDim2.new(1,-20,0,30)

	Title.Position = UDim2.fromOffset(10,5)

	Title.BackgroundTransparency = 1

	Title.Text = name or "Section"

	Title.TextColor3 = Theme.Text

	Title.Font = Enum.Font.BuilderSansBold

	Title.TextSize = 17

	Title.TextXAlignment = Enum.TextXAlignment.Left

	Title.Parent = Frame



	local Holder = Instance.new("Frame")

	Holder.Size = UDim2.new(1,-20,0,0)

	Holder.Position = UDim2.fromOffset(10,40)

	Holder.AutomaticSize = Enum.AutomaticSize.Y

	Holder.BackgroundTransparency = 1

	Holder.Parent = Frame



	local Layout = Instance.new("UIListLayout")

	Layout.Padding = UDim.new(0,8)

	Layout.Parent = Holder



	local Object = {}


	Object.Frame = Frame

	Object.Holder = Holder



	function Object:CreateButton(config)

		return Components.Button:Create(
			Holder,
			config,
			Theme,
			Utility
		)

	end



	function Object:CreateToggle(config)

		return Components.Toggle:Create(
			Holder,
			config,
			Theme,
			Utility
		)

	end



	function Object:CreateSlider(config)

		return Components.Slider:Create(
			Holder,
			config,
			Theme,
			Utility
		)

	end



	return Object

end


return Section
