-- ==========================================
-- VIP FF HUB | LOADER
-- ==========================================
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local lp = Players.LocalPlayer

local SCRIPTS = {
    ["South Bronx"]      = "https://raw.githubusercontent.com/fatehdifateh/vipffhub-script/refs/heads/main/qarslmaolmyansb.lua",
    ["Elite War"]        = "https://raw.githubusercontent.com/fatehdifateh/vipffhub-script/refs/heads/main/qarslmaoynu.lua",
    ["Murder Mystery 2"] = "https://raw.githubusercontent.com/fatehdifateh/vipffhub-script/refs/heads/main/qatiloynu.lua",
}

local KEY_URL = "https://pastebin.com/raw/mm21ris3"

local function checkKey(key)
    local ok, result = pcall(function()
        return game:HttpGet(KEY_URL)
    end)
    if not ok then return false end
    local trimKey = key:match("^%s*(.-)%s*$")
    local playerName = lp.Name
    for line in result:gmatch("[^\n]+") do
        local trimLine = line:match("^%s*(.-)%s*$")
        local kv = trimLine:match("^KEY:(.+)$")
        if kv and kv:match("^%s*(.-)%s*$") == trimKey then return true end
        local wl = trimLine:match("^WHITELIST:(.+)$")
        if wl and wl:match("^%s*(.-)%s*$") == playerName then return true end
    end
    return false
end

-- ==========================================
-- BLUR
-- ==========================================
local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = game:GetService("Lighting")
TweenService:Create(blur, TweenInfo.new(0.5), {Size = 22}):Play()

-- ==========================================
-- SCREEN GUI
-- ==========================================
local sg = Instance.new("ScreenGui")
sg.Name = "VIPFFLoader"
sg.ResetOnSpawn = false
sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
sg.Parent = lp.PlayerGui

-- Background
local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(8, 4, 4)
bg.BackgroundTransparency = 0.2
bg.Parent = sg

-- Decorative dots
for i = 1, 8 do
    local dot = Instance.new("Frame")
    dot.Size = UDim2.new(0, math.random(3,8), 0, math.random(3,8))
    dot.Position = UDim2.new(math.random(), 0, math.random(), 0)
    dot.BackgroundColor3 = Color3.fromRGB(180+math.random(75), 0, 0)
    dot.BackgroundTransparency = 0.4
    dot.BorderSizePixel = 0
    dot.Parent = bg
    Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
end

-- Main frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 540, 0, 320)
frame.Position = UDim2.new(0.5, -270, 2, 0)
frame.BackgroundColor3 = Color3.fromRGB(12, 4, 4)
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
frame.Parent = sg
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 14)
local frameStroke = Instance.new("UIStroke")
frameStroke.Color = Color3.fromRGB(160, 0, 0)
frameStroke.Thickness = 1.5
frameStroke.Parent = frame

-- Top bar
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 52)
topBar.BackgroundColor3 = Color3.fromRGB(130, 0, 0)
topBar.BorderSizePixel = 0
topBar.Parent = frame
Instance.new("UICorner", topBar).CornerRadius = UDim.new(0, 14)
-- Fix round corners only on top
local topBarFix = Instance.new("Frame")
topBarFix.Size = UDim2.new(1, 0, 0.5, 0)
topBarFix.Position = UDim2.new(0, 0, 0.5, 0)
topBarFix.BackgroundColor3 = Color3.fromRGB(130, 0, 0)
topBarFix.BorderSizePixel = 0
topBarFix.Parent = topBar
local tbGrad = Instance.new("UIGradient")
tbGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 30, 30)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 0, 0))
})
tbGrad.Parent = topBar

