--// CrimsonCore Button Component v1.0

local Button = {}


function Button:Create(Parent, config, Theme, Utility)

	config = config or {}


	local Object = Instance.new("TextButton")

	Object.Size = UDim2.new(1,-10,0,38)

	Object.BackgroundColor3 = Theme.Secondary

	Object.Text = config.Name or "Button"

	Object.TextColor3 = Theme.Text

	Object.Font = Enum.Font.BuilderSansBold

	Object.TextSize = 14

	Object.AutoButtonColor = false

	Object.Parent = Parent



	Utility:Corner(Object,10)



	Object.MouseEnter:Connect(function()

		Utility:Tween(Object,.15,{
			BackgroundColor3 = Theme.Crimson
		})

	end)



	Object.MouseLeave:Connect(function()

		Utility:Tween(Object,.15,{
			BackgroundColor3 = Theme.Secondary
		})

	end)



	Object.MouseButton1Click:Connect(function()

		if config.Callback then

			config.Callback()

		end

	end)



	return Object

end


return Button
