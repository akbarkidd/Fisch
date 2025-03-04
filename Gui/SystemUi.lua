local Library = {}

--// Service
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local TweenInfo = TweenInfo.new

--// Init
local LocalizationService = game:GetService("LocalizationService");
local http = game:GetService("HttpService");
local LocalPlayer = game:GetService("Players").LocalPlayer;
local NameID = LocalPlayer.Name;
local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name;

local utility = {};
local Objects = {};

function utility:Tween(instance, properties, duration, ...)
    TweenService:Create(instance, TweenInfo(duration, ...), properties):Play()
end;

local SettingToggle = {}

local Name = "BTConfig.JSON"

pcall(function()
    if not pcall(function() readfile(Name) end) then
    writefile(Name, game:service'HttpService':JSONEncode(SettingToggle))
    end

    Settings = game:service'HttpService':JSONEncode(readfile(Name))
end)

local LibName = tostring(math.random(1, 100))..tostring(math.random(1,50))..tostring(math.random(1, 100));

function Library:ToggleUI()
    if game.CoreGui[LibName].Enabled then
        game.CoreGui[LibName].Enabled = false
    else
        game.CoreGui[LibName].Enabled = true
    end
end

function Library:DestroyGui()
    if game.CoreGui[LibName] then
        game.CoreGui[LibName]:Destroy()
    end
end

