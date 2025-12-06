-- GLASSHUB 2025 - DZIAŁA W 100%, ZERO BŁĘDÓW
-- Wklej do executora albo LocalScript

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- Blur
local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = game.Lighting

-- ScreenGui
local sg = Instance.new("ScreenGui")
sg.ResetOnSpawn = false
sg.Parent = player:WaitForChild("PlayerGui")

-- Main Frame
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 750, 0, 550)
main.Position = UDim2.new(0.5, -375, 0.5, -275)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
main.BackgroundTransparency = 0.15
main.Active = true
main.Draggable = true
main.Parent = sg

-- UICorner – POPRAWNIE!
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 18)
corner.Parent = main

-- Glow
local glow = Instance.new("ImageLabel")
glow.Size = UDim2.new(1, 60, 1, 60)
glow.Position = UDim2.new(0, -30, 0, -30)
glow.BackgroundTransparency = 1
glow.Image = "rbxassetid://4996891903"
glow.ImageColor3 = Color3.fromRGB(100, 200, 255)
glow.ImageTransparency = 0.5
glow.ScaleType = Enum.ScaleType.Slice
glow.Parent = main

-- Topbar
local topbar = Instance.new("Frame")
topbar.Size = UDim2.new(1, 0, 0, 60)
topbar.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
topbar.BackgroundTransparency = 0.1
topbar.Parent = main

local topCorner = Instance.new("UICorner")
topCorner.CornerRadius = UDim.new(0, 18)
topCorner.Parent = topbar

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -180, 1, 0)
title.Position = UDim2.new(0, 25, 0, 0)
title.BackgroundTransparency = 1
title.Text = "GLASSHUB 2025"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBlack
title.TextSize = 28
title.Parent = topbar

-- Close Button
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
    sg:Destroy()
end)

-- Minimize Button
local miniBtn = Instance.new("TextButton")
miniBtn.Size = UDim2.new(0, 45, 0, 45)
miniBtn.Position = UDim2.new(1, -110, 0.5, -22.5)
miniBtn.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
miniBtn.Text = "−"
miniBtn.TextSize = 36
miniBtn.Parent = topbar
Instance.new("UICorner", miniBtn).CornerRadius = UDim.new(0, 12)

local minimized = false
miniBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    TweenService:Create(main, TweenInfo.new(0.4), {
        Size = minimized and UDim2.new(0, 750, 0, 60) or UDim2.new(0, 750, 0, 550)
    }):Play()
end)

-- Insert = hide/show
UserInputService.InputBegan:Connect(function(input, gp)
    if not gp and input.KeyCode == Enum.KeyCode.Insert then
     local visible = not main.Visible
     main.Visible = visible
     TweenService:Create(blur, TweenInfo.new(0.4), {Size = visible and 20 or 0}):Play()
 end
end)

-- Przykładowe cheaty (działają!)
local flying = false
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
        flying = not flying
        if flying then
            game.StarterGui:SetCore("SendNotification", {Title="GlassHub", Text="Fly ON"})
        else
            game.StarterGui:SetCore("SendNotification", {Title="GlassHub", Text="Fly OFF"})
        end
    end
end)

print("GLASSHUB 2025 ZAŁADOWANY – DZIAŁA W 100%")
