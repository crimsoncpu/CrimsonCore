--// CrimsonCore Section System v2.0
--// Premium Hybrid Edition

local Section = {}

local TweenService = game:GetService("TweenService")


function Section:Create(Page, title, Theme, Utility, Components)


	local Object = {}



	local Holder = Instance.new("Frame")

	Holder.Name = title or "Section"

	Holder.Size = UDim2.new(1,-10,0,50)

	Holder.BackgroundColor3 = Theme.Panel

	Holder.BackgroundTransparency = .15

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

	Title.Size = UDim2.new(1,-25,0,35)

	Title.Position = UDim2.fromOffset(15,5)

	Title.BackgroundTransparency = 1

	Title.Text = title or "Section"

	Title.TextColor3 = Theme.Text

	Title.Font = Enum.Font.BuilderSansBold

	Title.TextSize = 18

	Title.TextXAlignment = Enum.TextXAlignment.Left

	Title.Parent = Holder



	local Container = Instance.new("Frame")

	Container.Size = UDim2.new(1,-20,0,0)

	Container.Position = UDim2.fromOffset(10,45)

	Container.BackgroundTransparency = 1

	Container.AutomaticSize = Enum.AutomaticSize.Y

	Container.Parent = Page



	local Layout = Instance.new("UIListLayout")

	Layout.Padding = UDim.new(0,8)

	Layout.Parent = Container



	Holder.Size =
		UDim2.new(
			1,-10,
			0,
			50
		)



	Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()


		local Size =
			Layout.AbsoluteContentSize.Y



		Holder.Size =
			UDim2.new(
				1,-10,
				0,
				Size + 60
			)


	end)



	-- small entrance animation

	Holder.BackgroundTransparency = 1


	TweenService:Create(
		Holder,
		TweenInfo.new(
			.35,
			Enum.EasingStyle.Quint
		),
		{
			BackgroundTransparency = .15
		}
	):Play()



	local function AddComponent(component)

		component.Parent = Container

	end



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



	return Object

end


return Section