function Library:CreateWindow(hubname)

    table.insert(Library, hubname);
    for i,v in pairs(game.CoreGui:GetChildren()) do
        if v:IsA("ScreenGui") and v.Name == hubname then
            v:Destroy();
        end;
    end;

    -- Instances:
    local ScreenGui = Instance.new("ScreenGui")
    local Body = Instance.new("Frame")
    local Body_Corner = Instance.new("UICorner")
    local Title_Hub = Instance.new("TextLabel")
    local Discord = Instance.new("TextButton")
    local UICorner = Instance.new("UICorner")
    local Disc_Logo = Instance.new("ImageLabel")
    local Disc_Title = Instance.new("TextLabel")
    local Server_Time = Instance.new("TextLabel")
    local Server_ID = Instance.new("TextLabel")
    local List_Tile = Instance.new("Frame")
    local Tile_Gradient = Instance.new("UIGradient")
    local Toggle = Instance.new("Frame")
    local toggle_corner = Instance.new("UICorner")
    local toggle_Image = Instance.new("ImageButton")

    -- Properties:
    ScreenGui.Name = LibName
    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

    game:GetService("UserInputService").InputBegan:connect(function(input) 
        if input.KeyCode == Enum.KeyCode.LeftControl then
            Library:ToggleUI()
        end
    end)

    Body.Name = "Body"
    Body.Parent = ScreenGui
    Body.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    Body.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Body.BorderSizePixel = 0
    Body.Position = UDim2.new(0.258427024, 0, 0.217948765, 0)
    Body.Size = UDim2.new(0, 600, 0, 350)
    Body.ClipsDescendants = true

    Body_Corner.CornerRadius = UDim.new(0, 5)
    Body_Corner.Name = "Body_Corner"
    Body_Corner.Parent = Body

    Title_Hub.Name = "Title_Hub"
    Title_Hub.Parent = Body
    Title_Hub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title_Hub.BackgroundTransparency = 1.000
    Title_Hub.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title_Hub.BorderSizePixel = 0
    Title_Hub.Position = UDim2.new(0, 5, 0, 0)
    Title_Hub.Size = UDim2.new(0, 558, 0, 30)
    Title_Hub.Font = Enum.Font.SourceSansBold
    Title_Hub.Text = hubname .. " | " .. GameName
    Title_Hub.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title_Hub.TextSize = 15.000
    Title_Hub.TextXAlignment = Enum.TextXAlignment.Left

    Discord.Name = "Discord"
    Discord.Parent = Body
    Discord.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Discord.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Discord.BorderSizePixel = 0
    Discord.Position = UDim2.new(0, 5, 0, 320)
    Discord.Size = UDim2.new(0, 85, 0, 25)
    Discord.AutoButtonColor = false
    Discord.Font = Enum.Font.SourceSans
    Discord.Text = ""
    Discord.TextColor3 = Color3.fromRGB(0, 0, 0)
    Discord.TextSize = 14.000

    UICorner.CornerRadius = UDim.new(0, 5)
    UICorner.Parent = Discord

    Disc_Logo.Name = "Disc_Logo"
    Disc_Logo.Parent = Discord
    Disc_Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Disc_Logo.BackgroundTransparency = 1.000
    Disc_Logo.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Disc_Logo.BorderSizePixel = 0
    Disc_Logo.Position = UDim2.new(0, 5, 0, 1)
    Disc_Logo.Size = UDim2.new(0, 23, 0, 23)
    Disc_Logo.Image = "http://www.roblox.com/asset/?id=12058969086"

    Disc_Title.Name = "Disc_Title"
    Disc_Title.Parent = Discord
    Disc_Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Disc_Title.BackgroundTransparency = 1.000
    Disc_Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Disc_Title.BorderSizePixel = 0
    Disc_Title.Position = UDim2.new(0, 35, 0, 0)
    Disc_Title.Size = UDim2.new(0, 40, 0, 25)
    Disc_Title.Font = Enum.Font.SourceSansSemibold
    Disc_Title.Text = "Discord"
    Disc_Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Disc_Title.TextSize = 14.000
    Disc_Title.TextXAlignment = Enum.TextXAlignment.Left

    Discord.MouseEnter:Connect(function()
        utility:Tween(Discord, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}, .15)
        utility:Tween(Disc_Logo, {ImageTransparency = 0.7}, .15)
        utility:Tween(Disc_Title, {TextTransparency = 0.7}, .15)
    end)

    Discord.MouseLeave:connect(function()
        utility:Tween(Discord, {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}, .15)
        utility:Tween(Disc_Logo, {ImageTransparency = 0}, .15)
        utility:Tween(Disc_Title, {TextTransparency = 0}, .15)
    end)

    Discord.MouseButton1Click:Connect(function()
        (setclipboard or toclipboard)("https://discord.gg/25ms")
        wait(.1)
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "Discord",
            Text = "Discord copied on your clipboard",
            Button1 = "Okay",
            Duration = 20
        })
    end)

    Server_Time.Name = "Server_Time"
    Server_Time.Parent = Body
    Server_Time.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Server_Time.BackgroundTransparency = 1.000
    Server_Time.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Server_Time.BorderSizePixel = 0
    Server_Time.Position = UDim2.new(0, 100, 0, 320)
    Server_Time.Size = UDim2.new(0, 120, 0, 25)
    Server_Time.Font = Enum.Font.SourceSansSemibold
    Server_Time.Text = ""
    Server_Time.TextColor3 = Color3.fromRGB(255, 255, 255)
    Server_Time.TextSize = 14.000
    Server_Time.TextXAlignment = Enum.TextXAlignment.Left

    local ServerTimeFunc = {};
    function ServerTimeFunc:Refresh(textadd)
        Server_Time.Text = textadd;
    end;

    function UpdateTime()
        local GameTime = math.floor(workspace.DistributedGameTime+0.5)
        local Hour = math.floor(GameTime/(60^2))%24
        local Minute = math.floor(GameTime/(60^1))%60
        local Second = math.floor(GameTime/(60^0))%60
        local FormatTime = string.format("%02d.%02d.%02d", Hour, Minute, Second)
        ServerTimeFunc:Refresh("Game Time : " .. FormatTime)
    end

    spawn(function()
        while game:GetService('RunService').Heartbeat:Wait() do
            UpdateTime()
        end
    end)

    Server_ID.Name = "Server_ID"
    Server_ID.Parent = Body
    Server_ID.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Server_ID.BackgroundTransparency = 1.000
    Server_ID.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Server_ID.BorderSizePixel = 0
    Server_ID.Position = UDim2.new(0, 230, 0, 320)
    Server_ID.Size = UDim2.new(0, 365, 0, 25)
    Server_ID.Font = Enum.Font.SourceSansSemibold
    Server_ID.Text = "User : " .. NameID .. "     [CTRL = Hide Gui]";
    Server_ID.TextColor3 = Color3.fromRGB(255, 255, 255)
    Server_ID.TextSize = 14.000
    Server_ID.TextXAlignment = Enum.TextXAlignment.Right

    List_Tile.Name = "List_Tile"
    List_Tile.Parent = Body
    List_Tile.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    List_Tile.BorderColor3 = Color3.fromRGB(0, 0, 0)
    List_Tile.BorderSizePixel = 0
    List_Tile.Position = UDim2.new(0, 0, 0, 30)
    List_Tile.Size = UDim2.new(1, 0, 0, 2)

    Tile_Gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
        ColorSequenceKeypoint.new(0.3, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.7, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)),
    })
    Tile_Gradient.Name = "Tile_Gradient"
    Tile_Gradient.Parent = List_Tile

    Toggle.Name = "Toggle"
    Toggle.Parent = ScreenGui
    Toggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Toggle.BorderSizePixel = 0
    Toggle.Position = UDim2.new(0.0160791595, 0, 0.219451368, 0)
    Toggle.Size = UDim2.new(0, 40, 0, 40)

    toggle_corner.Name = "toggle_corner"
    toggle_corner.Parent = Toggle

    toggle_Image.Name = "toggle_Image"
    toggle_Image.Parent = Toggle
    toggle_Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    toggle_Image.BackgroundTransparency = 1.000
    toggle_Image.BorderColor3 = Color3.fromRGB(0, 0, 0)
    toggle_Image.BorderSizePixel = 0
    toggle_Image.Size = UDim2.new(0, 40, 0, 40)
    toggle_Image.Image = "http://www.roblox.com/asset/?id=6675147490"
    toggle_Image.ImageColor3 = Color3.fromRGB(255, 0, 0)

    local togimage = false
    toggle_Image.MouseEnter:Connect(function()
        utility:Tween(Toggle, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}, .15)
    end)

    toggle_Image.MouseLeave:Connect(function()
        utility:Tween(Toggle, {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}, .15)
    end)

    toggle_Image.MouseButton1Click:Connect(function()
        if togimage then
            Body.Visible = true
        else
            Body.Visible = false
        end
        togimage = not togimage;
    end)

    -- Scripts:
    local function HJUAU_fake_script() -- Body.BodyObject 
        local script = Instance.new('LocalScript', Body)
        
        local gui = script.Parent
        local dragging = false
        local dragInput, dragStart, startPos
        
        local function update(input)
            local delta = input.Position - dragStart
            gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
        
        gui.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = gui.Position
        
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)
        
        gui.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)
        
        UserInputService.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                update(input)
            end
        end)
    end
    coroutine.wrap(HJUAU_fake_script)()

    -- Instances:
    local Tab_Container = Instance.new("Frame")
    local Tab_List = Instance.new("Frame")
    local TabList_Gradient = Instance.new("UIGradient")
    local Tab_Scroll = Instance.new("ScrollingFrame")
    local Tab_Scroll_Layout = Instance.new("UIListLayout")
    local Main_Container = Instance.new("Frame")
    local Container = Instance.new("Folder")

    -- Properties:
    Tab_Container.Name = "Tab_Container"
    Tab_Container.Parent = Body
    Tab_Container.BackgroundColor3 = Color3.fromRGB(64, 64, 95)
    Tab_Container.BackgroundTransparency = 1.000
    Tab_Container.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Tab_Container.BorderSizePixel = 0
    Tab_Container.ClipsDescendants = true
    Tab_Container.Position = UDim2.new(0, 0, 0, 36)
    Tab_Container.Size = UDim2.new(1, 0, 0, 30)

    Tab_List.Name = "Tab_List"
    Tab_List.Parent = Tab_Container
    Tab_List.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Tab_List.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Tab_List.BorderSizePixel = 0
    Tab_List.Position = UDim2.new(0, 0, 0, 28)
    Tab_List.Size = UDim2.new(1, 0, 0, 2)

    TabList_Gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
        ColorSequenceKeypoint.new(0.3, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.7, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)),
    })
    TabList_Gradient.Name = "TabList_Gradient"
    TabList_Gradient.Parent = Tab_List

    Tab_Scroll.Name = "Tab_Scroll"
    Tab_Scroll.Parent = Tab_Container
    Tab_Scroll.Active = true
    Tab_Scroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Tab_Scroll.BackgroundTransparency = 1.000
    Tab_Scroll.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Tab_Scroll.BorderSizePixel = 0
    Tab_Scroll.Position = UDim2.new(0, 10, 0, 0)
    Tab_Scroll.Size = UDim2.new(1, -20, 0, 30)
    Tab_Scroll.CanvasPosition = Vector2.new(0, 150)
    Tab_Scroll.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
    Tab_Scroll.ScrollBarThickness = 0

    Tab_Scroll_Layout.Name = "Tab_Scroll_Layout"
    Tab_Scroll_Layout.Parent = Tab_Scroll
    Tab_Scroll_Layout.FillDirection = Enum.FillDirection.Horizontal
    Tab_Scroll_Layout.HorizontalAlignment = Enum.HorizontalAlignment.Left
    Tab_Scroll_Layout.VerticalAlignment = Enum.VerticalAlignment.Top
    Tab_Scroll_Layout.SortOrder = Enum.SortOrder.LayoutOrder
    Tab_Scroll_Layout.Padding = UDim.new(0, 5)

    Tab_Scroll_Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        Tab_Scroll.CanvasSize = UDim2.new(0, 0 + Tab_Scroll_Layout.Padding.Offset + Tab_Scroll_Layout.AbsoluteContentSize.X, 0, 0)
    end)

    Tab_Scroll.ChildAdded:Connect(function()
        Tab_Scroll.CanvasSize = UDim2.new(0, 0 + Tab_Scroll_Layout.Padding.Offset + Tab_Scroll_Layout.AbsoluteContentSize.X, 0, 0)
    end)

    Main_Container.Name = "Main_Container"
    Main_Container.Parent = Body
    Main_Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Main_Container.BackgroundTransparency = 1.000
    Main_Container.BorderSizePixel = 0
    Main_Container.Position = UDim2.new(0, 5, 0, 70)
    Main_Container.Size = UDim2.new(0, 590, 0, 245)

    local ContainerGradients = Instance.new("UIGradient")
    ContainerGradients.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 0, 0)),
        ColorSequenceKeypoint.new(0.3, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.7, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 0, 0)),
    })
    ContainerGradients.Name = "ContainerGradients"
    ContainerGradients.Parent = Main_Container

    Container.Name = "Container"
    Container.Parent = Main_Container


    local Tabs = {}
    local is_first_tab = true
    function Tabs:addTab(title_tab)

        -- Instances:
        local Tab_Items = Instance.new("TextButton")
        local Tab_Item_Corner = Instance.new("UICorner")

        -- Properties:
        Tab_Items.Name = "Tab_Items"
        Tab_Items.Parent = Tab_Scroll
        Tab_Items.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        Tab_Items.BackgroundTransparency = 1.000
        Tab_Items.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Tab_Items.BorderSizePixel = 0
        Tab_Items.Size = UDim2.new(0, 0, 0, 0)
        Tab_Items.AutoButtonColor = false
        Tab_Items.Font = Enum.Font.SourceSansSemibold
        Tab_Items.TextColor3 = Color3.fromRGB(255, 255, 255)
        Tab_Items.TextSize = 14.000
        Tab_Items.Text = title_tab

        Tab_Item_Corner.Name = "Tab_Item_Corner"
        Tab_Item_Corner.CornerRadius = UDim.new(0, 4)
        Tab_Item_Corner.Parent = Tab_Items

        utility:Tween(Tab_Items, {Size = UDim2.new(0, 25 + Tab_Items.TextBounds.X, 0, 24)}, .15)

        -- Instances:
        local ScrollingFrame = Instance.new("ScrollingFrame")
        local Scrolling_Layout = Instance.new("UIListLayout")

        -- Properties:
        ScrollingFrame.Name = "ScrollingFrame"
        ScrollingFrame.Parent = Container
        ScrollingFrame.Active = true
        ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ScrollingFrame.BackgroundTransparency = 1.000
        ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ScrollingFrame.BorderSizePixel = 0
        ScrollingFrame.Position = UDim2.new(0, 0, 0, 0)
        ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
        ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
        ScrollingFrame.ScrollBarThickness = 0
        ScrollingFrame.Visible = false

        Scrolling_Layout.Name = "Scrolling_Layout"
        Scrolling_Layout.Parent = ScrollingFrame
        Scrolling_Layout.FillDirection = Enum.FillDirection.Horizontal
        Scrolling_Layout.SortOrder = Enum.SortOrder.LayoutOrder
        Scrolling_Layout.Padding = UDim.new(0, 19)

        Scrolling_Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            ScrollingFrame.CanvasSize = UDim2.new(0, Scrolling_Layout.AbsoluteContentSize.X, 0, 0)
        end)
    
        ScrollingFrame.ChildAdded:Connect(function()
            ScrollingFrame.CanvasSize = UDim2.new(0, Scrolling_Layout.AbsoluteContentSize.X, 0, 0)
        end)

        if is_first_tab then
            is_first_tab = false
            utility:Tween(Tab_Items, {BackgroundTransparency = 0.5}, .3);
            ScrollingFrame.Visible = true
        end

        Tab_Items.MouseButton1Click:Connect(function()
            for _,v in next, Tab_Scroll:GetChildren() do
                if v:IsA("TextButton") then
                    utility:Tween(v, {BackgroundTransparency = 1.000}, .3);
                end;
            end;
            utility:Tween(Tab_Items, {BackgroundTransparency = 0.5}, .3);

            for _,v in next, Container:GetChildren() do
                if v.Name == "ScrollingFrame" then
                    v.Visible = false
                end;
            end;
            ScrollingFrame.Visible = true
        end)

        local Section = {}
        function Section:addSection()

            -- Instances:
            local SectionScroll = Instance.new("ScrollingFrame")
            local UIListLayout_Section = Instance.new("UIListLayout")

            -- Properties:
            SectionScroll.Name = "SectionScroll"
            SectionScroll.Parent = ScrollingFrame
            SectionScroll.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            SectionScroll.BackgroundTransparency = 1.000
            SectionScroll.BorderColor3 = Color3.fromRGB(0, 0, 0)
            SectionScroll.BorderSizePixel = 0
            SectionScroll.Size = UDim2.new(0, 285, 0, 245)
            SectionScroll.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 0)
            SectionScroll.ScrollBarThickness = 4

            UIListLayout_Section.Parent = SectionScroll
            UIListLayout_Section.HorizontalAlignment = Enum.HorizontalAlignment.Center
            UIListLayout_Section.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_Section.Padding = UDim.new(0, 6)

            UIListLayout_Section:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                SectionScroll.CanvasSize = UDim2.new(0, 0, 0, 5 + UIListLayout_Section.Padding.Offset + UIListLayout_Section.AbsoluteContentSize.Y)
            end)
            
            SectionScroll.ChildAdded:Connect(function()
                SectionScroll.CanvasSize = UDim2.new(0, 0, 0, 5 + UIListLayout_Section.Padding.Offset + UIListLayout_Section.AbsoluteContentSize.Y)
            end)

            local Menus = {}
            function Menus:addMenu(title_menu)

                -- Instances:
                local Section = Instance.new("Frame")
                local Section_Inner = Instance.new("Frame")
                local UIListLayout = Instance.new("UIListLayout")
                local UICorner = Instance.new("UICorner")
                local List = Instance.new("Frame")
                local UIGradient = Instance.new("UIGradient")
                local UIGradient_2 = Instance.new("UIGradient")
                local TextLabel = Instance.new("TextLabel")

                -- Properties:
                Section.Name = "Section" or title_menu
                Section.Parent = SectionScroll
                Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Section.BackgroundTransparency = 1.000
                Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Section.BorderSizePixel = 0
                Section.Size = UDim2.new(1, 0, 0, 25)

                Section_Inner.Name = "Section_Inner"
                Section_Inner.Parent = Section
                Section_Inner.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Section_Inner.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Section_Inner.BorderSizePixel = 0
                Section_Inner.Position = UDim2.new(0, 5, 0, 0)
                Section_Inner.Size = UDim2.new(1, -10, 0, 25)

                UIGradient_2.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
                    ColorSequenceKeypoint.new(0.3, Color3.fromRGB(20, 20, 20)),
                    ColorSequenceKeypoint.new(0.7, Color3.fromRGB(20, 20, 20)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)),
                })
                UIGradient_2.Parent = Section_Inner

                UIListLayout.Parent = Section_Inner
                UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout.Padding = UDim.new(0, 3)

                UICorner.CornerRadius = UDim.new(0, 4)
                UICorner.Parent = Section_Inner

                TextLabel.Parent = Section_Inner
                TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel.BackgroundTransparency = 1.000
                TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
                TextLabel.BorderSizePixel = 0
                TextLabel.Size = UDim2.new(1, 0, 0, 20)
                TextLabel.Font = Enum.Font.SourceSansSemibold
                TextLabel.Text = title_menu
                TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                TextLabel.TextSize = 14.000

                List.Name = "List"
                List.Parent = Section_Inner
                List.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                List.BorderColor3 = Color3.fromRGB(0, 0, 0)
                List.BorderSizePixel = 0
                List.Size = UDim2.new(1, 0, 0, 1)

                UIGradient.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 30)),
                    ColorSequenceKeypoint.new(0.3, Color3.fromRGB(255, 0, 0)),
                    ColorSequenceKeypoint.new(0.7, Color3.fromRGB(255, 0, 0)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 30)),
                })
                UIGradient.Parent = List

                Section.Size = UDim2.new(1, 0, 0, UIListLayout.AbsoluteContentSize.Y + UIListLayout.Padding.Offset + 5)
                Section_Inner.Size = UDim2.new(1, -10, 0, UIListLayout.AbsoluteContentSize.Y + UIListLayout.Padding.Offset + 5)
                UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                    Section.Size = UDim2.new(1, 0, 0, UIListLayout.AbsoluteContentSize.Y + UIListLayout.Padding.Offset + 5)
                    Section_Inner.Size = UDim2.new(1, -10, 0, UIListLayout.AbsoluteContentSize.Y + UIListLayout.Padding.Offset + 5)
                end)

                local function SectionScrollChanged()
                    local SCL = 0
                    SCL = UIListLayout.AbsoluteContentSize.Y
                    SectionScroll.CanvasSize = UDim2.new(0, 0, 0, SCL + UIListLayout.Padding.Offset + 5)
                end
                local function SectionInnerChanged()
                    Section.Size = UDim2.new(1, 0, 0, UIListLayout.AbsoluteContentSize.Y + UIListLayout.Padding.Offset + 5)
                    Section_Inner.Size = UDim2.new(1, -10, 0, UIListLayout.AbsoluteContentSize.Y + UIListLayout.Padding.Offset + 5)
                end

                SectionScrollChanged()
                SectionInnerChanged()
                
                local Menu_Item = {}
                function Menu_Item:addButton(button_tile, callback)

                    callback = callback or function () end

                    -- Instances:
                    local TextButton = Instance.new("TextButton")
                    local UICorner = Instance.new("UICorner")

                    -- Properties:
                    TextButton.Parent = Section_Inner
                    TextButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    TextButton.BorderSizePixel = 0
                    TextButton.Size = UDim2.new(1, -10, 0, 25)
                    TextButton.AutoButtonColor = false
                    TextButton.Font = Enum.Font.SourceSansSemibold
                    TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextButton.TextSize = 12.000
                    TextButton.Text = button_tile

                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = TextButton

                    TextButton.MouseEnter:Connect(function()
                        utility:Tween(TextButton, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}, .15)
                        utility:Tween(TextButton, {TextColor3 = Color3.fromRGB(180, 180, 180)}, .15)
                    end)

                    TextButton.MouseLeave:Connect(function()
                        utility:Tween(TextButton, {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}, .15)
                        utility:Tween(TextButton, {TextColor3 = Color3.fromRGB(255, 255, 255)}, .15)
                    end)

                    TextButton.MouseButton1Down:Connect(function()
                        utility:Tween(TextButton, {TextColor3 = Color3.fromRGB(0, 255, 0)}, .15)
                        utility:Tween(TextButton, {Size = UDim2.new(1, -25, 0, 15)}, .15)
                    end)

                    TextButton.MouseButton1Up:Connect(function()
                        utility:Tween(TextButton, {TextColor3 = Color3.fromRGB(255, 255, 255)}, 1)
                        utility:Tween(TextButton, {Size = UDim2.new(1, -10, 0, 25)}, .15)
                    end)

                    TextButton.MouseButton1Click:Connect(function()
                        callback()
                    end)
                end

                function Menu_Item:addToggle(toggle_title, default, callback)

                    callback = callback or function(Value) end
                    default = default or false

                    -- Instances:
                    local Frame = Instance.new("Frame")
                    local TextLabel = Instance.new("TextLabel")
                    local ImageButton = Instance.new("ImageButton")
                    local UICorner = Instance.new("UICorner")

                    -- Properties:
                    Frame.Parent = Section_Inner
                    Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    Frame.BorderSizePixel = 0
                    Frame.Size = UDim2.new(1, -10, 0, 25)

                    TextLabel.Parent = Frame
                    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.BackgroundTransparency = 1.000
                    TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    TextLabel.BorderSizePixel = 0
                    TextLabel.Position = UDim2.new(0, 5, 0, 0)
                    TextLabel.Size = UDim2.new(1, -30, 0, 25)
                    TextLabel.Font = Enum.Font.SourceSansSemibold
                    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.TextSize = 12.000
                    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
                    TextLabel.Text = toggle_title

                    ImageButton.Parent = Frame
                    ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ImageButton.BackgroundTransparency = 1.000
                    ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    ImageButton.BorderSizePixel = 0
                    ImageButton.Position = UDim2.new(0, 242, 0, 2)
                    ImageButton.Size = UDim2.new(0, 20, 0, 20)
                    ImageButton.Image = "rbxassetid://3926311105"
                    ImageButton.ImageRectOffset = Vector2.new(940, 784)
                    ImageButton.ImageRectSize = Vector2.new(48, 48)

                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = Frame

                    local CheckToggle = false
                    if default then
                        ImageButton.ImageRectOffset = Vector2.new(4, 836);
                        ImageButton.ImageColor3 = Color3.fromRGB(0, 255, 0);
                        TextLabel.TextColor3 = Color3.fromRGB(0, 255, 0);
                        CheckToggle = not CheckToggle;
                        callback(CheckToggle);
                    end

                    ImageButton.MouseEnter:Connect(function ()
                        utility:Tween(TextLabel, {TextTransparency = 0.5}, .15)
                        utility:Tween(ImageButton, {ImageTransparency = 0.5}, .15)
                        utility:Tween(Frame, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}, .15);
                    end);
    
                    ImageButton.MouseLeave:Connect(function ()
                        utility:Tween(TextLabel, {TextTransparency = 0}, .15)
                        utility:Tween(ImageButton, {ImageTransparency = 0}, .15)
                        utility:Tween(Frame, {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}, .15);
                    end);

                    ImageButton.MouseButton1Click:Connect(function ()
                        if not CheckToggle then
                            ImageButton.ImageRectOffset = Vector2.new(4, 836);
                            utility:Tween(ImageButton, {ImageColor3 = Color3.fromRGB(0, 255, 0)}, .3);
                            utility:Tween(TextLabel, {TextColor3 = Color3.fromRGB(0, 255, 0)}, .3);
                        else
                            ImageButton.ImageRectOffset = Vector2.new(940, 784);
                            utility:Tween(ImageButton, {ImageColor3 = Color3.fromRGB(255, 255, 255)}, .3);
                            utility:Tween(TextLabel, {TextColor3 = Color3.fromRGB(255, 255, 255)}, .3);
                        end;
                        CheckToggle = not CheckToggle;
                        callback(CheckToggle);
                    end)
                end

                function Menu_Item:addDropdown(dropdown_tile, default, list, callback)
                    default = default or ""
                    list = list or {}
                    callback = callback or function(Value) end

                    -- Instances:
                    local Frame = Instance.new("Frame")
                    local UICorner = Instance.new("UICorner")
                    local TextLabel = Instance.new("TextLabel")
                    local ImageButton = Instance.new("ImageButton")

                    -- Properties:
                    Frame.Parent = Section_Inner
                    Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    Frame.BorderSizePixel = 0
                    Frame.Size = UDim2.new(1, -10, 0, 25)

                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = Frame

                    TextLabel.Parent = Frame
                    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.BackgroundTransparency = 1.000
                    TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    TextLabel.BorderSizePixel = 0
                    TextLabel.Position = UDim2.new(0, 5, 0, 0)
                    TextLabel.Size = UDim2.new(1, -40, 0, 25)
                    TextLabel.Font = Enum.Font.SourceSansSemibold
                    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.TextSize = 12.000
                    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
                    TextLabel.Text = dropdown_tile

                    ImageButton.Parent = Frame
                    ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ImageButton.BackgroundTransparency = 1.000
                    ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    ImageButton.BorderSizePixel = 0
                    ImageButton.Position = UDim2.new(0, 242, 0, 1)
                    ImageButton.Size = UDim2.new(0, 21, 0, 22)
                    ImageButton.Image = "rbxassetid://14834203285"

                    if default then
                        for i,v in pairs(list) do
                            if v == default then
                                TextLabel.Text = dropdown_tile  ..' - ' .. v
                                callback(v)
                            end
                        end
                    end

                    ImageButton.MouseEnter:Connect(function ()
                        utility:Tween(TextLabel, {TextTransparency = 0.5}, .15)
                        utility:Tween(ImageButton, {ImageTransparency = 0.5}, .15)
                        utility:Tween(Frame, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}, .15);
                    end);
    
                    ImageButton.MouseLeave:Connect(function ()
                        utility:Tween(TextLabel, {TextTransparency = 0}, .15)
                        utility:Tween(ImageButton, {ImageTransparency = 0}, .15)
                        utility:Tween(Frame, {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}, .15);
                    end);

                    -- Instances:
                    local ScrollDown = Instance.new("Frame")
                    local UIListLayout = Instance.new("UIListLayout")
                    local UICorner = Instance.new("UICorner")

                    -- Properties:
                    ScrollDown.Name = "ScrollDown"
                    ScrollDown.Parent = Section_Inner
                    ScrollDown.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    ScrollDown.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    ScrollDown.BorderSizePixel = 0
                    ScrollDown.ClipsDescendants = true
                    ScrollDown.Size = UDim2.new(1, -10, 0, 0)

                    UIListLayout.Parent = ScrollDown
                    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
                    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                    UIListLayout.Padding = UDim.new(0, 3)

                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = ScrollDown

                    local dropdown_toggle = false
                    ImageButton.MouseButton1Click:Connect(function()
                        if dropdown_toggle then
                            utility:Tween(ScrollDown, {Size = UDim2.new(1, -10, 0, 0)}, 0.15)
                            utility:Tween(ImageButton, {ImageColor3 = Color3.fromRGB(255, 255, 255)}, .15)
                            utility:Tween(TextLabel, {TextColor3 = Color3.fromRGB(255, 255, 255)}, .15)
                        else
                            utility:Tween(ScrollDown, {Size = UDim2.new(1, -10, 0, 0 + UIListLayout.AbsoluteContentSize.Y + 5)}, 0.15)
                            utility:Tween(ImageButton, {ImageColor3 = Color3.fromRGB(0, 255, 0)}, .15)
                            utility:Tween(TextLabel, {TextColor3 = Color3.fromRGB(0, 255, 0)}, .15)
                        end
                        dropdown_toggle = not dropdown_toggle
                    end)

                    for i,v in pairs(list) do
                        local TextButton = Instance.new('TextButton')

                        TextButton.Parent = ScrollDown
                        TextButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                        TextButton.BackgroundTransparency = 1.000
                        TextButton.BorderSizePixel = 0
                        TextButton.Size = UDim2.new(1, 0, 0, 25)
                        TextButton.Position = UDim2.new(0, 5, 0, 0)
                        TextButton.Font = Enum.Font.SourceSansSemibold
                        TextButton.AutoButtonColor = false
                        TextButton.TextSize = 12.000
                        TextButton.Text = v
                        TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    
                        TextButton.MouseEnter:Connect(function()
                            utility:Tween(TextButton, {TextSize = 9.000}, 0.15)
                            utility:Tween(TextButton, {TextColor3 = Color3.fromRGB(0, 255, 0)}, 0.15)
                        end)
    
                        TextButton.MouseLeave:Connect(function()
                            utility:Tween(TextButton, {TextSize = 12.000}, 0.15)
                            utility:Tween(TextButton, {TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.15)
                        end)
    
                        TextButton.MouseButton1Click:Connect(function()
                            dropdown_toggle = false
                            TextLabel.Text = dropdown_tile  ..' - ' .. v
                            callback(v)
                            utility:Tween(ScrollDown, {Size = UDim2.new(1, -10, 0, 0)}, 0.15)
                            utility:Tween(ImageButton, {ImageColor3 = Color3.fromRGB(255, 255, 255)}, .15)
                            utility:Tween(TextLabel, {TextColor3 = Color3.fromRGB(255, 255, 255)}, .15)
                        end)
                    end

                    local updatedropfunc = {}
                    function updatedropfunc:Clear()
                        for i,v in pairs(ScrollDown:GetChildren()) do
                            if v:IsA("TextButton") then
                                v:Destroy()
                                dropdown_toggle = false
                                TextLabel.Text = dropdown_tile
                                callback(v)
                                utility:Tween(ScrollDown, {Size = UDim2.new(1, -10, 0, 0)}, 0.15)
                            end
                        end
                    end

                    function updatedropfunc:Refresh(newlist)
                        newlist = newlist or {}

                        for i,v in pairs(newlist) do
                            local TextButton = Instance.new('TextButton')
    
                            TextButton.Parent = ScrollDown
                            TextButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                            TextButton.BackgroundTransparency = 1.000
                            TextButton.BorderSizePixel = 0
                            TextButton.Size = UDim2.new(1, 0, 0, 25)
                            TextButton.Position = UDim2.new(0, 5, 0, 0)
                            TextButton.Font = Enum.Font.SourceSansSemibold
                            TextButton.AutoButtonColor = false
                            TextButton.TextSize = 12.000
                            TextButton.Text = v
                            TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        
                            TextButton.MouseEnter:Connect(function()
                                utility:Tween(TextButton, {TextSize = 9.000}, 0.15)
                                utility:Tween(TextButton, {TextColor3 = Color3.fromRGB(0, 255, 0)}, 0.15)
                            end)
        
                            TextButton.MouseLeave:Connect(function()
                                utility:Tween(TextButton, {TextSize = 12.000}, 0.15)
                                utility:Tween(TextButton, {TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.15)
                            end)
        
                            TextButton.MouseButton1Click:Connect(function()
                                dropdown_toggle = false
                                TextLabel.Text = dropdown_tile  ..' - ' .. v
                                callback(v)
                                utility:Tween(ScrollDown, {Size = UDim2.new(1, -10, 0, 0)}, 0.15)
                                utility:Tween(ImageButton, {ImageColor3 = Color3.fromRGB(255, 255, 255)}, .15)
                                utility:Tween(TextLabel, {TextColor3 = Color3.fromRGB(255, 255, 255)}, .15)
                            end)
                        end
                    end
                    return updatedropfunc
                end

                function Menu_Item:addTextbox(text_tile, default, callback)

                    callback = callback or function(Value) end
                    
                    -- Instances:
                    local Frame = Instance.new("Frame")
                    local UICorner = Instance.new("UICorner")
                    local TextLabel = Instance.new("TextLabel")
                    local TextBox = Instance.new("TextBox")

                    -- Properties:
                    Frame.Parent = Section_Inner
                    Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    Frame.BorderSizePixel = 0
                    Frame.Size = UDim2.new(1, -10, 0, 25)

                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = Frame

                    TextLabel.Parent = Frame
                    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.BackgroundTransparency = 1.000
                    TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    TextLabel.BorderSizePixel = 0
                    TextLabel.Position = UDim2.new(0, 5, 0, 0)
                    TextLabel.Size = UDim2.new(0, 150, 0, 25)
                    TextLabel.Font = Enum.Font.SourceSansSemibold
                    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.TextSize = 12.000
                    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
                    TextLabel.Text = text_tile

                    TextBox.Parent = Frame
                    TextBox.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
                    TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    TextBox.BorderSizePixel = 0
                    TextBox.Position = UDim2.new(0, 190, 0, 2)
                    TextBox.Size = UDim2.new(0, 70, 0, 20)
                    TextBox.Font = Enum.Font.SourceSansSemibold
                    TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextBox.TextSize = 12.000
                    TextBox.Text = default or "Type Here"

                    local function onFocusLost(enterPressed, default)
                        if enterPressed then
                            callback(TextBox.Text)
                            utility:Tween(TextBox, {TextColor3 = Color3.fromRGB(0, 255, 0)}, .1);
                            utility:Tween(TextLabel, {TextColor3 = Color3.fromRGB(0, 255, 0)}, .1);
                            wait(.1);
                            utility:Tween(TextBox, {TextColor3 = Color3.fromRGB(255, 255, 255)}, .5);
                            utility:Tween(TextLabel, {TextColor3 = Color3.fromRGB(255, 255, 255)}, .5);
                        end;
                    end;
                    TextBox.FocusLost:Connect(onFocusLost);
                end

                function Menu_Item:CreateSlider(name,min,max,callback)
                    callback = callback or function(Value) end;
                    name = name or "Slider"
                    min = min or 16
                    max = max or 100
                    local library4 = {}
                    library4["Value"] = nil
                    local Slider = Instance.new("Frame")
                    local UICorner_17 = Instance.new("UICorner")
                    local Title_4 = Instance.new("TextLabel")
                    local Tracker = Instance.new("Frame")
                    local Indicator_3 = Instance.new("Frame")
                    local TextButton_2 = Instance.new("TextButton")
                    local UICorner_18 = Instance.new("UICorner")
                    local Fade = Instance.new("Frame")
                    local UICorner_19 = Instance.new("UICorner")
                    local Value = Instance.new("Frame")
                    local UICorner_20 = Instance.new("UICorner")
                    local ValueText = Instance.new("TextLabel")
                    local Shadow_1 = Instance.new("ImageLabel")
                    local Shadow_2 = Instance.new("ImageLabel")
    
                    Slider.Name = "Slider"
                    Slider.Parent = SectionContainer
                    Slider.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
                    Slider.Size = UDim2.new(1, 0, 0, 40)
    
                    UICorner_17.CornerRadius = UDim.new(0, 4)
                    UICorner_17.Parent = Slider
    
                    Title_4.Name = "Title"
                    Title_4.Parent = Slider
                    Title_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Title_4.BackgroundTransparency = 1.000
                    Title_4.Position = UDim2.new(0, 7, 0, 0)
                    Title_4.Size = UDim2.new(1, -7, 0, 30)
                    Title_4.Font = Enum.Font.GothamBlack
                    Title_4.Text = name
                    Title_4.TextColor3 = Color3.fromRGB(255, 255, 255)
                    Title_4.TextSize = 12.000
                    Title_4.TextXAlignment = Enum.TextXAlignment.Left
    
                    Tracker.Name = "Tracker"
                    Tracker.Parent = Slider
                    Tracker.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
                    Tracker.BorderSizePixel = 0
                    Tracker.Position = UDim2.new(0, 7, 1, -10)
                    Tracker.Size = UDim2.new(1, -14, 0, 2)
    
                    Indicator_3.Name = "Indicator"
                    Indicator_3.Parent = Tracker
                    Indicator_3.BackgroundColor3 = Color3.fromRGB(135, 255, 135)
                    Indicator_3.BorderSizePixel = 0
                    Indicator_3.Size = UDim2.new(0, 0, 1, 0)
    
                    Shadow_1.Name = "Shadow_1"
                    Shadow_1.Parent = Indicator_3
                    Shadow_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Shadow_1.BackgroundTransparency = 1.000
                    Shadow_1.Position = UDim2.new(0, -15, 0, -15)
                    Shadow_1.Selectable = true
                    Shadow_1.Size = UDim2.new(1, 30, 1, 30)
                    Shadow_1.Image = "http://www.roblox.com/asset/?id=5761504593"
                    Shadow_1.ImageColor3 = Color3.fromRGB(135, 255, 135)
                    Shadow_1.ImageTransparency = 1
                    Shadow_1.ScaleType = Enum.ScaleType.Slice
                    Shadow_1.SliceCenter = Rect.new(17, 17, 283, 283)
    
                    TextButton_2.Parent = Indicator_3
                    TextButton_2.BackgroundColor3 = Color3.fromRGB(135, 255, 135)
                    TextButton_2.Position = UDim2.new(1, -4, 0.5, -4)
                    TextButton_2.Size = UDim2.new(0, 8, 0, 8)
                    TextButton_2.Font = Enum.Font.SourceSans
                    TextButton_2.Text = ""
                    TextButton_2.TextColor3 = Color3.fromRGB(0, 0, 0)
                    TextButton_2.TextSize = 14.000
    
                    Shadow_2.Name = "Shadow_2"
                    Shadow_2.Parent = TextButton_2
                    Shadow_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Shadow_2.BackgroundTransparency = 1.000
                    Shadow_2.Position = UDim2.new(0, -15, 0, -15)
                    Shadow_2.Selectable = true
                    Shadow_2.Size = UDim2.new(1, 30, 1, 30)
                    Shadow_2.Image = "http://www.roblox.com/asset/?id=5761504593"
                    Shadow_2.ImageColor3 = Color3.fromRGB(135, 255, 135)
                    Shadow_2.ImageTransparency = 1
                    Shadow_2.ScaleType = Enum.ScaleType.Slice
                    Shadow_2.SliceCenter = Rect.new(17, 17, 283, 283)
    
                    UICorner_18.CornerRadius = UDim.new(0.5, 0)
                    UICorner_18.Parent = TextButton_2
    
                    Fade.Name = "Fade"
                    Fade.Parent = TextButton_2
                    Fade.BackgroundColor3 = Color3.fromRGB(135, 255, 135)
                    Fade.BackgroundTransparency = 1.000
                    Fade.Position = UDim2.new(-0.5, 0, -0.5, 0)
                    Fade.Size = UDim2.new(2, 0, 2, 0)
    
                    UICorner_19.CornerRadius = UDim.new(0.5, 0)
                    UICorner_19.Parent = Fade
    
                    Value.Name = "Value"
                    Value.Parent = Slider
                    Value.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                    Value.BackgroundTransparency = 0.830
                    Value.Position = UDim2.new(1, -47, 0, 4)
                    Value.Size = UDim2.new(0, 43, 0, 22)
    
                    UICorner_20.CornerRadius = UDim.new(0, 4)
                    UICorner_20.Parent = Value
    
                    ValueText.Name = "ValueText"
                    ValueText.Parent = Value
                    ValueText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ValueText.BackgroundTransparency = 1.000
                    ValueText.BorderColor3 = Color3.fromRGB(27, 42, 53)
                    ValueText.Size = UDim2.new(1, 0, 1, 0)
                    ValueText.Font = Enum.Font.Gotham
                    ValueText.Text = min
                    ValueText.TextColor3 = Color3.fromRGB(227, 225, 228)
                    ValueText.TextSize = 12.000

                    local value
                    local dragging
                    local SliderBar = Tracker
                    local Sliderbutton = TextButton_2
                    local Slider_2 = Indicator_3
                    local mr = math.round
                    function library4:SetValue(input)
                        local pos = UDim2.new(math.clamp((input.Position.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1), 0, 0, (SliderBar.AbsoluteSize.Y))
                        Slider_2:TweenSize(pos, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
                        local value = math.floor(( ((pos.X.Scale * max) / max) * (max - min) + min ) * 100) / 100
                        ValueText.Text = tostring(mr(value))
                        library4["Value"] = value
                        spawn(function() callback(value) wait() ValueText.Text = mr(value) end)
                    end;
    
                    Sliderbutton.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = true
                            TS:Create(Fade,TweenInfo.new(.1),{BackgroundTransparency=0.8}):Play()
                            TS:Create(Shadow_1,TweenInfo.new(.1),{ImageTransparency=0.7}):Play()
                            TS:Create(Shadow_2,TweenInfo.new(.1),{ImageTransparency=0.7}):Play()
                        end
                    end)
    
                    Sliderbutton.InputEnded:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = false
                            TS:Create(Fade,TweenInfo.new(.1),{BackgroundTransparency=1}):Play()
                            TS:Create(Shadow_1,TweenInfo.new(.1),{ImageTransparency=1}):Play()
                            TS:Create(Shadow_2,TweenInfo.new(.1),{ImageTransparency=1}):Play()
                        end
                    end)
    
                    Sliderbutton.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            library4:SetValue(input)
                        end
                    end)
    
                    game:GetService("UserInputService").InputChanged:Connect(function(input)
                        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                            library4:SetValue(input)
                        end
                    end)
                    return library4	
                end

                function Menu_Item:addKeybind(keybind_tile, preset, callback)

                    callback = callback or function(Value) end;

                    -- Instances:
                    local Frame = Instance.new("Frame")
                    local UICorner = Instance.new("UICorner")
                    local TextLabel = Instance.new("TextLabel")
                    local TextButton = Instance.new("TextButton")
                    local UICorner_2 = Instance.new("UICorner")

                    -- Properties:
                    Frame.Parent = Section_Inner
                    Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    Frame.BorderSizePixel = 0
                    Frame.Size = UDim2.new(1, -10, 0, 25)

                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = Frame

                    TextLabel.Parent = Frame
                    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.BackgroundTransparency = 1.000
                    TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    TextLabel.BorderSizePixel = 0
                    TextLabel.Position = UDim2.new(0, 5, 0, 0)
                    TextLabel.Size = UDim2.new(0, 150, 0, 25)
                    TextLabel.Font = Enum.Font.SourceSansSemibold
                    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.TextSize = 12.000
                    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
                    TextLabel.Text = keybind_tile

                    TextButton.Parent = Frame
                    TextButton.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
                    TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    TextButton.BorderSizePixel = 0
                    TextButton.Position = UDim2.new(0, 190, 0, 3)
                    TextButton.Size = UDim2.new(0, 70, 0, 20)
                    TextButton.AutoButtonColor = false
                    TextButton.Font = Enum.Font.SourceSansSemibold
                    TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextButton.TextSize = 14.000
                    TextButton.Text = preset.Name

                    UICorner_2.CornerRadius = UDim.new(0, 4)
                    UICorner_2.Parent = TextButton

                    TextButton.MouseButton1Click:Connect(function()
                        TextButton.Text = ". . .";
                        local inputwait = UserInputService.InputBegan:wait();
                        if inputwait.KeyCode.Name == preset.Name then
                            TextButton.Text = inputwait.KeyCode.Name;
                            Key = inputwait.KeyCode.Name;
                            callback(Key);
                            utility:Tween(TextButton, {TextColor3 = Color3.fromRGB(0, 255, 0)}, .1);
                            utility:Tween(TextLabel, {TextColor3 = Color3.fromRGB(0, 255, 0)}, .1);
                            wait(.1);
                            utility:Tween(TextButton, {TextColor3 = Color3.fromRGB(255, 255, 255)}, 1);
                            utility:Tween(TextLabel, {TextColor3 = Color3.fromRGB(255, 255, 255)}, 1);
                        else
                            TextButton.Text = "Invald...";
                            Key = inputwait.KeyCode.Name;
                            callback();
                            utility:Tween(TextButton, {TextColor3 = Color3.fromRGB(255, 0, 0)}, .1);
                            utility:Tween(TextLabel, {TextColor3 = Color3.fromRGB(255, 0, 0)}, .1);
                            wait(.1);
                            utility:Tween(TextButton, {TextColor3 = Color3.fromRGB(255, 255, 255)}, 1);
                            utility:Tween(TextLabel, {TextColor3 = Color3.fromRGB(255, 255, 255)}, 1);
                        end;
                    end)
                end

                function Menu_Item:addLabel(label_text)

                    local LabelFunc = {}
                    local TextLabel = Instance.new("TextLabel")

                    -- Properties:
                    TextLabel.Parent = Section_Inner
                    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.BackgroundTransparency = 1.000
                    TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    TextLabel.BorderSizePixel = 0
                    TextLabel.Size = UDim2.new(1, -20, 0, 15)
                    TextLabel.Font = Enum.Font.SourceSansSemibold
                    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.TextSize = 12.000
                    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
                    TextLabel.Text = label_text

                    function LabelFunc:Refresh(newLabel)
                        if TextLabel.Text ~= newLabel then
                            TextLabel.Text = newLabel;
                        end;
                    end;
                    return LabelFunc;
                end
                
                function Menu_Item:addChangelog(changeloogtext)

                    local ChangelogFunc = {}
                    local TextLabel = Instance.new("TextLabel")

                    -- Properties:
                    TextLabel.Parent = Section_Inner
                    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.BackgroundTransparency = 1.000
                    TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    TextLabel.BorderSizePixel = 0
                    TextLabel.Size = UDim2.new(1, -20, 0, 15)
                    TextLabel.Font = Enum.Font.SourceSansSemibold
                    TextLabel.TextColor3 = Color3.fromRGB(85, 170, 255)
                    TextLabel.TextSize = 12.000
                    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
                    TextLabel.Text = changeloogtext

                    function ChangelogFunc:Refresh(newchangelog)
                        if TextLabel.Text ~= newchangelog then
                            TextLabel.Text = newchangelog;
                        end;
                    end;
                    return ChangelogFunc;
                end

                function Menu_Item:addLog(log_text)

                    local LogFunc = {}
                    local TextLabel = Instance.new("TextLabel")

                    -- Properties:
                    TextLabel.Parent = Section_Inner
                    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.BackgroundTransparency = 1.000
                    TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    TextLabel.BorderSizePixel = 0
                    TextLabel.Font = Enum.Font.SourceSansSemibold
                    TextLabel.Text = log_text
                    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
                    TextLabel.TextSize = 12.000
                    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
                    TextLabel.TextYAlignment = Enum.TextYAlignment.Top

                    TextLabel.Size = UDim2.new(1, -20, 0, TextLabel.Text:len() + 15)
                    TextLabel:GetPropertyChangedSignal("Text"):Connect(function()
                        TextLabel.Size = UDim2.new(1, -20, 0, TextLabel.Text:len() + 15)
                    end)

                    function LogFunc:Refresh(newLog)
                        if TextLabel.Text ~= newLog then
                            TextLabel.Text = newLog
                        end
                    end
                    return LogFunc
                end
                return Menu_Item
            end
            return Menus
        end
        return Section
    end
    return Tabs
end
return Library
