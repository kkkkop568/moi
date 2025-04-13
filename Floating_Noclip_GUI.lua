
-- Floating + Movable GUI + Noclip Script for Dandy's World
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- GUI Setup
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "FloatingGui"
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 200, 0, 80)
frame.Position = UDim2.new(0.5, -100, 0.8, 0)
frame.BackgroundTransparency = 0.3
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.Active = true
frame.Draggable = true

local label = Instance.new("TextLabel", frame)
label.Size = UDim2.new(1, 0, 0.5, 0)
label.Position = UDim2.new(0, 0, 0, 0)
label.Text = "Floating + Noclip"
label.TextColor3 = Color3.new(1, 1, 1)
label.BackgroundTransparency = 1

local toggle = Instance.new("TextButton", frame)
toggle.Size = UDim2.new(1, 0, 0.25, 0)
toggle.Position = UDim2.new(0, 0, 0.5, 0)
toggle.Text = "Noclip: OFF"
toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggle.TextColor3 = Color3.new(1, 1, 1)

local collapse = Instance.new("TextButton", frame)
collapse.Size = UDim2.new(1, 0, 0.25, 0)
collapse.Position = UDim2.new(0, 0, 0.75, 0)
collapse.Text = "[-]"
collapse.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
collapse.TextColor3 = Color3.new(1, 1, 1)

-- Floating
local floatHeight = 5
local floating = true
RunService.RenderStepped:Connect(function()
    if floating and character and humanoidRootPart then
        humanoidRootPart.Velocity = Vector3.new(0, 0, 0)
        humanoidRootPart.CFrame = humanoidRootPart.CFrame + Vector3.new(0, floatHeight - humanoidRootPart.Position.Y, 0)
    end
end)

-- Noclip
local noclip = false
toggle.MouseButton1Click:Connect(function()
    noclip = not noclip
    toggle.Text = "Noclip: " .. (noclip and "ON" or "OFF")
end)

RunService.Stepped:Connect(function()
    if noclip then
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide == true then
                part.CanCollide = false
            end
        end
    end
end)

-- Collapse GUI
local minimized = false
collapse.MouseButton1Click:Connect(function()
    minimized = not minimized
    for _, child in ipairs(frame:GetChildren()) do
        if child ~= collapse then
            child.Visible = not minimized
        end
    end
    collapse.Text = minimized and "[+]" or "[-]"
end)
