-- John Doe Horror Backdoor Script
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

-- 무서운 효과음 재생
local scarySound = Instance.new("Sound", SoundService)
scarySound.SoundId = "rbxassetid://9118823100" -- 공포 효과음 ID
scarySound.Volume = 1
scarySound.Looped = true
scarySound:Play()

-- 채팅 연출
task.spawn(function()
    while true do
        wait(10)
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
            "John Doe가 지배한다...",
            "All"
        )
    end
end)

-- 화면 깜빡임 효과
task.spawn(function()
    while true do
        wait(2)
        Lighting.Brightness = 0
        wait(0.3)
        Lighting.Brightness = 2
    end
end)

-- 존 도 아바타로 변신
local function applyJohnDoeLook()
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    if Humanoid then
        Humanoid:ApplyDescription(Players:GetHumanoidDescriptionFromUserId(2)) -- John Doe userId
    end
end

if Character then
    applyJohnDoeLook()
else
    LocalPlayer.CharacterAdded:Connect(function(char)
        Character = char
        applyJohnDoeLook()
    end)
end
