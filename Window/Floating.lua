--// CrimsonCore Floating Button v1.0

local Floating = {}



function Floating:Create(ScreenGui, Main, Theme, Utility)

	local Button = Instance.new("TextButton")

	Button.Name = "CrimsonCoreFloating"

	Button.Size = UDim2.fromOffset(55,55)

	Button.Position = UDim2.fromScale(.05,.5)

	Button.BackgroundColor3 = Theme.Crimson

	Button.Text = "C"

	Button.TextColor3 = Theme.Text

	Button.Font = Enum.Font.BuilderSansBold

	Button.TextSize = 28

	Button.AutoButtonColor = false

	Button.Parent = ScreenGui



	Utility:Corner(Button,999)

	Utility:Stroke(Button,Theme.Text,1)



	local Open = true


	Button.MouseButton1Click:Connect(function()

		Open = not Open

		Main.Visible = Open

	end)



	local Dragging = false

	local StartPos

	local StartMouse



	Button.InputBegan:Connect(function(input)

		if input.UserInputType == Enum.UserInputType.MouseButton1 then

			Dragging = true

			StartMouse = input.Position

			StartPos = Button.Position

		end

	end)



	Button.InputEnded:Connect(function(input)

		if input.UserInputType == Enum.UserInputType.MouseButton1 then

			Dragging = false

		end

	end)



	game:GetService("UserInputService").InputChanged:Connect(function(input)

		if Dragging and input.UserInputType == Enum.UserInputType.MouseMovement then

			local Delta = input.Position - StartMouse


			Button.Position = UDim2.new(

				StartPos.X.Scale,

				StartPos.X.Offset + Delta.X,

				StartPos.Y.Scale,

				StartPos.Y.Offset + Delta.Y

			)

		end

	end)



	return Button

end


return Floating
