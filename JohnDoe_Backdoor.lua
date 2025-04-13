
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- 채팅 연출
StarterGui:SetCore("ChatMakeSystemMessage", {
    Text = "John Doe가 지배한다...";
    Color = Color3.new(1, 0, 0);
    Font = Enum.Font.GothamBlack;
    FontSize = Enum.FontSize.Size96;
})

-- 공포 느낌 효과 UI
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
local label = Instance.new("TextLabel", screenGui)
label.Size = UDim2.new(1, 0, 1, 0)
label.BackgroundTransparency = 1
label.Text = "JOHN DOE IS WATCHING YOU"
label.TextColor3 = Color3.new(1, 0, 0)
label.TextScaled = true
label.Font = Enum.Font.Arcade
label.TextStrokeTransparency = 0
label.TextStrokeColor3 = Color3.new(0, 0, 0)

-- 외형 간단한 변형 (예: 얼굴 삭제)
local char = player.Character or player.CharacterAdded:Wait()
local head = char:FindFirstChild("Head")
if head and head:FindFirstChild("face") then
    head.face:Destroy()
end
