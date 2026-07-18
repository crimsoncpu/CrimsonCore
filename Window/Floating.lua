--// CrimsonCore Floating Restore Button v1.0

local Floating = {}


function Floating:Create(ScreenGui, Main, Theme, Utility)

	local Button = Instance.new("TextButton")

	Button.Name = "CrimsonCoreRestore"

	Button.Size = UDim2.fromOffset(55,55)

	Button.Position = UDim2.fromScale(.05,.5)

	Button.BackgroundColor3 = Theme.Crimson

	Button.Text = "C"

	Button.TextColor3 = Theme.Text

	Button.Font = Enum.Font.BuilderSansBold

	Button.TextSize = 28

	Button.Visible = false

	Button.Parent = ScreenGui


	Utility:Corner(Button,999)

	Utility:Stroke(Button,Theme.Text,1)



	Button.MouseButton1Click:Connect(function()

		Main.Visible = true

		Button.Visible = false

	end)



	return Button

end


return Floating