-- Title
local titleLbl = Instance.new("TextLabel")
titleLbl.Size = UDim2.new(1, -60, 1, 0)
titleLbl.Position = UDim2.new(0, 16, 0, 0)
titleLbl.BackgroundTransparency = 1
titleLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLbl.Font = Enum.Font.GothamBold
titleLbl.TextSize = 18
titleLbl.TextXAlignment = Enum.TextXAlignment.Left
titleLbl.Text = "🔐  VIP FF HUB  |  LOADER"
titleLbl.Parent = topBar

-- Close button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 32, 0, 32)
closeBtn.Position = UDim2.new(1, -42, 0.5, -16)
closeBtn.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 16
closeBtn.Text = "✕"
closeBtn.BorderSizePixel = 0
closeBtn.Parent = topBar
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 7)

closeBtn.MouseEnter:Connect(function()
    TweenService:Create(closeBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(180, 0, 0)}):Play()
end)
closeBtn.MouseLeave:Connect(function()
    TweenService:Create(closeBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(80, 0, 0)}):Play()
end)
closeBtn.MouseButton1Click:Connect(function()
    TweenService:Create(blur, TweenInfo.new(0.3), {Size = 0}):Play()
    TweenService:Create(frame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Position = UDim2.new(0.5, -270, 2, 0)
    }):Play()
    task.wait(0.45)
    blur:Destroy()
    sg:Destroy()
    error("Loader closed.")
end)

-- ==========================================
-- LEFT: GAME SELECT (Scrollable)
-- ==========================================
local leftPanel = Instance.new("Frame")
leftPanel.Size = UDim2.new(0, 220, 1, -62)
leftPanel.Position = UDim2.new(0, 10, 0, 58)
leftPanel.BackgroundTransparency = 1
leftPanel.Parent = frame

local gameLabel = Instance.new("TextLabel")
gameLabel.Size = UDim2.new(1, 0, 0, 20)
gameLabel.BackgroundTransparency = 1
gameLabel.TextColor3 = Color3.fromRGB(200, 80, 80)
gameLabel.Font = Enum.Font.GothamBold
gameLabel.TextSize = 12
gameLabel.TextXAlignment = Enum.TextXAlignment.Left
gameLabel.Text = "🎮 Select Game:"
gameLabel.Parent = leftPanel

local gameScroll = Instance.new("ScrollingFrame")
gameScroll.Size = UDim2.new(1, 0, 1, -26)
gameScroll.Position = UDim2.new(0, 0, 0, 24)
gameScroll.BackgroundTransparency = 1
gameScroll.BorderSizePixel = 0
gameScroll.ScrollBarThickness = 3
gameScroll.ScrollBarImageColor3 = Color3.fromRGB(160, 0, 0)
gameScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
gameScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
gameScroll.Parent = leftPanel

local gameLayout = Instance.new("UIListLayout")
gameLayout.Padding = UDim.new(0, 6)
gameLayout.Parent = gameScroll

local gamePad = Instance.new("UIPadding")
gamePad.PaddingTop = UDim.new(0, 2)
gamePad.PaddingBottom = UDim.new(0, 4)
gamePad.Parent = gameScroll

local selectedGame = nil
local allGameBtns = {}

local function makeGameBtn(name)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -4, 0, 48)
    btn.BackgroundColor3 = Color3.fromRGB(30, 8, 8)
    btn.TextColor3 = Color3.fromRGB(200, 160, 160)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 13
    btn.Text = name
    btn.BorderSizePixel = 0
    btn.Parent = gameScroll
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
    local bs = Instance.new("UIStroke")
    bs.Color = Color3.fromRGB(100, 0, 0)
    bs.Thickness = 1.5
    bs.Parent = btn

    btn.MouseEnter:Connect(function()
        if selectedGame ~= name then
            TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(50, 12, 12)}):Play()
        end
    end)
    btn.MouseLeave:Connect(function()
        if selectedGame ~= name then
            TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(30, 8, 8)}):Play()
        end
    end)

    table.insert(allGameBtns, {btn = btn, stroke = bs, name = name})
    return btn, bs
end

