--// CrimsonCore Utility System v2.0
--// Premium Hybrid Edition

local Utility = {}



function Utility:Corner(Object, Radius)

	local Corner = Instance.new("UICorner")

	Corner.CornerRadius =
		UDim.new(
			0,
			Radius or 12
		)

	Corner.Parent = Object

	return Corner

end



function Utility:Stroke(Object, Color, Thickness)

	local Stroke = Instance.new("UIStroke")

	Stroke.Color =
		Color or Color3.fromRGB(
			255,
			0,
			0
		)

	Stroke.Thickness =
		Thickness or 1

	Stroke.Transparency = .15

	Stroke.ApplyStrokeMode =
		Enum.ApplyStrokeMode.Border

	Stroke.Parent = Object


	return Stroke

end



function Utility:Padding(Object, Amount)

	local Padding = Instance.new("UIPadding")

	Padding.PaddingTop =
		UDim.new(0,Amount)

	Padding.PaddingBottom =
		UDim.new(0,Amount)

	Padding.PaddingLeft =
		UDim.new(0,Amount)

	Padding.PaddingRight =
		UDim.new(0,Amount)

	Padding.Parent = Object


	return Padding

end



function Utility:Gradient(Object, Color1, Color2)

	local Gradient = Instance.new("UIGradient")


	Gradient.Color =
		ColorSequence.new({

			ColorSequenceKeypoint.new(
				0,
				Color1
			),

			ColorSequenceKeypoint.new(
				1,
				Color2
			)

		})


	Gradient.Parent = Object


	return Gradient

end



function Utility:Glow(Object, Color)

	local Glow = Instance.new("UIStroke")


	Glow.Color =
		Color or Color3.fromRGB(
			255,
			0,
			60
		)


	Glow.Thickness = 3

	Glow.Transparency = .4

	Glow.Parent = Object


	return Glow

end



function Utility:MakeGlass(Object)

	Object.BackgroundTransparency = .15

	return Object

end



return Utility
