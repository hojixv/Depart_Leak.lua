-- pasted

getgenv().Depart = {
    kanyeJumpScare = {
        Enabled = true,
    },
    cameralock = {
        On = true,
        Key = "C",
        UseAirShot = true,
        EasingStyles = Enum.EasingStyle.Exponential,
        Part = "HumanoidRootPart",
        AirShotPart = "Head",
        AirShotSmoothness = 0.10,
        AirShotPrediction = 0.04334,
        EnableAirShotPrediction = true,
        DisableTargetAim = false,
        Prediction = 0.256688,
        Smoothness = 1,
        FoV = {
            Visible = false,
            Color = Color3.new(1, 1, 1),
            Radius = 1000,
            Transparency = 0.1
        }
    },

    Target = {
        On = true,
        Prediction = 0.12505,
        UseAirShot = true,
        EnableAirShotPrediction = false,
        MultipleHitParts = {"HumanoidRootPart", "Head", "UpperTorso"},
        Fov = {
            Visible = false,
            Color = Color3.new(1, 1, 1),
            Radius = 1000,
            Transparency = 0.1
        }
    },

    Macro = {
        Keybind = "X",
        Mode = "ThirdPerson", --// Options: FirstPerson, ThirdPerson
        Speed = 0.00001
    },

    SilentAim = {
        Setting = {
            Prediction = 0.127122,
            TargetPart = "HumanoidRootPart",
            WallCheck = false,
            ClosestPart = true,
            Enabled = true,
            FOV = {
                Radius = 100,
                Visible = false,
            },
            KOCheck = true,
        }
    }
}

--// Local variables
local Inset = game:GetService("GuiService"):GetGuiInset().Y
local Mouse = game.Players.LocalPlayer:GetMouse()
local Client = game.Players.LocalPlayer
local Cam = workspace.CurrentCamera

--// FOV Circle Drawing
local FOV = Drawing.new("Circle")
FOV.Thickness = 1
FOV.Color = Color3.fromRGB(255, 0, 0)
FOV.Filled = false

local function UpdateFOV()
    local fovSettings = Depart.Target.Fov
    if fovSettings.Visible then
        FOV.Position = Vector2.new(Mouse.X, Mouse.Y + Inset)
        FOV.Radius = fovSettings.Radius
        FOV.Visible = true
    else
        FOV.Visible = false
    end
end

task.spawn(function()
    while task.wait(0.5) do
        UpdateFOV()
    end
end)

local function WallCheck(destination, ignore)
    if not Depart.SilentAim.Setting.WallCheck then
        return true
    end
    local origin = Cam.CFrame.p
    local direction = destination - origin
    local ray = Ray.new(origin, direction)
    local hit = workspace:FindPartOnRayWithIgnoreList(ray, ignore)
    return hit == nil
end

local function Death(Plr)
    if Plr.Character and Plr.Character:FindFirstChild("BodyEffects") then
        local bodyEffects = Plr.Character.BodyEffects
        local ko = bodyEffects:FindFirstChild("K.O") or bodyEffects:FindFirstChild("KO")
        return ko and ko.Value
    end
    return false
end

local function getClosestChar()
    local target, closestDist = nil, math.huge
    local mousePos = Vector2.new(Mouse.X, Mouse.Y)

    for _, v in pairs(game.Players:GetPlayers()) do
        if v.Character and v ~= Client and v.Character:FindFirstChild("HumanoidRootPart") then
            if Depart.SilentAim.Setting.KOCheck and Death(v) then
                continue
            end

            local closestPart, closestPartDistance = nil, math.huge
            local partsToCheck = Depart.SilentAim.Setting.ClosestPart and v.Character:GetChildren() or {v.Character:FindFirstChild(Depart.SilentAim.Setting.TargetPart)}

            for _, part in pairs(partsToCheck) do
                if part:IsA("BasePart") then
                    local partPos = Cam:WorldToScreenPoint(part.Position)
                    local distance = (Vector2.new(partPos.X, partPos.Y) - mousePos).Magnitude
                    if distance < closestPartDistance and distance < Depart.SilentAim.Setting.FOV.Radius and WallCheck(part.Position, {Client, v.Character}) then
                        closestPartDistance = distance
                        closestPart = part
                    end
                end
            end

            if closestPart and closestPartDistance < closestDist then
                closestDist = closestPartDistance
                target = {Player = v, Part = closestPart}
            end
        end
    end
    return target