local function selectGame(name)
    selectedGame = name
    for _, data in pairs(allGameBtns) do
        if data.name == name then
            TweenService:Create(data.stroke, TweenInfo.new(0.15), {Color = Color3.fromRGB(220, 50, 50)}):Play()
            TweenService:Create(data.btn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(100, 10, 10)}):Play()
            data.btn.TextColor3 = Color3.fromRGB(255, 200, 200)
        else
            TweenService:Create(data.stroke, TweenInfo.new(0.15), {Color = Color3.fromRGB(100, 0, 0)}):Play()
            TweenService:Create(data.btn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(30, 8, 8)}):Play()
            data.btn.TextColor3 = Color3.fromRGB(200, 160, 160)
        end
    end
end

local sbBtn,  _ = makeGameBtn("South Bronx")
local ewBtn,  _ = makeGameBtn("Elite War")
local mm2Btn, _ = makeGameBtn("Murder Mystery 2")

sbBtn.MouseButton1Click:Connect(function()  selectGame("South Bronx") end)
ewBtn.MouseButton1Click:Connect(function()  selectGame("Elite War") end)
mm2Btn.MouseButton1Click:Connect(function() selectGame("Murder Mystery 2") end)

-- ==========================================
-- DIVIDER
-- ==========================================
local divider = Instance.new("Frame")
divider.Size = UDim2.new(0, 1, 1, -70)
divider.Position = UDim2.new(0, 238, 0, 60)
divider.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
divider.BackgroundTransparency = 0.5
divider.BorderSizePixel = 0
divider.Parent = frame

-- ==========================================
-- RIGHT: KEY SYSTEM
-- ==========================================
local rightPanel = Instance.new("Frame")
rightPanel.Size = UDim2.new(0, 278, 1, -62)
rightPanel.Position = UDim2.new(0, 248, 0, 58)
rightPanel.BackgroundTransparency = 1
rightPanel.Parent = frame

local keyLabel = Instance.new("TextLabel")
keyLabel.Size = UDim2.new(1, 0, 0, 20)
keyLabel.BackgroundTransparency = 1
keyLabel.TextColor3 = Color3.fromRGB(200, 80, 80)
keyLabel.Font = Enum.Font.GothamBold
keyLabel.TextSize = 12
keyLabel.TextXAlignment = Enum.TextXAlignment.Left
keyLabel.Text = "🔑 License Key:"
keyLabel.Parent = rightPanel

local input = Instance.new("TextBox")
input.Size = UDim2.new(1, 0, 0, 42)
input.Position = UDim2.new(0, 0, 0, 26)
input.BackgroundColor3 = Color3.fromRGB(28, 6, 6)
input.TextColor3 = Color3.fromRGB(255, 200, 200)
input.Font = Enum.Font.GothamBold
input.TextSize = 13
input.PlaceholderText = "  VIPFF-XXXXX-XXXXX"
input.PlaceholderColor3 = Color3.fromRGB(100, 40, 40)
input.Text = ""
input.BorderSizePixel = 0
input.ClearTextOnFocus = false
input.Parent = rightPanel
Instance.new("UICorner", input).CornerRadius = UDim.new(0, 10)
local inputStroke = Instance.new("UIStroke")
inputStroke.Color = Color3.fromRGB(140, 0, 0)
inputStroke.Thickness = 1.5
inputStroke.Parent = input

local verifyBtn = Instance.new("TextButton")
verifyBtn.Size = UDim2.new(1, 0, 0, 42)
verifyBtn.Position = UDim2.new(0, 0, 0, 76)
verifyBtn.BackgroundColor3 = Color3.fromRGB(160, 0, 0)
verifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
verifyBtn.Font = Enum.Font.GothamBold
verifyBtn.TextSize = 14
verifyBtn.Text = "✅  Verify & Load"
verifyBtn.BorderSizePixel = 0
verifyBtn.Parent = rightPanel
Instance.new("UICorner", verifyBtn).CornerRadius = UDim.new(0, 10)
local btnGrad = Instance.new("UIGradient")
btnGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(210, 40, 40)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 0, 0))
})
btnGrad.Rotation = 90
btnGrad.Parent = verifyBtn

