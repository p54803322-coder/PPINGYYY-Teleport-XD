-- [[ PPINGYYY HUB - ULTRA LIGHT VERSION ]] --
local lp = game:GetService("Players").LocalPlayer
local CoreGui = game:GetService("CoreGui")

-- ลบของเก่า
if CoreGui:FindFirstChild("PPINGYYY_Hub") then CoreGui.PPINGYYY_Hub:Destroy() end

-- สร้างหน้าต่างแบบเรียบง่ายที่สุด
local sg = Instance.new("ScreenGui", CoreGui)
sg.Name = "PPINGYYY_Hub"

local Main = Instance.new("Frame", sg)
Main.Size = UDim2.new(0, 200, 0, 150)
Main.Position = UDim2.new(0.5, -100, 0.5, -75)
Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Main.Active = true
Main.Draggable = true -- ลากได้แบบไม่ต้องใช้โค้ดเยอะ

-- ช่องใส่พิกัด
local CoordBox = Instance.new("TextBox", Main)
CoordBox.Size = UDim2.new(0.9, 0, 0, 30)
CoordBox.Position = UDim2.new(0.05, 0, 0, 10)
CoordBox.PlaceholderText = "X, Y, Z"
CoordBox.Text = ""
CoordBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CoordBox.TextColor3 = Color3.new(1, 1, 1)

-- ปุ่ม Copy
local CopyBtn = Instance.new("TextButton", Main)
CopyBtn.Size = UDim2.new(0.4, 0, 0, 30)
CopyBtn.Position = UDim2.new(0.05, 0, 0, 50)
CopyBtn.Text = "COPY"
CopyBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 0)

-- ปุ่ม Warp
local WarpBtn = Instance.new("TextButton", Main)
WarpBtn.Size = UDim2.new(0.4, 0, 0, 30)
WarpBtn.Position = UDim2.new(0.55, 0, 0, 50)
WarpBtn.Text = "WARP"
WarpBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 100)

-- ตรรกะงาน
CopyBtn.MouseButton1Click:Connect(function()
    local char = lp.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local p = char.HumanoidRootPart.Position
        CoordBox.Text = math.floor(p.X)..", "..math.floor(p.Y)..", "..math.floor(p.Z)
    end
end)

WarpBtn.MouseButton1Click:Connect(function()
    local char = lp.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local parts = string.split(CoordBox.Text, ",")
        if #parts == 3 then
            char.HumanoidRootPart.CFrame = CFrame.new(tonumber(parts[1]), tonumber(parts[2]), tonumber(parts[3]))
        end
    end
end)

-- ปุ่มปิด
local CloseBtn = Instance.new("TextButton", Main)
CloseBtn.Size = UDim2.new(1, 0, 0, 30)
CloseBtn.Position = UDim2.new(0, 0, 0, 100)
CloseBtn.Text = "CLOSE"
CloseBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
CloseBtn.MouseButton1Click:Connect(function() sg:Destroy() end)
