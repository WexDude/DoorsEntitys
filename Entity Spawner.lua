local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Plamen6789rock's Roblox DOORS GUI", "GrapeTheme")

-- DEFAULT ENTITIES
local Tab = Window:NewTab("Regular Entities")
local Section = Tab:NewSection("Regular Entites")


Section:NewButton("Halt", "Summons Halt.", function()
 require(game.ReplicatedStorage.ClientModules.EntityModules.Shade).stuff(require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game), workspace.CurrentRooms[game.Players.LocalPlayer:GetAttribute("CurrentRoom")])
end)

Section:NewButton("Screech", "Summons Screech.", function()
 require(game.StarterGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.Screech)(require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game), workspace.CurrentRooms[game.Players.LocalPlayer:GetAttribute("CurrentRoom")])
end)

Section:NewButton("Closet Jack", "Summons Closet Jack.", function()
 local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom
local config={
 Image="http://www.roblox.com/asset/?id=11388995838", -- Could also be "image.png"
 Sound="rbxassetid://11350126934", -- Could also be "file.mp3"
 EntityName="Jack" -- Make sure to change if you mod the image/sound to prevent overlapping
}
local ReSt = game:GetService("ReplicatedStorage")

local ModuleScripts = {
    ModuleEvents = require(ReSt.ClientModules.Module_Events),
}

local function connectClosetJack(wardrobes, room, bool)
    for _, wardrobe in pairs(wardrobes) do
        if not game:GetService("ReplicatedStorage"):FindFirstChild("closetAnim") then 
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://9460435404"
            anim.Name="closetAnim"
            anim.Parent=game:GetService("ReplicatedStorage")
        end
        if not game:GetService("ReplicatedStorage"):FindFirstChild("JackModel") then
            if not isfile(config.EntityName..".txt") then writefile(config.EntityName..".txt", game:HttpGet("https://github.com/sponguss/storage/raw/real/realisticClosetJack.rbxm?raw=true")) end
            local a=game:GetObjects((getcustomasset or getsynasset)(config.EntityName..".txt"))[1]
            a.Name="JackModel"
            a.Parent=game:GetService("ReplicatedStorage")
        end
        game:GetService("ReplicatedStorage").JackModel.Sound.SoundId=(isfile(config.Sound) and (getcustomasset or getsynasset)(config.Sound) or config.Sound)
        game:GetService("ReplicatedStorage").JackModel.Root.Beam.Texture=(isfile(config.Image) and (getcustomasset or getsynasset)(config.Image) or config.Image)
        local prompt = wardrobe:WaitForChild("HidePrompt", 1)
        if not prompt and wardrobe:FindFirstChild("fakePrompt") then return end
    
        if prompt then
            -- Fake prompt
    
            local fakePrompt = prompt:Clone()
            
            if bool then prompt:Destroy() else prompt.Enabled=false end
            fakePrompt.Parent = wardrobe
            fakePrompt.Name="fakePrompt"
            
            local connection; connection = fakePrompt.Triggered:Connect(function()
                if not bool then connection:Disconnect() end
                local model=game:GetService("ReplicatedStorage").JackModel:Clone()
    
                if model and not wardrobe:FindFirstChild(model.Name) then
                    model:SetPrimaryPartCFrame(wardrobe.Main.CFrame)
                    model.Parent = workspace
    
                    -- Animation setup
                    local anim = wardrobe.AnimationController:LoadAnimation(game:GetService("ReplicatedStorage").closetAnim)
    
                    -- Scare
                    
                    ModuleScripts.ModuleEvents.flickerLights(room, 1.664)
                    anim:Play()
                    model.Sound:Play()
    
                    -- Destroy
    
                    task.wait(1)
                    
                    model:Destroy()
                    if not bool then prompt.Enabled = true end
                    if not bool then fakePrompt:Destroy() end
    
                    if not bool then connection:Disconnect() end
                end
            end)
        end
    end
end

local wardrobes = {}
for _, wardrobe in pairs(workspace.CurrentRooms[LatestRoom.Value].Assets:GetChildren()) do
 if wardrobe.Name=="Wardrobe" then
 table.insert(wardrobes, wardrobe)
 end
end

if wardrobes[1] then
 connectClosetJack(wardrobes, workspace.CurrentRooms[LatestRoom.Value], false) -- 'true' for jack to appear every time
end
end)

Section:NewButton("Closet Jack [Infinitely]", "Summons Closet Jack in closets for the entire game.", function()
 local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom
local config={
 Image="http://www.roblox.com/asset/?id=11388995838", -- Could also be "image.png"
 Sound="rbxassetid://11350126934", -- Could also be "file.mp3"
 EntityName="Jack" -- Make sure to change if you mod the image/sound to prevent overlapping
}
local ReSt = game:GetService("ReplicatedStorage")

local ModuleScripts = {
 ModuleEvents = require(ReSt.ClientModules.Module_Events),
}

local function connectClosetJack(wardrobes, room, bool)
 for _, wardrobe in pairs(wardrobes) do
 if not game:GetService("ReplicatedStorage"):FindFirstChild("closetAnim") then 
 local anim = Instance.new("Animation")
 anim.AnimationId = "rbxassetid://9460435404"
 anim.Name="closetAnim"
 anim.Parent=game:GetService("ReplicatedStorage")
        end
 if not game:GetService("ReplicatedStorage"):FindFirstChild("JackModel") then
 if not isfile(config.EntityName..".txt") then writefile(config.EntityName..".txt", game:HttpGet("https://github.com/sponguss/storage/raw/real/realisticClosetJack.rbxm?raw=true")) end
 local a=game:GetObjects((getcustomasset or getsynasset)(config.EntityName..".txt"))[1]
 a.Name="JackModel"
 a.Parent=game:GetService("ReplicatedStorage")
        end
 game:GetService("ReplicatedStorage").JackModel.Sound.SoundId=(isfile(config.Sound) and (getcustomasset or getsynasset)(config.Sound) or config.Sound)
 game:GetService("ReplicatedStorage").JackModel.Root.Beam.Texture=(isfile(config.Image) and (getcustomasset or getsynasset)(config.Image) or config.Image)
 local prompt = wardrobe:WaitForChild("HidePrompt", 1)
 if not prompt and wardrobe:FindFirstChild("fakePrompt") then return end
    
 if prompt then
 -- Fake prompt
    
            local fakePrompt = prompt:Clone()
            
            if bool then prompt:Destroy() else prompt.Enabled=false end
            fakePrompt.Parent = wardrobe
            fakePrompt.Name="fakePrompt"
            
            local connection; connection = fakePrompt.Triggered:Connect(function()
                if not bool then connection:Disconnect() end
                local model=game:GetService("ReplicatedStorage").JackModel:Clone()
    
                if model and not wardrobe:FindFirstChild(model.Name) then
                    model:SetPrimaryPartCFrame(wardrobe.Main.CFrame)
                    model.Parent = workspace
    
                    -- Animation setup
                    local anim = wardrobe.AnimationController:LoadAnimation(game:GetService("ReplicatedStorage").closetAnim)
    
                    -- Scare
                    
                    ModuleScripts.ModuleEvents.flickerLights(room, 1.664)
                    anim:Play()
                    model.Sound:Play()
    
                    -- Destroy
    
                    task.wait(1)
                    
                    model:Destroy()
                    if not bool then prompt.Enabled = true end
                    if not bool then fakePrompt:Destroy() end
    
                    if not bool then connection:Disconnect() end
                end
            end)
        end
    end
end

local wardrobes = {}
for _, wardrobe in pairs(workspace.CurrentRooms[LatestRoom.Value].Assets:GetChildren()) do
    if wardrobe.Name=="Wardrobe" then
        table.insert(wardrobes, wardrobe)
    end
end

if wardrobes[1] then
    connectClosetJack(wardrobes, workspace.CurrentRooms[LatestRoom.Value], true) -- 'true' for jack to appear every time
end
end)

Section:NewButton("Eyes", "Summons Eyes.", function()
    local enableDamage = false

    local currentLoadedRoom=workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value]
    local eyes=game:GetObjects("rbxassetid://11388969546")[1]
    
    if eyes then end
    game.Workspace.CurrentRooms.ChildAdded:Connect(function()
        game.Workspace:FindFirstChild("Eyes"):Destroy()
        enableDamage = false
    end)
    local num=math.floor(#currentLoadedRoom.Nodes:GetChildren()/2)
    eyes.CFrame=(
        num==0 and currentLoadedRoom.Base or currentLoadedRoom.Nodes[num]
    ).CFrame+Vector3.new(0,7,0)
    
    eyes.Parent=workspace
    eyes.Ambience:Play()
    task.wait(.5)
    eyes.Attachment.Eyes.Enabled=true
    
    local hum=game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    while true and enableDamage do
        local _,found=workspace.CurrentCamera:WorldToScreenPoint(eyes.Position)
        if found then
            hum.Health-=10
            eyes.Attack:Play()
            if hum.Health<=0 then
                game:GetService("ReplicatedStorage").GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "Eyes"
                debug.setupvalue(getconnections(game:GetService("ReplicatedStorage").Bricks.DeathHint.OnClientEvent)[1].Function, 1, {
                    "You died to the Eyes...", "They don't like to be stared at."
                })
            end
        end
        task.wait(.1)
    end
end)

Section:NewButton("Eyes [Deals Damage]", "Summons Eyes which deals damage when being stared at.", function()
    local enableDamage = true

    local currentLoadedRoom=workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value]
    local eyes=game:GetObjects("rbxassetid://11388969546")[1]
    
    if eyes then end
    game.Workspace.CurrentRooms.ChildAdded:Connect(function()
        game.Workspace:FindFirstChild("Eyes"):Destroy()
        enableDamage = false
    end)
    local num=math.floor(#currentLoadedRoom.Nodes:GetChildren()/2)
    eyes.CFrame=(
        num==0 and currentLoadedRoom.Base or currentLoadedRoom.Nodes[num]
    ).CFrame+Vector3.new(0,7,0)
    
    eyes.Parent=workspace
    eyes.Ambience:Play()
    task.wait(.5)
    eyes.Attachment.Eyes.Enabled=true
    
 local hum=game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
 while true and enableDamage do
 local _,found=workspace.CurrentCamera:WorldToScreenPoint(eyes.Position)
 if found then
 hum.Health-=10
 eyes.Attack:Play()
 if hum.Health<=0 then
 game:GetService("ReplicatedStorage").GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "Eyes"
 debug.setupvalue(getconnections(game:GetService("ReplicatedStorage").Bricks.DeathHint.OnClientEvent)[1].Function, 1, {
 "You died to the Eyes...", "They don't like to be stared at."
                })
 end
 end
 task.wait(.1)
 end
end)

Section:NewButton("Rush", "Summons Rush.", function()
 local speed = 75
 local rush = Instance.new("Model", game:GetService("Teams"))
 rush.Name = "RushMoving"
 game:GetService("ReplicatedStorage").JumpscareModels.RushNew:Clone().Parent = rush
 rush.RushNew.CanCollide = false
 local tweensv = game:GetService("TweenService")
 local currentLoadedRoom
 local firstLoadedRoom
    
 local function setRooms()
 local tb = {}
 table.foreach(workspace.CurrentRooms:GetChildren(), function(_, r)
 if r:FindFirstChild("RoomStart") and r.Name~="0" then
 table.insert(tb, tonumber(r.Name))
 end
 end)
 firstLoadedRoom = workspace.CurrentRooms[tostring(math.min(unpack(tb)))]
 currentLoadedRoom = workspace.CurrentRooms[tostring(math.max(unpack(tb)) - 1)]
 workspace.CurrentRooms.ChildAdded:Connect(function()
 local tb = {}
            table.foreach(workspace.CurrentRooms:GetChildren(), function(_, r)
                if r:FindFirstChild("RoomStart") and r.Name~="0" then
                    table.insert(tb, tonumber(r.Name))
 end
            end)
            currentLoadedRoom = workspace.CurrentRooms[tostring(math.max(unpack(tb)) - 1)]
        end)
 end
 setRooms()
    
    rush.Parent = workspace
    rush:MoveTo(firstLoadedRoom.RoomStart.Position + Vector3.new(0, 5.2, 0))
    require(game.ReplicatedStorage.ClientModules.Module_Events).flickerLights(tonumber(currentLoadedRoom.Name), 1)
    require(game.ReplicatedStorage.ClientModules.Module_Events).breakLights(firstLoadedRoom)
    
    rush.RushNew.Attachment.BlackTrail.Enabled = true
    rush.RushNew.PlaySound:Play()
    rush.RushNew.Footsteps:Play()
    wait(5)
    for _, room in pairs(workspace.CurrentRooms:GetChildren()) do
        if not room:FindFirstChild("Nodes") then
            continue
        end
        local nodeNum = #room.Nodes:GetChildren()
        for _, node in pairs(room.Nodes:GetChildren()) do
            local timeC = (math.abs((node.Position - rush.RushNew.Position).Magnitude)) / speed
            tweensv
                :Create(rush.RushNew, TweenInfo.new(timeC, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                    CFrame = CFrame.new(node.CFrame.X, node.CFrame.Y + 5.2, node.CFrame.Z),
                })
                :Play()
            local random = math.random(1, nodeNum)
            if tonumber(node.Name) == random then -- first or last node? just choose please
                require(game.ReplicatedStorage.ClientModules.Module_Events).breakLights(room)
            end
            task.wait(timeC)
        end
        if room == currentLoadedRoom then
            task.wait(1)
            tweensv
                :Create(rush.RushNew, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                    CFrame = CFrame.new(rush.RushNew.CFrame.X, -50, rush.RushNew.CFrame.Z),
                })
                :Play()
            wait(0.5)
            rush:Destroy()
            currentLoadedRoom:WaitForChild("Door").ClientOpen:FireServer()
        end
    end
end)

