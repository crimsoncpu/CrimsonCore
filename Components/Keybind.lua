--// CrimsonCore Keybind Component v1.0

local Keybind = {}

local UserInputService = game:GetService("UserInputService")



function Keybind:Create(parent, config, Theme, Utility)

	config = config or {}


	local CurrentKey =
		config.Default or Enum.KeyCode.RightShift


	local Listening = false



	local Holder = Instance.new("Frame")

	Holder.Name = config.Text or "Keybind"

	Holder.Size =
		UDim2.new(
			1,
			-10,
			0,
			45
		)


	Holder.BackgroundColor3 =
		Theme.Panel


	Holder.Parent = parent



	Utility:Corner(
		Holder,
		12
	)


	Utility:Stroke(
		Holder,
		Theme.Crimson,
		1.5
	)



	local Label = Instance.new("TextLabel")

	Label.Size =
		UDim2.new(
			.6,
			0,
			1,
			0
		)


	Label.Position =
		UDim2.fromOffset(
			15,
			0
		)


	Label.BackgroundTransparency = 1


	Label.Text =
		config.Text or "Keybind"


	Label.TextColor3 =
		Theme.Text


	Label.Font =
		Enum.Font.BuilderSansBold


	Label.TextSize = 15


	Label.TextXAlignment =
		Enum.TextXAlignment.Left


	Label.Parent = Holder



	local Button = Instance.new("TextButton")

	Button.Size =
		UDim2.fromOffset(
			100,
			30
		)


	Button.Position =
		UDim2.new(
			1,
			-110,
			.5,
			-15
		)


	Button.BackgroundColor3 =
		Theme.Crimson


	Button.Text =
		CurrentKey.Name


	Button.TextColor3 =
		Theme.Text


	Button.Font =
		Enum.Font.BuilderSansBold


	Button.TextSize = 14


	Button.Parent = Holder



	Utility:Corner(
		Button,
		8
	)



	Button.MouseButton1Click:Connect(function()

		Listening = true

		Button.Text = "Press Key"

	end)



	UserInputService.InputBegan:Connect(function(input, gameProcessed)

		if gameProcessed then
			return
		end



		if Listening then


			if input.KeyCode ~= Enum.KeyCode.Unknown then


				CurrentKey =
					input.KeyCode


				Button.Text =
					CurrentKey.Name


				Listening = false


			end


			return

		end



		if input.KeyCode == CurrentKey then


			if config.Callback then

				config.Callback()

			end


		end

	end)



	return {

		Get = function()

			return CurrentKey

		end,


		Set = function(_,key)

			CurrentKey = key

			Button.Text = key.Name

		end

	}

end



return Keybind
