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
    ["The Bronx 3"]      = "https://raw.githubusercontent.com/fatehdifateh/vipffhub-script/refs/heads/main/thbronx3.lua",
    ["AutoFARM (BETA)"]  = "https://raw.githubusercontent.com/fatehdifateh/vipffhub-script/refs/heads/main/AutoFARM (BETA)ryf.lua",
}

local SCRIPTS_RAYFIELD = {
    ["South Bronx"]      = "https://raw.githubusercontent.com/fatehdifateh/vipffhub-script/refs/heads/main/qarslmaolmyansb_rayfield.lua",
    ["Elite War"]        = "https://raw.githubusercontent.com/fatehdifateh/vipffhub-script/refs/heads/main/qarslmaoynu.lua",
    ["Murder Mystery 2"] = "https://raw.githubusercontent.com/fatehdifateh/vipffhub-script/refs/heads/main/qatiloynu.lua",
    ["The Bronx 3"]      = "https://raw.githubusercontent.com/fatehdifateh/vipffhub-script/refs/heads/main/thbronx3.lua",
    ["AutoFARM (BETA)"]  = "https://raw.githubusercontent.com/fatehdifateh/vipffhub-script/refs/heads/main/AutoFARM (BETA).lua",
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

local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(8, 4, 4)
bg.BackgroundTransparency = 0.2
bg.Parent = sg

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

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 580, 0, 340)
frame.Position = UDim2.new(0.5, -290, 2, 0)
frame.BackgroundColor3 = Color3.fromRGB(12, 4, 4)
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
frame.Parent = sg
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 14)
local frameStroke = Instance.new("UIStroke")
frameStroke.Color = Color3.fromRGB(160, 0, 0)
frameStroke.Thickness = 1.5
frameStroke.Parent = frame

local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 52)
topBar.BackgroundColor3 = Color3.fromRGB(130, 0, 0)
topBar.BorderSizePixel = 0
topBar.Parent = frame
Instance.new("UICorner", topBar).CornerRadius = UDim.new(0, 14)
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
closeBtn.MouseButton1Click:Connect(function()
    TweenService:Create(blur, TweenInfo.new(0.3), {Size = 0}):Play()
    TweenService:Create(frame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Position = UDim2.new(0.5, -290, 2, 0)}):Play()
    task.wait(0.45) blur:Destroy() sg:Destroy() error("Loader closed.")
end)

-- ==========================================
-- GUI SEÇİMİ
-- ==========================================
local guiChoiceFrame = Instance.new("Frame")
guiChoiceFrame.Size = UDim2.new(1, -20, 0, 60)
guiChoiceFrame.Position = UDim2.new(0, 10, 0, 58)
guiChoiceFrame.BackgroundTransparency = 1
guiChoiceFrame.Parent = frame

local guiLabel = Instance.new("TextLabel")
guiLabel.Size = UDim2.new(1, 0, 0, 18)
guiLabel.BackgroundTransparency = 1
guiLabel.TextColor3 = Color3.fromRGB(200, 80, 80)
guiLabel.Font = Enum.Font.GothamBold
guiLabel.TextSize = 12
guiLabel.TextXAlignment = Enum.TextXAlignment.Left
guiLabel.Text = "🎨 Select UI:"
guiLabel.Parent = guiChoiceFrame

local selectedGUI = "fluent"

local function makeGuiBtn(xPos, name, label)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 120, 0, 36)
    btn.Position = UDim2.new(0, xPos, 0, 22)
    btn.BackgroundColor3 = Color3.fromRGB(30, 8, 8)
    btn.TextColor3 = Color3.fromRGB(200, 160, 160)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.Text = label
    btn.BorderSizePixel = 0
    btn.Parent = guiChoiceFrame
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    local bs = Instance.new("UIStroke") bs.Color = Color3.fromRGB(100, 0, 0) bs.Thickness = 1.5 bs.Parent = btn
    return btn, bs
end

local rayfieldBtn, rayfieldStroke = makeGuiBtn(0, "rayfield", "Rayfield")
local fluentBtn, fluentStroke = makeGuiBtn(130, "fluent", "Fluent")

fluentBtn.BackgroundColor3 = Color3.fromRGB(100, 10, 10)
fluentBtn.TextColor3 = Color3.fromRGB(255, 200, 200)
fluentStroke.Color = Color3.fromRGB(220, 50, 50)

