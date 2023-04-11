local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("BILL", "RJTheme3")
local Tab = Window:NewTab("Slap Battles")

local Section = Tab:NewSection("game")
local Section1 = Tab:NewSection("aura test")
local Section2 = Tab:NewSection("local")

local bypass;
bypass = hookmetamethod(game, "__namecall", function(method, ...) 
    if getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.Ban then
        return
    elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.AdminGUI then
        return
    elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.WalkSpeedChanged then
        return
    end
    return bypass(method, ...)
end)
    
task.wait()
    
if setfpscap then
        
    setfpscap(1269)
        
end
local Gloves = loadstring(game:HttpGet("https://raw.githubusercontent.com/cheesynob39/R20-EXPLOITER/main/Files/Gloves.lua"))()
local Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/cheesynob39/R20-EXPLOITER/main/Files/Functions.lua"))()
local function getGlove()
	    
    return game.Players.LocalPlayer.leaderstats.Glove.Value
end
local jesus = Instance.new("Part", workspace)

	jesus.Name = "jesusWalk"
	jesus.Size = Vector3.new(2047, 0.009, 2019)
	jesus.Position = Vector3.new(-80.5, -10.005, -246.5)
	jesus.CanCollide = false
	jesus.Anchored = true
	jesus.Transparency = 1
	
local arenaVoid = Instance.new("Part", workspace)

	arenaVoid.Name = "arenaVoid"
	arenaVoid.Size = Vector3.new(798, 1, 1290)
	arenaVoid.Position = Vector3.new(3450, 59.009, 68)
	arenaVoid.CanCollide = false
	arenaVoid.Anchored = true
	arenaVoid.Transparency = 1
Section:NewToggle("Normal Arena Anti-Void", "Creates A Barrier Over the Void In The Main Arena", function(state)
    if state then
	jesus.CanCollide = true
	jesus.Anchored = true
	jesus.Transparency = 0.5
    else

	jesus.CanCollide = false
	jesus.Anchored = true
	jesus.Transparency = 1
    end
end)

Section1:NewToggle("Slap Aura","awdadw", function(bool)

        getgenv().SlapAura = bool

            if bool == true then

                while getgenv().SlapAura do

                    task.wait(.005)
                        
                        for Index, Player in next, game.Players:GetPlayers() do
                            
                            if Player ~= game.Players.LocalPlayer and Player.Character and Player.Character:FindFirstChild("entered") then
                                
                                if Player.Character:FindFirstChild("Head") then
                                    
                                if Player.Character.Head:FindFirstChild("UnoReverseCard") == nil and Player.Character:FindFirstChild("rock") == nil then
                                    
                                    if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then

                                    local Magnitude = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude
                                    
                                    if 25 >= Magnitude then
                                        
                                        shared.gloveHits[getGlove()]:FireServer(Player.Character:WaitForChild("Head"))
                                        
                                end
                                    
                                    end
                            end
                                
                                end
                        end
                        
                        end
            
                end
                
            end
    
    end)

Section:NewToggle("Anti Ragdoll", "Creates A Barrier Over the Void In The Main Arena", function(bool)
    
    antiRagdoll = bool
        
    if bool == true then
            
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
        
    task.wait()
        
    game.Players.LocalPlayer.CharacterAdded:Connect(function()

        local Character = game.Workspace[game.Players.LocalPlayer.Name]
            
        task.wait()
            
        Character:WaitForChild("Ragdolled").Changed:Connect(function()
                
            if Character:WaitForChild("Ragdolled").Value == true and antiRagdoll == true then
                    
                repeat task.wait()
                        
                Character.Torso.Anchored = true
                        
                until Character:FindFirstChild("Torso") == nil or Character:WaitForChild("Ragdolled").Value == false
                    
                Character.Torso.Anchored = false

            end
                
        end)
            
    end)
        
    end
            
end)


Section:NewToggle("Disable Death Barriers","don t kill ", function(bool)
        
    if bool == true then
        
    if workspace:FindFirstChild("dedBarrier") and workspace:FindFirstChild("DEATHBARRIER") and workspace:FindFirstChild("DEATHBARRIER2") then
    
        workspace.DEATHBARRIER.CanTouch = false
        workspace.DEATHBARRIER2.CanTouch = false
        workspace.dedBarrier.CanTouch = false
        
    else
            
        print("No Death Barriers")
        
    end
        
    else
            
        workspace.DEATHBARRIER.CanTouch = true
        workspace.DEATHBARRIER2.CanTouch = true
        workspace.dedBarrier.CanTouch = true
        
    end
        
end)


Section:NewToggle("Disable Cube Of Death","cube frands", function(bool)
        
        if bool == true then
        
        if game.Workspace:FindFirstChild("the cube of death(i heard it kills)", 1) then
            
        workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = false
        
        end
        
        else
            
            if game.Workspace:FindFirstChild("the cube of death(i heard it kills)", 1) then
                
                workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = true

            end

        end
        
    end)


Section2:NewSlider("WALKSPEED", "YOU SPEED", 300, 15, function(WS) -- 500 (Макс. значение) | 0 (Мин. значение)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = WS
        
    WS1 = WS
end)

Section2:NewButton("REJOIN", "ButtonInfo", function()
    -- rejoin		
    local TeleportService = game:GetService("TeleportService")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
 
    local Rejoin = coroutine.create(function()
        local Success, ErrorMessage = pcall(function()
            TeleportService:Teleport(game.PlaceId, LocalPlayer)
        end)
 
        if ErrorMessage and not Success then
            warn(ErrorMessage)
        end
    end)
 
coroutine.resume(Rejoin)
end)
