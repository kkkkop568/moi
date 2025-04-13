
-- Floating Script with Movable GUI and 5 Studs Height

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

-- GUI 생성
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "FloatingGui"
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 150, 0, 50)
frame.Position = UDim2.new(0.5, -75, 0.8, 0)
frame.BackgroundTransparency = 0.2
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.Active = true
frame.Draggable = true

local textLabel = Instance.new("TextLabel", frame)
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = "Floating..."
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.Font = Enum.Font.SourceSansBold
textLabel.TextScaled = true

-- 떠오르게 만들기 (5 Studs 위로)
local floatPart = Instance.new("BodyPosition")
floatPart.Position = hrp.Position + Vector3.new(0, 5, 0)
floatPart.MaxForce = Vector3.new(0, math.huge, 0)
floatPart.P = 10000
floatPart.D = 1000
floatPart.Name = "FloatPart"
floatPart.Parent = hrp