local function selectGUI(name)
    selectedGUI = name
    if name == "rayfield" then
        rayfieldBtn.BackgroundColor3 = Color3.fromRGB(100, 10, 10)
        rayfieldBtn.TextColor3 = Color3.fromRGB(255, 200, 200)
        rayfieldStroke.Color = Color3.fromRGB(220, 50, 50)
        fluentBtn.BackgroundColor3 = Color3.fromRGB(30, 8, 8)
        fluentBtn.TextColor3 = Color3.fromRGB(200, 160, 160)
        fluentStroke.Color = Color3.fromRGB(100, 0, 0)
    else
        fluentBtn.BackgroundColor3 = Color3.fromRGB(100, 10, 10)
        fluentBtn.TextColor3 = Color3.fromRGB(255, 200, 200)
        fluentStroke.Color = Color3.fromRGB(220, 50, 50)
        rayfieldBtn.BackgroundColor3 = Color3.fromRGB(30, 8, 8)
        rayfieldBtn.TextColor3 = Color3.fromRGB(200, 160, 160)
        rayfieldStroke.Color = Color3.fromRGB(100, 0, 0)
    end
end

rayfieldBtn.MouseButton1Click:Connect(function() selectGUI("rayfield") end)
fluentBtn.MouseButton1Click:Connect(function() selectGUI("fluent") end)

-- ==========================================
-- SOL: GAME SEÇİMİ
-- ==========================================
local leftPanel = Instance.new("Frame")
leftPanel.Size = UDim2.new(0, 220, 1, -128)
leftPanel.Position = UDim2.new(0, 10, 0, 124)
leftPanel.BackgroundTransparency = 1
leftPanel.Parent = frame

local gameLabel2 = Instance.new("TextLabel")
gameLabel2.Size = UDim2.new(1, 0, 0, 20)
gameLabel2.BackgroundTransparency = 1
gameLabel2.TextColor3 = Color3.fromRGB(200, 80, 80)
gameLabel2.Font = Enum.Font.GothamBold
gameLabel2.TextSize = 12
gameLabel2.TextXAlignment = Enum.TextXAlignment.Left
gameLabel2.Text = "🎮 Select Game:"
gameLabel2.Parent = leftPanel

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
    local bs = Instance.new("UIStroke") bs.Color = Color3.fromRGB(100, 0, 0) bs.Thickness = 1.5 bs.Parent = btn
    btn.MouseEnter:Connect(function() if selectedGame~=name then TweenService:Create(btn,TweenInfo.new(0.15),{BackgroundColor3=Color3.fromRGB(50,12,12)}):Play() end end)
    btn.MouseLeave:Connect(function() if selectedGame~=name then TweenService:Create(btn,TweenInfo.new(0.15),{BackgroundColor3=Color3.fromRGB(30,8,8)}):Play() end end)
    table.insert(allGameBtns, {btn=btn, stroke=bs, name=name})
    return btn
end

local function selectGame(name)
    selectedGame = name
    for _, data in pairs(allGameBtns) do
        if data.name == name then
            TweenService:Create(data.stroke, TweenInfo.new(0.15), {Color=Color3.fromRGB(220,50,50)}):Play()
            TweenService:Create(data.btn, TweenInfo.new(0.15), {BackgroundColor3=Color3.fromRGB(100,10,10)}):Play()
            data.btn.TextColor3 = Color3.fromRGB(255,200,200)
        else
            TweenService:Create(data.stroke, TweenInfo.new(0.15), {Color=Color3.fromRGB(100,0,0)}):Play()
            TweenService:Create(data.btn, TweenInfo.new(0.15), {BackgroundColor3=Color3.fromRGB(30,8,8)}):Play()
            data.btn.TextColor3 = Color3.fromRGB(200,160,160)
        end
    end
end

local sbBtn  = makeGameBtn("South Bronx")
local ewBtn  = makeGameBtn("Elite War")
local mm2Btn = makeGameBtn("Murder Mystery 2")
local tb3Btn = makeGameBtn("The Bronx 3")

sbBtn.MouseButton1Click:Connect(function()  selectGame("South Bronx") end)
ewBtn.MouseButton1Click:Connect(function()  selectGame("Elite War") end)
mm2Btn.MouseButton1Click:Connect(function() selectGame("Murder Mystery 2") end)
tb3Btn.MouseButton1Click:Connect(function() selectGame("The Bronx 3") end)

