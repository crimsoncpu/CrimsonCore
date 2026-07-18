--// CrimsonCore Utility v1.0

local Utility = {}


function Utility:Corner(Object, Radius)

	local Corner = Instance.new("UICorner")

	Corner.CornerRadius = UDim.new(0, Radius or 10)

	Corner.Parent = Object

end



function Utility:Stroke(Object, Color, Thickness)

	local Stroke = Instance.new("UIStroke")

	Stroke.Color = Color

	Stroke.Thickness = Thickness or 1

	Stroke.Parent = Object

end



function Utility:Tween(Object, Time, Properties)

	local TweenService = game:GetService("TweenService")


	local Tween = TweenService:Create(

		Object,

		TweenInfo.new(
			Time,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
		),

		Properties

	)


	Tween:Play()

	return Tween

end


return Utility
