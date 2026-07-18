--// CrimsonCore Floating Button v3.5
--// Premium Hybrid Edition

local Floating = {}

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")


function Floating:Create(ScreenGui, Main, Theme, Utility)


	local Button = Instance.new("TextButton")

	Button.Name = "CrimsonFloating"

	Button.Size = UDim2.fromOffset(62,62)

	Button.Position = UDim2.fromOffset(100,300)

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



	local Scale = Instance.new("UIScale")

	Scale.Scale = 1

	Scale.Parent = Button



	local Glow = Instance.new("UIStroke")

	Glow.Color = Theme.Crimson

	Glow.Thickness = 5

	Glow.Transparency = .25

	Glow.Parent = Button



	-- pulse glow

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



	local Dragging = false

	local DragStart

	local StartPosition

	local Moved = false



	Button.InputBegan:Connect(function(input)

		if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then


			Dragging = true

			Moved = false

			DragStart = input.Position

			StartPosition = Button.Position



			TweenService:Create(
				Scale,
				TweenInfo.new(.15),
				{
					Scale = 1.15
				}
			):Play()

		end

	end)



	UserInputService.InputChanged:Connect(function(input)

		if Dragging and
		(
			input.UserInputType == Enum.UserInputType.MouseMovement
			or input.UserInputType == Enum.UserInputType.Touch
		) then


			local Delta =
				input.Position - DragStart



			if Delta.Magnitude > 5 then

				Moved = true

			end



			Button.Position =
				UDim2.new(
					StartPosition.X.Scale,
					StartPosition.X.Offset + Delta.X,
					StartPosition.Y.Scale,
					StartPosition.Y.Offset + Delta.Y
				)

		end

	end)



	UserInputService.InputEnded:Connect(function(input)

		if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then


			if Dragging then

				Dragging = false



				TweenService:Create(
					Scale,
					TweenInfo.new(.2),
					{
						Scale = 1
					}
				):Play()



				local Camera =
					workspace.CurrentCamera


				local Size =
					Camera.ViewportSize



				local CenterX =
					Button.AbsolutePosition.X +
					Button.AbsoluteSize.X/2



				local CenterY =
					Button.AbsolutePosition.Y +
					Button.AbsoluteSize.Y/2



				local SnapX


				if CenterX < Size.X/2 then

					SnapX = 35

				else

					SnapX = Size.X - 35

				end



				TweenService:Create(
					Button,
					TweenInfo.new(
						.45,
						Enum.EasingStyle.Quint,
						Enum.EasingDirection.Out
					),
					{
						Position =
							UDim2.fromOffset(
								SnapX,
								math.clamp(
									CenterY,
									100,
									Size.Y-100
								)
							)
					}
				):Play()

			end

		end

	end)



	Button.MouseButton1Click:Connect(function()

		if not Moved then

			Main.Visible = true

			Button.Visible = false


			TweenService:Create(
				Main,
				TweenInfo.new(
					.35,
					Enum.EasingStyle.Back
				),
				{
					Size = UDim2.fromOffset(760,500)
				}
			):Play()

		end

	end)



	return Button

end


return Floating
