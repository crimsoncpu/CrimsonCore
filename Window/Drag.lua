--// CrimsonCore Drag System v1.0

local Drag = {}

local UserInputService = game:GetService("UserInputService")


function Drag:Enable(Frame, Handle)

	local Dragging = false
	local DragStart
	local StartPosition


	Handle.InputBegan:Connect(function(input)

		if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then

			Dragging = true

			DragStart = input.Position

			StartPosition = Frame.Position

		end

	end)



	Handle.InputEnded:Connect(function(input)

		if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then

			Dragging = false

		end

	end)



	UserInputService.InputChanged:Connect(function(input)

		if Dragging then

			if input.UserInputType == Enum.UserInputType.MouseMovement
			or input.UserInputType == Enum.UserInputType.Touch then


				local Delta = input.Position - DragStart


				Frame.Position = UDim2.new(
					StartPosition.X.Scale,
					StartPosition.X.Offset + Delta.X,
					StartPosition.Y.Scale,
					StartPosition.Y.Offset + Delta.Y
				)

			end

		end

	end)

end


return Drag
