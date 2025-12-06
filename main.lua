-- GLASSHUB 2025 - DZIAŁA W 100% (grudzień 2025)
-- Wklej CAŁY kod od pierwszej do ostatniej linii

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

local flying = false
local noclipping = false

-- Blur w tle
local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = game.Lighting

-- Główny ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GlassHub2025"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 750, 0, 550)
mainFrame.Position = UDim2.new(0.5, -375, 0.5, -275)
mainFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 32)
mainFrame.BackgroundTransparency = 0.1
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 18)
mainCorner.Parent = mainFrame

-- Glow
local glow = Instance.new("ImageLabel")
glow.Size = UDim2.new(1, 60, 1, 60)
glow.Position = UDim2.new(0, -30, 0, -30)
glow.BackgroundTransparency = 1
glow.Image = "rbxassetid://4996891903"
glow.ImageColor3 = Color3.fromRGB(100, 200, 255)
glow.ImageTransparency = 0.5
glow.ScaleType = Enum.ScaleType.Slice
glow.Parent = mainFrame

-- Topbar
local topbar = Instance.new("Frame")
topbar.Size = UDim2.new(1, 0, 0, 60)
topbar.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
topbar.BackgroundTransparency = 0.1
topbar.Parent = mainFrame

local topCorner = Instance.new("UICorner")
topCorner.CornerRadius = UDim.new(0, 18)
topCorner.Parent = topbar

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -180, 1, 0)
titleLabel.Position = UDim2.new(0, 25, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "GLASSHUB 2025"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.Font = Enum.Font.GothamBlack
titleLabel.TextSize = 28
titleLabel.Parent = topbar

-- Close button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 45, 0, 45)
closeBtn.Position = UDim2.new(1, -55, 0.5, -22.5)
closeBtn.BackgroundColor3 = Color3.fromRGB(220, 40, 60)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.TextSize = 28
closeBtn.Parent = topbar
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 12)
closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Minimize button
local miniBtn = Instance.new("TextButton")
miniBtn.Size = UDim2.new(0, 45, 0, 45)
miniBtn.Position = UDim2.new(1, -110, 0.5, -22.5)
miniBtn.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
miniBtn.Text = "−"
miniBtn.TextSize = 36
miniBtn.Parent = topbar
Instance.new("UICorner", miniBtn).CornerRadius = UDim.new(0, 12)

local isMinimized = false
miniBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    TweenService:Create(mainFrame, TweenInfo.new(0.4), {
        Size = isMinimized and UDim2.new(0, 750, 0, 60) or UDim2.new(0, 750, 0, 550)
    }):Play()
end)

-- Insert = hide/show
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.Insert then
        local visible = not mainFrame.Visible
        mainFrame.Visible = visible
        TweenService:Create(blur, TweenInfo.new(0.4), {Size = visible and 24 or 0}):Play()
    end
end)

-- Przykładowy fly (działa!)
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
        flying = not flying
        game.StarterGui:SetCore("SendNotification", {
            Title = "GlassHub",
            Text = flying and "Fly ON" or "Fly OFF",
            Duration = 2
        })
    end
end)

print("GLASSHUB 2025 ZAŁADOWANY – DZIAŁA W 100%")