Section:NewButton("Ambush", "Summons Ambush.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Ambush", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Ambush.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 300, -- Percentage, 100 = default Rush speed
    DelayTime = 3, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = false,
    BreakLights = true,
    FlickerLights = {
        true, -- Enabled
        1, -- Time (seconds)
    },
    Cycles = {
        Min = 2,
        Max = 6,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled
        {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        true, -- Enabled ('false' if you don't want jumpscare)
        {
            Image1 = "rbxassetid://10110576663", -- Image1 url
            Image2 = "rbxassetid://10110576663", -- Image2 url
            Shake = true,
            Sound1 = {
                10483855823, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483999903, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled ('false' if you don't want tease)
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"You died to Ambush.", "You might need to hop in and out of your hiding spot a couple of times."}, -- Custom death message (can be as long as you want)
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityModel)
    print("Entity has spawned:", entityModel)
end

entity.Debug.OnEntityDespawned = function(entityModel)
    print("Entity has despawned:", mentityModelodel)
end

entity.Debug.OnEntityStartMoving = function(entityModel)
    print("Entity has started moving:", entityModel)
end

entity.Debug.OnEntityFinishedRebound = function(entityModel)
    print("Entity finished rebound:", entityModel)
end

entity.Debug.OnDeath = function()
    warn("You died.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)
end)

Section:NewButton("Timothy", "Summons Timothy", function()
    local a = game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game
    require(a.RemoteListener.Modules.SpiderJumpscare)(require(a), workspace.CurrentRooms["0"].Assets.Dresser.DrawerContainer, 0.2)
end)

Section:NewButton("Timothy [Deals Damage]", "Summons Timothy who CAN damage you.", function()
    local a = game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game
    require(a.RemoteListener.Modules.SpiderJumpscare)(require(a), workspace.CurrentRooms["0"].Assets.Dresser.DrawerContainer, 0.2)
    game.Players.LocalPlayer.Character.Humanoid.Health = game.Players.LocalPlayer.Character.Humanoid.Health - 5
end)

Section:NewButton("Glitch", "Summons Glitch.", function()
    require(game.ReplicatedStorage.ClientModules.EntityModules.Glitch).stuff(require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game), workspace.CurrentRooms[game.Players.LocalPlayer:GetAttribute("CurrentRoom")])
end)

Section:NewButton("Seek's Eyes", "Summons Seek's Eyes on walls.", function()
    require(game:GetService("ReplicatedStorage").ClientModules.EntityModules.Seek).tease(require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game), workspace.CurrentRooms[game.Players.LocalPlayer:GetAttribute("CurrentRoom")], 999)
end)

Section:NewButton("A-60", "Summons A-60. [NOT THE OFFICIAL]", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "A-60", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/A-60.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 850, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = false,
    BreakLights = true,
    FlickerLights = {
        true, -- Enabled
        1, -- Time (seconds)
    },
    Cycles = {
        Min = 2,
        Max = 6,
        WaitTime = 0.5,
    },
    CamShake = {
        false, -- Enabled
        {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        true, -- Enabled ('false' if you don't want jumpscare)
        {
            Image1 = "rbxassetid://11378592477", -- Image1 url
            Image2 = "rbxassetid://11360386086", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
 Flashing = {
 true, -- Enabled
 Color3.fromRGB(102, 0, 0), -- Color
            },
 Tease = {
 true, -- Enabled ('false' if you don't want tease)
 Min = 1,
 Max = 3,
            },
        },
    },
 CustomDialog = {"You died to A-60.", "It is nearly impossible to survive it due to it's high speeds.", "Wait..", "You shouldn't be seeing this."}, -- Custom death message (can be as long as you want)
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityModel)
 print("Entity has spawned:", entityModel)
end

entity.Debug.OnEntityDespawned = function(entityModel)
 print("Entity has despawned:", mentityModelodel)
end

entity.Debug.OnEntityStartMoving = function(entityModel)
 print("Entity has started moving:", entityModel)
end

entity.Debug.OnEntityFinishedRebound = function(entityModel)
 print("Entity finished rebound:", entityModel)
end

entity.Debug.OnDeath = function()
 warn("You died.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)
end)

Section:NewButton("A-60 [KILLABLE]", "Summons A-60 [CAN KILL AND NOT THE OFFICIAL]", function()
 local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

 -- Create entity
 local entity = Creator.createEntity({
 CustomName = "A-60", -- Custom name of your entity
 Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/A-60.rbxm?raw=true", -- Can be GitHub file or rbxassetid
        Speed = 850, -- Percentage, 100 = default Rush speed
        DelayTime = 2, -- Time before starting cycles (seconds)
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
            true, -- Enabled
            1, -- Time (seconds)
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 0.5,
        },
        CamShake = {
            false, -- Enabled
            {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
            100, -- Shake start distance (from Entity to you)
        },
        Jumpscare = {
            true, -- Enabled ('false' if you don't want jumpscare)
            {
                Image1 = "rbxassetid://11378592477", -- Image1 url
                Image2 = "rbxassetid://11360386086", -- Image2 url
                Shake = true,
                Sound1 = {
                    10483790459, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Sound2 = {
                    10483837590, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Flashing = {
                    true, -- Enabled
                    Color3.fromRGB(102, 0, 0), -- Color
                },
                Tease = {
                    true, -- Enabled ('false' if you don't want tease)
                    Min = 1,
                    Max = 3,
                },
            },
        },
        CustomDialog = {"You died to A-60.", "It is nearly impossible to survive it due to it's high speeds.", "Wait..", "You shouldn't be seeing this."}, -- Custom death message (can be as long as you want)
    })
    
    -----[[ Advanced ]]-----
    entity.Debug.OnEntitySpawned = function(entityModel)
        print("Entity has spawned:", entityModel)
    end
    
    entity.Debug.OnEntityDespawned = function(entityModel)
        print("Entity has despawned:", mentityModelodel)
    end
    
    entity.Debug.OnEntityStartMoving = function(entityModel)
        print("Entity has started moving:", entityModel)
    end
    
    entity.Debug.OnEntityFinishedRebound = function(entityModel)
        print("Entity finished rebound:", entityModel)
    end
    
    entity.Debug.OnDeath = function()
        warn("You died.")
    end
    ------------------------
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

-- CUSTOM ENTITIES
local Tab = Window:NewTab("Custom Entities")
local Section = Tab:NewSection("Custom Entities")

Section:NewButton("Angry Munci", "Summons Angry Munci. [KILLING CAN BE TOGGLED]", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/AngryMunci.rbxm?raw=true",
        Speed = 650,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 8,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to Angry Munci.", "He is very angry.", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Big Games", "Summons Big Games. [KILLING CAN BE TOGGLED]", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/BIGGAMES.rbxm?raw=true",
        Speed = 500,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 8,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to Big Games.", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("BigHead", "Summons BigHead", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/BigHead.rbxm?raw=true",
        Speed = 500,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 8,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to the Big Head.", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Depth", "Summons Depth.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Depth.rbxm?raw=true",
        Speed = 500,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 8,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to Depth.", "This is a fan-made concept!", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Doge", "Summons Doge.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Doge.rbxm?raw=true",
        Speed = 500,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 8,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to Doge.", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Freddy Fazbear", "Summons Freddy Fazbear.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        CustomName = "Freddy Fazbear", -- Custom name of your entity
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/FreddyFazbear.rbxm?raw=true", -- Can be GitHub file or rbxassetid
        Speed = 200, -- Percentage, 100 = default Rush speed
        DelayTime = 2, -- Time before starting cycles (seconds)
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true, -- Enabled
            1, -- Time (seconds)
        },
        Cycles = {
            Min = 1,
            Max = 4,
            WaitTime = 2,
        },
        CamShake = {
            true, -- Enabled
            {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
            100, -- Shake start distance (from Entity to you)
        },
        Jumpscare = {
            true, -- Enabled ('false' if you don't want jumpscare)
            {
                Image1 = "rbxassetid://7084794697", -- Image1 url
                Image2 = "rbxassetid://7084794697", -- Image2 url
                Shake = true,
                Sound1 = {
                    0, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Sound2 = {
                    2050521432, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Flashing = {
                    true, -- Enabled
                    Color3.fromRGB(92, 64, 51), -- Color
                },
                Tease = {
                    false, -- Enabled ('false' if you don't want tease)
                    Min = 1,
                    Max = 3,
                },
            },
        },
        CustomDialog = {"You died to Freddy Fazbear.", "Shutting the doors on him doesn't seem to stop him anymore.", "Try to hide in the closets."}, -- Custom death message (can be as long as you want)
    })
    
    -----[[ Advanced ]]-----
    entity.Debug.OnEntitySpawned = function(entityModel)
        print("Entity has spawned:", entityModel)
    end
    
    entity.Debug.OnEntityDespawned = function(entityModel)
        print("Entity has despawned:", mentityModelodel)
    end
    
    entity.Debug.OnEntityStartMoving = function(entityModel)
        print("Entity has started moving:", entityModel)
    end
    
    entity.Debug.OnEntityFinishedRebound = function(entityModel)
        print("Entity finished rebound:", entityModel)
    end
    
    entity.Debug.OnDeath = function()
        warn("You died.")
    end
    ------------------------
    
    -- Run the created entity
 Creator.runEntity(entity)
end)

Section:NewButton("Bonnie", "Summons Bonnie From FNAF.", function()
 local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
 CustomName = "Bonnie", -- Custom name of your entity
 Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Bonnie.rbxm?raw=true", -- Can be GitHub file or rbxassetid
 Speed = 200, -- Percentage, 100 = default Rush speed
 DelayTime = 2, -- Time before starting cycles (seconds)
 HeightOffset = 0,
 CanKill = false,
 BreakLights = true,
 FlickerLights = {
 true, -- Enabled
 1, -- Time (seconds)
    },
 Cycles = {
 Min = 1,
 Max = 4,
 WaitTime = 2,
    },
 CamShake = {
 true, -- Enabled
 {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
 100, -- Shake start distance (from Entity to you)
    },
 Jumpscare = {
 true, -- Enabled ('false' if you don't want jumpscare)
        {
 Image1 = "rbxassetid://2729500165", -- Image1 url
 Image2 = "rbxassetid://2729500165", -- Image2 url
 Shake = true,
 Sound1 = {
 0, -- SoundId
 { Volume = 0.5 }, -- Sound properties
            },
 Sound2 = {
 2050521432, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
 Flashing = {
 true, -- Enabled
 Color3.fromRGB(48, 16, 107), -- Color
            },
 Tease = {
                false, -- Enabled ('false' if you don't want tease)
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"You died to Bonnie.", "Shutting the doors on him doesn't seem to stop him anymore.", "Try to hide in the closets."}, -- Custom death message (can be as long as you want)
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityModel)
    print("Entity has spawned:", entityModel)
end

entity.Debug.OnEntityDespawned = function(entityModel)
    print("Entity has despawned:", mentityModelodel)
end

entity.Debug.OnEntityStartMoving = function(entityModel)
    print("Entity has started moving:", entityModel)
end

entity.Debug.OnEntityFinishedRebound = function(entityModel)
    print("Entity finished rebound:", entityModel)
end

entity.Debug.OnDeath = function()
    warn("You died.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)
end)

Section:NewButton("Chica", "Summons Chica From FNAF.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Chica", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Chica.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 200, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = false,
    BreakLights = true,
    FlickerLights = {
        true, -- Enabled
        1, -- Time (seconds)
    },
    Cycles = {
        Min = 1,
        Max = 4,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled
        {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        true, -- Enabled ('false' if you don't want jumpscare)
        {
            Image1 = "rbxassetid://3475269832", -- Image1 url
            Image2 = "rbxassetid://3475269832", -- Image2 url
            Shake = true,
            Sound1 = {
                0, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                2050521432, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled
                Color3.fromRGB(139, 128, 0), -- Color
            },
            Tease = {
                false, -- Enabled ('false' if you don't want tease)
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"You died to Chica.", "Shutting the doors on him doesn't seem to stop her anymore.", "Try to hide in the closets."}, -- Custom death message (can be as long as you want)
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityModel)
    print("Entity has spawned:", entityModel)
end

entity.Debug.OnEntityDespawned = function(entityModel)
    print("Entity has despawned:", mentityModelodel)
end

entity.Debug.OnEntityStartMoving = function(entityModel)
    print("Entity has started moving:", entityModel)
end

entity.Debug.OnEntityFinishedRebound = function(entityModel)
    print("Entity finished rebound:", entityModel)
end

entity.Debug.OnDeath = function()
    warn("You died.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)
end)

Section:NewButton("Foxy", "Summons Foxy From FNAF.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Foxy", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Foxy.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 200, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = false,
    BreakLights = true,
    FlickerLights = {
        true, -- Enabled
        1, -- Time (seconds)
    },
    Cycles = {
        Min = 1,
        Max = 4,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled
        {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        true, -- Enabled ('false' if you don't want jumpscare)
        {
            Image1 = "rbxassetid://3475910603", -- Image1 url
            Image2 = "rbxassetid://3475910603", -- Image2 url
            Shake = true,
            Sound1 = {
                0, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                2050521432, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled
                Color3.fromRGB(55, 0, 0), -- Color
            },
            Tease = {
                false, -- Enabled ('false' if you don't want tease)
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"You died to Foxy.", "Shutting the doors on him doesn't seem to stop him anymore.", "Try to hide in the closets."}, -- Custom death message (can be as long as you want)
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityModel)
    print("Entity has spawned:", entityModel)
end

entity.Debug.OnEntityDespawned = function(entityModel)
    print("Entity has despawned:", mentityModelodel)
end

entity.Debug.OnEntityStartMoving = function(entityModel)
    print("Entity has started moving:", entityModel)
end

entity.Debug.OnEntityFinishedRebound = function(entityModel)
    print("Entity finished rebound:", entityModel)
end

entity.Debug.OnDeath = function()
    warn("You died.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)
end)

Section:NewButton("Flamingo", "Summons Flamingo.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Flamingo", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Flamingo.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 250, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = false,
    BreakLights = true,
    FlickerLights = {
        true, -- Enabled
        1, -- Time (seconds)
    },
    Cycles = {
        Min = 2,
        Max = 6,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled
        {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        true, -- Enabled ('false' if you don't want jumpscare)
        {
            Image1 = "rbxassetid://9133214787", -- Image1 url
            Image2 = "rbxassetid://9133214787", -- Image2 url
            Shake = true,
            Sound1 = {
                0, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled
                Color3.fromRGB(255, 224, 189), -- Color
            },
            Tease = {
                false, -- Enabled ('false' if you don't want tease)
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"You died to Flamingo.", "Use the same tactics as Rush and Ambush!"}, -- Custom death message (can be as long as you want)
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityModel)
    print("Entity has spawned:", entityModel)
end

entity.Debug.OnEntityDespawned = function(entityModel)
    print("Entity has despawned:", mentityModelodel)
end

entity.Debug.OnEntityStartMoving = function(entityModel)
    print("Entity has started moving:", entityModel)
end

entity.Debug.OnEntityFinishedRebound = function(entityModel)
    print("Entity finished rebound:", entityModel)
end

entity.Debug.OnDeath = function()
    warn("You died.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)
end)

Section:NewButton("Eater", "Summons Eater.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Eater.rbxm?raw=true",
        Speed = 500,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 8,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to Eater.", "It is a fan-made concept!", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("El Gato", "Summons El Gato.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Elgato.rbxm?raw=true",
        Speed = 550,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 8,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to EL GATO.", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Greed", "Summons Greed.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Greed.rbxm?raw=true",
        Speed = 450,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 8,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to Greed.", "It is a fan-made concept!", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Green from Rainbow Friends", "Summons Green from Rainbow Friends.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/GreenRF.rbxm?raw=true",
        Speed = 525,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 8,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to Green.", "Wait.. He's from Rainbow Friends!", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Happy Munci", "Summons Happy Munci.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/HappyMunci.rbxm?raw=true",
        Speed = 500,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to Happy Munci.", "Wait, That's Impossible!", "If you are seeing this text,", "That means you edited the config!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Hehehehaw", "Summons Hehehehaw.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Hehehehaw.rbxm?raw=true",
        Speed = 500,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to Hehehehaw!", "HEHEHEHAW", "HEHEHEHAW", "UsE tHe SaMe TaCtIcS aS ruSh AnD aMbUsH!1"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Kardin Hong", "Summons the legendary and mythical speedrunner.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Kardin.rbxm?raw=true",
        Speed = 5,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 1,
            Max = 1,
            WaitTime = 2,
        },
        CamShake = {
            false,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to Kardin Hong!", "The notorious DOORS speedrunner!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Kreekcraft In Closet", "Summons Kreekcraft when a closet is opened.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom
    local config={
        Image="http://www.roblox.com/asset/?id=11395129820", -- Could also be "image.png"
        Sound="rbxassetid://11350126934", -- Could also be "file.mp3"
        EntityName="Kreekcraft" -- Make sure to change if you mod the image/sound to prevent overlapping
    }
    local ReSt = game:GetService("ReplicatedStorage")
    
    local ModuleScripts = {
        ModuleEvents = require(ReSt.ClientModules.Module_Events),
    }
    
    local function connectClosetJack(wardrobes, room, bool)
        for _, wardrobe in pairs(wardrobes) do
            if not game:GetService("ReplicatedStorage"):FindFirstChild("closetAnim") then 
                local anim = Instance.new("Animation")
                anim.AnimationId = "rbxassetid://9460435404"
                anim.Name="closetAnim"
                anim.Parent=game:GetService("ReplicatedStorage")
            end
            if not game:GetService("ReplicatedStorage"):FindFirstChild("JackModel") then
                if not isfile(config.EntityName..".txt") then writefile(config.EntityName..".txt", game:HttpGet("https://github.com/sponguss/storage/raw/real/realisticClosetJack.rbxm?raw=true")) end
                local a=game:GetObjects((getcustomasset or getsynasset)(config.EntityName..".txt"))[1]
                a.Name="JackModel"
                a.Parent=game:GetService("ReplicatedStorage")
            end
            game:GetService("ReplicatedStorage").JackModel.Sound.SoundId=(isfile(config.Sound) and (getcustomasset or getsynasset)(config.Sound) or config.Sound)
            game:GetService("ReplicatedStorage").JackModel.Root.Beam.Texture=(isfile(config.Image) and (getcustomasset or getsynasset)(config.Image) or config.Image)
            local prompt = wardrobe:WaitForChild("HidePrompt", 1)
            if not prompt and wardrobe:FindFirstChild("fakePrompt") then return end
        
            if prompt then
                -- Fake prompt
        
                local fakePrompt = prompt:Clone()
                
                if bool then prompt:Destroy() else prompt.Enabled=false end
                fakePrompt.Parent = wardrobe
                fakePrompt.Name="fakePrompt"
                
                local connection; connection = fakePrompt.Triggered:Connect(function()
                    if not bool then connection:Disconnect() end
                    local model=game:GetService("ReplicatedStorage").JackModel:Clone()
        
                    if model and not wardrobe:FindFirstChild(model.Name) then
                        model:SetPrimaryPartCFrame(wardrobe.Main.CFrame)
                        model.Parent = workspace
        
                        -- Animation setup
                        local anim = wardrobe.AnimationController:LoadAnimation(game:GetService("ReplicatedStorage").closetAnim)
        
                        -- Scare
                        
                        ModuleScripts.ModuleEvents.flickerLights(room, 1.664)
                        anim:Play()
                        model.Sound:Play()
        
                        -- Destroy
        
                        task.wait(1)
                        
                        model:Destroy()
                        if not bool then prompt.Enabled = true end
                        if not bool then fakePrompt:Destroy() end
        
                        if not bool then connection:Disconnect() end
                    end
                end)
            end
        end
    end
    
    local wardrobes = {}
    for _, wardrobe in pairs(workspace.CurrentRooms[LatestRoom.Value].Assets:GetChildren()) do
        if wardrobe.Name=="Wardrobe" then
            table.insert(wardrobes, wardrobe)
        end
    end
    
    if wardrobes[1] then
        connectClosetJack(wardrobes, workspace.CurrentRooms[LatestRoom.Value], false) -- 'true' for jack to appear every time
    end
end)

Section:NewButton("Kreekcraft In Closet [INFINITELY]", "Summons Kreekcraft when a closet is opened infinitely.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom
    local config={
        Image="http://www.roblox.com/asset/?id=11395129820", -- Could also be "image.png"
        Sound="rbxassetid://11350126934", -- Could also be "file.mp3"
        EntityName="Kreekcraft" -- Make sure to change if you mod the image/sound to prevent overlapping
    }
    local ReSt = game:GetService("ReplicatedStorage")
    
    local ModuleScripts = {
        ModuleEvents = require(ReSt.ClientModules.Module_Events),
    }
    
    local function connectClosetJack(wardrobes, room, bool)
        for _, wardrobe in pairs(wardrobes) do
            if not game:GetService("ReplicatedStorage"):FindFirstChild("closetAnim") then 
                local anim = Instance.new("Animation")
                anim.AnimationId = "rbxassetid://9460435404"
                anim.Name="closetAnim"
                anim.Parent=game:GetService("ReplicatedStorage")
            end
            if not game:GetService("ReplicatedStorage"):FindFirstChild("JackModel") then
                if not isfile(config.EntityName..".txt") then writefile(config.EntityName..".txt", game:HttpGet("https://github.com/sponguss/storage/raw/real/realisticClosetJack.rbxm?raw=true")) end
                local a=game:GetObjects((getcustomasset or getsynasset)(config.EntityName..".txt"))[1]
                a.Name="JackModel"
                a.Parent=game:GetService("ReplicatedStorage")
            end
            game:GetService("ReplicatedStorage").JackModel.Sound.SoundId=(isfile(config.Sound) and (getcustomasset or getsynasset)(config.Sound) or config.Sound)
            game:GetService("ReplicatedStorage").JackModel.Root.Beam.Texture=(isfile(config.Image) and (getcustomasset or getsynasset)(config.Image) or config.Image)
            local prompt = wardrobe:WaitForChild("HidePrompt", 1)
            if not prompt and wardrobe:FindFirstChild("fakePrompt") then return end
        
            if prompt then
                -- Fake prompt
        
                local fakePrompt = prompt:Clone()
                
                if bool then prompt:Destroy() else prompt.Enabled=false end
                fakePrompt.Parent = wardrobe
                fakePrompt.Name="fakePrompt"
                
                local connection; connection = fakePrompt.Triggered:Connect(function()
                    if not bool then connection:Disconnect() end
                    local model=game:GetService("ReplicatedStorage").JackModel:Clone()
        
                    if model and not wardrobe:FindFirstChild(model.Name) then
                        model:SetPrimaryPartCFrame(wardrobe.Main.CFrame)
                        model.Parent = workspace
        
                        -- Animation setup
                        local anim = wardrobe.AnimationController:LoadAnimation(game:GetService("ReplicatedStorage").closetAnim)
        
                        -- Scare
                        
                        ModuleScripts.ModuleEvents.flickerLights(room, 1.664)
                        anim:Play()
                        model.Sound:Play()
        
                        -- Destroy
        
                        task.wait(1)
                        
                        model:Destroy()
                        if not bool then prompt.Enabled = true end
                        if not bool then fakePrompt:Destroy() end
        
                        if not bool then connection:Disconnect() end
                    end
                end)
            end
        end
    end
    
    local wardrobes = {}
    for _, wardrobe in pairs(workspace.CurrentRooms[LatestRoom.Value].Assets:GetChildren()) do
        if wardrobe.Name=="Wardrobe" then
            table.insert(wardrobes, wardrobe)
        end
    end
    
    if wardrobes[1] then
        connectClosetJack(wardrobes, workspace.CurrentRooms[LatestRoom.Value], true) -- 'true' for jack to appear every time
    end
end)

Section:NewButton("Moving Eyes", "Summons Moving Eyes.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/MovingEyes.rbxm?raw=true",
        Speed = 500,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to the moving Eyes!", "Wait, that should be impossible!", "Hmm..", "That's strange..", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Obunga", "Summons Obunga.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Obunga.rbxm?raw=true",
        Speed = 500,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to Obunga!", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Old Ambush", "Summons the old scrapped Ambush.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        CustomName = "Old Ambush", -- Custom name of your entity
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/OldAmbush.rbxm?raw=true", -- Can be GitHub file or rbxassetid
        Speed = 225, -- Percentage, 100 = default Rush speed
        DelayTime = 2, -- Time before starting cycles (seconds)
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true, -- Enabled
            1, -- Time (seconds)
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 0.5,
        },
        CamShake = {
            false, -- Enabled
            {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
            100, -- Shake start distance (from Entity to you)
        },
        Jumpscare = {
            true, -- Enabled ('false' if you don't want jumpscare)
            {
                Image1 = "rbxassetid://0", -- Image1 url
                Image2 = "rbxassetid://11387541299", -- Image2 url
                Shake = true,
                Sound1 = {
                    10483790459, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Sound2 = {
                    10483837590, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Flashing = {
                    true, -- Enabled
                    Color3.fromRGB(102, 0, 0), -- Color
                },
                Tease = {
                    false, -- Enabled ('false' if you don't want tease)
                    Min = 1,
                    Max = 3,
                },
            },
        },
        CustomDialog = {"You died to the Old Ambush.", "Use the same tactics as the current Ambush!"}, -- Custom death message (can be as long as you want)
    })
    
    -----[[ Advanced ]]-----
    entity.Debug.OnEntitySpawned = function(entityModel)
        print("Entity has spawned:", entityModel)
    end
    
    entity.Debug.OnEntityDespawned = function(entityModel)
        print("Entity has despawned:", mentityModelodel)
    end
    
    entity.Debug.OnEntityStartMoving = function(entityModel)
        print("Entity has started moving:", entityModel)
    end
    
    entity.Debug.OnEntityFinishedRebound = function(entityModel)
        print("Entity finished rebound:", entityModel)
    end
    
    entity.Debug.OnDeath = function()
        warn("You died.")
    end
    ------------------------
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Orange From Rainbow Friends.", "Summons Orange From Rainbow Friends.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Orange.rbxm?raw=true",
        Speed = 500,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to Orange!", "Wait.. Orange is from Rainbow Friends!", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("plamen6789rocks", "Summons the creator of this GUI.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/plamen6789.rbxm?raw=true",
        Speed = 5,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 1,
            Max = 1,
            WaitTime = 2,
        },
        CamShake = {
            false,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to plamen6789rock's clones!", "They are very easy to survive due to their speeds.", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Old Private Jet", "Summons the old Private Jet.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/PrivateJetU.rbxm?raw=true",
        Speed = 500,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to a Private Jet!", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("New Private Jet", "Summons the New Private Jet.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/PrivateJet.rbxm?raw=true",
        Speed = 800,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 8,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to the new Private Jet!.", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Photon", "Summons Photon.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Photon", -- Custom name of your entity
    Model = "https://github.com/Kardin12/lolcat/blob/main/Photon.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 250, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = false,
    BreakLights = true,
    FlickerLights = {
        true, -- Enabled
        1, -- Time (seconds)
    },
    Cycles = {
        Min = 2,
        Max = 6,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled
        {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        true, -- Enabled ('false' if you don't want jumpscare)
        {
            Image1 = "rbxassetid://4749623118", -- Image1 url
            Image2 = "rbxassetid://4749623118", -- Image2 url
            Shake = true,
            Sound1 = {
                0, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled
                Color3.fromRGB(0, 0, 255), -- Color
            },
            Tease = {
                true, -- Enabled ('false' if you don't want tease)
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"You died to Photon.", "Use the same tactics as Rush and Ambush!"}, -- Custom death message (can be as long as you want)
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityModel)
    print("Entity has spawned:", entityModel)
end

entity.Debug.OnEntityDespawned = function(entityModel)
    print("Entity has despawned:", mentityModelodel)
end

entity.Debug.OnEntityStartMoving = function(entityModel)
    print("Entity has started moving:", entityModel)
end

entity.Debug.OnEntityFinishedRebound = function(entityModel)
    print("Entity finished rebound:", entityModel)
end

entity.Debug.OnDeath = function()
    warn("You died.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)
end)

Section:NewButton("Pikachu", "Summons Pikachu.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        CustomName = "Pikachu", -- Custom name of your entity
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Pikachu.rbxm?raw=true", -- Can be GitHub file or rbxassetid
        Speed = 250, -- Percentage, 100 = default Rush speed
        DelayTime = 2, -- Time before starting cycles (seconds)
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true, -- Enabled
            1, -- Time (seconds)
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 2,
        },
        CamShake = {
            true, -- Enabled
            {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
            100, -- Shake start distance (from Entity to you)
        },
        Jumpscare = {
            true, -- Enabled ('false' if you don't want jumpscare)
            {
                Image1 = "rbxassetid://488201647", -- Image1 url
                Image2 = "rbxassetid://488201647", -- Image2 url
                Shake = true,
                Sound1 = {
                    0, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Sound2 = {
                    131218535, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Flashing = {
                    true, -- Enabled
                    Color3.fromRGB(255, 255, 0), -- Color
                },
                Tease = {
                    false, -- Enabled ('false' if you don't want tease)
                    Min = 1,
                    Max = 3,
                },
            },
        },
        CustomDialog = {"You died to Pikachu.", "Use the same tactics as Rush and Ambush!"}, -- Custom death message (can be as long as you want)
    })
    
    -----[[ Advanced ]]-----
    entity.Debug.OnEntitySpawned = function(entityModel)
        print("Entity has spawned:", entityModel)
    end
    
    entity.Debug.OnEntityDespawned = function(entityModel)
        print("Entity has despawned:", mentityModelodel)
    end
    
    entity.Debug.OnEntityStartMoving = function(entityModel)
        print("Entity has started moving:", entityModel)
    end
    
    entity.Debug.OnEntityFinishedRebound = function(entityModel)
        print("Entity finished rebound:", entityModel)
    end
    
    entity.Debug.OnDeath = function()
        warn("You died.")
    end
    ------------------------
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Rage", "Summons Rage.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Rage.rbxm?raw=true",
        Speed = 500,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to Rage!", "This is a fan-made concept!", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Sandwich/Yoyoblocx", "Summons my friend Yoyoblocx.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        CustomName = "Yoyoblocx", -- Custom name of your entity
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Yoyoblocx.rbxm?raw=true", -- Can be GitHub file or rbxassetid
        Speed = 225, -- Percentage, 100 = default Rush speed
        DelayTime = 2, -- Time before starting cycles (seconds)
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true, -- Enabled
            1, -- Time (seconds)
        },
        Cycles = {
            Min = 1,
            Max = 4,
            WaitTime = 2,
        },
        CamShake = {
            true, -- Enabled
            {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
            100, -- Shake start distance (from Entity to you)
        },
        Jumpscare = {
            true, -- Enabled ('false' if you don't want jumpscare)
            {
                Image1 = "rbxassetid://11233906150", -- Image1 url
                Image2 = "rbxassetid://11384222407", -- Image2 url
                Shake = true,
                Sound1 = {
                    10483790459, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Sound2 = {
                    10483837590, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Flashing = {
                    true, -- Enabled
                    Color3.fromRGB(255, 174, 66), -- Color
                },
                Tease = {
                    true, -- Enabled ('false' if you don't want tease)
                    Min = 1,
                    Max = 3,
                },
            },
        },
        CustomDialog = {"You died to Yoyoblocx.", "He always wanted to be in the game so I added him.", "Use the same tactics as Rush and Ambush!"}, -- Custom death message (can be as long as you want)
    })
    
    -----[[ Advanced ]]-----
    entity.Debug.OnEntitySpawned = function(entityModel)
        print("Entity has spawned:", entityModel)
    end
    
    entity.Debug.OnEntityDespawned = function(entityModel)
        print("Entity has despawned:", mentityModelodel)
    end
    
    entity.Debug.OnEntityStartMoving = function(entityModel)
        print("Entity has started moving:", entityModel)
    end
    
    entity.Debug.OnEntityFinishedRebound = function(entityModel)
        print("Entity finished rebound:", entityModel)
    end
    
    entity.Debug.OnDeath = function()
        warn("You died.")
    end
    ------------------------
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Scratch Cat", "Summons Scratch Cat.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        CustomName = "Scratch Cat", -- Custom name of your entity
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/ScratchCat.rbxm?raw=true", -- Can be GitHub file or rbxassetid
        Speed = 250, -- Percentage, 100 = default Rush speed
        DelayTime = 2, -- Time before starting cycles (seconds)
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true, -- Enabled
            1, -- Time (seconds)
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 0.5,
        },
        CamShake = {
            false, -- Enabled
            {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
            100, -- Shake start distance (from Entity to you)
        },
        Jumpscare = {
            true, -- Enabled ('false' if you don't want jumpscare)
            {
                Image1 = "rbxassetid://11380973660", -- Image1 url
                Image2 = "rbxassetid://11380973660", -- Image2 url
                Shake = true,
                Sound1 = {
                    10483790459, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Sound2 = {
                    5104257032, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Flashing = {
                    true, -- Enabled
                    Color3.fromRGB(255, 255, 0), -- Color
                },
                Tease = {
                    true, -- Enabled ('false' if you don't want tease)
                    Min = 1,
                    Max = 3,
                },
            },
        },
        CustomDialog = {"You died to Scratch Cat.", "Use the same tactic as Rush and Ambush!"}, -- Custom death message (can be as long as you want)
    })
    
    -----[[ Advanced ]]-----
    entity.Debug.OnEntitySpawned = function(entityModel)
        print("Entity has spawned:", entityModel)
    end
    
    entity.Debug.OnEntityDespawned = function(entityModel)
        print("Entity has despawned:", mentityModelodel)
    end
    
    entity.Debug.OnEntityStartMoving = function(entityModel)
        print("Entity has started moving:", entityModel)
    end
    
    entity.Debug.OnEntityFinishedRebound = function(entityModel)
        print("Entity finished rebound:", entityModel)
    end
    
    entity.Debug.OnDeath = function()
        warn("You died.")
    end
    ------------------------
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Silence", "Summons Silence.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        CustomName = "Silence", -- Custom name of your entity
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Silence.rbxm?raw=true", -- Can be GitHub file or rbxassetid
        Speed = 175, -- Percentage, 100 = default Rush speed
        DelayTime = 2, -- Time before starting cycles (seconds)
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true, -- Enabled
            1, -- Time (seconds)
        },
        Cycles = {
            Min = 3,
            Max = 8,
            WaitTime = 2,
        },
        CamShake = {
            false, -- Enabled
            {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
            100, -- Shake start distance (from Entity to you)
        },
        Jumpscare = {
            true, -- Enabled ('false' if you don't want jumpscare)
            {
                Image1 = "rbxassetid://11393319553", -- Image1 url
                Image2 = "rbxassetid://11393319553", -- Image2 url
                Shake = true,
                Sound1 = {
                    0, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Sound2 = {
                    10483837590, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Flashing = {
                    true, -- Enabled
                    Color3.fromRGB(255, 255, 255), -- Color
                },
                Tease = {
                    false, -- Enabled ('false' if you don't want tease)
                    Min = 1,
                    Max = 3,
                },
            },
        },
        CustomDialog = {"You died to Silence.", "Make sure to hide in a closet!"}, -- Custom death message (can be as long as you want)
    })
    
    -----[[ Advanced ]]-----
    entity.Debug.OnEntitySpawned = function(entityModel)
        print("Entity has spawned:", entityModel)
    end
    
    entity.Debug.OnEntityDespawned = function(entityModel)
        print("Entity has despawned:", mentityModelodel)
    end
    
    entity.Debug.OnEntityStartMoving = function(entityModel)
        print("Entity has started moving:", entityModel)
    end
    
    entity.Debug.OnEntityFinishedRebound = function(entityModel)
        print("Entity finished rebound:", entityModel)
    end
    
    entity.Debug.OnDeath = function()
        warn("You died.")
    end
    ------------------------
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Scoobis", "Summons Scoobis.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Scoobis.rbxm?raw=true",
        Speed = 500,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to Scoobis!", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Slenderman", "Summons Slenderman.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Slenderman.rbxm?raw=true",
        Speed = 250,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 8,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to Slenderman!", "You collected all of his pages.", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)


Section:NewButton("Stare", "Summons Stare.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Stare.rbxm?raw=true",
        Speed = 500,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to Stare!", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Troll Face Ambush", "Summons Troll Face Ambush.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/TrollFaceAmbush.rbxm?raw=true",
        Speed = 500,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to the Trololo Ambush!", "The image for Trololo Ambush is from reddit user: r/temportrium", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Troll Face Rush", "Summons Troll Face Rush.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/TrollRush.rbxm?raw=true",
        Speed = 500,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 1,
            Max = 1,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to TrollFace Rush!", "The image for TrollFace Rush is from reddit user: r/Filberto_ossani2", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("The Rock", "Summons The Rock.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "The Rock", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/TheRock.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 250, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = false,
    BreakLights = true,
    FlickerLights = {
        true, -- Enabled
        1, -- Time (seconds)
    },
    Cycles = {
        Min = 2,
        Max = 6,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled
        {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        true, -- Enabled ('false' if you don't want jumpscare)
        {
            Image1 = "rbxassetid://8425069718", -- Image1 url
            Image2 = "rbxassetid://8425069718", -- Image2 url
            Shake = true,
            Sound1 = {
                0, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled
                Color3.fromRGB(255, 224, 189), -- Color
            },
            Tease = {
                false, -- Enabled ('false' if you don't want tease)
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"You died to The Rock.", "Use the same tactics as Rush and Ambush!"}, -- Custom death message (can be as long as you want)
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityModel)
    print("Entity has spawned:", entityModel)
end

entity.Debug.OnEntityDespawned = function(entityModel)
    print("Entity has despawned:", mentityModelodel)
end

entity.Debug.OnEntityStartMoving = function(entityModel)
    print("Entity has started moving:", entityModel)
end

entity.Debug.OnEntityFinishedRebound = function(entityModel)
    print("Entity finished rebound:", entityModel)
end

entity.Debug.OnDeath = function()
    warn("You died.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)
end)

Section:NewButton("Wise Mystical Tree", "Summons the Wise Mystical Tree.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Wise Mystical Tree.rbxm?raw=true",
        Speed = 500,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to the Wise Mystical Tree!", "Are you over 25 and have a personal computer?", "Then download this game now!", "Also, the sound for the Wise Mystical Tree is copyrighted!", "Yay!", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Nuke", "Summons Nuke.", function()
    loadstring(game:HttpGet"https://raw.githubusercontent.com/sponguss/storage/main/entitySpawner.lua")().createEntity("Ambush")

    local tb=entityTable["Ambush"]
    tb.Speed=1000
    tb.Sounds={"PlaySound", "Footsteps"}
    tb.Model="https://github.com/tonyBflako/thing/raw/main/nuke.rbxm"
    tb.Ambush.Enabled=true
    tb.WaitTime=0
    tb.WT_Increase=-100
    
    loadstring(game:HttpGet"https://raw.githubusercontent.com/sponguss/storage/main/entitySpawner.lua")().runEntity("Ambush") 
end)

Section:NewButton("Troll Face Rush [old]", "Summons the old troll face Rush.", function()
    loadstring(game:HttpGet"https://raw.githubusercontent.com/sponguss/storage/main/entitySpawner.lua")().createEntity("Ambush")

    local tb=entityTable["Ambush"]
    tb.Speed=110
    tb.Sounds={"PlaySound", "Footsteps"}
    tb.Model="https://github.com/tonyBflako/thing/raw/main/trollrush.rbxm"
    tb.Ambush.Enabled=false
    tb.WaitTime=2.5
    
    loadstring(game:HttpGet"https://raw.githubusercontent.com/sponguss/storage/main/entitySpawner.lua")().runEntity("Ambush")
end)

Section:NewButton("Nightmare Rush", "Summons Nightmare Rush.", function()
    loadstring(game:HttpGet"https://raw.githubusercontent.com/sponguss/storage/main/entitySpawner.lua")().createEntity("Ambush")

    local tb=entityTable["Ambush"]
    tb.Speed=115
    tb.Sounds={"PlaySound", "Footsteps"}
    tb.Model="https://github.com/tonyBflako/thing/raw/main/nightmarerush.rbxm"
    tb.Ambush.Enabled=false
    tb.WaitTime=1.5
    tb.FlickerLenght=0.5
    
    loadstring(game:HttpGet"https://raw.githubusercontent.com/sponguss/storage/main/entitySpawner.lua")().runEntity("Ambush")
end)

Section:NewButton("Original Rush", "Summons Original Rush.", function()
    loadstring(game:HttpGet"https://raw.githubusercontent.com/sponguss/storage/main/entitySpawner.lua")().createEntity("Ambush")

    local tb=entityTable["Ambush"]
    tb.Speed=60
    tb.Sounds={"PlaySound", "Footsteps"}
    tb.Model="https://github.com/tonyBflako/thing/raw/main/orignalrush.rbxm"
    tb.Ambush.Enabled=false
    tb.WaitTime=0
    tb.FlickerLenght=5
    
    loadstring(game:HttpGet"https://raw.githubusercontent.com/sponguss/storage/main/entitySpawner.lua")().runEntity("Ambush")
end)

Section:NewButton("Peter Griffin", "Summons Peter Griffin", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        CustomName = "Peter Griffin", -- Custom name of your entity
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/PeterGriffin.rbxm?raw=true", -- Can be GitHub file or rbxassetid
        Speed = 300, -- Percentage, 100 = default Rush speed
        DelayTime = 2, -- Time before starting cycles (seconds)
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true, -- Enabled
            1, -- Time (seconds)
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 0.5,
        },
        CamShake = {
            false, -- Enabled
            {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
            100, -- Shake start distance (from Entity to you)
        },
        Jumpscare = {
            true, -- Enabled ('false' if you don't want jumpscare)
            {
                Image1 = "rbxassetid://11380974265", -- Image1 url
                Image2 = "rbxassetid://11380974265", -- Image2 url
                Shake = true,
                Sound1 = {
                    10483790459, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Sound2 = {
                    4753228365, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Flashing = {
                    true, -- Enabled
                    Color3.fromRGB(255, 255, 255), -- Color
                },
                Tease = {
                    true, -- Enabled ('false' if you don't want tease)
                    Min = 1,
                    Max = 3,
                },
            },
        },
        CustomDialog = {"You died to Peter Griffin.", "Use the same tactics as Rush and Ambush!"}, -- Custom death message (can be as long as you want)
    })
    
    -----[[ Advanced ]]-----
    entity.Debug.OnEntitySpawned = function(entityModel)
        print("Entity has spawned:", entityModel)
    end
    
    entity.Debug.OnEntityDespawned = function(entityModel)
        print("Entity has despawned:", mentityModelodel)
    end
    
    entity.Debug.OnEntityStartMoving = function(entityModel)
        print("Entity has started moving:", entityModel)
    end
    
    entity.Debug.OnEntityFinishedRebound = function(entityModel)
        print("Entity finished rebound:", entityModel)
    end
    
    entity.Debug.OnDeath = function()
        warn("You died.")
    end
    ------------------------
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Sponge Wall", "Summons Sponge Wall.", function()
    loadstring(game:HttpGet"https://raw.githubusercontent.com/sponguss/storage/main/entitySpawner.lua")().createEntity("Ambush")

    local tb=entityTable["Ambush"]
    tb.Speed=20
    tb.Sounds={"PlaySound", "Footsteps"}
    tb.Model="https://github.com/tonyBflako/thing/raw/main/wallofsponge2.rbxm"
    tb.Ambush.Enabled=false
    tb.WaitTime=0
    
    loadstring(game:HttpGet"https://raw.githubusercontent.com/sponguss/storage/main/entitySpawner.lua")().runEntity("Ambush")
end)

Section:NewButton("Train", "Summons Train.", function()
    loadstring(game:HttpGet"https://raw.githubusercontent.com/sponguss/storage/main/entitySpawner.lua")().createEntity("Ambush")

    local tb=entityTable["Ambush"]
    tb.Speed=200
    tb.Sounds={"PlaySound", "Footsteps"}
    tb.Model="https://github.com/tonyBflako/thing/raw/main/train.rbxm"
    tb.Ambush.Enabled=false
    tb.WaitTime=0
    
    loadstring(game:HttpGet"https://raw.githubusercontent.com/sponguss/storage/main/entitySpawner.lua")().runEntity("Ambush")
end)

Section:NewButton("A-Train", "Summons A-Train.", function()
    loadstring(game:HttpGet"https://raw.githubusercontent.com/sponguss/storage/main/entitySpawner.lua")().createEntity("Ambush")

    local tb=entityTable["Ambush"]
    tb.Speed=200
    tb.Sounds={"PlaySound", "Footsteps"}
    tb.Model="https://github.com/tonyBflako/thing/raw/main/atrain.rbxm"
    tb.Ambush.Enabled=false
    tb.WaitTime=0
    
    loadstring(game:HttpGet"https://raw.githubusercontent.com/sponguss/storage/main/entitySpawner.lua")().runEntity("Ambush")
end)

Section:NewButton("The J", "Summons The J.", function()
    loadstring(game:HttpGet"https://raw.githubusercontent.com/sponguss/storage/main/entitySpawner.lua")().createEntity("Ambush")

    local tb=entityTable["Ambush"]
    tb.Speed=69
    tb.Sounds={"PlaySound", "Footsteps"}
    tb.Model="https://github.com/TheJfromComedytale/The-J-Has-Been-Spotted-In-Roblox-Doors-Please-Leave-If-You-Value-Your-Lives/raw/main/TheJ.rbxm"
    tb.Ambush.Enabled=true
    tb.WaitTime=2.5
    
    loadstring(game:HttpGet"https://raw.githubusercontent.com/sponguss/storage/main/entitySpawner.lua")().runEntity("Ambush")
end)

Section:NewButton("Baller", "Summons Baller.", function()
    loadstring(game:HttpGet"https://raw.githubusercontent.com/sponguss/storage/main/entitySpawner.lua")().createEntity("Ambush")

    local tb=entityTable["Ambush"]
    tb.Speed=80
    tb.Sounds={"PlaySound", "Footsteps"}
    tb.Model="https://github.com/Similirity/Baller/raw/main/Baller.rbxm"
    tb.Ambush.Enabled=true
    tb.WaitTime=1
    
    loadstring(game:HttpGet"https://raw.githubusercontent.com/sponguss/storage/main/entitySpawner.lua")().runEntity("Ambush")
end)

Section:NewButton("LSPLASH", "Summons LSPLASH.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        CustomName = "LSPLASH", -- Custom name of your entity
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/LSPLASH.rbxm?raw=true", -- Can be GitHub file or rbxassetid
        Speed = 650, -- Percentage, 100 = default Rush speed
        DelayTime = 2, -- Time before starting cycles (seconds)
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true, -- Enabled
            1, -- Time (seconds)
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 0.5,
        },
        CamShake = {
            false, -- Enabled
            {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
            100, -- Shake start distance (from Entity to you)
        },
        Jumpscare = {
            true, -- Enabled ('false' if you don't want jumpscare)
            {
                Image1 = "rbxassetid://11367716419", -- Image1 url
                Image2 = "rbxassetid://11367716419", -- Image2 url
                Shake = true,
                Sound1 = {
                    10483790459, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Sound2 = {
                    10483837590, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Flashing = {
                    true, -- Enabled
                    Color3.fromRGB(0, 100, 100), -- Color
                },
                Tease = {
                    false, -- Enabled ('false' if you don't want tease)
                    Min = 1,
                    Max = 3,
                },
            },
        },
        CustomDialog = {"You died to LSPLASH", "They only killed you to ruin your fun."}, -- Custom death message (can be as long as you want)
    })
    
    -----[[ Advanced ]]-----
    entity.Debug.OnEntitySpawned = function(entityModel)
        print("Entity has spawned:", entityModel)
    end
    
    entity.Debug.OnEntityDespawned = function(entityModel)
        print("Entity has despawned:", mentityModelodel)
    end
    
    entity.Debug.OnEntityStartMoving = function(entityModel)
        print("Entity has started moving:", entityModel)
    end
    
    entity.Debug.OnEntityFinishedRebound = function(entityModel)
        print("Entity finished rebound:", entityModel)
    end
    
    entity.Debug.OnDeath = function()
        warn("You died.")
    end
    ------------------------
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Angry Munci [KILLABLE]", "Summons Angry Munci Who Kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/AngryMunci.rbxm?raw=true",
        Speed = 650,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 8,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to Angry Munci.", "He is very angry.", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Big Games [KILLABLE]", "Summons Big Games who kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/BIGGAMES.rbxm?raw=true",
        Speed = 500,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 8,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to Big Games.", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("BigHead [KILLABLE]", "Summons BigHead who kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/BigHead.rbxm?raw=true",
        Speed = 500,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 8,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to the Big Head.", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Depth [KILLABLE]", "Summons Depth who kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Depth.rbxm?raw=true",
        Speed = 500,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 8,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to Depth.", "This is a fan-made concept!", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Doge [KILLABLE]", "Summons Doge who kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Doge.rbxm?raw=true",
        Speed = 500,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 8,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to Doge.", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Freddy Fazbear [KILLABLE]", "Summons Freddy Fazbear that kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        CustomName = "Freddy Fazbear", -- Custom name of your entity
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/FreddyFazbear.rbxm?raw=true", -- Can be GitHub file or rbxassetid
        Speed = 200, -- Percentage, 100 = default Rush speed
        DelayTime = 2, -- Time before starting cycles (seconds)
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
            true, -- Enabled
            1, -- Time (seconds)
        },
        Cycles = {
            Min = 1,
            Max = 4,
            WaitTime = 2,
        },
        CamShake = {
            true, -- Enabled
            {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
            100, -- Shake start distance (from Entity to you)
        },
        Jumpscare = {
            true, -- Enabled ('false' if you don't want jumpscare)
            {
                Image1 = "rbxassetid://7084794697", -- Image1 url
                Image2 = "rbxassetid://7084794697", -- Image2 url
                Shake = true,
                Sound1 = {
                    0, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Sound2 = {
                    2050521432, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Flashing = {
                    true, -- Enabled
                    Color3.fromRGB(92, 64, 51), -- Color
                },
                Tease = {
                    false, -- Enabled ('false' if you don't want tease)
                    Min = 1,
                    Max = 3,
                },
            },
        },
        CustomDialog = {"You died to Freddy Fazbear.", "Shutting the doors on him doesn't seem to stop him anymore.", "Try to hide in the closets."}, -- Custom death message (can be as long as you want)
    })
    
    -----[[ Advanced ]]-----
    entity.Debug.OnEntitySpawned = function(entityModel)
        print("Entity has spawned:", entityModel)
    end
    
    entity.Debug.OnEntityDespawned = function(entityModel)
        print("Entity has despawned:", mentityModelodel)
    end
    
    entity.Debug.OnEntityStartMoving = function(entityModel)
        print("Entity has started moving:", entityModel)
    end
    
    entity.Debug.OnEntityFinishedRebound = function(entityModel)
        print("Entity finished rebound:", entityModel)
    end
    
    entity.Debug.OnDeath = function()
        warn("You died.")
    end
    ------------------------
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Bonnie [KILLABLE]", "Summons Bonnie From FNAF that kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Bonnie", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Bonnie.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 200, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    BreakLights = true,
    FlickerLights = {
        true, -- Enabled
        1, -- Time (seconds)
    },
    Cycles = {
        Min = 1,
        Max = 4,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled
        {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        true, -- Enabled ('false' if you don't want jumpscare)
        {
            Image1 = "rbxassetid://2729500165", -- Image1 url
            Image2 = "rbxassetid://2729500165", -- Image2 url
            Shake = true,
            Sound1 = {
                0, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                2050521432, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled
                Color3.fromRGB(48, 16, 107), -- Color
            },
            Tease = {
                false, -- Enabled ('false' if you don't want tease)
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"You died to Bonnie.", "Shutting the doors on him doesn't seem to stop him anymore.", "Try to hide in the closets."}, -- Custom death message (can be as long as you want)
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityModel)
    print("Entity has spawned:", entityModel)
end

entity.Debug.OnEntityDespawned = function(entityModel)
    print("Entity has despawned:", mentityModelodel)
end

entity.Debug.OnEntityStartMoving = function(entityModel)
    print("Entity has started moving:", entityModel)
end

entity.Debug.OnEntityFinishedRebound = function(entityModel)
    print("Entity finished rebound:", entityModel)
end

entity.Debug.OnDeath = function()
    warn("You died.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)
end)

Section:NewButton("Chica [KILLABLE]", "Summons Chica From FNAF that kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Chica", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Chica.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 200, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    BreakLights = true,
    FlickerLights = {
        true, -- Enabled
        1, -- Time (seconds)
    },
    Cycles = {
        Min = 1,
        Max = 4,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled
        {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        true, -- Enabled ('false' if you don't want jumpscare)
        {
            Image1 = "rbxassetid://3475269832", -- Image1 url
            Image2 = "rbxassetid://3475269832", -- Image2 url
            Shake = true,
            Sound1 = {
                0, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                2050521432, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled
                Color3.fromRGB(139, 128, 0), -- Color
            },
            Tease = {
                false, -- Enabled ('false' if you don't want tease)
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"You died to Chica.", "Shutting the doors on him doesn't seem to stop her anymore.", "Try to hide in the closets."}, -- Custom death message (can be as long as you want)
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityModel)
    print("Entity has spawned:", entityModel)
end

entity.Debug.OnEntityDespawned = function(entityModel)
    print("Entity has despawned:", mentityModelodel)
end

entity.Debug.OnEntityStartMoving = function(entityModel)
    print("Entity has started moving:", entityModel)
end

entity.Debug.OnEntityFinishedRebound = function(entityModel)
    print("Entity finished rebound:", entityModel)
end

entity.Debug.OnDeath = function()
    warn("You died.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)
end)

Section:NewButton("Flamingo [KILLABLE]", "Summons Flamingo that kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Flamingo", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Flamingo.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 250, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    BreakLights = true,
    FlickerLights = {
        true, -- Enabled
        1, -- Time (seconds)
    },
    Cycles = {
        Min = 2,
        Max = 6,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled
        {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        true, -- Enabled ('false' if you don't want jumpscare)
        {
            Image1 = "rbxassetid://9133214787", -- Image1 url
            Image2 = "rbxassetid://9133214787", -- Image2 url
            Shake = true,
            Sound1 = {
                0, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled
                Color3.fromRGB(255, 224, 189), -- Color
            },
            Tease = {
                false, -- Enabled ('false' if you don't want tease)
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"You died to Flamingo.", "Use the same tactics as Rush and Ambush!"}, -- Custom death message (can be as long as you want)
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityModel)
    print("Entity has spawned:", entityModel)
end

entity.Debug.OnEntityDespawned = function(entityModel)
    print("Entity has despawned:", mentityModelodel)
end

entity.Debug.OnEntityStartMoving = function(entityModel)
    print("Entity has started moving:", entityModel)
end

entity.Debug.OnEntityFinishedRebound = function(entityModel)
    print("Entity finished rebound:", entityModel)
end

entity.Debug.OnDeath = function()
    warn("You died.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)
end)

Section:NewButton("Foxy [KILLABLE]", "Summons Foxy From FNAF That Kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Foxy", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Foxy.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 200, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    BreakLights = true,
    FlickerLights = {
        true, -- Enabled
        1, -- Time (seconds)
    },
    Cycles = {
        Min = 1,
        Max = 4,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled
        {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        true, -- Enabled ('false' if you don't want jumpscare)
        {
            Image1 = "rbxassetid://3475910603", -- Image1 url
            Image2 = "rbxassetid://3475910603", -- Image2 url
            Shake = true,
            Sound1 = {
                0, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                2050521432, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled
                Color3.fromRGB(55, 0, 0), -- Color
            },
            Tease = {
                false, -- Enabled ('false' if you don't want tease)
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"You died to Foxy.", "Shutting the doors on him doesn't seem to stop him anymore.", "Try to hide in the closets."}, -- Custom death message (can be as long as you want)
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityModel)
    print("Entity has spawned:", entityModel)
end

entity.Debug.OnEntityDespawned = function(entityModel)
    print("Entity has despawned:", mentityModelodel)
end

entity.Debug.OnEntityStartMoving = function(entityModel)
    print("Entity has started moving:", entityModel)
end

entity.Debug.OnEntityFinishedRebound = function(entityModel)
    print("Entity finished rebound:", entityModel)
end

entity.Debug.OnDeath = function()
    warn("You died.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)
end)

Section:NewButton("Eater [KILLABLE]", "Summons Eater who kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Eater.rbxm?raw=true",
        Speed = 500,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 8,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to Eater.", "It is a fan-made concept!", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("El Gato [KILLABLE]", "Summons El Gatow who kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Elgato.rbxm?raw=true",
        Speed = 550,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 8,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to EL GATO.", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Greed [KILLABLE]", "Summons Greed who kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Greed.rbxm?raw=true",
        Speed = 450,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 8,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to Greed.", "It is a fan-made concept!", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Green from Rainbow Friends [KILLABLE]", "Summons Green from RF who kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/GreenRF.rbxm?raw=true",
        Speed = 525,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 8,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to Green.", "Wait.. He's from Rainbow Friends!", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Happy Munci [KILLABLE]", "Summons Happy Munci who kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/HappyMunci.rbxm?raw=true",
        Speed = 500,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to Happy Munci.", "Wait, That's Impossible!", "If you are seeing this text,", "That means you triggered Munci!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Hehehehaw [killable]", "Summons Hehehehaw who kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Hehehehaw.rbxm?raw=true",
        Speed = 500,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to Hehehehaw!", "HEHEHEHAW", "HEHEHEHAW", "UsE tHe SaMe TaCtIcS aS ruSh AnD aMbUsH!1"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Kardin Hong [KILLABLE]", "Summons the legendary and mythical speedrunner who kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Kardin.rbxm?raw=true",
        Speed = 5,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 1,
            Max = 1,
            WaitTime = 2,
        },
        CamShake = {
            false,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to Kardin Hong!", "The notorious DOORS speedrunner!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Moving Eyes [KILLABLE]", "Summons Moving Eyes who kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/MovingEyes.rbxm?raw=true",
        Speed = 500,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to the moving Eyes!", "Wait, that should be impossible!", "Hmm..", "That's strange..", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Obunga [KILLABLE]", "Summons Obunga who kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Obunga.rbxm?raw=true",
        Speed = 500,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to Obunga!", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Old Ambush [KILLABLE]", "Summons the old scrapped Ambush that kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        CustomName = "Old Ambush", -- Custom name of your entity
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/OldAmbush.rbxm?raw=true", -- Can be GitHub file or rbxassetid
        Speed = 225, -- Percentage, 100 = default Rush speed
        DelayTime = 2, -- Time before starting cycles (seconds)
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
            true, -- Enabled
            1, -- Time (seconds)
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 0.5,
        },
        CamShake = {
            false, -- Enabled
            {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
            100, -- Shake start distance (from Entity to you)
        },
        Jumpscare = {
            true, -- Enabled ('false' if you don't want jumpscare)
            {
                Image1 = "rbxassetid://0", -- Image1 url
                Image2 = "rbxassetid://11387541299", -- Image2 url
                Shake = true,
                Sound1 = {
                    10483790459, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Sound2 = {
                    10483837590, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Flashing = {
                    true, -- Enabled
                    Color3.fromRGB(102, 0, 0), -- Color
                },
                Tease = {
                    false, -- Enabled ('false' if you don't want tease)
                    Min = 1,
                    Max = 3,
                },
            },
        },
        CustomDialog = {"You died to the Old Ambush.", "Use the same tactics as the current Ambush!"}, -- Custom death message (can be as long as you want)
    })
    
    -----[[ Advanced ]]-----
    entity.Debug.OnEntitySpawned = function(entityModel)
        print("Entity has spawned:", entityModel)
    end
    
    entity.Debug.OnEntityDespawned = function(entityModel)
        print("Entity has despawned:", mentityModelodel)
    end
    
    entity.Debug.OnEntityStartMoving = function(entityModel)
        print("Entity has started moving:", entityModel)
    end
    
    entity.Debug.OnEntityFinishedRebound = function(entityModel)
        print("Entity finished rebound:", entityModel)
    end
    
    entity.Debug.OnDeath = function()
        warn("You died.")
    end
    ------------------------
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Orange From Rainbow Friends.", "Summons Orange From RF who kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Orange.rbxm?raw=true",
        Speed = 500,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to Orange!", "Wait.. Orange is from Rainbow Friends!", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("plamen6789rocks [KILLABLE]", "Summons the creator of this GUI who kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/plamen6789.rbxm?raw=true",
        Speed = 5,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 1,
            Max = 1,
            WaitTime = 2,
        },
        CamShake = {
            false,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to plamen6789rock's clones!", "They are very easy to survive due to their speeds.", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Old Private Jet [KILLABLE}", "Summons the old Private Jet who kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/PrivateJetU.rbxm?raw=true",
        Speed = 500,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to a Private Jet!", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("New Private Jet [KILLABLE]", "Summons the New Private Jet who kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/PrivateJet.rbxm?raw=true",
        Speed = 800,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 8,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to the new Private Jet!.", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Photon [KILLABLE]", "Summons Photon that kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Photon", -- Custom name of your entity
    Model = "https://github.com/Kardin12/lolcat/blob/main/Photon.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 250, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    BreakLights = true,
    FlickerLights = {
        true, -- Enabled
        1, -- Time (seconds)
    },
    Cycles = {
        Min = 2,
        Max = 6,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled
        {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        true, -- Enabled ('false' if you don't want jumpscare)
        {
            Image1 = "rbxassetid://4749623118", -- Image1 url
            Image2 = "rbxassetid://4749623118", -- Image2 url
            Shake = true,
            Sound1 = {
                0, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled
                Color3.fromRGB(0, 0, 255), -- Color
            },
            Tease = {
                true, -- Enabled ('false' if you don't want tease)
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"You died to Photon.", "Use the same tactics as Rush and Ambush!"}, -- Custom death message (can be as long as you want)
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityModel)
    print("Entity has spawned:", entityModel)
end

entity.Debug.OnEntityDespawned = function(entityModel)
    print("Entity has despawned:", mentityModelodel)
end

entity.Debug.OnEntityStartMoving = function(entityModel)
    print("Entity has started moving:", entityModel)
end

entity.Debug.OnEntityFinishedRebound = function(entityModel)
    print("Entity finished rebound:", entityModel)
end

entity.Debug.OnDeath = function()
    warn("You died.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)
end)

Section:NewButton("Pikachu [KILLABLE]", "Summons Pikachu that kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        CustomName = "Pikachu", -- Custom name of your entity
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Pikachu.rbxm?raw=true", -- Can be GitHub file or rbxassetid
        Speed = 250, -- Percentage, 100 = default Rush speed
        DelayTime = 2, -- Time before starting cycles (seconds)
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
            true, -- Enabled
            1, -- Time (seconds)
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 2,
        },
        CamShake = {
            true, -- Enabled
            {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
            100, -- Shake start distance (from Entity to you)
        },
        Jumpscare = {
            true, -- Enabled ('false' if you don't want jumpscare)
            {
                Image1 = "rbxassetid://488201647", -- Image1 url
                Image2 = "rbxassetid://488201647", -- Image2 url
                Shake = true,
                Sound1 = {
                    0, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Sound2 = {
                    131218535, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Flashing = {
                    true, -- Enabled
                    Color3.fromRGB(255, 255, 0), -- Color
                },
                Tease = {
                    false, -- Enabled ('false' if you don't want tease)
                    Min = 1,
                    Max = 3,
                },
            },
        },
        CustomDialog = {"You died to Pikachu.", "Use the same tactics as Rush and Ambush!"}, -- Custom death message (can be as long as you want)
    })
    
    -----[[ Advanced ]]-----
    entity.Debug.OnEntitySpawned = function(entityModel)
        print("Entity has spawned:", entityModel)
    end
    
    entity.Debug.OnEntityDespawned = function(entityModel)
        print("Entity has despawned:", mentityModelodel)
    end
    
    entity.Debug.OnEntityStartMoving = function(entityModel)
        print("Entity has started moving:", entityModel)
    end
    
    entity.Debug.OnEntityFinishedRebound = function(entityModel)
        print("Entity finished rebound:", entityModel)
    end
    
    entity.Debug.OnDeath = function()
        warn("You died.")
    end
    ------------------------
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Rage [KILLABLE]", "Summons Rage who kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Rage.rbxm?raw=true",
        Speed = 500,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to Rage!", "This is a fan-made concept!", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Silence [KILLABLE]", "Summons Silence that kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        CustomName = "Silence", -- Custom name of your entity
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Silence.rbxm?raw=true", -- Can be GitHub file or rbxassetid
        Speed = 175, -- Percentage, 100 = default Rush speed
        DelayTime = 2, -- Time before starting cycles (seconds)
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
            true, -- Enabled
            1, -- Time (seconds)
        },
        Cycles = {
            Min = 3,
            Max = 8,
            WaitTime = 2,
        },
        CamShake = {
            false, -- Enabled
            {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
            100, -- Shake start distance (from Entity to you)
        },
        Jumpscare = {
            true, -- Enabled ('false' if you don't want jumpscare)
            {
                Image1 = "rbxassetid://11393319553", -- Image1 url
                Image2 = "rbxassetid://11393319553", -- Image2 url
                Shake = true,
                Sound1 = {
                    0, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Sound2 = {
                    10483837590, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Flashing = {
                    true, -- Enabled
                    Color3.fromRGB(255, 255, 255), -- Color
                },
                Tease = {
                    false, -- Enabled ('false' if you don't want tease)
                    Min = 1,
                    Max = 3,
                },
            },
        },
        CustomDialog = {"You died to Silence.", "Make sure to hide in a closet!"}, -- Custom death message (can be as long as you want)
    })
    
    -----[[ Advanced ]]-----
    entity.Debug.OnEntitySpawned = function(entityModel)
        print("Entity has spawned:", entityModel)
    end
    
    entity.Debug.OnEntityDespawned = function(entityModel)
        print("Entity has despawned:", mentityModelodel)
    end
    
    entity.Debug.OnEntityStartMoving = function(entityModel)
        print("Entity has started moving:", entityModel)
    end
    
    entity.Debug.OnEntityFinishedRebound = function(entityModel)
        print("Entity finished rebound:", entityModel)
    end
    
    entity.Debug.OnDeath = function()
        warn("You died.")
    end
    ------------------------
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Sandwich/Yoyoblocx [KILLABLE]", "Summons my friend yoyoblocx which kills you.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        CustomName = "Yoyoblocx", -- Custom name of your entity
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Yoyoblocx.rbxm?raw=true", -- Can be GitHub file or rbxassetid
        Speed = 225, -- Percentage, 100 = default Rush speed
        DelayTime = 2, -- Time before starting cycles (seconds)
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
            true, -- Enabled
            1, -- Time (seconds)
        },
        Cycles = {
            Min = 1,
            Max = 4,
            WaitTime = 2,
        },
        CamShake = {
            true, -- Enabled
            {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
            100, -- Shake start distance (from Entity to you)
        },
        Jumpscare = {
            true, -- Enabled ('false' if you don't want jumpscare)
            {
                Image1 = "rbxassetid://11233906150", -- Image1 url
                Image2 = "rbxassetid://11384222407", -- Image2 url
                Shake = true,
                Sound1 = {
                    10483790459, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Sound2 = {
                    10483837590, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Flashing = {
                    true, -- Enabled
                    Color3.fromRGB(255, 174, 66), -- Color
                },
                Tease = {
                    true, -- Enabled ('false' if you don't want tease)
                    Min = 1,
                    Max = 3,
                },
            },
        },
        CustomDialog = {"You died to Yoyoblocx.", "He always wanted to be in the game so I added him.", "Use the same tactics as Rush and Ambush!"}, -- Custom death message (can be as long as you want)
    })
    
    -----[[ Advanced ]]-----
    entity.Debug.OnEntitySpawned = function(entityModel)
        print("Entity has spawned:", entityModel)
    end
    
    entity.Debug.OnEntityDespawned = function(entityModel)
        print("Entity has despawned:", mentityModelodel)
    end
    
    entity.Debug.OnEntityStartMoving = function(entityModel)
        print("Entity has started moving:", entityModel)
    end
    
    entity.Debug.OnEntityFinishedRebound = function(entityModel)
        print("Entity finished rebound:", entityModel)
    end
    
    entity.Debug.OnDeath = function()
        warn("You died.")
    end
    ------------------------
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Scoobis [KILLABLE]", "Summons Scoobis who kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Scoobis.rbxm?raw=true",
        Speed = 500,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to Scoobis!", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Slenderman [KILLABLE]", "Summons Slenderman who kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Slenderman.rbxm?raw=true",
        Speed = 250,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 8,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to Slenderman!", "You collected all of his pages.", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)


Section:NewButton("Stare [KILLABLE]", "Summons Stare who kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Stare.rbxm?raw=true",
        Speed = 500,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to Stare!", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Troll Face Ambush [KILLABLE]", "Summons Troll Face Ambush who kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/TrollFaceAmbush.rbxm?raw=true",
        Speed = 500,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to the Trololo Ambush!", "The image for Trololo Ambush is from reddit user: r/temportrium", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Troll Face Rush [KILLABLE]", "Summons Troll Face Rush who kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/TrollRush.rbxm?raw=true",
        Speed = 500,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 1,
            Max = 1,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to TrollFace Rush!", "The image for TrollFace Rush is from reddit user: r/Filberto_ossani2", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("The Rock [KILLABLE]", "Summons The Rock that kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "The Rock", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/TheRock.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 250, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    BreakLights = true,
    FlickerLights = {
        true, -- Enabled
        1, -- Time (seconds)
    },
    Cycles = {
        Min = 2,
        Max = 6,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled
        {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        true, -- Enabled ('false' if you don't want jumpscare)
        {
            Image1 = "rbxassetid://8425069718", -- Image1 url
            Image2 = "rbxassetid://8425069718", -- Image2 url
            Shake = true,
            Sound1 = {
                0, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled
                Color3.fromRGB(255, 224, 189), -- Color
            },
            Tease = {
                false, -- Enabled ('false' if you don't want tease)
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"You died to The Rock.", "Use the same tactics as Rush and Ambush!"}, -- Custom death message (can be as long as you want)
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityModel)
    print("Entity has spawned:", entityModel)
end

entity.Debug.OnEntityDespawned = function(entityModel)
    print("Entity has despawned:", mentityModelodel)
end

entity.Debug.OnEntityStartMoving = function(entityModel)
    print("Entity has started moving:", entityModel)
end

entity.Debug.OnEntityFinishedRebound = function(entityModel)
    print("Entity finished rebound:", entityModel)
end

entity.Debug.OnDeath = function()
    warn("You died.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)
end)

Section:NewButton("Wise Mystical Tree [KILLABLE]", "Summons the Wise Mystical Tree who kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Wise Mystical Tree.rbxm?raw=true",
        Speed = 500,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 0.5,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to the Wise Mystical Tree!", "Are you over 25 and have a personal computer?", "Then download this game now!", "Also, the sound for the Wise Mystical Tree is copyrighted!", "Yay!", "Use the same tactics as Rush and Ambush!"},
    })
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("LSPLASH [KILLABLE]", "Summons LSPLASH which kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        CustomName = "LSPLASH", -- Custom name of your entity
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/LSPLASH.rbxm?raw=true", -- Can be GitHub file or rbxassetid
        Speed = 650, -- Percentage, 100 = default Rush speed
        DelayTime = 2, -- Time before starting cycles (seconds)
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
            true, -- Enabled
            1, -- Time (seconds)
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 0.5,
        },
        CamShake = {
            false, -- Enabled
            {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
            100, -- Shake start distance (from Entity to you)
        },
        Jumpscare = {
            true, -- Enabled ('false' if you don't want jumpscare)
            {
                Image1 = "rbxassetid://11367716419", -- Image1 url
                Image2 = "rbxassetid://11367716419", -- Image2 url
                Shake = true,
                Sound1 = {
                    10483790459, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Sound2 = {
                    10483837590, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Flashing = {
                    true, -- Enabled
                    Color3.fromRGB(0, 100, 100), -- Color
                },
                Tease = {
                    false, -- Enabled ('false' if you don't want tease)
                    Min = 1,
                    Max = 3,
                },
            },
        },
        CustomDialog = {"You died to LSPLASH", "They only killed you to ruin your fun."}, -- Custom death message (can be as long as you want)
    })
    
    -----[[ Advanced ]]-----
    entity.Debug.OnEntitySpawned = function(entityModel)
        print("Entity has spawned:", entityModel)
    end
    
    entity.Debug.OnEntityDespawned = function(entityModel)
        print("Entity has despawned:", mentityModelodel)
    end
    
    entity.Debug.OnEntityStartMoving = function(entityModel)
        print("Entity has started moving:", entityModel)
    end
    
    entity.Debug.OnEntityFinishedRebound = function(entityModel)
        print("Entity finished rebound:", entityModel)
    end
    
    entity.Debug.OnDeath = function()
        warn("You died.")
    end
    ------------------------
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Peter Griffin [KILLABLE]", "Summons Peter Griffin that kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        CustomName = "Peter Griffin", -- Custom name of your entity
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/PeterGriffin.rbxm?raw=true", -- Can be GitHub file or rbxassetid
        Speed = 300, -- Percentage, 100 = default Rush speed
        DelayTime = 2, -- Time before starting cycles (seconds)
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
            true, -- Enabled
            1, -- Time (seconds)
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 0.5,
        },
        CamShake = {
            false, -- Enabled
            {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
            100, -- Shake start distance (from Entity to you)
        },
        Jumpscare = {
            true, -- Enabled ('false' if you don't want jumpscare)
            {
                Image1 = "rbxassetid://11380974265", -- Image1 url
                Image2 = "rbxassetid://11380974265", -- Image2 url
                Shake = true,
                Sound1 = {
                    10483790459, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Sound2 = {
                    4753228365, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Flashing = {
                    true, -- Enabled
                    Color3.fromRGB(255, 255, 255), -- Color
                },
                Tease = {
                    true, -- Enabled ('false' if you don't want tease)
                    Min = 1,
                    Max = 3,
                },
            },
        },
        CustomDialog = {"You died to Peter Griffin.", "Use the same tactics as Rush and Ambush!"}, -- Custom death message (can be as long as you want)
    })
    
    -----[[ Advanced ]]-----
    entity.Debug.OnEntitySpawned = function(entityModel)
        print("Entity has spawned:", entityModel)
    end
    
    entity.Debug.OnEntityDespawned = function(entityModel)
        print("Entity has despawned:", mentityModelodel)
    end
    
    entity.Debug.OnEntityStartMoving = function(entityModel)
        print("Entity has started moving:", entityModel)
    end
    
    entity.Debug.OnEntityFinishedRebound = function(entityModel)
        print("Entity finished rebound:", entityModel)
    end
    
    entity.Debug.OnDeath = function()
        warn("You died.")
    end
    ------------------------
    
    -- Run the created entity
    Creator.runEntity(entity)
end)

Section:NewButton("Scratch Cat [KILLABLE]", "Summons Scratch Cat that kills.", function()
    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

    -- Create entity
    local entity = Creator.createEntity({
        CustomName = "Scratch Cat", -- Custom name of your entity
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/ScratchCat.rbxm?raw=true", -- Can be GitHub file or rbxassetid
        Speed = 500, -- Percentage, 100 = default Rush speed
        DelayTime = 2, -- Time before starting cycles (seconds)
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
            true, -- Enabled
            1, -- Time (seconds)
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 0.5,
        },
        CamShake = {
            false, -- Enabled
            {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
            100, -- Shake start distance (from Entity to you)
        },
        Jumpscare = {
            true, -- Enabled ('false' if you don't want jumpscare)
            {
                Image1 = "rbxassetid://11380973660", -- Image1 url
                Image2 = "rbxassetid://11380973660", -- Image2 url
                Shake = true,
                Sound1 = {
                    10483790459, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Sound2 = {
                    5104257032, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Flashing = {
                    true, -- Enabled
                    Color3.fromRGB(255, 255, 0), -- Color
                },
                Tease = {
                    true, -- Enabled ('false' if you don't want tease)
                    Min = 1,
                    Max = 3,
                },
            },
        },
        CustomDialog = {"You died to Scratch Cat.", "Use the same tactic as Rush and Ambush!"}, -- Custom death message (can be as long as you want)
    })
    
    -----[[ Advanced ]]-----
    entity.Debug.OnEntitySpawned = function(entityModel)
        print("Entity has spawned:", entityModel)
    end
    
    entity.Debug.OnEntityDespawned = function(entityModel)
        print("Entity has despawned:", mentityModelodel)
    end
    
    entity.Debug.OnEntityStartMoving = function(entityModel)
        print("Entity has started moving:", entityModel)
    end
    
    entity.Debug.OnEntityFinishedRebound = function(entityModel)
        print("Entity finished rebound:", entityModel)
    end
    
    entity.Debug.OnDeath = function()
        warn("You died.")
    end
    ------------------------
    
    -- Run the created entity
    Creator.runEntity(entity)
end)


--Entity Summoner Time
local Tab = Window:NewTab("Entity Timer")
local Section = Tab:NewSection("Summon Entities Every Couple Of Seconds/Minutes Etc")

Section:NewButton("Halt Every 15 Secs", "Summons Halt every 15 seconds. [IRREVERSIBLE]", function()
    local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

    while true do -- Will run the script forever
      coroutine.wrap(function() require(game.ReplicatedStorage.ClientModules.EntityModules.Shade).stuff(Data, workspace.CurrentRooms[tostring(game.ReplicatedStorage.GameData.LatestRoom.Value)]) end)() -- Coroutines prevent the script from yielding.
    task.wait(15) -- Waits somewhere around a millisecond before executing again. This is necessary so that the script won't crash your game. You can also add a time as such: task.wait(1) or task.wait(0.5)
    end
end)

Section:NewButton("Screech Every 15 Secs", "Summons Screech every 15 seconds. [IRREVERSIBLE]", function()
    local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

    while true do -- Will run the script forever
      coroutine.wrap(function() require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.Screech)(Data) end)() -- Coroutines prevent the script from yielding.
    task.wait(15) -- Waits somewhere around a millisecond before executing again. This is necessary so that the script won't crash your game. You can also add a time as such: task.wait(1) or task.wait(0.5)
    end
end)

Section:NewButton("Glitch Every 15 Secs", "Summons Glitch every 15 seconds. [IRREVERSIBLE]", function()
    local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

    while true do -- Will run the script forever
      coroutine.wrap(function() require(game.ReplicatedStorage.ClientModules.EntityModules.Glitch).stuff(Data, workspace.CurrentRooms[tostring(game.ReplicatedStorage.GameData.LatestRoom.Value)]) end)() -- Coroutines prevent the script from yielding.
    task.wait(15) -- Waits somewhere around a millisecond before executing again. This is necessary so that the script won't crash your game. You can also add a time as such: task.wait(1) or task.wait(0.5)
    end
end)

Section:NewButton("Rush Every 15 Secs", "Summons Rush every 15 seconds.", function()
    local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

    while true do -- Will run the script forever
      coroutine.wrap(function() local speed = 75
    local rush = Instance.new("Model", game:GetService("Teams"))
    rush.Name = "RushMoving"
    game:GetService("ReplicatedStorage").JumpscareModels.RushNew:Clone().Parent = rush
    rush.RushNew.CanCollide = false
    local tweensv = game:GetService("TweenService")
    local currentLoadedRoom
    local firstLoadedRoom
    
    local function setRooms()
        local tb = {}
        table.foreach(workspace.CurrentRooms:GetChildren(), function(_, r)
            if r:FindFirstChild("RoomStart") and r.Name~="0" then
                table.insert(tb, tonumber(r.Name))
            end
        end)
        firstLoadedRoom = workspace.CurrentRooms[tostring(math.min(unpack(tb)))]
        currentLoadedRoom = workspace.CurrentRooms[tostring(math.max(unpack(tb)) - 1)]
        workspace.CurrentRooms.ChildAdded:Connect(function()
            local tb = {}
            table.foreach(workspace.CurrentRooms:GetChildren(), function(_, r)
                if r:FindFirstChild("RoomStart") and r.Name~="0" then
                    table.insert(tb, tonumber(r.Name))
                end
            end)
            currentLoadedRoom = workspace.CurrentRooms[tostring(math.max(unpack(tb)) - 1)]
        end)
    end
    setRooms()
    
    rush.Parent = workspace
    rush:MoveTo(firstLoadedRoom.RoomStart.Position + Vector3.new(0, 5.2, 0))
    require(game.ReplicatedStorage.ClientModules.Module_Events).flickerLights(tonumber(currentLoadedRoom.Name), 1)
    require(game.ReplicatedStorage.ClientModules.Module_Events).breakLights(firstLoadedRoom)
    
    rush.RushNew.Attachment.BlackTrail.Enabled = true
    rush.RushNew.PlaySound:Play()
    rush.RushNew.Footsteps:Play()
    wait(5)
    for _, room in pairs(workspace.CurrentRooms:GetChildren()) do
        if not room:FindFirstChild("Nodes") then
            continue
        end
        local nodeNum = #room.Nodes:GetChildren()
        for _, node in pairs(room.Nodes:GetChildren()) do
            local timeC = (math.abs((node.Position - rush.RushNew.Position).Magnitude)) / speed
            tweensv
                :Create(rush.RushNew, TweenInfo.new(timeC, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                    CFrame = CFrame.new(node.CFrame.X, node.CFrame.Y + 5.2, node.CFrame.Z),
                })
                :Play()
            local random = math.random(1, nodeNum)
            if tonumber(node.Name) == random then -- first or last node? just choose please
                require(game.ReplicatedStorage.ClientModules.Module_Events).breakLights(room)
            end
            task.wait(timeC)
        end
        if room == currentLoadedRoom then
            task.wait(1)
            tweensv
                :Create(rush.RushNew, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                    CFrame = CFrame.new(rush.RushNew.CFrame.X, -50, rush.RushNew.CFrame.Z),
                })
                :Play()
            wait(0.5)
            rush:Destroy()
            currentLoadedRoom:WaitForChild("Door").ClientOpen:FireServer()
        end
    end
     end)() -- Coroutines prevent the script from yielding.
    task.wait(15) -- Waits somewhere around a millisecond before executing again. This is necessary so that the script won't crash your game. You can also add a time as such: task.wait(1) or task.wait(0.5)
    end
end)

Section:NewButton("Ambush every 15 seconds", "Summons Ambush every 15 seconds. [IRREVERSIBLE]", function()
    local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

    while true do -- Will run the script forever
      coroutine.wrap(function()    local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()
    
    -- Create entity
    local entity = Creator.createEntity({
        CustomName = "Ambush", -- Custom name of your entity
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Ambush.rbxm?raw=true", -- Can be GitHub file or rbxassetid
        Speed = 200, -- Percentage, 100 = default Rush speed
        DelayTime = 3, -- Time before starting cycles (seconds)
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true, -- Enabled
            1, -- Time (seconds)
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 2,
        },
        CamShake = {
            true, -- Enabled
            {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
            100, -- Shake start distance (from Entity to you)
        },
        Jumpscare = {
            true, -- Enabled ('false' if you don't want jumpscare)
            {
                Image1 = "rbxassetid://10110576663", -- Image1 url
                Image2 = "rbxassetid://10110576663", -- Image2 url
                Shake = true,
                Sound1 = {
                    10483855823, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Sound2 = {
                    10483999903, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Flashing = {
                    true, -- Enabled
                    Color3.fromRGB(255, 255, 255), -- Color
                },
                Tease = {
                    true, -- Enabled ('false' if you don't want tease)
                    Min = 1,
                    Max = 3,
                },
            },
        },
        CustomDialog = {"You died to Ambush.", "You might need to hop in and out of your hiding spot a couple of times."}, -- Custom death message (can be as long as you want)
    })
    
    -----[[ Advanced ]]-----
    entity.Debug.OnEntitySpawned = function(entityModel)
        print("Entity has spawned:", entityModel)
    end
    
    entity.Debug.OnEntityDespawned = function(entityModel)
        print("Entity has despawned:", mentityModelodel)
    end
    
    entity.Debug.OnEntityStartMoving = function(entityModel)
        print("Entity has started moving:", entityModel)
    end
    
    entity.Debug.OnEntityFinishedRebound = function(entityModel)
        print("Entity finished rebound:", entityModel)
    end
    
    entity.Debug.OnDeath = function()
        warn("You died.")
    end
    ------------------------
    
    -- Run the created entity
    Creator.runEntity(entity) end)() -- Coroutines prevent the script from yielding.
    task.wait(15) -- Waits somewhere around a millisecond before executing again. This is necessary so that the script won't crash your game. You can also add a time as such: task.wait(1) or task.wait(0.5)
    end
end)

Section:NewButton("Timothy Every 15 seconds", "Summons Timothy every 15 seconds. [IRREVERSIBLE]", function()
    local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

    while true do -- Will run the script forever
      coroutine.wrap(function() local a = game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game
    require(a.RemoteListener.Modules.SpiderJumpscare)(require(a), workspace.CurrentRooms["0"].Assets.Dresser.DrawerContainer, 0.2) end)() -- Coroutines prevent the script from yielding.
    task.wait(15) -- Waits somewhere around a millisecond before executing again. This is necessary so that the script won't crash your game. You can also add a time as such: task.wait(1) or task.wait(0.5)
    end
end)

Section:NewButton("A-60 every 15 seconds", "Summons A-60 every 15 seconds. [IRREVERSIBLE]", function()
    local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

    while true do -- Will run the script forever
      coroutine.wrap(function() local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()
    
    -- Create entity
    local entity = Creator.createEntity({
        CustomName = "A-60", -- Custom name of your entity
        Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/A-60.rbxm?raw=true", -- Can be GitHub file or rbxassetid
        Speed = 850, -- Percentage, 100 = default Rush speed
        DelayTime = 2, -- Time before starting cycles (seconds)
        HeightOffset = 0,
        CanKill = false,
        BreakLights = true,
        FlickerLights = {
            true, -- Enabled
            1, -- Time (seconds)
        },
        Cycles = {
            Min = 2,
            Max = 6,
            WaitTime = 0.5,
        },
        CamShake = {
            false, -- Enabled
            {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
            100, -- Shake start distance (from Entity to you)
        },
        Jumpscare = {
            true, -- Enabled ('false' if you don't want jumpscare)
            {
                Image1 = "rbxassetid://11378592477", -- Image1 url
                Image2 = "rbxassetid://11360386086", -- Image2 url
                Shake = true,
                Sound1 = {
                    10483790459, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Sound2 = {
                    10483837590, -- SoundId
                    { Volume = 0.5 }, -- Sound properties
                },
                Flashing = {
                    true, -- Enabled
                    Color3.fromRGB(102, 0, 0), -- Color
                },
                Tease = {
                    true, -- Enabled ('false' if you don't want tease)
                    Min = 1,
                    Max = 3,
                },
            },
        },
        CustomDialog = {"You died to A-60.", "It is nearly impossible to survive it due to it's high speeds.", "Wait..", "You shouldn't be seeing this."}, -- Custom death message (can be as long as you want)
    })
    
    -----[[ Advanced ]]-----
    entity.Debug.OnEntitySpawned = function(entityModel)
        print("Entity has spawned:", entityModel)
    end
    
    entity.Debug.OnEntityDespawned = function(entityModel)
        print("Entity has despawned:", mentityModelodel)
    end
    
    entity.Debug.OnEntityStartMoving = function(entityModel)
        print("Entity has started moving:", entityModel)
    end
    
    entity.Debug.OnEntityFinishedRebound = function(entityModel)
        print("Entity finished rebound:", entityModel)
    end
    
    entity.Debug.OnDeath = function()
        warn("You died.")
    end
    ------------------------
    
    -- Run the created entity
    Creator.runEntity(entity) end)() -- Coroutines prevent the script from yielding.
    task.wait(15) -- Waits somewhere around a millisecond before executing again. This is necessary so that the script won't crash your game. You can also add a time as such: task.wait(1) or task.wait(0.5)
    end
end)

Section:NewButton("Eyes every 15 secs [no damage]", "Summons Eyes every 15 seconds which deals no damage.", function()
    local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

    while true do -- Will run the script forever
      coroutine.wrap(function() local enableDamage = false
    
    local currentLoadedRoom=workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value]
    local eyes=game:GetObjects("rbxassetid://11388969546")[1]
    
    if eyes then end
    game.Workspace.CurrentRooms.ChildAdded:Connect(function()
        game.Workspace:FindFirstChild("Eyes"):Destroy()
        enableDamage = false
    end)
    local num=math.floor(#currentLoadedRoom.Nodes:GetChildren()/2)
    eyes.CFrame=(
        num==0 and currentLoadedRoom.Base or currentLoadedRoom.Nodes[num]
    ).CFrame+Vector3.new(0,7,0)
    
    eyes.Parent=workspace
    eyes.Ambience:Play()
    task.wait(.5)
    eyes.Attachment.Eyes.Enabled=true
    
    local hum=game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    while true and enableDamage do
        local _,found=workspace.CurrentCamera:WorldToScreenPoint(eyes.Position)
        if found then
            hum.Health-=10
            eyes.Attack:Play()
            if hum.Health<=0 then
                game:GetService("ReplicatedStorage").GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "Eyes"
                debug.setupvalue(getconnections(game:GetService("ReplicatedStorage").Bricks.DeathHint.OnClientEvent)[1].Function, 1, {
                    "You died to the Eyes...", "They don't like to be stared at."
                })
            end
        end
        task.wait(.1)
    end end)() -- Coroutines prevent the script from yielding.
    task.wait(15) -- Waits somewhere around a millisecond before executing again. This is necessary so that the script won't crash your game. You can also add a time as such: task.wait(1) or task.wait(0.5)
    end
end)

Section:NewButton("Eyes every 15 secs [Deals Damage]", "Summons Eyes every 15 seconds which deals damage.", function()
    local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

    while true do -- Will run the script forever
      coroutine.wrap(function() local enableDamage = true
    
    local currentLoadedRoom=workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value]
    local eyes=game:GetObjects("rbxassetid://11388969546")[1]
    
    if eyes then end
    game.Workspace.CurrentRooms.ChildAdded:Connect(function()
        game.Workspace:FindFirstChild("Eyes"):Destroy()
        enableDamage = false
    end)
    local num=math.floor(#currentLoadedRoom.Nodes:GetChildren()/2)
    eyes.CFrame=(
        num==0 and currentLoadedRoom.Base or currentLoadedRoom.Nodes[num]
    ).CFrame+Vector3.new(0,7,0)
    
    eyes.Parent=workspace
    eyes.Ambience:Play()
    task.wait(.5)
    eyes.Attachment.Eyes.Enabled=true
    
    local hum=game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    while true and enableDamage do
        local _,found=workspace.CurrentCamera:WorldToScreenPoint(eyes.Position)
        if found then
            hum.Health-=10
            eyes.Attack:Play()
            if hum.Health<=0 then
                game:GetService("ReplicatedStorage").GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "Eyes"
                debug.setupvalue(getconnections(game:GetService("ReplicatedStorage").Bricks.DeathHint.OnClientEvent)[1].Function, 1, {
                    "You died to the Eyes...", "They don't like to be stared at."
                })
            end
        end
        task.wait(.1)
    end end)() -- Coroutines prevent the script from yielding.
    task.wait(15) -- Waits somewhere around a millisecond before executing again. This is necessary so that the script won't crash your game. You can also add a time as such: task.wait(1) or task.wait(0.5)
    end
end)

--Entity Summons every Room
local Tab = Window:NewTab("Entity On Each Door")
local Section = Tab:NewSection("Spawns an entity each time a door is opened.")

Section:NewLabel("Eyes does not work to let you know.")
Section:NewLabel("Eyes instantly despawns due to his code.")

Section:NewButton("Halt Every Door", "Summons Halt every door. [IRREVERSIBLE]", function()
    local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

    game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()
    require(game.ReplicatedStorage.ClientModules.EntityModules.Shade).stuff(Data, workspace.CurrentRooms[tostring(game.ReplicatedStorage.GameData.LatestRoom.Value)])
    end)
end)

Section:NewButton("Screech Every Door", "Summons Screech every door. [IRREVERSIBLE]", function()
    local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

    game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()
        require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.Screech)(Data)
    end)
end)

Section:NewButton("Glitch Every Door", "Summons Glitch every door. [IRREVERSIBLE]", function()
    local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

    game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()
        require(game.ReplicatedStorage.ClientModules.EntityModules.Glitch).stuff(Data, workspace.CurrentRooms[tostring(game.ReplicatedStorage.GameData.LatestRoom.Value)])
    end)
end)

Section:NewButton("Rush Every Door", "Summons Rush every door. [IRREVERSIBLE]", function()
    local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

    game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()
        local speed = 75
local rush = Instance.new("Model", game:GetService("Teams"))
rush.Name = "RushMoving"
game:GetService("ReplicatedStorage").JumpscareModels.RushNew:Clone().Parent = rush
rush.RushNew.CanCollide = false
local tweensv = game:GetService("TweenService")
local currentLoadedRoom
local firstLoadedRoom

local function setRooms()
	local tb = {}
	table.foreach(workspace.CurrentRooms:GetChildren(), function(_, r)
		if r:FindFirstChild("RoomStart") and r.Name~="0" then
			table.insert(tb, tonumber(r.Name))
		end
	end)
	firstLoadedRoom = workspace.CurrentRooms[tostring(math.min(unpack(tb)))]
	currentLoadedRoom = workspace.CurrentRooms[tostring(math.max(unpack(tb)) - 1)]
	workspace.CurrentRooms.ChildAdded:Connect(function()
		local tb = {}
		table.foreach(workspace.CurrentRooms:GetChildren(), function(_, r)
			if r:FindFirstChild("RoomStart") and r.Name~="0" then
				table.insert(tb, tonumber(r.Name))
			end
		end)
		currentLoadedRoom = workspace.CurrentRooms[tostring(math.max(unpack(tb)) - 1)]
	end)
end
setRooms()

rush.Parent = workspace
rush:MoveTo(firstLoadedRoom.RoomStart.Position + Vector3.new(0, 5.2, 0))
require(game.ReplicatedStorage.ClientModules.Module_Events).flickerLights(tonumber(currentLoadedRoom.Name), 1)
require(game.ReplicatedStorage.ClientModules.Module_Events).breakLights(firstLoadedRoom)

rush.RushNew.Attachment.BlackTrail.Enabled = true
rush.RushNew.PlaySound:Play()
rush.RushNew.Footsteps:Play()
wait(5)
for _, room in pairs(workspace.CurrentRooms:GetChildren()) do
	if not room:FindFirstChild("Nodes") then
		continue
	end
	local nodeNum = #room.Nodes:GetChildren()
	for _, node in pairs(room.Nodes:GetChildren()) do
		local timeC = (math.abs((node.Position - rush.RushNew.Position).Magnitude)) / speed
		tweensv
			:Create(rush.RushNew, TweenInfo.new(timeC, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
				CFrame = CFrame.new(node.CFrame.X, node.CFrame.Y + 5.2, node.CFrame.Z),
			})
			:Play()
		local random = math.random(1, nodeNum)
		if tonumber(node.Name) == random then -- first or last node? just choose please
			require(game.ReplicatedStorage.ClientModules.Module_Events).breakLights(room)
		end
		task.wait(timeC)
	end
	if room == currentLoadedRoom then
		task.wait(1)
		tweensv
			:Create(rush.RushNew, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
				CFrame = CFrame.new(rush.RushNew.CFrame.X, -50, rush.RushNew.CFrame.Z),
			})
			:Play()
		wait(0.5)
		rush:Destroy()
		currentLoadedRoom:WaitForChild("Door").ClientOpen:FireServer()
	end
end
    end)
end)

Section:NewButton("Ambush Every Door", "Summons Ambush every door. [IRREVERSIBLE]", function()
    local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

    game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Ambush", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Ambush.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 300, -- Percentage, 100 = default Rush speed
    DelayTime = 3, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = false,
    BreakLights = true,
    FlickerLights = {
        true, -- Enabled
        1, -- Time (seconds)
    },
    Cycles = {
        Min = 2,
        Max = 6,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled
        {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        true, -- Enabled ('false' if you don't want jumpscare)
        {
            Image1 = "rbxassetid://10110576663", -- Image1 url
            Image2 = "rbxassetid://10110576663", -- Image2 url
            Shake = true,
            Sound1 = {
                10483855823, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483999903, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled ('false' if you don't want tease)
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"You died to Ambush.", "You might need to hop in and out of your hiding spot a couple of times."}, -- Custom death message (can be as long as you want)
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityModel)
    print("Entity has spawned:", entityModel)
end

entity.Debug.OnEntityDespawned = function(entityModel)
    print("Entity has despawned:", mentityModelodel)
end

entity.Debug.OnEntityStartMoving = function(entityModel)
    print("Entity has started moving:", entityModel)
end

entity.Debug.OnEntityFinishedRebound = function(entityModel)
    print("Entity finished rebound:", entityModel)
end

entity.Debug.OnDeath = function()
    warn("You died.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)
    end)
end)

Section:NewButton("Timothy Every Door", "Summons Timothy every door. [IRREVERSIBLE]", function()
    local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

    game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()
        local a = game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game
require(a.RemoteListener.Modules.SpiderJumpscare)(require(a), workspace.CurrentRooms["0"].Assets.Dresser.DrawerContainer, 0.2)
    end)
end)

Section:NewButton("Seek's Eyes Every Door", "Summons Seek's eyes every door. [IRREVERSIBLE]", function()
    local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

    game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()
        require(game:GetService("ReplicatedStorage").ClientModules.EntityModules.Seek).tease(nil, workspace.CurrentRooms:WaitForChild(game.ReplicatedStorage.GameData.LatestRoom.Value), 14, 1665596753, true)
    end)
end)

Section:NewButton("Bloodroom Every Door", "Summons the Bloodroom every door. [IRREVERSIBLE]", function()
    local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

    game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()
        firesignal(game.ReplicatedStorage.Bricks.UseEventModule.OnClientEvent, "tryp", workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value], 999999)
    end)
end)

Section:NewButton("A-60 Every Door", "Summons A-60 every door. [IRREVERSIBLE]", function()
    local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)

    game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "A-60", -- Custom name of your entity
    Model = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/A-60.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 850, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = false,
    BreakLights = true,
    FlickerLights = {
        true, -- Enabled
        1, -- Time (seconds)
    },
    Cycles = {
        Min = 2,
        Max = 6,
        WaitTime = 0.5,
    },
    CamShake = {
        false, -- Enabled
        {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        true, -- Enabled ('false' if you don't want jumpscare)
        {
            Image1 = "rbxassetid://11378592477", -- Image1 url
            Image2 = "rbxassetid://11360386086", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled
                Color3.fromRGB(102, 0, 0), -- Color
            },
            Tease = {
                true, -- Enabled ('false' if you don't want tease)
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"You died to A-60.", "It is nearly impossible to survive it due to it's high speeds.", "Wait..", "You shouldn't be seeing this."}, -- Custom death message (can be as long as you want)
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityModel)
    print("Entity has spawned:", entityModel)
end

entity.Debug.OnEntityDespawned = function(entityModel)
    print("Entity has despawned:", mentityModelodel)
end

entity.Debug.OnEntityStartMoving = function(entityModel)
    print("Entity has started moving:", entityModel)
end

entity.Debug.OnEntityFinishedRebound = function(entityModel)
    print("Entity finished rebound:", entityModel)
end

entity.Debug.OnDeath = function()
    warn("You died.")
end
------------------------

-- Run the created entity
Creator.runEntity(entity)
    end)
end)

--Extras
local Tab = Window:NewTab("Extra")
local Section = Tab:NewSection("Extras")

Section:NewButton("Red Room", "Summons the Red Room. [No Jack]", function()
    local currentLoadedRoom
    local function setRooms()
        local tb = {}
        table.foreach(workspace.CurrentRooms:GetChildren(), function(_, r)
            if r:FindFirstChild("RoomStart") then
                table.insert(tb, tonumber(r.Name))
            end
        end)
        currentLoadedRoom = workspace.CurrentRooms[tostring(math.max(unpack(tb)) - 1)]
    end
    setRooms()
    require(game.ReplicatedStorage.ClientModules.Module_Events).tryp(currentLoadedRoom, 9e307)
end)

Section:NewButton("Infinite Yield", "Gives you Infinite Yield admin.", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

Section:NewButton("Vynixius Hub", "Gives you the Vynixius Hub.", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Loader.lua"))()
end)

Section:NewButton("Orion GUI", "Gives you the Orion GUI.", function()
    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    local Window = OrionLib:MakeWindow({IntroText = "Doors GUI v1.2",Name = "Doors", HidePremium = false, SaveConfig = true, ConfigFolder = "DoorsSex"})
    if game.PlaceId == 6516141723 then
        OrionLib:MakeNotification({
            Name = "Error",
            Content = "Please execute when in game, not in lobby.",
            Time = 2
        })
    end
    local VisualsTab = Window:MakeTab({
        Name = "Visuals",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    local CF = CFrame.new
    local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom
    local ChaseStart = game:GetService("ReplicatedStorage").GameData.ChaseStart
    
    local KeyChams = {}
    VisualsTab:AddToggle({
        Name = "Key Chams",
        Default = false,
        Flag = "KeyToggle",
        Save = true,
        Callback = function(Value)
            for i,v in pairs(KeyChams) do
                v.Enabled = Value
            end
        end    
    })
    
    local function ApplyKeyChams(inst)
        wait()
        local Cham = Instance.new("Highlight")
        Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        Cham.FillColor = Color3.new(0.980392, 0.670588, 0)
        Cham.FillTransparency = 0.5
        Cham.OutlineColor = Color3.new(0.792156, 0.792156, 0.792156)
        Cham.Parent = game:GetService("CoreGui")
        Cham.Adornee = inst
        Cham.Enabled = OrionLib.Flags["KeyToggle"].Value
        Cham.RobloxLocked = true
        return Cham
    end
    
    local KeyCoroutine = coroutine.create(function()
        workspace.CurrentRooms.DescendantAdded:Connect(function(inst)
            if inst.Name == "KeyObtain" then
                table.insert(KeyChams,ApplyKeyChams(inst))
            end
        end)
    end)
    for i,v in ipairs(workspace:GetDescendants()) do
        if v.Name == "KeyObtain" then
            table.insert(KeyChams,ApplyKeyChams(v))
        end
    end
    coroutine.resume(KeyCoroutine)
    
    local BookChams = {}
    VisualsTab:AddToggle({
        Name = "Book Chams",
        Default = false,
        Flag = "BookToggle",
        Save = true,
        Callback = function(Value)
            for i,v in pairs(BookChams) do
                v.Enabled = Value
            end
        end    
    })
    
    local FigureChams = {}
    VisualsTab:AddToggle({
        Name = "Figure Chams",
        Default = false,
        Flag = "FigureToggle",
        Save = true,
        Callback = function(Value)
            for i,v in pairs(FigureChams) do
                v.Enabled = Value
            end
        end
    })
    
    local function ApplyBookChams(inst)
        if inst:IsDescendantOf(game:GetService("Workspace").CurrentRooms:FindFirstChild("50")) and game:GetService("ReplicatedStorage").GameData.LatestRoom.Value == 50 then
            wait()
            local Cham = Instance.new("Highlight")
            Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            Cham.FillColor = Color3.new(0, 1, 0.749019)
            Cham.FillTransparency = 0.5
            Cham.OutlineColor = Color3.new(0.792156, 0.792156, 0.792156)
            Cham.Parent = game:GetService("CoreGui")
            Cham.Enabled = OrionLib.Flags["BookToggle"].Value
            Cham.Adornee = inst
            Cham.RobloxLocked = true
            return Cham
        end
    end
    
    local function ApplyEntityChams(inst)
        wait()
        local Cham = Instance.new("Highlight")
        Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        Cham.FillColor = Color3.new(1, 0, 0)
        Cham.FillTransparency = 0.5
        Cham.OutlineColor = Color3.new(0.792156, 0.792156, 0.792156)
        Cham.Parent = game:GetService("CoreGui")
        Cham.Enabled = OrionLib.Flags["FigureToggle"].Value
        Cham.Adornee = inst
        Cham.RobloxLocked = true
        return Cham
    end
    
    local BookCoroutine = coroutine.create(function()
        task.wait(1)
        for i,v in pairs(game:GetService("Workspace").CurrentRooms["50"].Assets:GetDescendants()) do
            if v.Name == "LiveHintBook" then
                table.insert(BookChams,ApplyBookChams(v))
            end
        end
    end)
    local EntityCoroutine = coroutine.create(function()
        local Entity = game:GetService("Workspace").CurrentRooms["50"].FigureSetup:WaitForChild("FigureRagdoll",5)
        Entity:WaitForChild("Torso",2.5)
        table.insert(FigureChams,ApplyEntityChams(Entity))
    end)
    
    
    local GameTab = Window:MakeTab({
        Name = "Game",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    local CharTab = Window:MakeTab({
        Name = "Character",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    local TargetWalkspeed
    CharTab:AddSlider({
        Name = "Speed",
        Min = 0,
        Max = 50,
        Default = 5,
        Color = Color3.fromRGB(255,255,255),
        Increment = 1,
        Callback = function(Value)
            TargetWalkspeed = Value
        end    
    })
    
    local pcl = Instance.new("SpotLight")
    pcl.Brightness = 1
    pcl.Face = Enum.NormalId.Front
    pcl.Range = 90
    pcl.Parent = game.Players.LocalPlayer.Character.Head
    pcl.Enabled = false
    
    
    CharTab:AddToggle({
        Name = "Headlight",
        Default = false,
        Callback = function(Value)
            pcl.Enabled = Value
        end
    })
    
    GameTab:AddToggle({
        Name = "No seek arms/obstructions",
        Default = false,
        Flag = "NoSeek",
        Save = true
    })
    
    GameTab:AddToggle({
        Name = "Instant Interact",
        Default = false,
        Flag = "InstantToggle",
        Save = true
    })
    GameTab:AddButton({
        Name = "Skip level",
        Callback = function()
            pcall(function()
                local HasKey = false
                local CurrentDoor = workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door")
                for i,v in ipairs(CurrentDoor.Parent:GetDescendants()) do
                    if v.Name == "KeyObtain" then
                        HasKey = v
                    end
                end
                if HasKey then
                    game.Players.LocalPlayer.Character:PivotTo(CF(HasKey.Hitbox.Position))
                    wait(0.3)
                    fireproximityprompt(HasKey.ModulePrompt,0)
                    game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
                    wait(0.3)
                    fireproximityprompt(CurrentDoor.Lock.UnlockPrompt,0)
                end
                if LatestRoom == 50 then
                    CurrentDoor = workspace.CurrentRooms[tostring(LatestRoom+1)]:WaitForChild("Door")
                end
                game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
                wait(0.3)
                CurrentDoor.ClientOpen:FireServer()
            end)
          end    
    })
    
    GameTab:AddToggle({
        Name = "Auto skip level",
        Default = false,
        Save = false,
        Flag = "AutoSkip"
    })
    
    local AutoSkipCoro = coroutine.create(function()
            while true do
                task.wait()
                pcall(function()
                if OrionLib.Flags["AutoSkip"].Value == true and game:GetService("ReplicatedStorage").GameData.LatestRoom.Value < 100 then
                    local HasKey = false
                    local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom.Value
                    local CurrentDoor = workspace.CurrentRooms[tostring(LatestRoom)]:WaitForChild("Door")
                    for i,v in ipairs(CurrentDoor.Parent:GetDescendants()) do
                        if v.Name == "KeyObtain" then
                            HasKey = v
                        end
                    end
                    if HasKey then
                        game.Players.LocalPlayer.Character:PivotTo(CF(HasKey.Hitbox.Position))
                        task.wait(0.3)
                        fireproximityprompt(HasKey.ModulePrompt,0)
                        game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
                        task.wait(0.3)
                        fireproximityprompt(CurrentDoor.Lock.UnlockPrompt,0)
                    end
                    if LatestRoom == 50 then
                        CurrentDoor = workspace.CurrentRooms[tostring(LatestRoom+1)]:WaitForChild("Door")
                    end
                    game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
                    task.wait(0.3)
                    CurrentDoor.ClientOpen:FireServer()
                end
            end)
            end
    end)
    coroutine.resume(AutoSkipCoro)
    
    GameTab:AddButton({
        Name = "No jumpscares",
        Callback = function()
            pcall(function()
                game:GetService("ReplicatedStorage").Bricks.Jumpscare:Destroy()
            end)
          end    
    })
    GameTab:AddToggle({
        Name = "Avoid Rush/Ambush",
        Default = false,
        Flag = "AvoidRushToggle",
        Save = true
    })
    GameTab:AddToggle({
        Name = "No Screech",
        Default = false,
        Flag = "ScreechToggle",
        Save = true
    })
    
    GameTab:AddToggle({
        Name = "Always win heartbeat",
        Default = false,
        Flag = "HeartbeatWin",
        Save = true
    })
    
    GameTab:AddToggle({
        Name = "Predict chases",
        Default = false,
        Flag = "PredictToggle" ,
        Save = true
    })
    GameTab:AddToggle({
        Name = "Notify when mob spawns",
        Default = false,
        Flag = "MobToggle" ,
        Save = true
    })
    GameTab:AddButton({
        Name = "Complete breaker box minigame",
        Callback = function()
            game:GetService("ReplicatedStorage").Bricks.EBF:FireServer()
          end    
    })
    GameTab:AddButton({
        Name = "Skip level 50",
        Callback = function()
            local CurrentDoor = workspace.CurrentRooms[tostring(LatestRoom+1)]:WaitForChild("Door")
            game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
          end    
    })
    GameTab:AddParagraph("Warning","You may need to open/close the panel a few times for this to work, fixing soon.")
    
    --// ok actual code starts here
    
    game:GetService("RunService").RenderStepped:Connect(function()
        pcall(function()
            if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
                game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character.Humanoid.MoveDirection * TargetWalkspeed/50)
            end
        end)
    end)
    
    game:GetService("Workspace").CurrentRooms.DescendantAdded:Connect(function(descendant)
        if OrionLib.Flags["NoSeek"].Value == true and descendant.Name == ("Seek_Arm" or "ChandelierObstruction") then
            task.spawn(function()
                wait()
                descendant:Destroy()
            end)
        end
    end)
    
    game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
        if OrionLib.Flags["InstantToggle"].Value == true then
            fireproximityprompt(prompt)
        end
    end)
    
    local old
    old = hookmetamethod(game,"__namecall",newcclosure(function(self,...)
        local args = {...}
        local method = getnamecallmethod()
        
        if tostring(self) == 'Screech' and method == "FireServer" and OrionLib.Flags["ScreechToggle"].Value == true then
            args[1] = true
            return old(self,unpack(args))
        end
        if tostring(self) == 'ClutchHeartbeat' and method == "FireServer" and OrionLib.Flags["HeartbeatWin"].Value == true then
            args[2] = true
            return old(self,unpack(args))
        end
        
        return old(self,...)
    end))
    
    workspace.CurrentCamera.ChildAdded:Connect(function(child)
        if child.Name == "Screech" and OrionLib.Flags["ScreechToggle"].Value == true then
            child:Destroy()
        end
    end)
    
    local NotificationCoroutine = coroutine.create(function()
        LatestRoom.Changed:Connect(function()
            if OrionLib.Flags["PredictToggle"].Value == true then
                local n = ChaseStart.Value - LatestRoom.Value
                if 0 < n and n < 4 then
                    OrionLib:MakeNotification({
                        Name = "Warning!",
                        Content = "Event in " .. tostring(n) .. " rooms.",
                        Time = 5
                    })
                end
            end
            if OrionLib.Flags["BookToggle"].Value == true then
                if LatestRoom.Value == 50 then
                    coroutine.resume(BookCoroutine)
                end
            end
            if OrionLib.Flags["FigureToggle"].Value == true then
                if LatestRoom.Value == 50 then
                    coroutine.resume(EntityCoroutine)
                end
            end
        end)
        workspace.ChildAdded:Connect(function(inst)
            if inst.Name == "RushMoving" and OrionLib.Flags["MobToggle"].Value == true then
                if OrionLib.Flags["AvoidRushToggle"].Value == true then
                    OrionLib:MakeNotification({
                        Name = "Warning!",
                        Content = "Avoiding Rush. Please wait.",
                        Time = 5
                    })
                    local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                    local con = game:GetService("RunService").Heartbeat:Connect(function()
                        game.Players.LocalPlayer.Character:MoveTo(OldPos + Vector3.new(0,20,0))
                    end)
                    
                    inst.Destroying:Wait()
                    con:Disconnect()
    
                    game.Players.LocalPlayer.Character:MoveTo(OldPos)
                else
                    OrionLib:MakeNotification({
                        Name = "Warning!",
                        Content = "Rush has spawned, hide!",
                        Time = 5
                    })
                end
            elseif inst.Name == "AmbushMoving" and OrionLib.Flags["MobToggle"].Value == true then
                if OrionLib.Flags["AvoidRushToggle"].Value == true then
                    OrionLib:MakeNotification({
                        Name = "Warning!",
                        Content = "Avoiding Ambush. Please wait.",
                        Time = 5
                    })
                    local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                    local con = game:GetService("RunService").Heartbeat:Connect(function()
                        game.Players.LocalPlayer.Character:MoveTo(OldPos + Vector3.new(0,20,0))
                    end)
                    
                    inst.Destroying:Wait()
                    con:Disconnect()
                    
                    game.Players.LocalPlayer.Character:MoveTo(OldPos)
                else
                    OrionLib:MakeNotification({
                        Name = "Warning!",
                        Content = "Ambush has spawned, hide!",
                        Time = 5
                    })
                end
            end
        end)
    end)
    
    --// ok actual code ends here
    
    local CreditsTab = Window:MakeTab({
        Name = "Credits",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    CreditsTab:AddParagraph("Credits to","OminousVibes - (Got most of the ideas from their thread, check it out! - https://v3rmillion.net/showthread.php?tid=1184088)")
    
    coroutine.resume(NotificationCoroutine)
    
    OrionLib:Init()
    
    task.wait(2)
end)

Section:NewButton("Heartbeat Minigame", "Starts the Heartbeat Minigame [IRREVERSIBLE]", function()
    firesignal(game.ReplicatedStorage.Bricks.ClutchHeartbeat.OnClientEvent)
end)

Section:NewButton("Unlock All Achievements", "Grants you all achievements. [VISUAL]", function()
    for i,v in pairs(require(game.ReplicatedStorage.Achievements)) do
        spawn(function()
            require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.AchievementUnlock)(nil, i)
        end)
    end
end)

Section:NewButton("Flicker Lights", "Flickers the lights in the room you're in.", function()
    firesignal(game.ReplicatedStorage.Bricks.UseEventModule.OnClientEvent, "flickerLights", game.ReplicatedStorage.GameData.LatestRoom.Value, 1)
end)

Section:NewButton("Break Lights", "Breaks the lights in the room you're in.", function()
    firesignal(game.ReplicatedStorage.Bricks.UseEventModule.OnClientEvent, "breakLights", workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value], 0.416, 60)
end)

--Credits 
local Tab = Window:NewTab("Credits")
local Section = Tab:NewSection("Credits for the GUI and Scripts.")

Section:NewLabel("GUI made by plamen6789rocks")

Section:NewLabel("UI, Body, Buttons etc by Kavo's Library UI")

Section:NewLabel("Entity Summon scripts by Kardin Hong, Dreadmania,")

Section:NewLabel("Lolcat and Vynixius")

Section:NewLabel("Break Lights, Flicker Lights and All Achievements")

Section:NewLabel("By Dreadmania")

--Update Log 
local Tab = Window:NewTab("Update Log")
local Section = Tab:NewSection("List of all the new things that got added.")

Section:NewLabel("Added Entities: Flamingo, Kreekcraft in Closet,")
Section:NewLabel("Pikachu and Photon.")