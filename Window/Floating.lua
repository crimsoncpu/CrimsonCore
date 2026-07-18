--// CrimsonCore Floating Button v3.1

local Floating = {}

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")


function Floating:Create(ScreenGui, Main, Theme, Utility)

	local Button = Instance.new("TextButton")

	Button.Name = "CrimsonFloating"

	Button.Size = UDim2.fromOffset(60,60)

	Button.Position = UDim2.new(.5,0,.5,0)

	Button.AnchorPoint = Vector2.new(.5,.5)

	Button.BackgroundColor3 = Theme.Crimson

	Button.Text = "C"

	Button.TextColor3 = Theme.Text

	Button.Font = Enum.Font.BuilderSansBold

	Button.TextSize = 28

	Button.AutoButtonColor = false

	Button.Visible = false

	Button.Parent = ScreenGui


	Utility:Corner(Button,100)

	Utility:Stroke(Button,Theme.Crimson,2)



	-- glow

	local Glow = Instance.new("UIStroke")

	Glow.Color = Theme.Crimson

	Glow.Thickness = 5

	Glow.Transparency = .3

	Glow.Parent = Button



	-- pulse

	task.spawn(function()

		while Button.Parent do

			TweenService:Create(
				Glow,
				TweenInfo.new(
					1,
					Enum.EasingStyle.Sine,
					Enum.EasingDirection.InOut
				),
				{
					Transparency = .7
				}
			):Play()

			task.wait(1)


			TweenService:Create(
				Glow,
				TweenInfo.new(
					1,
					Enum.EasingStyle.Sine,
					Enum.EasingDirection.InOut
				),
				{
					Transparency = .2
				}
			):Play()

			task.wait(1)

		end

	end)



	local dragging = false
	local dragStart
	local startPos



	Button.InputBegan:Connect(function(input)

		if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then


			dragging = true

			dragStart = input.Position

			startPos = Button.Position

		end

	end)



	UserInputService.InputChanged:Connect(function(input)

		if dragging and
		(
			input.UserInputType == Enum.UserInputType.MouseMovement
			or input.UserInputType == Enum.UserInputType.Touch
		) then


			local delta = input.Position - dragStart


			Button.Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)

		end

	end)



	UserInputService.InputEnded:Connect(function(input)

		if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then


			if dragging then

				dragging = false


				local camera = workspace.CurrentCamera

				local size = camera.ViewportSize


				local x =
					Button.AbsolutePosition.X +
					Button.AbsoluteSize.X/2


				local y =
					Button.AbsolutePosition.Y +
					Button.AbsoluteSize.Y/2



				local snapX

				if x < size.X/2 then

					snapX = 30

				else

					snapX = size.X - 30

				end



				TweenService:Create(
					Button,
					TweenInfo.new(
						.5,
						Enum.EasingStyle.Quint,
						Enum.EasingDirection.Out
					),
					{
						Position = UDim2.fromOffset(
							snapX,
							math.clamp(
								y,
								100,
								size.Y-100
							)
						)
					}
				):Play()

			end

		end

	end)



	Button.MouseButton1Click:Connect(function()

		Main.Visible = true

		Button.Visible = false

	end)



	return Button

end


return Floating
