--// CrimsonCore Tab System v2.5
--// Fixed Category Text Edition

local Tab = {}

local TweenService = game:GetService("TweenService")


function Tab:Create(Pages, Sidebar, Theme, Utility, Section, Components)

	local Object = {}



	function Object:New(name)


		local TabButton = Instance.new("TextButton")

		TabButton.Name =
			name or "Tab"


		TabButton.Size =
			UDim2.new(
				1,
				0,
				0,
				40
			)


		TabButton.BackgroundColor3 =
			Theme.Panel


		TabButton.BackgroundTransparency =
			0.55


		TabButton.Text =
			name or "Tab"


		TabButton.TextColor3 =
			Theme.Text


		TabButton.Font =
			Enum.Font.BuilderSansBold


		TabButton.TextSize = 15


		-- FIX CATEGORY TEXT

		TabButton.TextXAlignment =
			Enum.TextXAlignment.Left


		TabButton.TextTruncate =
			Enum.TextTruncate.AtEnd


		TabButton.ZIndex = 2


		TabButton.Parent =
			Sidebar



		Utility:Corner(
			TabButton,
			10
		)



		-- padding so text isn't touching edge

		local Padding = Instance.new("UIPadding")

		Padding.PaddingLeft =
			UDim.new(
				0,
				14
			)

		Padding.Parent =
			TabButton



		local Page = Instance.new("ScrollingFrame")


		Page.Name =
			name or "Page"


		Page.Size =
			UDim2.new(
				1,
				0,
				1,
				0
			)


		Page.BackgroundColor3 =
			Theme.Panel


		Page.BackgroundTransparency =
			0.65


		Page.BorderSizePixel = 0


		Page.ScrollBarThickness = 3


		Page.Visible = false


		Page.CanvasSize =
			UDim2.new(
				0,
				0,
				0,
				0
			)


		Page.Parent =
			Pages



		Utility:Corner(
			Page,
			14
		)



		Utility:Stroke(
			Page,
			Theme.Crimson,
			1
		)



		local Layout = Instance.new("UIListLayout")


		Layout.Padding =
			UDim.new(
				0,
				10
			)


		Layout.Parent =
			Page



		Layout:GetPropertyChangedSignal(
			"AbsoluteContentSize"
		):Connect(function()


			Page.CanvasSize =
				UDim2.new(
					0,
					0,
					0,
					Layout.AbsoluteContentSize.Y + 20
				)

		end)



		TabButton.MouseButton1Click:Connect(function()



			for _,v in pairs(Pages:GetChildren()) do

				if v:IsA("ScrollingFrame") then

					v.Visible = false

				end

			end



			Page.Visible = true



			TweenService:Create(

				Page,

				TweenInfo.new(
					0.25,
					Enum.EasingStyle.Quint
				),

				{
					BackgroundTransparency = 0.65
				}

			):Play()



		end)



		function Object:CreateSection(title)


			return Section:Create(

				Page,

				title,

				Theme,

				Utility,

				Components

			)


		end



		return Object

	end



	return Object

end


return Tab
