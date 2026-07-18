--// CrimsonCore Tab System v1.0

local Tab = {}


function Tab:Create(Content, Sidebar, Theme, Utility, Section, Components)

	local Object = {}



	function Object:New(name)

		local Button = Instance.new("TextButton")

		Button.Size = UDim2.new(1,0,0,40)

		Button.BackgroundColor3 = Theme.Secondary

		Button.Text = name or "Tab"

		Button.TextColor3 = Theme.Text

		Button.Font = Enum.Font.BuilderSansBold

		Button.TextSize = 14

		Button.AutoButtonColor = false

		Button.Parent = Sidebar


		Utility:Corner(Button,10)



		local Page = Instance.new("ScrollingFrame")

		Page.Size = UDim2.fromScale(1,1)

		Page.BackgroundTransparency = 1

		Page.Visible = false

		Page.ScrollBarThickness = 3

		Page.Parent = Content



		local Layout = Instance.new("UIListLayout")

		Layout.Padding = UDim.new(0,10)

		Layout.Parent = Page



		Button.MouseButton1Click:Connect(function()

			for _,v in pairs(Content:GetChildren()) do

				if v:IsA("ScrollingFrame") then

					v.Visible = false

				end

			end


			Page.Visible = true

		end)



		local TabObject = {}


		TabObject.Page = Page



		function TabObject:CreateSection(sectionName)

			return Section:Create(
				Page,
				sectionName,
				Theme,
				Utility,
				Components
			)

		end



		return TabObject

	end



	return Object

end


return Tab
