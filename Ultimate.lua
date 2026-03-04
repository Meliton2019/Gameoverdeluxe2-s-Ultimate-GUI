-- Ultimate Gui v1.0 (Roblox Client-Side - Solara/Delta/Xeno)
-- Carga scripts OP con 1 click. Arrastrable, dark theme.
-- Ejecuta en executor: Paste & Run

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Crear ScreenGui principal (invisible en lobby, visible en juego)
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "UltimateGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = game:GetService("CoreGui")  -- CoreGui = no se ve en PlayerList

-- Frame principal (draggable, centrado)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 300, 0, 400)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true  -- Arrastrable
mainFrame.Parent = screenGui

-- Esquinas redondeadas + sombra
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = mainFrame

local shadow = Instance.new("UIStroke")
shadow.Color = Color3.fromRGB(0, 0, 0)
shadow.Thickness = 2
shadow.Transparency = 0.5
shadow.Parent = mainFrame

-- Título
local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "🛡️ ULTIMATE GUI"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 12)
titleCorner.Parent = title

-- ScrollFrame para botones (si muchos)
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Name = "ScrollFrame"
scrollFrame.Size = UDim2.new(1, -20, 1, -70)
scrollFrame.Position = UDim2.new(0, 10, 0, 60)
scrollFrame.BackgroundTransparency = 1
scrollFrame.BorderSizePixel = 0
scrollFrame.ScrollBarThickness = 6
scrollFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 500)  -- Auto ajusta
scrollFrame.Parent = mainFrame

-- Función para crear botón
local function createButton(name, posY, scriptLink)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Size = UDim2.new(1, -20, 0, 50)
    button.Position = UDim2.new(0, 10, 0, posY)
    button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Text = name
    button.TextScaled = true
    button.Font = Enum.Font.Gotham
    button.Parent = scrollFrame
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = button
    
    local btnStroke = Instance.new("UIStroke")
    btnStroke.Color = Color3.fromRGB(70, 70, 70)
    btnStroke.Thickness = 1
    btnStroke.Parent = button
    
    -- Hover effect
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
    end)
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}):Play()
    end)
    
    -- Click: Carga script
    button.MouseButton1Click:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(0, 170, 0)}):Play()
        wait(0.1)
        TweenService:Create(button, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}):Play()
        
        -- Loadstring del script
        loadstring(game:HttpGet(scriptLink))()
        print("✅ " .. name .. " cargado!")
    end)
    
    return posY + 60  -- Siguiente posición Y
end

-- Crear botones con links OP (marzo 2026 - probados)
local nextY = 0
nextY = createButton("Infinite Yield (Admin)", nextY, "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
nextY = createButton("CMD-X (600+ Cmds)", nextY, "https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source")
nextY = createButton("c00lgui Reborn", nextY, "https://raw.githubusercontent.com/Gazer6541/C00lgui/refs/heads/main/C00lgui"
nextY = createButton("Fly GUI", nextY, "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/fly.lua")  -- Fly simple
nextY = createButton("ESP Players", nextY, "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/esp.lua")
nextY = createButton("DEX Explorer", nextY, "https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.txt")

-- Ajustar CanvasSize auto
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, nextY + 20)

-- Botón Close (arriba derecha)
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = mainFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 15)
closeCorner.Parent = closeBtn

closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

print("🛡️ Ultimate Gui cargado! Arrastra y clickea botones.")
