--// CrimsonCore Keybind Component v1.0

local Keybind = {}

local UserInputService = game:GetService("UserInputService")


function Keybind:Create(Parent, config, Theme, Utility)

	config = config or {}


	local CurrentKey = config.Default or Enum.KeyCode.RightShift

	local Listening = false



	local Button = Instance.new("TextButton")

	Button.Size = UDim2.new(1,-10,0,38)

	Button.BackgroundColor3 = Theme.Secondary

	Button.TextColor3 = Theme.Text

	Button.Font = Enum.Font.BuilderSansBold

	Button.TextSize = 14

	Button.AutoButtonColor = false

	Button.Parent = Parent



	Utility:Corner(Button,10)



	local function Update()

		Button.Text =
			(config.Name or "Keybind")..
			": "..CurrentKey.Name

	end



	Update()



	Button.MouseButton1Click:Connect(function()

		Listening = true

		Button.Text = "Press a key..."

	end)



	UserInputService.InputBegan:Connect(function(input, gameProcessed)

		if gameProcessed then
			return
		end


		if Listening then

			if input.KeyCode ~= Enum.KeyCode.Unknown then

				CurrentKey = input.KeyCode

				Listening = false

				Update()

			end

		elseif input.KeyCode == CurrentKey then

			if config.Callback then

				config.Callback()

			end

		end

	end)



	return {

		Get = function()

			return CurrentKey

		end

	}

end


return Keybind
