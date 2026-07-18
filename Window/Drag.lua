--// CrimsonCore Drag System v2.0

local Drag = {}

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")


function Drag:Enable(Frame, Handle)

	local Dragging = false

	local DragStart

	local StartPosition

	local CurrentInput



	local function Update(input)

		local Delta = input.Position - DragStart


		local NewX =
			StartPosition.X.Offset + Delta.X


		local NewY =
			StartPosition.Y.Offset + Delta.Y



		Frame.Position = UDim2.new(
			StartPosition.X.Scale,
			NewX,
			StartPosition.Y.Scale,
			NewY
		)

	end



	Handle.InputBegan:Connect(function(input)

		if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then


			Dragging = true

			DragStart = input.Position

			StartPosition = Frame.Position


			input.Changed:Connect(function()

				if input.UserInputState ==
					Enum.UserInputState.End then

					Dragging = false

				end

			end)

		end

	end)



	Handle.InputChanged:Connect(function(input)

		if input.UserInputType ==
			Enum.UserInputType.MouseMovement
		or input.UserInputType ==
			Enum.UserInputType.Touch then


			CurrentInput = input

		end

	end)



	UserInputService.InputChanged:Connect(function(input)

		if input == CurrentInput and Dragging then

			Update(input)

		end

	end)



end


return Drag
