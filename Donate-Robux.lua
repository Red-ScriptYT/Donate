local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--// Teleport Game ID
local TargetPlaceID = 123456789 -- Palitan ng game ID na pupuntahan mo

--// ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DonateUI"
screenGui.Parent = playerGui

--// Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 0, 0, 0)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.Visible = false
frame.Parent = screenGui

Instance.new("UICorner", frame)

-- Rainbow UIGradient sa Frame fill (no spin)
local bgGradient = Instance.new("UIGradient", frame)
bgGradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255,0,0)),
	ColorSequenceKeypoint.new(0.2, Color3.fromRGB(255,255,0)),
	ColorSequenceKeypoint.new(0.4, Color3.fromRGB(0,255,0)),
	ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0,255,255)),
	ColorSequenceKeypoint.new(0.8, Color3.fromRGB(0,0,255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255,0,255))
}

-- UIStroke na may Rainbow + Spin
local stroke = Instance.new("UIStroke", frame)
stroke.Thickness = 3
stroke.Color = Color3.fromRGB(255, 255, 255)

local strokeGradient = Instance.new("UIGradient", stroke)
strokeGradient.Color = bgGradient.Color

local spinTween = TweenService:Create(strokeGradient, TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {Rotation = 360})
spinTween:Play()

-- Label
local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 0, 50)
label.BackgroundTransparency = 1
label.Text = "Would you like to be teleported"
label.TextColor3 = Color3.fromRGB(255,255,255)
label.Font = Enum.Font.SourceSansBold
label.TextSize = 20
label.Parent = frame

local btnGradient = Instance.new("UIGradient", label)
	btnGradient.Color = bgGradient.Color

local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 0, 50)
label.BackgroundTransparency = 1
label.Text = "to donate Robux to Red Script?"
label.TextColor3 = Color3.fromRGB(255,255,255)
label.Font = Enum.Font.SourceSansBold
label.TextSize = 20
label.Parent = frame
label.Position = UDim2.new(0, 0, 0.12, 0)

local btnGradient = Instance.new("UIGradient", label)
	btnGradient.Color = bgGradient.Color

-- Function to create Rainbow Button
local function createRainbowButton(text, pos, color)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0.4, 0, 0, 40)
	btn.Position = pos
	btn.BackgroundColor3 = color
	btn.Text = text
	btn.TextColor3 = Color3.new(1,1,1)
	btn.Font = Enum.Font.SourceSansBold
	btn.TextSize = 20
	btn.Parent = frame

	Instance.new("UICorner", btn)
	local btnStroke = Instance.new("UIStroke", btn)
  btnStroke.Color = Color3.fromRGB(0, 0, 0)
	btnStroke.Thickness = 2
 btnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

	local btnGradient = Instance.new("UIGradient", btnStroke)
	btnGradient.Color = bgGradient.Color

	local btnTween = TweenService:Create(btnGradient, TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {Rotation = 360})
	btnTween:Play()

	return btn
end

-- Create Buttons
local yesButton = createRainbowButton("Yes", UDim2.new(0.05, 0, 0.6, 0), Color3.fromRGB(0, 200, 0))
local noButton = createRainbowButton("No", UDim2.new(0.55, 0, 0.6, 0), Color3.fromRGB(200, 0, 0))

-- Animation Functions
local function openFrame()
	frame.Visible = true
	frame.Size = UDim2.new(0, 0, 0, 0)
	TweenService:Create(frame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 300, 0, 150)}):Play()
end

local function closeFrame()
	local tween = TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)})
	tween:Play()
	tween.Completed:Connect(function()
		frame.Visible = false
	end)
end
