--// CrimsonCore Toggle Component v1.0

local Toggle = {}


function Toggle:Create(Parent, config, Theme, Utility)

	config = config or {}


	local Enabled = config.Default or false


	local Button = Instance.new("TextButton")

	Button.Size = UDim2.new(1,-10,0,38)

	Button.BackgroundColor3 = Theme.Secondary

	Button.TextColor3 = Theme.Text

	Button.Font = Enum.Font.BuilderSansBold

	Button.TextSize = 14

	Button.AutoButtonColor = false

	Button.Text = (config.Name or "Toggle") .. " : OFF"

	Button.Parent = Parent



	Utility:Corner(Button,10)



	local function Update()

		if Enabled then

			Button.Text = (config.Name or "Toggle") .. " : ON"

			Utility:Tween(Button,.15,{
				BackgroundColor3 = Theme.Crimson
			})

		else

			Button.Text = (config.Name or "Toggle") .. " : OFF"

			Utility:Tween(Button,.15,{
				BackgroundColor3 = Theme.Secondary
			})

		end

	end



	Button.MouseButton1Click:Connect(function()

		Enabled = not Enabled

		Update()


		if config.Callback then

			config.Callback(Enabled)

		end

	end)



	Update()



	return {

		Button = Button,

		Get = function()

			return Enabled

		end

	}

end


return Toggle
