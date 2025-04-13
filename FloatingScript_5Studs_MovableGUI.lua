-- Floating Script with Movable GUI and Adjustable Height (5 studs)
local floatingHeight = 5 -- 원하는 높이 설정

-- UI 생성
local ScreenGui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 150, 0, 50)
Frame.Position = UDim2.new(0.1, 0, 0.1, 0)
Frame.BackgroundTransparency = 0.3
Frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
Frame.Active = true
Frame.Draggable = true

local Label = Instance.new("TextLabel", Frame)
Label.Size = UDim2.new(1, 0, 1, 0)
Label.Text = "Floating..."
Label.TextColor3 = Color3.new(1, 1, 1)
Label.BackgroundTransparency = 1
Label.Font = Enum.Font.SourceSansBold
Label.TextScaled = true

-- 부드러운 공중 이동 로직
local RunService = game:GetService("RunService")
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()

RunService.RenderStepped:Connect(function()
    if Character and Character:FindFirstChild("HumanoidRootPart") then
        local rootPart = Character.HumanoidRootPart
        local currentPos = rootPart.Position
        rootPart.Velocity = Vector3.new(0, 0, 0)
        rootPart.CFrame = CFrame.new(currentPos.X, workspace.FallenPartsDestroyHeight + floatingHeight + 5, currentPos.Z)
    end
end)
