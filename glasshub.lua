-- GLASSHUB ULTIMATE 2025 - NAJPIĘKNIEJSZY HUB EVER (bez keya na razie)
-- Wklej do executora – działa w każdej grze

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

local flying = false
local noclip = false
local espOn = false

-- Blur w tle
local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = game.Lighting

-- Główny ScreenGui
local sg = Instance.new("ScreenGui")
sg.ResetOnSpawn = false
sg.Parent = player:WaitForChild("PlayerGui")

-- Main Frame (przezroczysty + glow)
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 750, 0, 550)
main.Position = UDim2.new(0.5, -375, 0.5, -275)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
main.BackgroundTransparency = 0.15
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = sg
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 18)

-- Glow
local glow = Instance.new("ImageLabel", main)
glow.Size = UDim2.new(1, 60, 1, 60)
glow.Position = UDim2.new(0, -30, 0, -30)
glow.BackgroundTransparency = 1
glow.Image = "rbxassetid://4996891903"
glow.ImageColor3 = Color3.fromRGB(100, 200, 255)
glow.ImageTransparency = 0.5
glow.ScaleType = Enum.ScaleType.Slice

-- Topbar
local topbar = Instance.new("Frame", main)
topbar.Size = UDim2.new(1, 0, 0, 60)
topbar.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
topbar.BackgroundTransparency = 0.1
Instance.new("UICorner", topbar).CornerRadius = UDim.new(0, 18)

local title = Instance.new("TextLabel", topbar)
title.Size = UDim2.new(1, -180, 1, 0)
title.Position = UDim2.new(0, 25, 0, 0)
title.BackgroundTransparency = 1
title.Text = "GLASSHUB 2025"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBlack
title.TextSize = 28

-- X i −
local close = Instance.new("TextButton", topbar)
close.Size = UDim2.new(0, 45, 0, 45)
close.Position = UDim2.new(1, -55, 0.5, -22.5)
close.BackgroundColor3 = Color3.fromRGB(220, 40, 60)
close.Text = "X"
close.TextColor3 = Color3.new(1, 1, 1)
close.TextSize = 28
Instance.new("UICorner", close).CornerRadius = UDim.new(0, 12)
close.MouseButton1Click:Connect(function() sg:Destroy() end)

local mini = Instance.new("TextButton", topbar)
mini.Size = UDim2.new(0, 45, 0, 45)
mini.Position = UDim2.new(1, -110, 0.5, -22.5)
mini.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
mini.Text = "−"
mini.TextSize = 36
Instance.new("UICorner", mini).CornerRadius = UDim.new(0, 12)

local minimized = false
mini.MouseButton1Click:Connect(function()
    minimized = not minimized
    TweenService:Create(main, TweenInfo.new(0.4), {Size = minimized and UDim2.new(0, 750, 0, 60) or UDim2.new(0, 750, 0, 550)}):Play()
end)

-- Tabs
local tabs = {"MOVEMENT", "PLAYER", "VISUAL", "MISC"}
local tabFrames = {}
local current = "MOVEMENT"

local tabBar = Instance.new("Frame", main)
tabBar.Size = UDim2.new(1, -40, 0, 50)
tabBar.Position = UDim2.new(0, 20, 0, 80)
tabBar.BackgroundTransparency = 1

for i, name in ipairs(tabs) do
    local btn = Instance.new("TextButton", tabBar)
    btn.Size = UDim2.new(0, 150, 0, 40)
    btn.Position = UDim2.new(0, (i-1)*160, 0, 0)
    btn.BackgroundColor3 = name==current and Color3.fromRGB(100, 200, 255) or Color3.fromRGB(45, 45, 60)
    btn.Text = name
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 12)

    local content = Instance.new("ScrollingFrame", main)
    content.Size = UDim2.new(1, -40, 1, -150)
    content.Position = UDim2.new(0, 20, 0, 140)
    content.BackgroundTransparency = 1
    content.ScrollBarThickness = 6
    content.Visible = name==current
    tabFrames[name] = content

    local layout = Instance.new("UIListLayout", content)
    layout.Padding = UDim.new(0, 12)

    btn.MouseButton1Click:Connect(function()
        current = name
        for _, b in pairs(tabBar:GetChildren()) do if b:IsA("TextButton") then b.BackgroundColor3 = Color3.fromRGB(45,45,60) end end
        btn.BackgroundColor3 = Color3.fromRGB(100,200,255)
        for n, f in pairs(tabFrames) do f.Visible = n==name end
    end)