-- ==========================================
-- DIVIDER
-- ==========================================
local divider = Instance.new("Frame")
divider.Size = UDim2.new(0, 1, 1, -134)
divider.Position = UDim2.new(0, 238, 0, 126)
divider.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
divider.BackgroundTransparency = 0.5
divider.BorderSizePixel = 0
divider.Parent = frame

-- ==========================================
-- SAĞ: KEY SİSTEMİ
-- ==========================================
local rightPanel = Instance.new("Frame")
rightPanel.Size = UDim2.new(0, 310, 1, -128)
rightPanel.Position = UDim2.new(0, 248, 0, 124)
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
btnGrad.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(210,40,40)),ColorSequenceKeypoint.new(1,Color3.fromRGB(120,0,0))})
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

verifyBtn.MouseEnter:Connect(function() TweenService:Create(verifyBtn,TweenInfo.new(0.15),{BackgroundColor3=Color3.fromRGB(230,50,50)}):Play() end)
verifyBtn.MouseLeave:Connect(function() TweenService:Create(verifyBtn,TweenInfo.new(0.15),{BackgroundColor3=Color3.fromRGB(160,0,0)}):Play() end)

TweenService:Create(frame, TweenInfo.new(0.7, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5, -290, 0.5, -170)
}):Play()

-- ==========================================
-- VERIFY
-- ==========================================
local keyValid = false

verifyBtn.MouseButton1Click:Connect(function()
    if not selectedGame then
        statusLbl.TextColor3 = Color3.fromRGB(255,150,0)
        statusLbl.Text = "⚠️ Please select a game first!"
        return
    end
    local key = input.Text
    if key == "" then
        statusLbl.TextColor3 = Color3.fromRGB(255,150,0)
        statusLbl.Text = "⚠️ Please enter a key!"
        return
    end
    statusLbl.TextColor3 = Color3.fromRGB(255,220,0)
    statusLbl.Text = "🔄 Verifying..."
    verifyBtn.Text = "Checking..."
    verifyBtn.BackgroundColor3 = Color3.fromRGB(50,15,15)

    task.spawn(function()
        local valid = checkKey(key)
        if valid then
            inputStroke.Color = Color3.fromRGB(0,200,80)
            statusLbl.TextColor3 = Color3.fromRGB(0,220,100)
            statusLbl.Text = "✅ Access granted! Loading "..selectedGame.." ["..selectedGUI:upper().."]..."
            -- KEY'İ GLOBAL'E KAYDET
            _G.VIPFF_KEY = key
            TweenService:Create(frame,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.In),{Position=UDim2.new(0.5,-290,-2,0)}):Play()
            TweenService:Create(blur,TweenInfo.new(0.5),{Size=0}):Play()
            task.wait(0.6) blur:Destroy() sg:Destroy() keyValid=true
        else
            statusLbl.TextColor3 = Color3.fromRGB(255,60,60)
            statusLbl.Text = "❌ Invalid key!"
            inputStroke.Color = Color3.fromRGB(220,0,0)
            verifyBtn.Text = "✅  Verify & Load"
            verifyBtn.BackgroundColor3 = Color3.fromRGB(160,0,0)
            for i=1,3 do
                TweenService:Create(frame,TweenInfo.new(0.05),{Position=UDim2.new(0.5,-280,0.5,-170)}):Play() task.wait(0.05)
                TweenService:Create(frame,TweenInfo.new(0.05),{Position=UDim2.new(0.5,-300,0.5,-170)}):Play() task.wait(0.05)
            end
            TweenService:Create(frame,TweenInfo.new(0.1),{Position=UDim2.new(0.5,-290,0.5,-170)}):Play()
        end
    end)
end)

repeat task.wait(0.1) until keyValid

-- ==========================================
-- LOAD SCRIPT
-- ==========================================
local scriptTable = selectedGUI == "rayfield" and SCRIPTS_RAYFIELD or SCRIPTS
local url = scriptTable[selectedGame]
if url then
    local ok, err = pcall(function()
        loadstring(game:HttpGet(url))()
    end)
    if not ok then
        warn("❌ Script failed to load: "..tostring(err))
    end
end
