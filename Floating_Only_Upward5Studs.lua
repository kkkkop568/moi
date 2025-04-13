
-- Floating Only GUI (Upward 5 Studs)
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

-- GUI 생성
local screenGui = Instance.new("ScreenGui", game.CoreGui)
screenGui.Name = "FloatingGUI"

local openButton = Instance.new("TextButton", screenGui)
openButton.Text = "-"
openButton.Size = UDim2.new(0, 50, 0, 50)
openButton.Position = UDim2.new(0, 0, 0.5, -25)
openButton.BackgroundTransparency = 0.3
openButton.BackgroundColor3 = Color3.fromRGB(30,30,30)
openButton.TextColor3 = Color3.new(1,1,1)
openButton.TextScaled = true

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 200, 0, 100)
mainFrame.Position = UDim2.new(0, 60, 0.5, -50)
mainFrame.BackgroundTransparency = 0.3
mainFrame.BackgroundColor3 = Color3.fromRGB(50,50,50)
mainFrame.Visible = true

local floatButton = Instance.new("TextButton", mainFrame)
floatButton.Size = UDim2.new(1, 0, 0.5, 0)
floatButton.Position = UDim2.new(0, 0, 0, 0)
floatButton.Text = "Float +5 Studs"
floatButton.BackgroundColor3 = Color3.fromRGB(80,80,80)
floatButton.TextColor3 = Color3.new(1,1,1)
floatButton.TextScaled = true

openButton.MouseButton1Click:Connect(function()
	mainFrame.Visible = not mainFrame.Visible
end)

floatButton.MouseButton1Click:Connect(function()
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if hrp then
		hrp.CFrame = hrp.CFrame + Vector3.new(0, 5, 0)
	end
end)
