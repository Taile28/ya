local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua'))()

local Window = Rayfield:CreateWindow({
   Name = "🦕 ADRENALINE HUB",
   LoadingTitle = "ADRENALINE HUB",
   LoadingSubtitle = "by syntax9000",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "dsscript12"
   },
   Discord = {
      Enabled = true,
      Invite = "QpmNbkWq", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "🦕 ADRENALINE HUB 🦕",
      Subtitle = "Key System",
      Note = "STATUS = UNDETECTED",
      FileName = "License Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/FSnysPxg"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})


local MainTab = Window:CreateTab("Local Player", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Main")
Rayfield:Notify({
   Title = "WHITELISTED",
   Content = "made by syntax9000",
   Duration = 8.5,
   Image = 4483362458,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "CLOSE",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})

local Button = MainTab:CreateButton({
   Name = "Add Hunger",
   Callback = function()
   game.Workspace.GameEvents.EatPlant:FireServer(Workspace.GameMap.Ferns.Fern,2)
   end,
})
local Button = MainTab:CreateButton({
   Name = "Subtract Hunger",
   Callback = function()
   game.Workspace.GameEvents.EatPlant:FireServer(Workspace.GameMap.Ferns.Fern,-10)
   end,
})
local Button = MainTab:CreateButton({
   Name = "Add Thirst",
   Callback = function()
       local A_1 = game:GetService("Workspace").GameMap.Water.Water
    local A_2 = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.p
    local Event = game:GetService("Workspace").GameEvents.addThirst
    Event:FireServer(A_1, A_2)
   end,
})

local Toggle

Toggle = MainTab:CreateToggle({
    Name = "Infinite Thirst",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        -- The function that takes place when the toggle is pressed
        -- The variable (Value) is a boolean on whether the toggle is true or false
        
        -- Define a function to perform the actions in the loop
        local function PerformActions()
            -- Loop while the toggle is active
            while Toggle.CurrentValue do
                -- Perform the actions inside the loop
                
                local A_1 = game:GetService("Workspace").GameMap.Water.Water
                local A_2 = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.p
                local Event = game:GetService("Workspace").GameEvents.addThirst
                Event:FireServer(A_1, A_2)
                
                wait(0.1) -- Adjust the wait time as needed
            end
        end
        
        -- If the toggle is turned on, start the loop
        if Value then
            PerformActions()
        end
    end,
})





local MainSection = MainTab:CreateSection("Local Player")

local WalkspeedSlider = MainTab:CreateSlider({
   Name = "Walkspeed",
   Range = {0, 100},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "Slider1", 
   Callback = function(Value)
       game.Players.LocalPlayer.Character.Dinosaur.WalkSpeed = Value
   end,
})

local JumpPowerSlider = MainTab:CreateSlider({
   Name = "Jump Power",
   Range = {0, 100},
   Increment = 1,
   Suffix = "Jump Power",
   CurrentValue = 16,
   Flag = "Slider2", 
   Callback = function(Value)
       game.Players.LocalPlayer.Character.Dinosaur.JumpPower = Value
   end,
})

-- Function to update Walkspeed continuously
local function updateWalkspeedLoop()
    while true do
        -- Call the WalkspeedSlider callback function with the current value
        WalkspeedSlider.Callback(WalkspeedSlider.CurrentValue)
        wait(0) -- Adjust the delay as needed
    end
end

-- Function to update JumpPower continuously
local function updateJumpPowerLoop()
    while true do
        -- Call the JumpPowerSlider callback function with the current value
        JumpPowerSlider.Callback(JumpPowerSlider.CurrentValue)
        wait(0) -- Adjust the delay as needed
    end
end

-- Start the update loops in separate coroutines
coroutine.wrap(updateWalkspeedLoop)()
coroutine.wrap(updateJumpPowerLoop)()


local CombatTab = Window:CreateTab("Combat", nil) -- Title, Image
local Section = CombatTab:CreateSection("Combat")

local toggleValue = false -- Variable to store toggle state

local Toggle = CombatTab:CreateToggle({
   Name = "Automatic AOE",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
       -- The function that takes place when the toggle is pressed
       -- The variable (Value) is a boolean on whether the toggle is true or false
       toggleValue = Value -- Update the toggle state variable
       if toggleValue then
           -- When toggle is activated (true), continuously fire the server event
           while toggleValue do
               Workspace.GameEvents.AOEDamage:FireServer()
               wait(1) -- Adjust the wait time as needed
           end
       end
   end,
})


local toggleValue = false -- Variable to store toggle state

local Toggle = CombatTab:CreateToggle({
   Name = "Automatic ATTACK",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
       -- The function that takes place when the toggle is pressed
       -- The variable (Value) is a boolean on whether the toggle is true or false
       toggleValue = Value -- Update the toggle state variable
       if toggleValue then
           -- When toggle is activated (true), continuously fire the server event
           while toggleValue do
               Workspace.GameEvents.Damage:FireServer()
               wait(1) -- Adjust the wait time as needed
           end
       end
   end,
})



local Section = CombatTab:CreateSection("Sauropods Spawn")


local Button = CombatTab:CreateButton({
   Name = "Spawn Classic Barosaurus",
   Callback = function()
       -- Define the dinosaur names
       local a = "Classic Barosaurus"
       local targ = "Classic Barosaurus"
       
       -- Fire the GoToMenu server event immediately
       workspace.GameEvents.GoToMenu:FireServer(1)
       
       -- Function to create and display the countdown GUI
       local function CreateCountdown()
           -- Create a ScreenGui to hold the countdown text
           local countdownGui = Instance.new("ScreenGui")
           countdownGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
           
           -- Create a TextLabel to display the countdown
           local countdownLabel = Instance.new("TextLabel")
           countdownLabel.Name = "CountdownLabel"
           countdownLabel.Size = UDim2.new(0, 200, 0, 100)
           countdownLabel.Position = UDim2.new(0.5, -100, 0.5, -50)
           countdownLabel.AnchorPoint = Vector2.new(0.5, 0.5)
           countdownLabel.BackgroundTransparency = 1
           countdownLabel.Font = Enum.Font.SourceSansBold
           countdownLabel.TextSize = 24
           countdownLabel.TextColor3 = Color3.new(1, 1, 1)
           countdownLabel.TextStrokeTransparency = 0
           countdownLabel.ZIndex = 10
           countdownLabel.TextScaled = true
           countdownLabel.Text = "Spawning in (7)" -- Initial countdown value
           countdownLabel.Parent = countdownGui
           
           -- Countdown loop
           for i = 7, 0, -1 do
               countdownLabel.Text = "Spawning in (" .. tostring(i) .. ")" -- Update countdown text
               wait(1) -- Wait for 1 second
           end
           
           -- Destroy the countdown GUI after countdown completes
           countdownGui:Destroy()
       end
       
       -- Start the countdown immediately
       CreateCountdown()
       
       -- Fire the ChangeDinosaur server event with the initial dinosaur name
       workspace.GameEvents.ChangeDinosaur:FireServer(a)
       wait(2.5)
       
       -- Fire the StartPlayer server event
       workspace.GameEvents.StartPlayer:FireServer()
       
       -- Fire the ChangeDinosaur server event with the target dinosaur name twice
       workspace.GameEvents.ChangeDinosaur:FireServer(targ)
       wait(3)
       workspace.GameEvents.ChangeDinosaur:FireServer(targ)
   end,
})


local Button = CombatTab:CreateButton({
   Name = "Spawn Kaiju Giraffatitan",
   Callback = function()
       -- Define the dinosaur names
       local a = "Kaiju Giraffatitan"
       local targ = "Kaiju Giraffatitan"
       
       -- Fire the GoToMenu server event immediately
       workspace.GameEvents.GoToMenu:FireServer(1)
       
       -- Function to create and display the countdown GUI
       local function CreateCountdown()
           -- Create a ScreenGui to hold the countdown text
           local countdownGui = Instance.new("ScreenGui")
           countdownGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
           
           -- Create a TextLabel to display the countdown
           local countdownLabel = Instance.new("TextLabel")
           countdownLabel.Name = "CountdownLabel"
           countdownLabel.Size = UDim2.new(0, 200, 0, 100)
           countdownLabel.Position = UDim2.new(0.5, -100, 0.5, -50)
           countdownLabel.AnchorPoint = Vector2.new(0.5, 0.5)
           countdownLabel.BackgroundTransparency = 1
           countdownLabel.Font = Enum.Font.SourceSansBold
           countdownLabel.TextSize = 24
           countdownLabel.TextColor3 = Color3.new(1, 1, 1)
           countdownLabel.TextStrokeTransparency = 0
           countdownLabel.ZIndex = 10
           countdownLabel.TextScaled = true
           countdownLabel.Text = "Spawning in (7)" -- Initial countdown value
           countdownLabel.Parent = countdownGui
           
           -- Countdown loop
           for i = 7, 0, -1 do
               countdownLabel.Text = "Spawning in (" .. tostring(i) .. ")" -- Update countdown text
               wait(1) -- Wait for 1 second
           end
           
           -- Destroy the countdown GUI after countdown completes
           countdownGui:Destroy()
       end
       
       -- Start the countdown immediately
       CreateCountdown()
       
       -- Fire the ChangeDinosaur server event with the initial dinosaur name
       workspace.GameEvents.ChangeDinosaur:FireServer(a)
       wait(2.5)
       
       -- Fire the StartPlayer server event
       workspace.GameEvents.StartPlayer:FireServer()
       
       -- Fire the ChangeDinosaur server event with the target dinosaur name twice
       workspace.GameEvents.ChangeDinosaur:FireServer(targ)
       wait(3)
       workspace.GameEvents.ChangeDinosaur:FireServer(targ)
   end,
})



local Button = CombatTab:CreateButton({
   Name = "Spawn Classic Apatosaurus",
   Callback = function()
       -- Define the dinosaur names
       local a = "Classic Apatosaurus"
       local targ = "Classic Apatosaurus"
       
       -- Fire the GoToMenu server event immediately
       workspace.GameEvents.GoToMenu:FireServer(1)
       
       -- Function to create and display the countdown GUI
       local function CreateCountdown()
           -- Create a ScreenGui to hold the countdown text
           local countdownGui = Instance.new("ScreenGui")
           countdownGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
           
           -- Create a TextLabel to display the countdown
           local countdownLabel = Instance.new("TextLabel")
           countdownLabel.Name = "CountdownLabel"
           countdownLabel.Size = UDim2.new(0, 200, 0, 100)
           countdownLabel.Position = UDim2.new(0.5, -100, 0.5, -50)
           countdownLabel.AnchorPoint = Vector2.new(0.5, 0.5)
           countdownLabel.BackgroundTransparency = 1
           countdownLabel.Font = Enum.Font.SourceSansBold
           countdownLabel.TextSize = 24
           countdownLabel.TextColor3 = Color3.new(1, 1, 1)
           countdownLabel.TextStrokeTransparency = 0
           countdownLabel.ZIndex = 10
           countdownLabel.TextScaled = true
           countdownLabel.Text = "Spawning in (7)" -- Initial countdown value
           countdownLabel.Parent = countdownGui
           
           -- Countdown loop
           for i = 7, 0, -1 do
               countdownLabel.Text = "Spawning in (" .. tostring(i) .. ")" -- Update countdown text
               wait(1) -- Wait for 1 second
           end
           
           -- Destroy the countdown GUI after countdown completes
           countdownGui:Destroy()
       end
       
       -- Start the countdown immediately
       CreateCountdown()
       
       -- Fire the ChangeDinosaur server event with the initial dinosaur name
       workspace.GameEvents.ChangeDinosaur:FireServer(a)
       wait(2.5)
       
       -- Fire the StartPlayer server event
       workspace.GameEvents.StartPlayer:FireServer()
       
       -- Fire the ChangeDinosaur server event with the target dinosaur name twice
       workspace.GameEvents.ChangeDinosaur:FireServer(targ)
       wait(3)
       workspace.GameEvents.ChangeDinosaur:FireServer(targ)
   end,
})


local Section = CombatTab:CreateSection("Hybrids Spawn")

local Button = CombatTab:CreateButton({
   Name = "Spawn Pitch Black Terror V3",
   Callback = function()
       -- Define the dinosaur names
       local a = "Pitch Black Terror V3"
       local targ = "Pitch Black Terror V3"
       
       -- Fire the GoToMenu server event immediately
       workspace.GameEvents.GoToMenu:FireServer(1)
       
       -- Function to create and display the countdown GUI
       local function CreateCountdown()
           -- Create a ScreenGui to hold the countdown text
           local countdownGui = Instance.new("ScreenGui")
           countdownGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
           
           -- Create a TextLabel to display the countdown
           local countdownLabel = Instance.new("TextLabel")
           countdownLabel.Name = "CountdownLabel"
           countdownLabel.Size = UDim2.new(0, 200, 0, 100)
           countdownLabel.Position = UDim2.new(0.5, -100, 0.5, -50)
           countdownLabel.AnchorPoint = Vector2.new(0.5, 0.5)
           countdownLabel.BackgroundTransparency = 1
           countdownLabel.Font = Enum.Font.SourceSansBold
           countdownLabel.TextSize = 24
           countdownLabel.TextColor3 = Color3.new(1, 1, 1)
           countdownLabel.TextStrokeTransparency = 0
           countdownLabel.ZIndex = 10
           countdownLabel.TextScaled = true
           countdownLabel.Text = "Spawning in (7)" -- Initial countdown value
           countdownLabel.Parent = countdownGui
           
           -- Countdown loop
           for i = 7, 0, -1 do
               countdownLabel.Text = "Spawning in (" .. tostring(i) .. ")" -- Update countdown text
               wait(1) -- Wait for 1 second
           end
           
           -- Destroy the countdown GUI after countdown completes
           countdownGui:Destroy()
       end
       
       -- Start the countdown immediately
       CreateCountdown()
       
       -- Fire the ChangeDinosaur server event with the initial dinosaur name
       workspace.GameEvents.ChangeDinosaur:FireServer(a)
       wait(2.5)
       
       -- Fire the StartPlayer server event
       workspace.GameEvents.StartPlayer:FireServer()
       
       -- Fire the ChangeDinosaur server event with the target dinosaur name twice
       workspace.GameEvents.ChangeDinosaur:FireServer(targ)
       wait(3)
       workspace.GameEvents.ChangeDinosaur:FireServer(targ)
   end,
})


local Button = CombatTab:CreateButton({
   Name = "Spawn Classic Megavore V2",
   Callback = function()
       -- Define the dinosaur names
       local a = "Classic Megavore V2"
       local targ = "Classic Megavore V2"
       
       -- Fire the GoToMenu server event immediately
       workspace.GameEvents.GoToMenu:FireServer(1)
       
       -- Function to create and display the countdown GUI
       local function CreateCountdown()
           -- Create a ScreenGui to hold the countdown text
           local countdownGui = Instance.new("ScreenGui")
           countdownGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
           
           -- Create a TextLabel to display the countdown
           local countdownLabel = Instance.new("TextLabel")
           countdownLabel.Name = "CountdownLabel"
           countdownLabel.Size = UDim2.new(0, 200, 0, 100)
           countdownLabel.Position = UDim2.new(0.5, -100, 0.5, -50)
           countdownLabel.AnchorPoint = Vector2.new(0.5, 0.5)
           countdownLabel.BackgroundTransparency = 1
           countdownLabel.Font = Enum.Font.SourceSansBold
           countdownLabel.TextSize = 24
           countdownLabel.TextColor3 = Color3.new(1, 1, 1)
           countdownLabel.TextStrokeTransparency = 0
           countdownLabel.ZIndex = 10
           countdownLabel.TextScaled = true
           countdownLabel.Text = "Spawning in (7)" -- Initial countdown value
           countdownLabel.Parent = countdownGui
           
           -- Countdown loop
           for i = 7, 0, -1 do
               countdownLabel.Text = "Spawning in (" .. tostring(i) .. ")" -- Update countdown text
               wait(1) -- Wait for 1 second
           end
           
           -- Destroy the countdown GUI after countdown completes
           countdownGui:Destroy()
       end
       
       -- Start the countdown immediately
       CreateCountdown()
       
       -- Fire the ChangeDinosaur server event with the initial dinosaur name
       workspace.GameEvents.ChangeDinosaur:FireServer(a)
       wait(2.5)
       
       -- Fire the StartPlayer server event
       workspace.GameEvents.StartPlayer:FireServer()
       
       -- Fire the ChangeDinosaur server event with the target dinosaur name twice
       workspace.GameEvents.ChangeDinosaur:FireServer(targ)
       wait(3)
       workspace.GameEvents.ChangeDinosaur:FireServer(targ)
   end,
})





local Button = CombatTab:CreateButton({
   Name = "Spawn Pitch Black Terror",
   Callback = function()
       -- Define the dinosaur names
       local a = "Pitch Black Terror"
       local targ = "Pitch Black Terror"
       
       -- Fire the GoToMenu server event immediately
       workspace.GameEvents.GoToMenu:FireServer(1)
       
       -- Function to create and display the countdown GUI
       local function CreateCountdown()
           -- Create a ScreenGui to hold the countdown text
           local countdownGui = Instance.new("ScreenGui")
           countdownGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
           
           -- Create a TextLabel to display the countdown
           local countdownLabel = Instance.new("TextLabel")
           countdownLabel.Name = "CountdownLabel"
           countdownLabel.Size = UDim2.new(0, 200, 0, 100)
           countdownLabel.Position = UDim2.new(0.5, -100, 0.5, -50)
           countdownLabel.AnchorPoint = Vector2.new(0.5, 0.5)
           countdownLabel.BackgroundTransparency = 1
           countdownLabel.Font = Enum.Font.SourceSansBold
           countdownLabel.TextSize = 24
           countdownLabel.TextColor3 = Color3.new(1, 1, 1)
           countdownLabel.TextStrokeTransparency = 0
           countdownLabel.ZIndex = 10
           countdownLabel.TextScaled = true
           countdownLabel.Text = "Spawning in (7)" -- Initial countdown value
           countdownLabel.Parent = countdownGui
           
           -- Countdown loop
           for i = 7, 0, -1 do
               countdownLabel.Text = "Spawning in (" .. tostring(i) .. ")" -- Update countdown text
               wait(1) -- Wait for 1 second
           end
           
           -- Destroy the countdown GUI after countdown completes
           countdownGui:Destroy()
       end
       
       -- Start the countdown immediately
       CreateCountdown()
       
       -- Fire the ChangeDinosaur server event with the initial dinosaur name
       workspace.GameEvents.ChangeDinosaur:FireServer(a)
       wait(2.5)
       
       -- Fire the StartPlayer server event
       workspace.GameEvents.StartPlayer:FireServer()
       
       -- Fire the ChangeDinosaur server event with the target dinosaur name twice
       workspace.GameEvents.ChangeDinosaur:FireServer(targ)
       wait(3)
       workspace.GameEvents.ChangeDinosaur:FireServer(targ)
   end,
})


local Section = CombatTab:CreateSection("Land Spawn")


local Button = CombatTab:CreateButton({
   Name = "Spawn Tyrannotitan",
   Callback = function()
       -- Define the dinosaur names
       local a = "yrannotitan"
       local targ = "yrannotitan"
       
       -- Fire the GoToMenu server event immediately
       workspace.GameEvents.GoToMenu:FireServer(1)
       
       -- Function to create and display the countdown GUI
       local function CreateCountdown()
           -- Create a ScreenGui to hold the countdown text
           local countdownGui = Instance.new("ScreenGui")
           countdownGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
           
           -- Create a TextLabel to display the countdown
           local countdownLabel = Instance.new("TextLabel")
           countdownLabel.Name = "CountdownLabel"
           countdownLabel.Size = UDim2.new(0, 200, 0, 100)
           countdownLabel.Position = UDim2.new(0.5, -100, 0.5, -50)
           countdownLabel.AnchorPoint = Vector2.new(0.5, 0.5)
           countdownLabel.BackgroundTransparency = 1
           countdownLabel.Font = Enum.Font.SourceSansBold
           countdownLabel.TextSize = 24
           countdownLabel.TextColor3 = Color3.new(1, 1, 1)
           countdownLabel.TextStrokeTransparency = 0
           countdownLabel.ZIndex = 10
           countdownLabel.TextScaled = true
           countdownLabel.Text = "Spawning in (7)" -- Initial countdown value
           countdownLabel.Parent = countdownGui
           
           -- Countdown loop
           for i = 7, 0, -1 do
               countdownLabel.Text = "Spawning in (" .. tostring(i) .. ")" -- Update countdown text
               wait(1) -- Wait for 1 second
           end
           
           -- Destroy the countdown GUI after countdown completes
           countdownGui:Destroy()
       end
       
       -- Start the countdown immediately
       CreateCountdown()
       
       -- Fire the ChangeDinosaur server event with the initial dinosaur name
       workspace.GameEvents.ChangeDinosaur:FireServer(a)
       wait(2.5)
       
       -- Fire the StartPlayer server event
       workspace.GameEvents.StartPlayer:FireServer()
       
       -- Fire the ChangeDinosaur server event with the target dinosaur name twice
       workspace.GameEvents.ChangeDinosaur:FireServer(targ)
       wait(3)
       workspace.GameEvents.ChangeDinosaur:FireServer(targ)
   end,
})




local Button = CombatTab:CreateButton({
   Name = "Spawn Abrasive Giganotosaurus",
   Callback = function()
       -- Define the dinosaur names
       local initialDinosaur = "Abrasive Giganotosaurus"
       local targetDinosaur = "Abrasive Giganotosaurus"
       
       -- Function to create and display the countdown GUI
       local function CreateCountdown()
           -- Create a ScreenGui to hold the countdown text
           local countdownGui = Instance.new("ScreenGui")
           countdownGui.Name = "CountdownGui" -- Set name for easy access
           countdownGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
           
           -- Create a TextLabel to display the countdown
           local countdownLabel = Instance.new("TextLabel")
           countdownLabel.Name = "CountdownLabel"
           countdownLabel.Size = UDim2.new(0, 200, 0, 100)
           countdownLabel.Position = UDim2.new(0.5, -100, 0.5, -50)
           countdownLabel.AnchorPoint = Vector2.new(0.5, 0.5)
           countdownLabel.BackgroundTransparency = 1
           countdownLabel.Font = Enum.Font.SourceSansBold
           countdownLabel.TextSize = 24
           countdownLabel.TextColor3 = Color3.new(1, 1, 1)
           countdownLabel.TextStrokeTransparency = 0
           countdownLabel.ZIndex = 10
           countdownLabel.TextScaled = true
           countdownLabel.Parent = countdownGui
           
           -- Countdown loop
           for i = 7, 0, -1 do
               countdownLabel.Text = "Spawning in " .. tostring(i) -- Update countdown text
               wait(1) -- Wait for 1 second
           end
           
           -- Destroy the countdown GUI after countdown completes
           countdownGui:Destroy()
       end
       
       -- Start the countdown coroutine
       coroutine.wrap(CreateCountdown)()
       
       -- Execute the rest of the code immediately
       -- Fire the GoToMenu server event
       workspace.GameEvents.GoToMenu:FireServer(1)
       wait(6)
       
       -- Fire the ChangeDinosaur server event with the initial dinosaur name
       workspace.GameEvents.ChangeDinosaur:FireServer(initialDinosaur)
       wait(2.5)
       
       -- Fire the StartPlayer server event
       workspace.GameEvents.StartPlayer:FireServer()
       
       -- Fire the ChangeDinosaur server event with the target dinosaur name twice
       workspace.GameEvents.ChangeDinosaur:FireServer(targetDinosaur)
       wait(3)
       workspace.GameEvents.ChangeDinosaur:FireServer(targetDinosaur)
   end,
})

local Button = CombatTab:CreateButton({
   Name = "Spawn Amargasaurus",
   Callback = function()
       -- Define the dinosaur names
       local initialDinosaur = "Amargasaurus"
       local targetDinosaur = "Amargasaurus"
       
       -- Function to create and display the countdown GUI
       local function CreateCountdown()
           -- Create a ScreenGui to hold the countdown text
           local countdownGui = Instance.new("ScreenGui")
           countdownGui.Name = "CountdownGui" -- Set name for easy access
           countdownGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
           
           -- Create a TextLabel to display the countdown
           local countdownLabel = Instance.new("TextLabel")
           countdownLabel.Name = "CountdownLabel"
           countdownLabel.Size = UDim2.new(0, 200, 0, 100)
           countdownLabel.Position = UDim2.new(0.5, -100, 0.5, -50)
           countdownLabel.AnchorPoint = Vector2.new(0.5, 0.5)
           countdownLabel.BackgroundTransparency = 1
           countdownLabel.Font = Enum.Font.SourceSansBold
           countdownLabel.TextSize = 24
           countdownLabel.TextColor3 = Color3.new(1, 1, 1)
           countdownLabel.TextStrokeTransparency = 0
           countdownLabel.ZIndex = 10
           countdownLabel.TextScaled = true
           countdownLabel.Parent = countdownGui
           
           -- Countdown loop
           for i = 7, 0, -1 do
               countdownLabel.Text = "Spawning in " .. tostring(i) -- Update countdown text
               wait(1) -- Wait for 1 second
           end
           
           -- Destroy the countdown GUI after countdown completes
           countdownGui:Destroy()
       end
       
       -- Start the countdown coroutine
       coroutine.wrap(CreateCountdown)()
       
       -- Execute the rest of the code immediately
       -- Fire the GoToMenu server event
       workspace.GameEvents.GoToMenu:FireServer(1)
       wait(6)
       
       -- Fire the ChangeDinosaur server event with the initial dinosaur name
       workspace.GameEvents.ChangeDinosaur:FireServer(initialDinosaur)
       wait(2.5)
       
       -- Fire the StartPlayer server event
       workspace.GameEvents.StartPlayer:FireServer()
       
       -- Fire the ChangeDinosaur server event with the target dinosaur name twice
       workspace.GameEvents.ChangeDinosaur:FireServer(targetDinosaur)
       wait(3)
       workspace.GameEvents.ChangeDinosaur:FireServer(targetDinosaur)
   end,
})


local Button = CombatTab:CreateButton({
   Name = "Spawn Classic Tyrannosaurus Rex",
   Callback = function()
       -- Define the dinosaur names
       local initialDinosaur = "Classic Tyrannosaurus Rex"
       local targetDinosaur = "Classic Tyrannosaurus Rex"
       
       -- Function to create and display the countdown GUI
       local function CreateCountdown()
           -- Create a ScreenGui to hold the countdown text
           local countdownGui = Instance.new("ScreenGui")
           countdownGui.Name = "CountdownGui" -- Set name for easy access
           countdownGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
           
           -- Create a TextLabel to display the countdown
           local countdownLabel = Instance.new("TextLabel")
           countdownLabel.Name = "CountdownLabel"
           countdownLabel.Size = UDim2.new(0, 200, 0, 100)
           countdownLabel.Position = UDim2.new(0.5, -100, 0.5, -50)
           countdownLabel.AnchorPoint = Vector2.new(0.5, 0.5)
           countdownLabel.BackgroundTransparency = 1
           countdownLabel.Font = Enum.Font.SourceSansBold
           countdownLabel.TextSize = 24
           countdownLabel.TextColor3 = Color3.new(1, 1, 1)
           countdownLabel.TextStrokeTransparency = 0
           countdownLabel.ZIndex = 10
           countdownLabel.TextScaled = true
           countdownLabel.Parent = countdownGui
           
           -- Countdown loop
           for i = 7, 0, -1 do
               countdownLabel.Text = "Spawning in " .. tostring(i) -- Update countdown text
               wait(1) -- Wait for 1 second
           end
           
           -- Destroy the countdown GUI after countdown completes
           countdownGui:Destroy()
       end
       
       -- Start the countdown coroutine
       coroutine.wrap(CreateCountdown)()
       
      

local Section = CombatTab:CreateSection("Aquatics Spawn")

local Button = CombatTab:CreateButton({
   Name = "Spawn Classic Tusoteuthis",
   Callback = function()
       -- Define the dinosaur names
       local a = "Classic Tusoteuthis"
       local targ = "Classic Tusoteuthis"
       
       -- Fire the GoToMenu server event immediately
       workspace.GameEvents.GoToMenu:FireServer(1)
       
       -- Function to create and display the countdown GUI
       local function CreateCountdown()
           -- Create a ScreenGui to hold the countdown text
           local countdownGui = Instance.new("ScreenGui")
           countdownGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
           
           -- Create a TextLabel to display the countdown
           local countdownLabel = Instance.new("TextLabel")
           countdownLabel.Name = "CountdownLabel"
           countdownLabel.Size = UDim2.new(0, 200, 0, 100)
           countdownLabel.Position = UDim2.new(0.5, -100, 0.5, -50)
           countdownLabel.AnchorPoint = Vector2.new(0.5, 0.5)
           countdownLabel.BackgroundTransparency = 1
           countdownLabel.Font = Enum.Font.SourceSansBold
           countdownLabel.TextSize = 24
           countdownLabel.TextColor3 = Color3.new(1, 1, 1)
           countdownLabel.TextStrokeTransparency = 0
           countdownLabel.ZIndex = 10
           countdownLabel.TextScaled = true
           countdownLabel.Text = "Spawning in (7)" -- Initial countdown value
           countdownLabel.Parent = countdownGui
           
           -- Countdown loop
           for i = 7, 0, -1 do
               countdownLabel.Text = "Spawning in (" .. tostring(i) .. ")" -- Update countdown text
               wait(1) -- Wait for 1 second
           end
           
           -- Destroy the countdown GUI after countdown completes
           countdownGui:Destroy()
       end
       
       -- Start the countdown immediately
       CreateCountdown()
       
       -- Fire the ChangeDinosaur server event with the initial dinosaur name
       workspace.GameEvents.ChangeDinosaur:FireServer(a)
       wait(2.5)
       
       -- Fire the StartPlayer server event
       workspace.GameEvents.StartPlayer:FireServer()
       
       -- Fire the ChangeDinosaur server event with the target dinosaur name twice
       workspace.GameEvents.ChangeDinosaur:FireServer(targ)
       wait(3)
       workspace.GameEvents.ChangeDinosaur:FireServer(targ)
   end,
})








local Button = CombatTab:CreateButton({
   Name = "Spawn Tusoteuthis",
   Callback = function()
       -- Define the dinosaur names
       local a = "Tusoteuthis"
       local targ = "Tusoteuthis"
       
       -- Fire the GoToMenu server event immediately
       workspace.GameEvents.GoToMenu:FireServer(1)
       
       -- Function to create and display the countdown GUI
       local function CreateCountdown()
           -- Create a ScreenGui to hold the countdown text
           local countdownGui = Instance.new("ScreenGui")
           countdownGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
           
           -- Create a TextLabel to display the countdown
           local countdownLabel = Instance.new("TextLabel")
           countdownLabel.Name = "CountdownLabel"
           countdownLabel.Size = UDim2.new(0, 200, 0, 100)
           countdownLabel.Position = UDim2.new(0.5, -100, 0.5, -50)
           countdownLabel.AnchorPoint = Vector2.new(0.5, 0.5)
           countdownLabel.BackgroundTransparency = 1
           countdownLabel.Font = Enum.Font.SourceSansBold
           countdownLabel.TextSize = 24
           countdownLabel.TextColor3 = Color3.new(1, 1, 1)
           countdownLabel.TextStrokeTransparency = 0
           countdownLabel.ZIndex = 10
           countdownLabel.TextScaled = true
           countdownLabel.Text = "Spawning in (7)" -- Initial countdown value
           countdownLabel.Parent = countdownGui
           
           -- Countdown loop
           for i = 7, 0, -1 do
               countdownLabel.Text = "Spawning in (" .. tostring(i) .. ")" -- Update countdown text
               wait(1) -- Wait for 1 second
           end
           
           -- Destroy the countdown GUI after countdown completes
           countdownGui:Destroy()
       end
       
       -- Start the countdown immediately
       CreateCountdown()
       
       -- Fire the ChangeDinosaur server event with the initial dinosaur name
       workspace.GameEvents.ChangeDinosaur:FireServer(a)
       wait(2.5)
       
       -- Fire the StartPlayer server event
       workspace.GameEvents.StartPlayer:FireServer()
       
       -- Fire the ChangeDinosaur server event with the target dinosaur name twice
       workspace.GameEvents.ChangeDinosaur:FireServer(targ)
       wait(3)
       workspace.GameEvents.ChangeDinosaur:FireServer(targ)
   end,
})








local Button = CombatTab:CreateButton({
   Name = "Spawn Carcharocles Megalodon",
   Callback = function()
       -- Define the dinosaur names
       local a = "Carcharocles Megalodon"
       local targ = "Carcharocles Megalodon"
       
       -- Function to create and display the countdown GUI
       local function CreateCountdown()
           -- Create a ScreenGui to hold the countdown text
           local countdownGui = Instance.new("ScreenGui")
           countdownGui.Name = "CountdownGui" -- Set name for easy access
           countdownGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
           
           -- Create a TextLabel to display the countdown
           local countdownLabel = Instance.new("TextLabel")
           countdownLabel.Name = "CountdownLabel"
           countdownLabel.Size = UDim2.new(0, 200, 0, 100)
           countdownLabel.Position = UDim2.new(0.5, -100, 0.5, -50)
           countdownLabel.AnchorPoint = Vector2.new(0.5, 0.5)
           countdownLabel.BackgroundTransparency = 1
           countdownLabel.Font = Enum.Font.SourceSansBold
           countdownLabel.TextSize = 24
           countdownLabel.TextColor3 = Color3.new(1, 1, 1)
           countdownLabel.TextStrokeTransparency = 0
           countdownLabel.ZIndex = 10
           countdownLabel.TextScaled = true
           countdownLabel.Text = "Spawning in (7)" -- Initial countdown value
           countdownLabel.Parent = countdownGui
           
           -- Countdown loop
           for i = 7, 0, -1 do
               countdownLabel.Text = "Spawning in (" .. tostring(i) .. ")" -- Update countdown text
               wait(1) -- Wait for 1 second
           end
           
           -- Destroy the countdown GUI after countdown completes
           countdownGui:Destroy()
       end
       
       -- Start the countdown coroutine
       coroutine.wrap(CreateCountdown)()
       
       -- Fire the GoToMenu server event
       workspace.GameEvents.GoToMenu:FireServer(1)
       wait(6)
       
       -- Fire the ChangeDinosaur server event with the initial dinosaur name
       workspace.GameEvents.ChangeDinosaur:FireServer(a)
       wait(2.5)
       
       -- Fire the StartPlayer server event
       workspace.GameEvents.StartPlayer:FireServer()
       
       -- Fire the ChangeDinosaur server event with the target dinosaur name twice
       workspace.GameEvents.ChangeDinosaur:FireServer(targ)
       wait(3)
       workspace.GameEvents.ChangeDinosaur:FireServer(targ)
   end,
})

local Button = CombatTab:CreateButton({
   Name = "Spawn Fossil Carcharocles Megalodon",
   Callback = function()
       -- Define the dinosaur names
       local a = "Fossil Carcharocles Megalodon"
       local targ = "Fossil Carcharocles Megalodon"
       
       -- Function to create and display the countdown GUI
       local function CreateCountdown()
           -- Create a ScreenGui to hold the countdown text
           local countdownGui = Instance.new("ScreenGui")
           countdownGui.Name = "CountdownGui" -- Set name for easy access
           countdownGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
           
           -- Create a TextLabel to display the countdown
           local countdownLabel = Instance.new("TextLabel")
           countdownLabel.Name = "CountdownLabel"
           countdownLabel.Size = UDim2.new(0, 200, 0, 100)
           countdownLabel.Position = UDim2.new(0.5, -100, 0.5, -50)
           countdownLabel.AnchorPoint = Vector2.new(0.5, 0.5)
           countdownLabel.BackgroundTransparency = 1
           countdownLabel.Font = Enum.Font.SourceSansBold
           countdownLabel.TextSize = 24
           countdownLabel.TextColor3 = Color3.new(1, 1, 1)
           countdownLabel.TextStrokeTransparency = 0
           countdownLabel.ZIndex = 10
           countdownLabel.TextScaled = true
           countdownLabel.Text = "Spawning in (7)" -- Initial countdown value
           countdownLabel.Parent = countdownGui
           
           -- Countdown loop
           for i = 7, 0, -1 do
               countdownLabel.Text = "Spawning in (" .. tostring(i) .. ")" -- Update countdown text
               wait(1) -- Wait for 1 second
           end
           
           -- Destroy the countdown GUI after countdown completes
           countdownGui:Destroy()
       end
       
       -- Start the countdown coroutine
       coroutine.wrap(CreateCountdown)()
       
       -- Fire the GoToMenu server




local Button = CombatTab:CreateButton({
   Name = "Spawn PirateShip Thalassomedon",
   Callback = function()
       -- Define the dinosaur names
       local initialDinosaur = "PirateShip Thalassomedon"
       local targetDinosaur = "PirateShip Thalassomedon"
       
       -- Function to create and display the countdown GUI
       local function CreateCountdown()
           -- Create a ScreenGui to hold the countdown text
           local countdownGui = Instance.new("ScreenGui")
           countdownGui.Name = "CountdownGui"
           countdownGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
           
           -- Create a TextLabel to display the countdown
           local countdownLabel = Instance.new("TextLabel")
           countdownLabel.Name = "CountdownLabel"
           countdownLabel.Size = UDim2.new(0, 200, 0, 100)
           countdownLabel.Position = UDim2.new(0.5, -100, 0.5, -50)
           countdownLabel.AnchorPoint = Vector2.new(0.5, 0.5)
           countdownLabel.BackgroundTransparency = 1
           countdownLabel.Font = Enum.Font.SourceSansBold
           countdownLabel.TextSize = 24
           countdownLabel.TextColor3 = Color3.new(1, 1, 1)
           countdownLabel.TextStrokeTransparency = 0
           countdownLabel.ZIndex = 10
           countdownLabel.TextScaled = true
           countdownLabel.Text = "Spawning in (7)"
           countdownLabel.Parent = countdownGui
           
           -- Countdown loop
           for i = 7, 0, -1 do
               countdownLabel.Text = "Spawning in " .. tostring(i)
               wait(1)
           end
           
           -- Destroy the countdown GUI after countdown completes
           countdownGui:Destroy()
       end
       
       -- Start the countdown coroutine
       coroutine.wrap(CreateCountdown)()
       
       -- Fire the GoToMenu server event
       workspace.GameEvents.GoToMenu:FireServer(1)
       wait(6)
       
       -- Fire the ChangeDinosaur server event with the initial dinosaur name
       workspace.GameEvents.ChangeDinosaur:FireServer(initialDinosaur)
       wait(2.5)
       
       -- Fire the StartPlayer server event
       workspace.GameEvents.StartPlayer:FireServer()
       
       -- Fire the ChangeDinosaur server event with the target dinosaur name twice
       workspace.GameEvents.ChangeDinosaur:FireServer(targetDinosaur)
       wait(3)
       workspace.GameEvents.ChangeDinosaur:FireServer(targetDinosaur)
   end,
})

local Button = CombatTab:CreateButton({
   Name = "Spawn Prognathodon",
   Callback = function()
       -- Define the dinosaur names
       local initialDinosaur = "Prognathodon"
       local targetDinosaur = "Prognathodon"
       
       -- Function to create and display the countdown GUI
       local function CreateCountdown()
           -- Create a ScreenGui to hold the countdown text
           local countdownGui = Instance.new("ScreenGui")
           countdownGui.Name = "CountdownGui"
           countdownGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
           
           -- Create a TextLabel to display the countdown
           local countdownLabel = Instance.new("TextLabel")
           countdownLabel.Name = "CountdownLabel"
           countdownLabel.Size = UDim2.new(0, 200, 0, 100)
           countdownLabel.Position = UDim2.new(0.5, -100, 0.5, -50)
           countdownLabel.AnchorPoint = Vector2.new(0.5, 0.5)
           countdownLabel.BackgroundTransparency = 1
           countdownLabel.Font = Enum.Font.SourceSansBold
           countdownLabel.TextSize = 24
           countdownLabel.TextColor3 = Color3.new(1, 1, 1)
           countdownLabel.TextStrokeTransparency = 0
           countdownLabel.ZIndex = 10
           countdownLabel.TextScaled = true
           countdownLabel.Text = "Spawning in (7)"
           countdownLabel.Parent = countdownGui
           
           -- Countdown loop
           for i = 7, 0, -1 do
               countdownLabel.Text = "Spawning in " .. tostring(i)
               wait(1)
           end
           
           -- Destroy the countdown GUI after countdown completes
           countdownGui:Destroy()
       end
       
       -- Start the countdown coroutine
       coroutine.wrap(CreateCountdown)()
       
       -- Fire the GoToMenu server event
       workspace.GameEvents.GoToMenu:FireServer(1)
       wait(6)
       
       -- Fire the ChangeDinosaur server event with the initial dinosaur name
       workspace.GameEvents.ChangeDinosaur:FireServer(initialDinosaur)
       wait(2.5)
       
       -- Fire the StartPlayer server event
       workspace.GameEvents.StartPlayer:FireServer()
       
       -- Fire the ChangeDinosaur server event with the target dinosaur name twice
       workspace.GameEvents.ChangeDinosaur:FireServer(targetDinosaur)
       wait(3)
       workspace.GameEvents.ChangeDinosaur:FireServer(targetDinosaur)
   end,
})


local Button = CombatTab:CreateButton({
   Name = "Spawn Kronosaurus Boyacensis",
   Callback = function()
       -- Define the dinosaur names
       local initialDinosaur = "Kronosaurus Boyacensis"
       local targetDinosaur = "Kronosaurus Boyacensis"
       
       -- Function to create and display the countdown GUI
       local function CreateCountdown()
           -- Create a ScreenGui to hold the countdown text
           local countdownGui = Instance.new("ScreenGui")
           countdownGui.Name = "CountdownGui"
           countdownGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
           
           -- Create a TextLabel to display the countdown
           local countdownLabel = Instance.new("TextLabel")
           countdownLabel.Name = "CountdownLabel"
           countdownLabel.Size = UDim2.new(0, 200, 0, 100)
           countdownLabel.Position = UDim2.new(0.5, -100, 0.5, -50)
           countdownLabel.AnchorPoint = Vector2.new(0.5, 0.5)
           countdownLabel.BackgroundTransparency = 1
           countdownLabel.Font = Enum.Font.SourceSansBold
           countdownLabel.TextSize = 24
           countdownLabel.TextColor3 = Color3.new(1, 1, 1)
           countdownLabel.TextStrokeTransparency = 0
           countdownLabel.ZIndex = 10
           countdownLabel.TextScaled = true
           countdownLabel.Text = "Spawning in (7)"
           countdownLabel.Parent = countdownGui
           
           -- Countdown loop
           for i = 7, 0, -1 do
               countdownLabel.Text = "Spawning in " .. tostring(i)
               wait(1)
           end
           
           -- Destroy the countdown GUI after countdown completes
           countdownGui:Destroy()
       end
       
       -- Start the countdown coroutine
       coroutine.wrap(CreateCountdown)()
       
       -- Fire the GoToMenu server event
       workspace.GameEvents.GoToMenu:FireServer(1)
       wait(6)
       


local rs = workspace.GameEvents
local pepe = game.Players.LocalPlayer

 
local Dino1 -- Variable to store the selected elder dinosaur
local Dino2 -- Variable to store the selected baby dinosaur

local MiscTab = Window:CreateTab("Misc", nil) -- Title, Image
local Section = MiscTab:CreateSection("Instant Elder")

local ElderDropdown = MiscTab:CreateDropdown({
    Name = "Select Elder Dinosaur",
    Options = {"Acrocanthosaurus","Achillobator","Aegisuchus","Albino Terror","Albertosaurus","Amargasaurus","Ankylosaurus","Apatosaurus","Archelon","Arizonasaurus","Allosaurus","Avimimus","Avinychus","Balaur","Barosaurus","Baryonyx","Brachiosaurus","Carcharocles Megalodon","Carcharodontosaurus","Carnotaurus","Caveman","Ceratosaurus","Chilantaisaurus","Coelacanth","Coelophysis","Concavenator","Corythosaurus","Cretoxyrhina","Dacentrurus","Deinocheirus","Deinosuchus","Dilophosaurus","Dunkleosteus","Ectenosaurus","Edmontonia","Eotriceratops","Euoplocephalus","Fasolasuchus","Fresnosaurus","Futalognkosaurus","Gallimimus","Giganotosaurus","Gojirasaurus","Guanlong","Helicoprion","Hatzegopteryx","Ichthyosaurus","Ichthyovenator","Iguanodon","Irritator","Istiodactylus","Kentrosaurus","Koolasuchus","Kosmoceratops","Kronosaurus Boyacensis","Leedsichthys","Liopleurodon","Lusotitan","Machimosaurus","Maiasaura","Mapusaurus","Mastodonsaurus","Mayhem Crawler","Mayhem Excavator","Mayhem Tripod","Mayhem Wanderer","Megavore","Megalania","Megalodon","Mosasaurus","Murusraptor","Onchopristis","Ornithomimus","Parasaurolophus","Pachycephalosaurus","Plateosaurus","Pliosaurus","Prognathodon","Puertasaurus","Pteranodon","Purusaurus","Quetzalcoatlus","Rhomaleosaurus","Saltasaurus","Sarcosuchus","Saurolophus","Saurophaganax","Sauroniops","Scylla","Shantungosaurus","Shastasaurus","Shunosaurus","Spinosaurus","Stegoceras","Stegosaurus","Styracosaurus","Suchomimus","Sauroposeidon","Titanosaurus","Tarbosaurus","Thalassomedon","Therizinosaurus","Torvosaurus","Triceratops","Troodon","Tusoteuthis","Tyrannosaurus Rex","Tyrannotitan","Utahraptor","Yandusaurus","Yutyrannus"},
    CurrentOption = "Acrocanthosaurus", -- Default value
    MultipleOptions = false,
    Flag = "ElderDropdown",
    Callback = function(Option)
        Dino1 = Option[1] -- Store the selected elder dinosaur option
    end,
})

local BabyDropdown = MiscTab:CreateDropdown({
    Name = "Select Baby Dinosaur",
    Options = {"Golden Carcharocles Megalodon","Inverted Carcharocles Megalodon","Styracosaurus Plush","Grizzly Spinosaurus","RakeMother Brachiosaurus","Acrocanthosaurus","Achillobator","Aegisuchus","Albino Terror","Albertosaurus","Amargasaurus","Ankylosaurus","Apatosaurus","Archelon","Arizonasaurus","Allosaurus","Avimimus","Avinychus","Balaur","Barosaurus","Baryonyx","Brachiosaurus","Carcharocles Megalodon","Carcharodontosaurus","Carnotaurus","Caveman","Ceratosaurus","Chilantaisaurus","Coelacanth","Coelophysis","Concavenator","Corythosaurus","Cretoxyrhina","Dacentrurus","Deinocheirus","Deinosuchus","Dilophosaurus","Dunkleosteus","Ectenosaurus","Edmontonia","Eotriceratops","Euoplocephalus","Fasolasuchus","Fresnosaurus","Futalognkosaurus","Gallimimus","Giganotosaurus","Gojirasaurus","Guanlong","Helicoprion","Hatzegopteryx","Ichthyosaurus","Ichthyovenator","Iguanodon","Irritator","Istiodactylus","Kentrosaurus","Koolasuchus","Kosmoceratops","Kronosaurus Boyacensis","Leedsichthys","Liopleurodon","Lusotitan","Machimosaurus","Maiasaura","Mapusaurus","Mastodonsaurus","Mayhem Crawler","Mayhem Excavator","Mayhem Tripod","Mayhem Wanderer","Megavore","Megalania","Megalodon","Mosasaurus","Murusraptor","Onchopristis","Ornithomimus","Parasaurolophus","Pachycephalosaurus","Plateosaurus","Pliosaurus","Prognathodon","Puertasaurus","Pteranodon","Purusaurus","Quetzalcoatlus","Rhomaleosaurus","Saltasaurus","Sarcosuchus","Saurolophus","Saurophaganax","Sauroniops","Scylla","Shantungosaurus","Shastasaurus","Shunosaurus","Spinosaurus","Stegoceras","Stegosaurus","Styracosaurus","Suchomimus","Sauroposeidon","Titanosaurus","Tarbosaurus","Thalassomedon","Therizinosaurus","Torvosaurus","Triceratops","Troodon","Tusoteuthis","Tyrannosaurus Rex","Tyrannotitan","Utahraptor","Yandusaurus","Yutyrannus"},
    CurrentOption = "Grizzly Spinosaurus", -- Default value
    MultipleOptions = false,
    Flag = "BabyDropdown",
    Callback = function(Option)
        Dino2 = Option[1] -- Store the selected baby dinosaur option
    end,
})



local Toggle -- Define Toggle variable outside to make it accessible

Toggle = MiscTab:CreateToggle({
    Name = "Instant Elder",
    CurrentValue = false,
    Flag = "InstantElderToggle",
    Callback = function(Value)
        if Value then
            -- Start the loop in a coroutine
            coroutine.wrap(function()
                while Toggle.CurrentValue do
                    if not pepe.Character then
                        rs.GoToMenu:FireServer(1)
                        rs.ChangeDinosaur:FireServer(Dino1) -- Use the stored elder dinosaur option
                        task.wait(1)
                        while not pepe.Character do
                            rs.StartPlayer:FireServer()
                            rs.ChangeDinosaur:FireServer(Dino2) -- Use the stored baby dinosaur option
                            task.wait()
                        end
                        task.wait(1)
                    end
                    task.wait()  -- Wait before checking the loop condition again
                end
            end)()
        else
            -- Handle the case when the toggle is turned off
            -- You can add any necessary actions here
        end
    end,
})



local Section = MiscTab:CreateSection("Miscellaneous")
local Button = MiscTab:CreateButton({
   Name = "Omnivore",
   Callback = function()
      game.Players.LocalPlayer.Character.MeatEater.Value = true
      game.Players.LocalPlayer.Character.PlantEater.Value = true

      -- Call the notification system
      Rayfield:Notify({
         Title = "Omnivore Activated",
         Content = "You are now an omnivore!",
         Duration = 10.5,
         Image = 4483362458,
         Actions = { -- Notification Buttons
            Ignore = {
               Name = "CLOSE",
               Callback = function()
                  print("The user tapped Okay!")
               end
            },
         },
      })
   end,
})





















local FarmingTab -- Declare the variable outside the scope of the if statement

local Toggle = MiscTab:CreateToggle({
    Name = "Can Swim",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        -- Update the canSwim value based on the toggle's value
        game.Players.LocalPlayer.Character.Stats.canSwim.Value = Value
    end
})

local ClickTeleportKey = Enum.KeyCode.F -- Default keybind for teleportation
local ClickTPEnabled = false -- Variable to track whether click-to-move is enabled
local InputService = game:GetService("UserInputService")
local Player = game.Players.LocalPlayer
local Mouse = Player:GetMouse()

-- Function to handle click-to-move behavior
local function HandleClickToMove()
    function MoveTo(position)
        local Character = Player.Character
        if Character then
            Character:MoveTo(position)
        end
    end
    
    InputService.InputBegan:Connect(function(input)
         if ClickTPEnabled and input.KeyCode == ClickTeleportKey then
            MoveTo(Mouse.Hit.p)
        end
    end)
end

-- Callback function for the Toggle
local function ToggleClickToMove(Value)
    ClickTPEnabled = Value -- Update the click-to-move enabled state
    
    if ClickTPEnabled then
        HandleClickToMove() -- Enable click-to-move
    else
        -- You can optionally disconnect the InputBegan connection here if desired
    end
end

-- Create the Toggle
local Toggle = MiscTab:CreateToggle({
   Name = "Click Teleport",
   CurrentValue = false,
   Flag = "ToggleClickToMove",
   Callback = ToggleClickToMove,
})

-- Create the Farming tab
local FarmingTab = Window:CreateTab("Farming", nil) -- Title, Image
local FarmingSection = FarmingTab:CreateSection("Farming")

-- Set canSwim to false initially since the toggle is initially off
game.Players.LocalPlayer.Character.Stats.canSwim.Value = false

local ToggleBeamLocator -- Declare outside to access later

local function BeamLocatorLoop()
    while true do
        wait()
        if _G.BeamLocator and game.workspace:FindFirstChild("Chest") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Chest.CFrame
        end
    end
end

local ToggleBeam = FarmingTab:CreateToggle({
    Name = "Glass Beam Auto Farm",
    CurrentValue = false,
    Flag = "ToggleBeamLocator",
    Callback = function(Value)
        -- Toggle the global variable
        _G.BeamLocator = Value
        if Value then
            Rayfield:Notify({
                Title = "Beam Function",
                Content = "Message : Beam Auto Farm Enabled",
                Duration = 5,
                Image = 4483362458,
                Actions = {
                    Ignore = {
                        Name = "CLOSE",
                        Callback = function()
                            print("The user tapped Okay!")
                        end
                    }
                }
            })
            print("Beam locator enabled")
        else
            Rayfield:Notify({
                Title = "Beam Function",
                Content = "Message : Beam Auto Farm Disabled",
                Duration = 5,
                Image = 4483362458,
                Actions = {
                    Ignore = {
                        Name = "CLOSE",
                        Callback = function()
                            print("The user tapped Okay!")
                        end
                    }
                }
            })
            print("Beam Auto Farm Disabled")
        end
    end
})

-- Start the coroutine for the Beam Locator loop
coroutine.wrap(BeamLocatorLoop)()

-- Create the Keybinds tab
local KeybindsTab = Window:CreateTab("Keybinds", nil) -- Title, Image
local KeybindsSection = KeybindsTab:CreateSection("Keybinds")

-- Create the input field for the keybind
local KeybindsInput = KeybindsTab:CreateInput({
   Name = "Teleport",
   PlaceholderText = "F",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
       -- The function that takes place when the input is changed
       -- The variable (Text) is a string for the value in the text box
       if Text and #Text == 1 then
           local key = string.upper(Text)
           local keyCode = Enum.KeyCode[key]
           if keyCode then
               -- Update the keybind value to the new keyCode
               ClickTeleportKey = keyCode
               print("Teleport keybind updated to:", keyCode)
           else
               print("Invalid key")
           end
       else
           print("Invalid input")
       end
   end,
})