end

local function Arguments()
        local placeIds = {
            [16871610060] = "UpdateMousePos",
            [18128296193] = "UpdateMousePos",
            [18126537775] = "UpdateMousePos",
            [2788229376] = "UpdateMousePosI",
            [16033173781] = "UpdateMousePosI",
            [7213786345] = "UpdateMousePosI",
            [9825515356] = "MousePosUpdate",
            [17895632819] = "UpdateMousePos",
            [5602055394] = "MousePos",
            [7951883376] = "MousePos",
            [9183932460] = "UpdateMousePos",
            [17403265390] = "MOUSE",
            [14412601883] = "MOUSE",
            [18111448661] = "MOUSE",
            [14487637618] = "MOUSE",
            [11143225577] = "UpdateMousePos",
            [14413712255] = "MOUSE",
            [12927359803] = "UpdateMousePos",
            [12867571492] = "UpdateMousePos",
            [11867820563] = "UpdateMousePos",
            [17109142105] = "MoonUpdateMousePos",
            [15186202290] = "MOUSE",
            [16469595315] = "UpdateMousePos",
            [17319408836] = "UpdateMousePosI",
            [14975320521] = "UpdateMousePos",
            [17200018150] = "UpdateMousePos",
            [15644861772] = "UpdateMousePos",
            [17723797487] = "UpdateMousePosI",
            [17897702920] = "UpdateMousePos",
            [17809101348] = "UpdateMousePos",
            [17344804827] = "UpdateMousePos",
            [16435867341] = "UpdateMousePos",
            [18128019573] = "UpdateMousePos",
            [17079102898] = "UpdateMousePos",
            [16859411452] = "UpdateMousePos",
            [17718959553] = "UpdateMousePos",
            [14277620939] = "UpdateMousePos",
            [18100659835] = "UpdateMousePos",
            [13504008904] = "UpdateMousePos",
            [18700848369] = "UpdateMousePos",
            [18209866987] = "UpdateMousePos",
            [18128296193] = "UpdateMousePos",
            [18111451594] = "MOUSE",
            [14800398569] = "UpdateMousePos",
            [18128226573] = "UpdateMousePos",
            [16871610060] = "UpdateMousePos",
            [17836920497] = "Mouse",
        }
    return placeIds[game.PlaceId] or "UpdateMousePos"
end

local function MainEvents()
    local eventNames = {
        "MainEvent",
        "MAINEVENT",
        "Bullets",
        ".gg/untitledhood",
    }
    for _, child in pairs(game.ReplicatedStorage:GetChildren()) do
        for _, eventName in pairs(eventNames) do
            if child.Name == eventName then
                return child
            end
        end
    end
end

local function connectToolActivation(tool)
    if tool:IsA("Tool") then
        local debounce = false
        tool.Activated:Connect(function()
            if not debounce then
                debounce = true
                if Depart.SilentAim.Setting.Enabled then
                    local target = getClosestChar()
                    if target then
                        local endPoint = target.Part.CFrame.Position + (target.Part.Velocity * Depart.SilentAim.Setting.Prediction)
                        MainEvents():FireServer(Arguments(), endPoint)
                    end
                end
                task.wait(0.1)
                debounce = false
            end
        end)
    end
end

local function handleRespawn()
    for _, tool in pairs(Client.Backpack:GetChildren()) do
        connectToolActivation(tool)
    end

    Client.Character.ChildAdded:Connect(function(tool)
        connectToolActivation(tool)
    end)
end

local function setupRespawnHandling()
    Client.CharacterAdded:Connect(function()
        task.wait(1)
        handleRespawn()
    end)
end

handleRespawn()
setupRespawnHandling()





local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local playersService = game:GetService("Players")
local workspace = game:GetService("Workspace")
local camera = workspace.CurrentCamera
local localPlayer = playersService.LocalPlayer
local mouse = localPlayer:GetMouse()

local aimCircle = Drawing.new("Circle")
local camlockCircle = Drawing.new("Circle")

