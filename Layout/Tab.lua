--// CrimsonCore Tab System v2.0
--// Premium Hybrid Edition

local Tab = {}

local TweenService = game:GetService("TweenService")


function Tab:Create(Pages, Sidebar, Theme, Utility, Section, Components)

	local System = {}



	function System:New(name)


		local Button = Instance.new("TextButton")

		Button.Name = name

		Button.Size = UDim2.new(1,0,0,40)

		Button.BackgroundColor3 = Theme.Panel

		Button.BackgroundTransparency = .2

		Button.Text = name

		Button.TextColor3 = Theme.Text

		Button.Font = Enum.Font.BuilderSansBold

		Button.TextSize = 15

		Button.AutoButtonColor = false

		Button.Parent = Sidebar



		Utility:Corner(Button,10)

		Utility:Stroke(
			Button,
			Theme.Crimson,
			1
		)



		local Page = Instance.new("ScrollingFrame")

		Page.Name = name.."Page"

		Page.Size = UDim2.fromScale(1,1)

		Page.BackgroundTransparency = 1

		Page.ScrollBarThickness = 3

		Page.Visible = false

		Page.Parent = Pages



		local Layout = Instance.new("UIListLayout")

		Layout.Padding = UDim.new(0,10)

		Layout.Parent = Page



		local Padding = Instance.new("UIPadding")

		Padding.PaddingTop = UDim.new(0,5)

		Padding.PaddingLeft = UDim.new(0,5)

		Padding.PaddingRight = UDim.new(0,5)

		Padding.Parent = Page



		local TabObject = {}



		function TabObject:Show()


			for _,v in pairs(Pages:GetChildren()) do

				if v:IsA("ScrollingFrame") then

					v.Visible = false

				end

			end



			Page.Visible = true

			Page.CanvasPosition = Vector2.new(0,0)


			Page.BackgroundTransparency = 1


			TweenService:Create(
				Page,
				TweenInfo.new(
					.25,
					Enum.EasingStyle.Quint
				),
				{
					BackgroundTransparency = 0
				}
			):Play()


		end



		Button.MouseEnter:Connect(function()


			TweenService:Create(
				Button,
				TweenInfo.new(.15),
				{
					BackgroundColor3 = Theme.Crimson
				}
			):Play()


		end)



		Button.MouseLeave:Connect(function()


			if Page.Visible == false then

				TweenService:Create(
					Button,
					TweenInfo.new(.15),
					{
						BackgroundColor3 = Theme.Panel
					}
				):Play()

			end


		end)



		Button.MouseButton1Click:Connect(function()

			TabObject:Show()

		end)



		function TabObject:CreateSection(title)


			local SectionObject =
				Section:Create(
					Page,
					title,
					Theme,
					Utility,
					Components
				)


			return SectionObject


		end



		task.delay(.1,function()

			if #Pages:GetChildren() == 1 then

				TabObject:Show()

			end

		end)



		return TabObject

	end



	return System

end


return Tab
