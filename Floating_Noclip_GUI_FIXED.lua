
-- Floating + Noclip + Toggleable GUI Script (5 Studs Upwards)
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

-- FLOATING
local floating = true
local floatHeight = 5

-- Noclip
local noclip = false
game:GetService("RunService").Stepped:Connect(function()
	if noclip then
		for _, part in ipairs(char:GetDescendants()) do
			if part:IsA("BasePart") and part.CanCollide then
				part.CanCollide = false
			end
		end
	end
end)

-- GUI
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 150, 0, 100)
mainFrame.Position = UDim2.new(0.5, -75, 0.5, -50)
mainFrame.BackgroundTransparency = 0.3
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.Active = true
mainFrame.Draggable = true

local floatLabel = Instance.new("TextLabel", mainFrame)
floatLabel.Size = UDim2.new(1, 0, 0.6, 0)
floatLabel.Position = UDim2.new(0, 0, 0, 0)
floatLabel.Text = "Floating + Noclip"
floatLabel.TextColor3 = Color3.new(1, 1, 1)
floatLabel.BackgroundTransparency = 1
floatLabel.Font = Enum.Font.SourceSansBold
floatLabel.TextSize = 16

local toggleButton = Instance.new("TextButton", mainFrame)
toggleButton.Size = UDim2.new(1, 0, 0.4, 0)
toggleButton.Position = UDim2.new(0, 0, 0.6, 0)
toggleButton.Text = "닫기 -"
toggleButton.Font = Enum.Font.SourceSans
toggleButton.TextSize = 14
toggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
toggleButton.TextColor3 = Color3.new(1, 1, 1)

toggleButton.MouseButton1Click:Connect(function()
	mainFrame.Visible = false
end)

-- Floating Logic
task.spawn(function()
	while true do
		if floating then
			hrp.Velocity = Vector3.new(0, floatHeight, 0)
		end
		task.wait()
	end
end)

-- Open keybind (tap to re-show GUI on mobile)
local UIS = game:GetService("UserInputService")
UIS.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Touch or input.KeyCode == Enum.KeyCode.Minus then
		mainFrame.Visible = not mainFrame.Visible
	end
end)

-- Enable noclip (always on)
noclip = true