local function updateCircles()
    local guiInsetY = game:GetService("GuiService"):GetGuiInset().Y
    local mousePosition = Vector2.new(mouse.X, mouse.Y + guiInsetY)

    local targetFov = getgenv().Depart.Target.Fov
    if targetFov then
        aimCircle.Visible = targetFov.Visible
        aimCircle.Color = targetFov.Color
        aimCircle.Radius = targetFov.Radius
        aimCircle.Transparency = targetFov.Transparency
        aimCircle.Position = mousePosition
    end

    local cameralockFov = getgenv().Depart.cameralock.FoV
    if cameralockFov then
        camlockCircle.Visible = cameralockFov.Visible
        camlockCircle.Color = cameralockFov.Color
        camlockCircle.Radius = cameralockFov.Radius
        camlockCircle.Transparency = cameralockFov.Transparency
        camlockCircle.Position = mousePosition
    end
end

runService.RenderStepped:Connect(updateCircles)

local function isDead(player)
    if player.Character and player.Character:FindFirstChild("BodyEffects") then
        local bodyEffects = player.Character.BodyEffects
        local ko = bodyEffects:FindFirstChild("K.O") or bodyEffects:FindFirstChild("KO")
        return ko and ko.Value or false
    end
    return false
end

local function isGrabbed(player)
    return player.Character and player.Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil
end

local function findClosestPlayer(circle)
    local closestPlayer, shortestDistance = nil, math.huge
    local players = playersService:GetPlayers()
    local mousePosition = Vector2.new(mouse.X, mouse.Y)

    for _, player in ipairs(players) do
        if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local screenPosition, onScreen = camera:WorldToScreenPoint(player.Character.HumanoidRootPart.Position)
            if onScreen then
                local distance = (Vector2.new(screenPosition.X, screenPosition.Y) - mousePosition).Magnitude
                if circle.Radius > distance and distance < shortestDistance then
                    closestPlayer, shortestDistance = player, distance
                end
            end
        end
    end
    return closestPlayer
end

local function toggleCamlock(input, processed)
    if processed then return end

    local camlockKey = Enum.KeyCode[getgenv().Depart.cameralock.Key]
    if input.KeyCode == camlockKey then
        camlockToggle = not camlockToggle

        if camlockToggle then
            if getgenv().Depart.cameralock.On then
                if getgenv().Depart.cameralock.DisableTargetAim then
                    camlockTarget = findClosestPlayer(camlockCircle)
                else
                    if getgenv().Depart.Target.On and getgenv().Depart.Target.UseAirShot then
                        silentTarget = findClosestPlayer(aimCircle)
                    end
                    camlockTarget = findClosestPlayer(camlockCircle)
                end
            end
        else
            silentTarget, camlockTarget = nil, nil
        end
    end
end

userInputService.InputBegan:Connect(toggleCamlock)

local function getArgument()
    local currentPlaceId = game.PlaceId
    local eventName, args

    if currentPlaceId == 2788229376 or currentPlaceId == 7213786345 or currentPlaceId == 16033173781 then
        eventName = "MainEvent"
        args = { "UpdateMousePosI", Vector3.new(-621.6868286132812, 18.75, -117.6417465209961) }
    elseif currentPlaceId == 9825515356 then
        eventName = "MainEvent"
        args = { "MousePosUpdate", Vector3.new(9367.11328125, 547.904541015625, -3346.381103515625) }
    elseif currentPlaceId == 15186202290 or currentPlaceId == 17836920497 or currentPlaceId == 17403265390 then
        eventName = "MAINEVENT"
        args = { "MOUSE", Vector3.new(-105.59376525878906, 11.003229141235352, 127.97737884521484) }
    else
        eventName = "MainEvent"
        args = { "UpdateMousePos", Vector3.new(-134.94320678710938, 21.908273696899414, -769.0164794921875) }
    end

    return eventName, args
end

local function getVelocity(player, partName)
    local part = player.Character and player.Character:FindFirstChild(partName)
    return part and part.Velocity or Vector3.new()
end

local function handleSilentAim(tool)
    local eventName, arguments = getArgument()
    local event = game.ReplicatedStorage:FindFirstChild(eventName)

    if tool:IsA("Tool") and event then
        tool.Activated:Connect(function()
            if silentTarget and silentTarget.Character and not isDead(silentTarget) then
                local settings = getgenv().Depart.Target
                local targetPart = silentTarget.Character:FindFirstChild(settings.MultipleHitParts[1])

                if settings.UseAirShot and targetPart and targetPart.Velocity.Y < -16 then
                    if getgenv().Depart.Target.EnableAirShotPrediction then
                        targetPart = silentTarget.Character:FindFirstChild(settings.AirShotPart)
                    end
                end

                if targetPart then
                    local targetPosition = targetPart.Position + (getVelocity(silentTarget, settings.MultipleHitParts[1]) * settings.Prediction)
                    event:FireServer(unpack(arguments), targetPosition)
                end
            end
        end)
    end
