--// CrimsonCore Notification Component v1.0

local Notification = {}


function Notification:Create(ScreenGui, config, Theme, Utility)

	config = config or {}


	local Holder = ScreenGui:FindFirstChild("Notifications")


	if not Holder then

		Holder = Instance.new("Frame")

		Holder.Name = "Notifications"

		Holder.Size = UDim2.new(0,300,1,-20)

		Holder.Position = UDim2.new(1,-320,0,20)

		Holder.BackgroundTransparency = 1

		Holder.Parent = ScreenGui



		local Layout = Instance.new("UIListLayout")

		Layout.Padding = UDim.new(0,10)

		Layout.VerticalAlignment = Enum.VerticalAlignment.Top

		Layout.Parent = Holder

	end



	local Box = Instance.new("Frame")

	Box.Size = UDim2.fromOffset(300,60)

	Box.BackgroundColor3 = Theme.Panel

	Box.Parent = Holder


	Utility:Corner(Box,12)

	Utility:Stroke(Box,Theme.Crimson,1)



	local Text = Instance.new("TextLabel")

	Text.Size = UDim2.new(1,-20,1,0)

	Text.Position = UDim2.fromOffset(10,0)

	Text.BackgroundTransparency = 1

	Text.TextColor3 = Theme.Text

	Text.Font = Enum.Font.BuilderSansBold

	Text.TextSize = 14

	Text.TextXAlignment = Enum.TextXAlignment.Left

	Text.Text = config.Text or "Notification"

	Text.Parent = Box



	task.delay(
		config.Duration or 3,
		function()

			if Box then

				Box:Destroy()

			end

		end
	)



	return Box

end


return Notification
