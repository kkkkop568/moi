
--!strict
-- John Doe Backdoor Module

local function scareEveryone()
    for _, player in pairs(game.Players:GetPlayers()) do
        local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
        gui.Name = "JohnDoeHorror"
        
        local msg = Instance.new("TextLabel", gui)
        msg.Size = UDim2.new(1, 0, 1, 0)
        msg.BackgroundTransparency = 1
        msg.TextColor3 = Color3.new(1, 0, 0)
        msg.TextScaled = true
        msg.Text = "John Doe가 지배한다..."
        msg.Font = Enum.Font.Arcade

        -- Optional flashing effect
        coroutine.wrap(function()
            while gui and gui.Parent do
                msg.Visible = not msg.Visible
                wait(0.3)
            end
        end)()
    end

    -- Play scary sound
    local sound = Instance.new("Sound", workspace)
    sound.SoundId = "rbxassetid://9118823106" -- scary sound
    sound.Volume = 5
    sound:Play()
end

return scareEveryone
