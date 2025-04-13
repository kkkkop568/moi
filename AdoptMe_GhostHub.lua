
--[[
    Adopt Me Ghost Hub Script (Money-Free Version)
    Features: Auto Farm, Teleport, Pet Spawn/Clone, Speed Hack
    GUI: Dark mode, draggable, ghost-hub style
]]

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui", Player:WaitForChild("PlayerGui"))
ScreenGui.Name = "AdoptMeGhostHub"
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 250, 0, 300)
MainFrame.Position = UDim2.new(0.5, -125, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true

local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 12)

local UIListLayout = Instance.new("UIListLayout", MainFrame)
UIListLayout.Padding = UDim.new(0, 5)
UIListLayout.FillDirection = Enum.FillDirection.Vertical
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Utility
local function createButton(name, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -20, 0, 30)
    button.Position = UDim2.new(0, 10, 0, 0)
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.Gotham
    button.TextSize = 14
    button.Text = name
    button.Parent = MainFrame

    local corner = Instance.new("UICorner", button)
    corner.CornerRadius = UDim.new(0, 8)

    button.MouseButton1Click:Connect(callback)
end

-- Feature: Speed Hack
createButton("Speed Hack", function()
    local human = Character:FindFirstChildOfClass("Humanoid")
    if human then
        human.WalkSpeed = 50
    end
end)

-- Feature: Teleport to Nursery
createButton("Teleport: Nursery", function()
    local nursery = workspace:FindFirstChild("Nursery")
    if nursery and nursery:FindFirstChild("TeleportSpot") then
        HumanoidRootPart.CFrame = nursery.TeleportSpot.CFrame + Vector3.new(0, 3, 0)
    end
end)

-- Feature: Auto Farm Needs (hunger, shower, etc.)
createButton("Auto Farm (Needs)", function()
    while wait(2) do
        for _, need in ipairs(Player.PlayerGui:GetChildren()) do
            if need.Name:match("Need") and need:FindFirstChild("DoTask") then
                fireclickdetector(need.DoTask.ClickDetector)
            end
        end
    end
end)

-- Feature: Pet Clone
createButton("Pet Clone", function()
    local pet = Player.Character:FindFirstChild("Pet")
    if pet then
        local clone = pet:Clone()
        clone.Parent = workspace
        clone:SetPrimaryPartCFrame(HumanoidRootPart.CFrame + Vector3.new(3, 0, 0))
    end
end)

-- Feature: Spawn Pet
createButton("Spawn Pet", function()
    local petModel = game.ReplicatedStorage:FindFirstChild("Dog")
    if petModel then
        local clone = petModel:Clone()
        clone.Parent = workspace
        clone:SetPrimaryPartCFrame(HumanoidRootPart.CFrame + Vector3.new(5, 0, 0))
    end
end)