local statusLbl = Instance.new("TextLabel")
statusLbl.Size = UDim2.new(1, 0, 0, 40)
statusLbl.Position = UDim2.new(0, 0, 0, 126)
statusLbl.BackgroundTransparency = 1
statusLbl.TextColor3 = Color3.fromRGB(180, 80, 80)
statusLbl.Font = Enum.Font.Gotham
statusLbl.TextSize = 11
statusLbl.TextWrapped = true
statusLbl.Text = "© VIP FF HUB - All rights reserved"
statusLbl.Parent = rightPanel

verifyBtn.MouseEnter:Connect(function()
    TweenService:Create(verifyBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(230, 50, 50)}):Play()
end)
verifyBtn.MouseLeave:Connect(function()
    TweenService:Create(verifyBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(160, 0, 0)}):Play()
end)

-- Animate frame in
TweenService:Create(frame, TweenInfo.new(0.7, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5, -270, 0.5, -160)
}):Play()

-- ==========================================
-- VERIFY BUTTON
-- ==========================================
local keyValid = false

verifyBtn.MouseButton1Click:Connect(function()
    if not selectedGame then
        statusLbl.TextColor3 = Color3.fromRGB(255, 150, 0)
        statusLbl.Text = "⚠️ Please select a game first!"
        return
    end
    local key = input.Text
    if key == "" then
        statusLbl.TextColor3 = Color3.fromRGB(255, 150, 0)
        statusLbl.Text = "⚠️ Please enter a key!"
        return
    end

    statusLbl.TextColor3 = Color3.fromRGB(255, 220, 0)
    statusLbl.Text = "🔄 Verifying..."
    verifyBtn.Text = "Checking..."
    verifyBtn.BackgroundColor3 = Color3.fromRGB(50, 15, 15)

    task.spawn(function()
        local valid = checkKey(key)
        if valid then
            inputStroke.Color = Color3.fromRGB(0, 200, 80)
            statusLbl.TextColor3 = Color3.fromRGB(0, 220, 100)
            statusLbl.Text = "✅ Access granted! Loading " .. selectedGame .. "..."
            TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                Position = UDim2.new(0.5, -270, -2, 0)
            }):Play()
            TweenService:Create(blur, TweenInfo.new(0.5), {Size = 0}):Play()
            task.wait(0.6)
            blur:Destroy()
            sg:Destroy()
            keyValid = true
        else
            statusLbl.TextColor3 = Color3.fromRGB(255, 60, 60)
            statusLbl.Text = "❌ Invalid key! Contact the developer."
            inputStroke.Color = Color3.fromRGB(220, 0, 0)
            verifyBtn.Text = "✅  Verify & Load"
            verifyBtn.BackgroundColor3 = Color3.fromRGB(160, 0, 0)
            -- Shake
            for i = 1, 3 do
                TweenService:Create(frame, TweenInfo.new(0.05), {Position = UDim2.new(0.5,-260,0.5,-160)}):Play() task.wait(0.05)
                TweenService:Create(frame, TweenInfo.new(0.05), {Position = UDim2.new(0.5,-280,0.5,-160)}):Play() task.wait(0.05)
            end
            TweenService:Create(frame, TweenInfo.new(0.1), {Position = UDim2.new(0.5,-270,0.5,-160)}):Play()
        end
    end)
end)

repeat task.wait(0.1) until keyValid

-- ==========================================
-- LOAD SCRIPT
-- ==========================================
local url = SCRIPTS[selectedGame]
if url then
    local ok, err = pcall(function()
        loadstring(game:HttpGet(url))()
    end)
    if not ok then
        warn("❌ Script failed to load: " .. tostring(err))
    end
end
