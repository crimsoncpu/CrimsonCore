--// CrimsonCore Theme System v2.4
--// Full Glass Edition

local Theme = {}



-- Main glass background

Theme.Background =
	Color3.fromRGB(
		8,
		8,
		14
	)



-- Glass panels

Theme.Panel =
	Color3.fromRGB(
		18,
		18,
		30
	)



-- Crimson colors

Theme.Crimson =
	Color3.fromRGB(
		220,
		30,
		55
	)


Theme.CrimsonDark =
	Color3.fromRGB(
		120,
		10,
		30
	)


Theme.CrimsonLight =
	Color3.fromRGB(
		255,
		90,
		120
	)



-- Text

Theme.Text =
	Color3.fromRGB(
		245,
		245,
		250
	)


Theme.SubText =
	Color3.fromRGB(
		160,
		160,
		175
	)



-- Glass transparency

Theme.MainTransparency =
	0.35


Theme.PanelTransparency =
	0.50


Theme.CardTransparency =
	0.60



-- Effects

Theme.Blur =
	true


Theme.BlurSize =
	14



Theme.Glow =
	true



return Theme
