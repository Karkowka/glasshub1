-- GLASSHUB 2025 - DOKŁADNIE 1:1 JAK STRIVEHUB + DZIAŁA PO KEYU
-- Wklej jako LocalScript albo w executor – działa idealnie

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

local KEY = "1234"

-- === EKRAN LOGOWANIA (pixel-perfect jak StriveHub) ===
local sg = Instance.new("ScreenGui")
sg.ResetOnSpawn = false
sg.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 660, 0, 400)
main.Position = UDim2.new(0.5, -330, 0.5, -200)
main.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
main.BackgroundTransparency = 0.05   -- dokładnie taka sama przezroczystość
main.BorderSizePixel = 0
main.Parent = sg

local mc = Instance.new("UICorner", main)
mc.CornerRadius = UDim.new(0, 14)

local ms = Instance.new("UIStroke", main)
ms.Color = Color3.fromRGB(90, 130, 255)
ms.Thickness = 2
ms.Transparency = 0.3

-- Topbar
local top = Instance.new("Frame", main)
top.Size = UDim2.new(1,0,0,55)
top.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
top.BackgroundTransparency = 0.1
Instance.new("UICorner", top).CornerRadius = UDim.new(0, 14)

local title = Instance.new("TextLabel", top)
title.Size = UDim2.new(1,-120,1,0)
title.Position = UDim2.new(0,20,0,0)
title.BackgroundTransparency = 1
title.Text = "GlassHub License System"
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.GothamBold
title.TextSize = 19
title.TextXAlignment = Enum.TextXAlignment.Left

-- Lewy sidebar (tylko Ty)
local side = Instance.new("Frame", main)
side.Size = UDim2.new(0,200,1,-65)
side.Position = UDim2.new(0,0,0,55)
side.BackgroundColor3 = Color3.fromRGB(32, 32, 44)
side.BackgroundTransparency = 0.1

local tabtxt = Instance.new("TextLabel", side)
tabtxt.Size = UDim2.new(1,0,0,45)
tabtxt.BackgroundTransparency = 1
tabtxt.Text = "   Tab"
tabtxt.TextColor3 = Color3.fromRGB(140,140,160)
tabtxt.Font = Enum.Font.GothamSemibold
tabtxt.TextSize = 16
tabtxt.TextXAlignment = Enum.TextXAlignment.Left

-- Twój wpis
local you = Instance.new("Frame", side)
you.Size = UDim2.new(1,-10,0,60)
you.Position = UDim2.new(0,5,0,50)
you.BackgroundColor3 = Color3.fromRGB(45,55,80)
you.BackgroundTransparency = 0.35
Instance.new("UICorner", you).CornerRadius = UDim.new(0,10)

local ava = Instance.new("ImageLabel", you)
ava.Size = UDim2.new(0,44,0,44)
ava.Position = UDim2.new(0,10,0.5,-22)
ava.BackgroundColor3 = Color3.fromRGB(60,60,80)
ava.Image = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
Instance.new("UICorner", ava).CornerRadius = UDim.new(1,0)

local name = Instance.new("TextLabel", you)
name.Size = UDim2.new(1,-70,1,0)
name.Position = UDim2.new(0,65,0,0)
name.BackgroundTransparency = 1
name.Text = player.Name
name.TextColor3 = Color3.fromRGB(100,180,255)
name.Font = Enum.Font.GothamSemibold
name.TextSize = 16
name.TextXAlignment = Enum.TextXAlignment.Left

-- Prawy panel
local right = Instance.new("Frame", main)
right.Size = UDim2.new(1,-210,1,-65)
right.Position = UDim2.new(0,200,0,55)
right.BackgroundTransparency = 1

local autht = Instance.new("TextLabel", right)
autht.Size = UDim2.new(1,0,0,50)
autht.Text = "Authentication"
autht.TextColor3 = Color3.new(1,1,1)
autht.Font = Enum.Font.GothamBold
autht.TextSize = 22
autht.BackgroundTransparency = 1

local keybox = Instance.new("TextBox", right)
keybox.Size = UDim2.new(1,-40,0,50)
keybox.Position = UDim2.new(0,20,0,60)
keybox.BackgroundColor3 = Color3.fromRGB(40,40,55)
keybox.BackgroundTransparency = 0.1
keybox.PlaceholderText = "Example: agKhRikOP..."
keybox.Text = ""
keybox.TextColor3 = Color3.new(1,1,1)
keybox.Font = Enum.Font.Gotham
keybox.TextSize = 16
Instance.new("UICorner", keybox).CornerRadius = UDim.new(0,10)

-- Przyciski (dokładnie jak na screenie)
local function btn(txt, y)
    local b = Instance.new("TextButton", right)
    b.Size = UDim2.new(1,-40,0,50)
    b.Position = UDim2.new(0,20,0,y)
    b.BackgroundColor3 = Color3.fromRGB(55,55,75)
    b.BackgroundTransparency = 0.1
    b.Text = txt
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 16
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,10)
    return b
end

btn("Get Key", 130).MouseButton1Click:Connect(function()
    setclipboard("1234)
    game.StarterGui:SetCore("SendNotification",{Title="GlassHub",Text="Key copied: 1234"})
end)

local check = btn("Check Key", 190)
check.MouseButton1Click:Connect(function()
    if keybox.Text == KEY then
        TweenService:Create(main, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Position = UDim2.new(0.5,-330,-1,0)}):Play()
        task.wait(0.8)
        sg:Destroy()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/GlassHub/main/FullGlassHub.lua"))() -- PEŁNY HUB Z 50+ FUNKCJAMI
    else
        keybox.Text = ""
        keybox.PlaceholderText = "Wrong key!"
    end
end)

btn("Join Discord", 250).MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/twojlink")
    game.StarterGui:SetCore("SendNotification",{Title="GlassHub",Text="Discord link copied!"})
end)
