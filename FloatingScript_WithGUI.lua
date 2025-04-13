
-- 공중 부양 GUI 토글 핵 스크립트
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- ScreenGui 생성
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "FloatGui"

local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 120, 0, 40)
toggleButton.Position = UDim2.new(0, 20, 0, 100)
toggleButton.Text = "Toggle Float"
toggleButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.Parent = gui

local isFloating = false
local float

toggleButton.MouseButton1Click:Connect(function()
    character = player.Character or player.CharacterAdded:Wait()
    local root = character:WaitForChild("HumanoidRootPart")

    if isFloating then
        if float then float:Destroy() end
        isFloating = false
        toggleButton.Text = "Toggle Float"
    else
        float = Instance.new("BodyPosition")
        float.Name = "FloatPosition"
        float.MaxForce = Vector3.new(0, math.huge, 0)
        float.Position = root.Position + Vector3.new(0, 10, 0)
        float.Parent = root

        game:GetService("RunService").Heartbeat:Connect(function()
            if float and root then
                float.Position = root.Position + Vector3.new(0, 10, 0)
            end
        end)
        
        isFloating = true
        toggleButton.Text = "Floating..."
    end
end)
