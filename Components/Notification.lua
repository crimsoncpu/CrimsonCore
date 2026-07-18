--// CrimsonCore Notification Component v1.1 Animated

local Notification = {}


function Notification:Create(ScreenGui, config, Theme, Utility)

	config = config or {}


	local Holder = ScreenGui:FindFirstChild("Notifications")


	if not Holder then

		Holder = Instance.new("Frame")

		Holder.Name = "Notifications"

		Holder.Size = UDim2.new(0,320,1,-40)

		Holder.Position = UDim2.new(1,-340,0,20)

		Holder.BackgroundTransparency = 1

		Holder.Parent = ScreenGui


		local Layout = Instance.new("UIListLayout")

		Layout.Padding = UDim.new(0,10)

		Layout.VerticalAlignment = Enum.VerticalAlignment.Top

		Layout.Parent = Holder

	end



	local Box = Instance.new("Frame")

	Box.Size = UDim2.fromOffset(300,65)

	Box.BackgroundColor3 = Theme.Panel

	Box.BackgroundTransparency = 1

	Box.Position = UDim2.fromOffset(40,0)

	Box.Parent = Holder


	Utility:Corner(Box,12)

	Utility:Stroke(Box,Theme.Crimson,1)



	local Text = Instance.new("TextLabel")

	Text.Size = UDim2.new(1,-20,1,0)

	Text.Position = UDim2.fromOffset(10,0)

	Text.BackgroundTransparency = 1

	Text.TextColor3 = Theme.Text

	Text.TextTransparency = 1

	Text.Font = Enum.Font.BuilderSansBold

	Text.TextSize = 14

	Text.TextXAlignment = Enum.TextXAlignment.Left

	Text.Text = config.Text or "Notification"

	Text.Parent = Box



	-- animate in

	Utility:Tween(Box,.35,{
		BackgroundTransparency = 0,
		Position = UDim2.fromOffset(0,0)
	})


	Utility:Tween(Text,.35,{
		TextTransparency = 0
	})



	task.delay(config.Duration or 3,function()


		-- animate out

		Utility:Tween(Box,.35,{
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(40,0)
		})


		Utility:Tween(Text,.35,{
			TextTransparency = 1
		})


		task.wait(.4)


		Box:Destroy()

	end)



	return Box

end


return Notification
