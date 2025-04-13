
-- 모바일 전용 허브 (Dead Rail용)
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.ResetOnSpawn = false
gui.Name = "DeadRailHub"

-- 열기 버튼
local openBtn = Instance.new("TextButton")
openBtn.Text = "열기"
openBtn.Size = UDim2.new(0, 80, 0, 80)
openBtn.Position = UDim2.new(0, 20, 0.5, -40)
openBtn.BackgroundColor3 = Color3.new(0, 0, 0)
openBtn.BackgroundTransparency = 0.4
openBtn.TextColor3 = Color3.new(1, 1, 1)
openBtn.TextScaled = true
openBtn.Parent = gui
openBtn.ClipsDescendants = true
openBtn.ZIndex = 2
openBtn.BorderSizePixel = 0
openBtn.AutoButtonColor = true
openBtn.Font = Enum.Font.GothamBlack
openBtn.TextStrokeTransparency = 0.8
openBtn.Name = "OpenButton"
openBtn.AnchorPoint = Vector2.new(0, 0.5)
openBtn.UICorner = Instance.new("UICorner", openBtn)

-- 메인 프레임
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 250, 0, 160)
main.Position = UDim2.new(0.5, -125, 0.5, -80)
main.BackgroundTransparency = 0.3
main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
main.Visible = false
main.Parent = gui
Instance.new("UICorner", main)

-- 닫기 버튼
local close = Instance.new("TextButton")
close.Text = "X"
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -35, 0, 5)
close.Parent = main
close.BackgroundColor3 = Color3.new(1, 0, 0)
Instance.new("UICorner", close)

-- 버튼 생성 함수
local function createBtn(text, order, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -20, 0, 40)
    btn.Position = UDim2.new(0, 10, 0, 40 + (order * 45))
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Text = text
    btn.Parent = main
    btn.Font = Enum.Font.Gotham
    btn.TextScaled = true
    btn.ClipsDescendants = true
    Instance.new("UICorner", btn)

    btn.MouseButton1Click:Connect(callback)
end

-- 자동사냥 함수
local function autoHunt()
    for _, mob in pairs(workspace:GetDescendants()) do
        if mob:IsA("Model") and mob:FindFirstChild("Humanoid") then
            local hum = mob:FindFirstChild("Humanoid")
            if hum.Health > 0 then
                player.Character:SetPrimaryPartCFrame(mob:GetPrimaryPartCFrame())
            end
        end
    end
end

-- 아이템 소환 함수 (예시로 채권 포함)
local function summonItems()
    local remote = game:GetService("ReplicatedStorage"):FindFirstChild("SpawnItemRemote") -- 예시 이름
    if remote then
        for _, itemName in pairs({"채권", "탄약", "의약품"}) do
            remote:FireServer(itemName)
        end
    end
end

-- 버튼들
createBtn("자동사냥", 0, autoHunt)
createBtn("아이템 소환 (채권 포함)", 1, summonItems)

-- 열기/닫기 연결
openBtn.MouseButton1Click:Connect(function()
    main.Visible = true
    openBtn.Visible = false
end)

close.MouseButton1Click:Connect(function()
    main.Visible = false
    openBtn.Visible = true
end)
