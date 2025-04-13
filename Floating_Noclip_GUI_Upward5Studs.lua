
-- Floating + Noclip Script with Movable GUI and Toggle Button (Upward 5 studs)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- GUI 생성
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "FloatingGui"
screenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 200, 0, 100)
mainFrame.Position = UDim2.new(0.5, -100, 0.3, 0)
mainFrame.BackgroundTransparency = 0.3
mainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
mainFrame.Active = true
mainFrame.Draggable = true

local titleLabel = Instance.new("TextLabel", mainFrame)
titleLabel.Size = UDim2.new(1, 0, 0.3, 0)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.Text = "Floating + Noclip"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.BackgroundTransparency = 1
titleLabel.Font = Enum.Font.SourceSans
titleLabel.TextScaled = true

local toggleButton = Instance.new("TextButton", mainFrame)
toggleButton.Size = UDim2.new(0.5, -5, 0.4, -5)
toggleButton.Position = UDim2.new(0, 5, 0.6, 0)
toggleButton.Text = "활성화"
toggleButton.Font = Enum.Font.SourceSans
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.TextScaled = true
toggleButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)

local closeButton = Instance.new("TextButton", mainFrame)
closeButton.Size = UDim2.new(0.5, -5, 0.4, -5)
closeButton.Position = UDim2.new(0.5, 0, 0.6, 0)
closeButton.Text = "-"
closeButton.Font = Enum.Font.SourceSans
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.TextScaled = true
closeButton.BackgroundColor3 = Color3.fromRGB(128, 128, 128)

local isFloating = false
local isClosed = false
local connection

toggleButton.MouseButton1Click:Connect(function()
    isFloating = not isFloating
    toggleButton.Text = isFloating and "비활성화" or "활성화"

    if isFloating then
        connection = RunService.RenderStepped:Connect(function()
            if character and humanoidRootPart then
                humanoidRootPart.Velocity = Vector3.new(0, 5, 0)
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    elseif connection then
        connection:Disconnect()
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
end)

closeButton.MouseButton1Click:Connect(function()
    isClosed = not isClosed
    mainFrame.Size = isClosed and UDim2.new(0, 200, 0, 30) or UDim2.new(0, 200, 0, 100)
    toggleButton.Visible = not isClosed
end)