end

local function handleCamlock()
    if camlockToggle and camlockTarget and camlockTarget.Character and not isDead(camlockTarget) then
        local settings = getgenv().Depart.cameralock
        local hitPartName = settings.Part
        local airPartName = settings.AirShotPart
        local prediction = settings.Prediction
        local airshotPrediction = settings.AirShotPrediction
        local smooth = settings.Smoothness
        local airPartSmooth = settings.AirShotSmoothness
        local hitAirPartEnabled = settings.UseAirShot

        local targetPart = camlockTarget.Character:FindFirstChild(hitPartName)
        local isAirShot = hitAirPartEnabled and targetPart and targetPart.Velocity.Y < 0

        if isAirShot then
            if getgenv().Depart.cameralock.EnableAirShotPrediction then
                targetPart = camlockTarget.Character:FindFirstChild(airPartName)
                if targetPart then
                    smooth = airPartSmooth
                    prediction = airshotPrediction
                end
            end
        end

        if targetPart then
            local targetVelocity = getVelocity(camlockTarget, hitPartName)
            local predictedPosition = targetPart.Position + targetVelocity * prediction
            local targetCFrame = CFrame.new(camera.CFrame.Position, predictedPosition)

            camera.CFrame = camera.CFrame:Lerp(targetCFrame, smooth)
        end
    else
        camlockTarget = nil
    end
end

runService.RenderStepped:Connect(handleCamlock)

local function onToolEquipped(tool)
    handleSilentAim(tool)
end

local function connectToolEvents()
    for _, tool in ipairs(localPlayer.Backpack:GetChildren()) do
        if tool:IsA("Tool") then
            onToolEquipped(tool)
        end
    end

    localPlayer.Backpack.ChildAdded:Connect(function(child)
        if child:IsA("Tool") then
            onToolEquipped(child)
        end
    end)
end

connectToolEvents()

local function onCharacterAdded(character)
    character.ChildAdded:Connect(function(child)
        if child:IsA("Tool") then
            onToolEquipped(child)
        end
    end)
    for _, tool in pairs(character:GetChildren()) do
        if tool:IsA("Tool") then
            onToolEquipped(tool)
        end
    end

    camlockTarget = nil
end

localPlayer.CharacterAdded:Connect(onCharacterAdded)
if localPlayer.Character then
    onCharacterAdded(localPlayer.Character)
end


local VirtualInputManager = game:GetService("VirtualInputManager")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")

local function handleMacroSpeedGlitch()
    local settings = getgenv().Depart.Macro
    local interval = settings.Speed

    if settings.Keybind then
        local function onMacroInput(input, processed)
            if processed then return end

            if input.KeyCode == Enum.KeyCode[settings.Keybind] then
                settings.Enabled = not settings.Enabled

                if settings.Enabled then
                    if settings.Mode == "FirstPerson" then
                        local nextActionTime = tick() + interval

                        repeat
                            if tick() >= nextActionTime then
                                VirtualInputManager:SendMouseWheelEvent(0, 0, true, game)
                                runService.Heartbeat:Wait()
                                VirtualInputManager:SendMouseWheelEvent(0, 0, false, game)
                                nextActionTime = tick() + interval
                            end
                            runService.Heartbeat:Wait()
                        until not settings.Enabled

                    elseif settings.Mode == "ThirdPerson" then
                        local actionInterval = interval / 4
                        local nextActionTime = tick() + actionInterval

                        repeat
                            if tick() >= nextActionTime then
                                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.I, false, game)
                                nextActionTime = tick() + actionInterval
                            end
                            runService.Heartbeat:Wait()

                            if tick() >= nextActionTime then
                                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.O, false, game)
                                nextActionTime = tick() + actionInterval
                            end
                            runService.Heartbeat:Wait()

                            if tick() >= nextActionTime then
                                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.I, false, game)
                                nextActionTime = tick() + actionInterval
                            end
                            runService.Heartbeat:Wait()

                            if tick() >= nextActionTime then
                                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.O, false, game)
                                nextActionTime = tick() + actionInterval
                            end
                            runService.Heartbeat:Wait()

                        until not settings.Enabled
                    end
                end
            end
        end
        userInputService.InputBegan:Connect(onMacroInput)
    end
end

handleMacroSpeedGlitch()
