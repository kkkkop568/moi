
-- Floating_Only_Upward_Constant.lua

-- Create GUI
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "FloatingGUI"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Position = UDim2.new(0.4, 0, 0.9, 0)
Frame.Size = UDim2.new(0, 200, 0, 50)
Frame.BackgroundTransparency = 0.4
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Active = true
Frame.Draggable = true

local FloatButton = Instance.new("TextButton", Frame)
FloatButton.Size = UDim2.new(1, 0, 1, 0)
FloatButton.Text = "Floating ON"
FloatButton.TextColor3 = Color3.new(1, 1, 1)
FloatButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

-- Floating logic
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")

local floating = false
local bodyVelocity = Instance.new("BodyVelocity")
bodyVelocity.Velocity = Vector3.new(0, 5, 0)
bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)

FloatButton.MouseButton1Click:Connect(function()
    floating = not floating
    if floating then
        bodyVelocity.Parent = root
        FloatButton.Text = "Floating OFF"
    else
        bodyVelocity:Destroy()
        bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Velocity = Vector3.new(0, 5, 0)
        bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
        FloatButton.Text = "Floating ON"
    end
end)