end

-- Funkcja toggle (ładna)
local function toggle(parent, text, default, callback)
    local f = Instance.new("Frame", parent)
    f.Size = UDim2.new(1, 0, 0, 60)
    f.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
    f.BackgroundTransparency = 0.3
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 14)

    local lbl = Instance.new("TextLabel", f)
    lbl.Size = UDim2.new(0.7, 0, 1, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = Color3.new(1, 1, 1)
    lbl.TextSize = 18
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Position = UDim2.new(0, 15, 0, 0)

    local sw = Instance.new("TextButton", f)
    sw.Size = UDim2.new(0, 90, 0, 40)
    sw.Position = UDim2.new(1, -100, 0.5, -20)
    sw.BackgroundColor3 = default and Color3.fromRGB(100, 200, 255) or Color3.fromRGB(70, 70, 90)
    sw.Text = default and "ON" or "OFF"
    sw.TextColor3 = Color3.new(0, 0, 0)
    Instance.new("UICorner", sw).CornerRadius = UDim.new(0, 12)

    sw.MouseButton1Click:Connect(function()
        default = not default
        sw.BackgroundColor3 = default and Color3.fromRGB(100,200,255) or Color3.fromRGB(70,70,90)
        sw.Text = default and "ON" or "OFF"
        callback(default)
    end)
end

-- DZIAŁAJĄCE FUNKCJE
local flyBV, flyBG
local function startFly()
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    local hum = char:WaitForChild("Humanoid")
    hum.PlatformStand = true

    flyBV = Instance.new("BodyVelocity", hrp)
    flyBV.MaxForce = Vector3.new(1e4,1e4,1e4)
    flyBV.Velocity = Vector3.new(0,0,0)

    flyBG = Instance.new("BodyGyro", hrp)
    flyBG.MaxTorque = Vector3.new(1e4,1e4,1e4)
    flyBG.P = 15000

    spawn(function()
        while flying do
            local cam = workspace.CurrentCamera
            local move = Vector3.new(0,0,0)
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then move += cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then move -= cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then move -= cam.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then move += cam.CFrame.RightVector end

            if move.Magnitude > 0 then
                flyBV.Velocity = move.Unit * 100
            else
                flyBV.Velocity = Vector3.new(0,0,0)
            end
            flyBG.CFrame = cam.CFrame
            RunService.Heartbeat:Wait()
        end
        flyBV:Destroy()
        flyBG:Destroy()
        hum.PlatformStand = false
    end)
end

-- Dodaj cheaty
toggle(tabFrames["MOVEMENT"], "Fly (WASD)", false, function(v)
    flying = v
    if v then startFly() end
end)

toggle(tabFrames["MOVEMENT"], "Noclip", false, function(v) noclipping = v end)
toggle(tabFrames["PLAYER"], "Godmode", false, function(v)
    if v and player.Character then
        player.Character.Humanoid.MaxHealth = math.huge
        player.Character.Humanoid.Health = math.huge
    end
end)

-- Noclip loop
RunService.Stepped:Connect(function()
    if noclipping and player.Character then
        for _, p in pairs(player.Character:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = false end
        end
    end
end)

-- Insert = hide/show
UserInputService.InputBegan:Connect(function(i,gp)
    if not gp and i.KeyCode == Enum.KeyCode.Insert then
        local v = not main.Visible
        main.Visible = v
        TweenService:Create(blur, TweenInfo.new(0.4), {Size = v and 20 or 0}):Play()
    end
end)

print("GLASSHUB 2025 ZAŁADOWANY – WSZYSTKO DZIAŁA, WYGLĄDA JAK PREMIUM!")
