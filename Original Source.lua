if not game.ReplicatedStorage:FindFirstChild("GameData") or not game.ReplicatedStorage:FindFirstChild("EntityInfo") then return end
local actualName = "Fire~Doors"
local version = "2.1.5"
local fullName = actualName.." ["..version.."]"
_G.fullName = fullName
_G.actualName = actualName
local logoImage = "http://www.roblox.com/asset/?id=876744268"
_G.logoImage = logoImage
local ppNames = {
	["ModulePrompt"] = true,
	["ActivateEventPrompt"] = true,
	["LootPrompt"] = true,
	["SkipPrompt"] = true,
	["HerbPrompt"] = true,
	["AwesomePrompt"] = true,
	["UnlockPrompt"] = true,
}
local pagelist,close,mainFrame,screenGui,logo,title = loadstring(game:HttpGet("https://raw.githubusercontent.com/InfernusScriptz/FireHub/main/hub.lua"))()
local pageList = pagelist
local connectedFunctions = {}
local hwidWhitelist = loadstring(game:HttpGet("https://raw.githubusercontent.com/InfernusScriptz/Fire-Doors/main/Whitelist.lua"))()
local MarketplaceService = game:GetService("MarketplaceService")
local bools = {
	["nill"] = true,
	["DoorESP"] = false,
	["DrawerESP"] = false,
	["EntityESP"] = false,
	["PlayerESP"] = false,
	["AutoInteract"] = false,
	["Tornado"] = false,
	["Noclipping"] = false,
	["EnableAllInteractables"] = false,
	["NotifyEntities"] = false,
	["PlayerUntouchable"] = false,
	["God"] = false,
	["ItemESP"] = false,
	["InstantInteract"] = false,
	["NoSeek"] = false,
	["Massless"] = false,
	["Autoplay"] = false,
	["FullBright"] = false,
	["EnableJumping"] = false,
	["NeverAnchor"] = false,
	["SpamOthersTools"] = false,
	["FarAutoLoot"] = false,
	["FlingOnDeath"] = false,
	["NotifyEntetiesForOthers"] = false,
	["FarDoors"] = false,
	["FlexAchievements"] = false,
	["AutoLibraryCode"] = false,
	["SpamWalkSound"] = false,
	["AutoHide"] = false,
	["AutoFixElevator"] = false,
	["ShowBackpacks"] = false,
	["NotifyWhenPlayerEntersOrLeaves"] = false,
	["MOTAA"] = false,
	["MOTANA"] = false,
	["SpeedBypass"] = false,
	["BrokenNeck"] = false,
	["FOV"] = false,
	["HidingSpotESP"] = false,
	["NoSliding"] = false,
}
local closed = false
local Font = Enum.Font.Oswald
local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local gui = game.CoreGui
local collision = char:FindFirstChild("Collision")
if not collision then
	collision = Instance.new('Part',char)
	collision.Anchored = true
end
local bp = plr.Backpack or plr:WaitForChild("Backpack")
local hrp = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Collision") or char:FindFirstChildOfClass("BasePart")
local hum = char:WaitForChild("Humanoid")
local event = Instance.new("BindableEvent",screenGui)
workspace.FallenPartsDestroyHeight = (1/0)/(1/0)
workspace.FilteringEnabled = true
local fireproximityprompt = fireproximityprompt or function(Obj, Amount, Skip)
	local Skip = Skip or false
	if Obj and Obj.Parent and Obj:IsA("ProximityPrompt") then 
		local Amount = Amount or 1
		local ex = Obj.Exclusivity
		Obj.Exclusivity = Enum.ProximityPromptExclusivity.AlwaysShow
		if Amount == 0 or Amount <= 0 then
			Amount = 1
		end
		local PromptTime = Obj.HoldDuration
		if Skip == true then 
			Obj.HoldDuration = 0
		end
		for i = 1, Amount do 
			Obj:InputHoldBegin()
			if not Skip then 
				task.wait(Obj.HoldDuration)
			end
			Obj:InputHoldEnd()
		end
		Obj.Exclusivity = ex
		Obj.HoldDuration = PromptTime
	end
end
local waypointSpacing = "0.5"
function WaitForChildOfClass(where,className)
	if where and where:FindFirstChildOfClass(className) then
		return where:FindFirstChildOfClass(className)
	elseif where and not where:FindFirstChildOfClass(className) then
		coroutine.wrap(function()
			task.wait(5)
			if where and not where:FindFirstChildOfClass(className) then
				warn("Infinite yield possible on '"..where.Name..[[:WaitForChildOfClass("]]..className..[[")']])
			end
		end)()
		repeat
			game["Run Service"].Stepped:Wait()
		until where:FindFirstChildOfClass(className) or not where or closed or where:IsDescendantOf(nil)
		if where then
			return where:FindFirstChildOfClass(className)
		else
			warn("Cannot do the operation '".."nil"..[[:WaitForChildOfClass("]]..className..[[")'
The instance is not exist.]])
			return nil
		end
	end
end
local WaitForChildWhichIsA = WaitForChildOfClass
local rs = function(times)
	local times = times or 1
	if times == 0 or times <= 0 then
		times = 1
	end
	times = math.round(times)
	for i=1,times do
		game["Run Service"].Stepped:Wait()
	end
end
local textBar = game:GetService("CoreGui").ExperienceChat.appLayout.chatInputBar.Background.Container.TextContainer.TextBoxContainer.TextBox
function sendMessage(text)
	text = text or "lol"
	if text == "" then
		text = "lol"
	end
	local txt = textBar.Text
	local focused = textBar:IsFocused()
	game["Run Service"].Stepped:Wait()
	textBar.Text = text
	textBar:CaptureFocus()
	game["Run Service"].Stepped:Wait()
	textBar:ReleaseFocus(true)
	textBar.Text = txt
	if focused then
		textBar:CaptureFocus()
	end
	game["Run Service"].Stepped:Wait()
end
local distanceMult = 0
local function randomString(amoutOfSymbols)
	local symbols = string.split([[qSEPwSEPeSEPrSEPtSEPySEPuSEPiSEPoSEPpSEPaSEPsSEPdSEPfSEPgSEPhSEPjSEPkSEPlSEPzSEPxSEPcSEPvSEPbSEPnSEPmSEP1SEP2SEP3SEP4SEP5SEP6SEP7SEP8SEP9SEP0SEP-SEP=SEP`SEP\SEP/SEP.SEP,SEP+SEP_SEP*SEP;SEP:SEP'SEP"SEP]SEP[SEP SEP|SEP!SEP@SEP#SEP$SEP%SEP^SEP&SEP&SEP(SEP)SEP?SEP 
SEP	SEP😎SEP😈SEP💀SEPSepSEPSЕРSEPSeparatorSEPXDSEPLOLSEPXDSEPOOFSEPLove you!]],"SEP")
	local context = ""
	amoutOfSymbols = amoutOfSymbols or math.random(1, 250)
	if amoutOfSymbols == 0 or amoutOfSymbols <= 0 then
		amoutOfSymbols = math.random(1,250)
	end
	for i=1,amoutOfSymbols do
		local uorl = false
		if math.random(1,2) == 1 then
			uorl = true
		end
		local addSymbol = symbols[math.random(1,#symbols)]
		if uorl then
			addSymbol = string.upper(addSymbol)
		else
			addSymbol = string.lower(addSymbol)
		end
		context = context..addSymbol
	end
	return context
end
event.Name = randomString()
local function esp(target,color,text,boolName)
	local color = color or Color3.fromRGB(255,255,255)
	if target then
		text = text or target.Name
	end
	local boolName = boolName or "nill"
	if bools[boolName] == nil then
		boolName = "nill"
	end
	local function esp(target)
		local espDetected = false
		local fldr = nil
		if target and target.Parent  then
			for i,v in pairs(target:GetChildren()) do
				if v and v.Parent and v:IsA("Folder") and string.match(string.lower(v:GetFullName()),"esp") then
					espDetected = true
					fldr = v
				end
			end
		end
		if target and target.Parent and not espDetected then
			local folder = Instance.new("Folder",target)
			folder.Name = "esp"..randomString()
			local esp = Instance.new("Highlight",folder)
			esp.OutlineColor = color
			esp.FillColor = color
			esp.Adornee = target
			esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			esp.OutlineTransparency = 0.75
			esp.OutlineTransparency = 0
			local bg = Instance.new("BillboardGui",folder)
			bg.Size = UDim2.fromOffset(100,100)
			bg.Brightness = 1
			bg.AlwaysOnTop = true
			bg.MaxDistance = 1000
			bg.Adornee = target
			local frame = Instance.new("Frame",bg)
			frame.BackgroundColor3 = color
			frame.AnchorPoint = Vector2.new(0.5,0.5)
			frame.Position = UDim2.fromScale(0.5,0.5)
			frame.Size = UDim2.fromScale(0.1,0.1)
			local gradient = Instance.new("UIGradient",frame)
			gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(75,75,75))}
			gradient.Rotation = 90
			local txt = Instance.new("TextLabel",bg)
			txt.Text = text
			txt.BackgroundTransparency = 1
			txt.Size = UDim2.fromScale(1,0.3)
			txt.AnchorPoint = Vector2.new(0.5,0.5)
			txt.Position = UDim2.fromScale(0.5,0.7)
			txt.Font = Font
			txt.TextScaled = true
			txt.TextColor3 = color
			local stroke = Instance.new("UIStroke",txt)
			stroke.Thickness = 3
			stroke.Color = Color3.fromRGB(0,0,0)
			local stroke = Instance.new("UIStroke",frame)
			stroke.Thickness = 3
			stroke.Color = Color3.fromRGB(0,0,0)
			local corner = Instance.new("UICorner",frame)
			corner.CornerRadius = UDim.new(1,0)
			for i,v in pairs(folder:GetDescendants()) do
				if v then
					v.Name = randomString()
				end
			end
			coroutine.wrap(function()
				repeat
					esp.Adornee = nil
					esp.Adornee = target
					bg.Adornee = nil
					bg.Adornee = target
					if target and target.Parent then
						if bools[boolName] == true then
							esp.Enabled = bools[boolName]
							bg.Enabled = esp.Enabled
						else
							esp.Enabled = false
							bg.Enabled = esp.Enabled
						end
					end
					rs(10)
				until not target or closed or not target:IsDescendantOf(workspace)
				if target and target.Parent then
					if bools[boolName] == true then
						esp.Enabled = bools[boolName]
						bg.Enabled = esp.Enabled
					else
						esp.Enabled = false
						bg.Enabled = esp.Enabled
					end
				end
			end)()
			return esp,frame,txt
		elseif target and target.Parent and espDetected and fldr then
			local esp =  fldr:FindFirstChildOfClass("Highlight")
			local bg = fldr:FindFirstChildOfClass("BillboardGui")
			local frame = fldr:FindFirstChildOfClass("BillboardGui"):FindFirstChildOfClass("Frame")
			local txt = fldr:FindFirstChildOfClass("BillboardGui"):FindFirstChildOfClass("TextLabel")
			esp.OutlineColor = color
			esp.FillColor = color
			frame.BackgroundColor3 = color
			txt.Text = text
			txt.TextColor3 = color
			coroutine.wrap(function()
				repeat
					esp.Adornee = nil
					esp.Adornee = target
					bg.Adornee = nil
					bg.Adornee = target
					if target and target.Parent then
						if bools[boolName] == true then
							esp.Enabled = bools[boolName]
							bg.Enabled = esp.Enabled
						else
							esp.Enabled = false
							bg.Enabled = esp.Enabled
						end
					end
					rs(10)
				until not target or closed or not target:IsDescendantOf(workspace)
				rs(1)
				if target and target.Parent then
					if bools[boolName] == true then
						esp.Enabled = bools[boolName]
						bg.Enabled = esp.Enabled
					else
						esp.Enabled = false
						bg.Enabled = esp.Enabled
					end
				end
			end)()
			return esp,frame,txt
		end
	end
	if not target:IsA("Instance") then return end
	return esp(target)
end
local specialmobs = {
	["A60"] = true,
	["A90"] = true,
	["Screech"] = true,
	["Eyes"] = true,
}
local spinSpeed = "1"
local spinningAttachments = {}
for i=1, 10 do
	local spinningAttachment = Instance.new("Attachment",hrp)
	spinningAttachments[#spinningAttachments+1] = spinningAttachment
	spinningAttachment.Position = Vector3.new(0,-2,0)
	coroutine.wrap(function()
		local rot = 0
		while not closed and task.wait(0) do
			spinningAttachment.Orientation = Vector3.new(0,rot,0)
			rot += tonumber(spinSpeed)*(5/i)
		end
		spinningAttachment:Destroy()
	end)()
end
local function display(target,boolName)
	if not target or not target:IsA("Instance") then return nil end
	local function detect()
		local can,instance = false,nil
		for i,v in pairs(target:GetChildren()) do
			if v and string.match(string.lower(v.Name),"display") then
				can = true
				instance = v
			end
		end
		return can,instance
	end
	local function esp()
		local bg = Instance.new("BillboardGui",target)
		bg.AlwaysOnTop = true
		bg.Brightness = 1
		bg.MaxDistance = 2500
		bg.Adornee = target
		bg.ResetOnSpawn = false
		bg.Size = UDim2.fromOffset(500,500)
		local name = ""
		if math.random(1,2) == 1 then
			name = "DISPLAY"
		else
			name = "display"
		end
		name = name..randomString()
		bg.Name = name
		local grid = Instance.new("UIGridLayout",bg)
		grid.CellPadding = UDim2.fromOffset(0,0)
		grid.CellSize = UDim2.fromScale(0.1,0.1)
		grid.FillDirectionMaxCells = 3
		grid.HorizontalAlignment = Enum.HorizontalAlignment.Center
		grid.SortOrder = Enum.SortOrder.LayoutOrder
		grid.VerticalAlignment = Enum.VerticalAlignment.Center
		local function clear()
			for i,v in pairs(bg:GetChildren()) do
				if v and v ~= grid then
					v:Destroy()
				end
			end
		end
		coroutine.wrap(function()
			repeat
				bg.Enabled = bools[boolName]
				rs(10)
			until not target or closed
			rs(1)
			if target then
				bg.Enabled = false
			end
		end)()
		for i,v in pairs(bg:GetDescendants()) do
			if v then
				v.Name = randomString()
			end
		end
		connectedFunctions[#connectedFunctions+1] = bg.DescendantAdded:Connect(function(v)
			if v then
				v.Name = randomString()
			end
		end)
		return bg,clear
	end
	local bg,clear
	local bool,instance = detect()
	if bool then
		local grid = instance:FindFirstChildOfClass("UIGridLayout")
		bg = instance
		connectedFunctions[#connectedFunctions+1] = bg.DescendantAdded:Connect(function(v)
			if v then
				v.Name = randomString()
			end
		end)
		clear = function()
			for i,v in pairs(bg:GetChildren()) do
				if v and v ~= grid then
					v:Destroy()
				end
			end
		end
		coroutine.wrap(function()
			repeat
				bg.Enabled = bools[boolName]
				rs(10)
			until not target or closed
			rs(1)
			if target then
				bg.Enabled = false
			end
		end)()
		clear()
	else
		bg,clear = esp()
		clear()
	end
	return bg,clear
end
local tools = {}
function descendant(d)
	coroutine.wrap(function()
		if d then
			if d:IsA("BasePart") then
				rs(5)
				d.CanQuery = false
				if d.Name == "Shade" then
					d.Anchored = bools.God
				end
			end
			if d:IsA("RemoteEvent") then
				rs(1)
				if d.Name == "ClientOpen" then
					repeat
						if bools.FarDoors then
							d:FireServer()
						end
						rs(10)
					until closed or not d or not d:IsDescendantOf(workspace)
				end
			end
			if d:IsA("ProximityPrompt") and not ppNames[d.Name] then
				rs(1)
				d.MaxActivationDistance = 6*(distanceMult+1)
				if d.Enabled == false and bools.EnableAllInteractables and d.ActionText ~= "Close" and d.ObjectText ~= "Close" then
					d.Enabled = true
				end
				if bools.EnableAllInteractables or bools.AutoInteract then
					d.Exclusivity = Enum.ProximityPromptExclusivity.AlwaysShow
				end
				if d.ActionText == "Close" or d.ObjectText == "Close" then
					d.Enabled = not bools.AutoInteract
				end
			end
			if d:IsA("ProximityPrompt") and ppNames[d.Name] then
				rs(1)
				local can = true
				if workspace.CurrentRooms:FindFirstChild("100") then
					if d:IsDescendantOf(workspace.CurrentRooms["100"].ElectricalDoor) then
						can = false
					end
					if d:IsDescendantOf(workspace.CurrentRooms["100"].IndustrialGate) then
						can = false
					end
					if d:IsDescendantOf(workspace.CurrentRooms["100"]:FindFirstChild("ElevatorBreaker")) then
						can = true
					end
					if d.Parent.Name == "ElevatorBreaker" then
						can = false
					end
				end
				if workspace.CurrentRooms:FindFirstChild("50") and workspace.CurrentRooms:FindFirstChild("Door") then
					if d:IsDescendantOf(workspace.CurrentRooms["50"].Door) then
						can = false
					end
				end
				if workspace.CurrentRooms:FindFirstChild("52") then
					if d:IsDescendantOf(workspace.CurrentRooms["52"]) then
						can = false
					end
				end
				repeat
					if not d or not can then return end
					d.MaxActivationDistance = 6*(distanceMult+1)
					if bools.AutoInteract and getDistance(d.Parent,hrp) and getDistance(d.Parent,hrp) <= d.MaxActivationDistance and d.Enabled and d.ActionText ~= "Close" and d.ObjectText ~= "Close" then
						d.RequiresLineOfSight = false
						fireproximityprompt(d,1,true)
					end
					if d.Enabled == false and bools.EnableAllInteractables and d.ActionText ~= "Close" and d.ObjectText ~= "Close" then
						d.Enabled = true
					end
					if bools.EnableAllInteractables or bools.AutoInteract then
						d.Exclusivity = Enum.ProximityPromptExclusivity.AlwaysShow
					end
					if d.ActionText == "Close" or d.ObjectText == "Close" then
						d.Enabled = not bools.AutoInteract
					end
					rs(1)
				until not d or closed or not can or not d:IsDescendantOf(workspace)
			end
			if d:IsA("Model") and not d:IsA("Tool") then
				if d.Name == "LiveBreakerPolePickup" then
					repeat
						if bools.AutoInteract then
							d.RequiresLineOfSight = false
							fireproximityprompt(d:WaitForChild("ActivateEventPrompt"),1,true)
						end
						rs(1)
					until closed or not d or not d:IsDescendantOf(workspace) or d:IsDescendantOf(nil)
				end
				if d.Name == "TriggerEventCollision" then
					rs(1)
					coroutine.wrap(function()
						repeat
							if bools.NoSeek then
								if workspace.CurrentRooms:FindFirstChild("100") and d:IsDescendantOf(workspace.CurrentRooms["100"]) then
									return
								elseif workspace.CurrentRooms:FindFirstChild("50") and d:IsDescendantOf(workspace.CurrentRooms["50"]) then
									return
								else
									d:Destroy()
								end
							end
							rs(10)
						until not d or closed or not d:IsDescendantOf(workspace)
					end)()
				end
				if d.Name == "KeyObtain" then
					rs(1)
					esp(d,Color3.fromRGB(0,150,0),"Key","ItemESP")
				end
				if d.Name == "Green_Herb" then
					rs(1)
					esp(d,Color3.fromRGB(100,255,100),"Herb","ItemESP")
				end
				if d.Name == "Wardrobe" or d.Name == "Toolshed" or d.Name == "Bed" then
					rs(1)
					esp(d,Color3.fromRGB(85, 0, 127),d.Name,"HidingSpotESP")
				end
				if d.Name == "Rooms_Locker" then
					rs(1)
					esp(d,Color3.fromRGB(85, 0, 127),"Locker","HidingSpotESP")
				end
				if d.Name == "Vitamins" then
					rs(1)
					esp(d,Color3.fromRGB(150,75,0),"Vitamins","ItemESP")
				end
				if d.Name == "DoorFake" then
					rs(1)
					esp(d:WaitForChild("Door"),Color3.fromRGB(85, 0, 0),"Dupe","EntityESP")
				end
				if d.Name == "GoldPile" then
					rs(1)
					local gold = d:GetAttribute("GoldValue")
					if gold <= 24.9 then
						esp(d,Color3.fromRGB(150,150,0),"Coins ["..tostring(gold).."]","ItemESP")
					elseif gold >= 24.9 and gold <= 99.9 then
						esp(d,Color3.fromRGB(250,250,0),"Gold ["..tostring(gold).."]","ItemESP")
					elseif gold >= 99.9 then
						esp(d,Color3.fromRGB(0,250,250),"Diamonds ["..tostring(gold).."]","ItemESP")
					end
				end
				if d.Name == "Crucifix" then
					rs(1)
					esp(d,Color3.fromRGB(0,150,150),"Crucifix","ItemESP")
				end
				if d.Name == "CrucifixWall" then
					rs(1)
					esp(d,Color3.fromRGB(0,150,150),"Crucifix","ItemESP")
				end
				if d.Name == "Lighter" then
					rs(1)
					esp(d,Color3.fromRGB(150,150,0),"Lighter","ItemESP")
				end
				if d.Name == "RolltopContainer" then
					rs(1)
					esp(d,Color3.fromRGB(255, 85, 0),"Container","DrawerESP")
				end
				if d.Name == "DrawerContainer" then
					wait(1)
					coroutine.wrap(function()
						repeat task.wait(0) until closed or bools.FarAutoLoot
						if bools.FarAutoLoot then
							local aP = Instance.new("AlignPosition",d)
							aP.Attachment1 = char:WaitForChild("RightHand"):WaitForChild("RightGripAttachment")
							aP.Attachment0 = d:WaitForChild("Main"):WaitForChild("Attachment")
							aP.MaxForce = math.huge
							aP.Responsiveness = 200
							aP.ApplyAtCenterOfMass = true
							local aO = Instance.new("AlignOrientation",d)
							aO.Attachment1 = aP.Attachment1
							aO.Attachment0 = aP.Attachment0
							aO.RigidityEnabled = true
						end
					end)()
				end
				if d.Name == "DrawerContainer" then
					wait(1)
					coroutine.wrap(function()
						repeat task.wait(0) until closed or bools.Tornado
						if bools.Tornado then
							local spinAttachment = Instance.new("Attachment",spinningAttachments[math.random(1,#spinningAttachments)])
							spinAttachment.Position = Vector3.new(math.random(1,2) == 1 and 2 or -2,math.random(0,50)/10,math.random(1,2) == 1 and 2 or -2)
							spinAttachment.Position -= Vector3.new(0,0,spinAttachment.Position.Y*2)
							local aP = Instance.new("AlignPosition",d)
							aP.Attachment1 = spinAttachment
							aP.Attachment0 = d:WaitForChild("Main"):WaitForChild("Attachment")
							aP.MaxForce = math.huge
							aP.Responsiveness = 200
							aP.ApplyAtCenterOfMass = true
							local aO = Instance.new("AlignOrientation",d)
							aO.Attachment1 = aP.Attachment1
							aO.Attachment0 = aP.Attachment0
							aO.RigidityEnabled = true
						end
					end)()
				end
				if d.Name == "ChestBoxLocked" then
					rs(1)
					esp(d,Color3.fromRGB(170, 85, 255),"Locked Chest","DrawerESP")
				end
				if d.Name == "ChestBox" then
					rs(1)
					esp(d,Color3.fromRGB(170, 85, 127),"Chest","DrawerESP")
				end
				if d.Name == "Battery" then
					rs(1)
					esp(d,Color3.fromRGB(175,50,0),"Battery","ItemESP")
				end
				if d.Name == "Flashlight" then
					rs(1)
					esp(d,Color3.fromRGB(150,150,150),"Flashlight","ItemESP")
				end
				if d.Name == "Candle" then
					rs(1)
					esp(d,Color3.fromRGB(175,100,0),"Candle","ItemESP")
				end
				if d.Name == "Lockpick" then
					rs(1)
					esp(d,Color3.fromRGB(50,50,50),"Lockpick","ItemESP")
				end
				if d.Name == "SkeletonKey" then
					rs(1)
					esp(d,Color3.fromRGB(50,50,50),"Skele-key","ItemESP")
				end
				if d.Name == "LiveHintBook" then
					rs(1)
					esp(d,Color3.fromRGB(0,150,150),"Hint","ItemESP")
				end
				if d.Name == "LiveBreakerPolePickup" then
					rs(1)
					esp(d,Color3.fromRGB(150,50,0),"Breaker","ItemESP")
				end
				if specialmobs[d.Name] or d.Parent == workspace then
					rs(1)
					if not game.Players:GetPlayerFromCharacter(d) then
						if specialmobs[d.Name] and d.Name ~= "Screech" then
							event:Fire("Entity",d)
						elseif d.Name == "Screech" then
							event:Fire("LocalEntity",d)
						else
							if d and d:FindFirstChildOfClass("Part") then
								d:FindFirstChildOfClass("Part").Changed:Wait()
								if d and d:FindFirstChildOfClass("Part") then
									d:FindFirstChildOfClass("Part").Changed:Wait()
									if d and d:FindFirstChildOfClass("Part") then
										event:Fire("Entity",d)
									end
								end
							end
						end
					end
				end
				if d.Name == "FigureRagdoll" and d.Parent ~= workspace then
					rs(1)
					esp(d,Color3.fromRGB(255,0,0),"Figure","EntityESP")
					repeat
						for i,v in pairs(d:GetDescendants()) do
							if v and v:IsA("BasePart") then
								v.CanCollide = false
							end
						end
						rs(60)
					until closed or not d or not d:IsDescendantOf(workspace)
				end
				if d.Name == "Door" and isnumber(d.Parent.Name) then
					rs(1)
					coroutine.wrap(function()
						local roomNumber = string.format("%04d",tostring(tonumber(d.Parent.Name)+1))
						local toEspText = roomNumber
						local _,_,c = esp(d:WaitForChild("Door"),Color3.fromRGB(170, 109, 35),toEspText,"DoorESP")
						repeat
							if workspace.CurrentRooms:FindFirstChild(tostring(tonumber(d.Parent.Name)+1)) then
								local originalName = workspace.CurrentRooms:WaitForChild(tostring(tonumber(d.Parent.Name)+1)):GetAttribute("OriginalName")
								originalName = string.split(originalName,"_")[2]
								toEspText = " "..roomNumber..[[ 
 []]..originalName..[[] ]]
							else
								toEspText = roomNumber
							end
							c.Text = toEspText
							rs(1)
						until not d or not c or closed or not d:IsDescendantOf(workspace)
					end)()
				end
				if d.Name == "LeverForGate" then
					rs(1)
					esp(d,Color3.fromRGB(170, 109, 35),"Lever","ItemESP")
				end
			end
			if d:IsA("Tool") then
				rs(1)
				if d and d:FindFirstChild("Remote") then
					tools[d.Parent.Name.."'s "..d.Name] = d
				end
			end
			if d:IsA("PrismaticConstraint") then
				wait(1)
				coroutine.wrap(function()
					repeat task.wait(0) until closed or bools.Tornado or bools.FarAutoLoot
					if bools.FarAutoLoot or bools.Tornado then
						d:Destroy()
					end
				end)()
			end
		end
	end)()
end
function dPlayer(v)
	if v and v:IsA("Tool") and v:FindFirstChild("Remote") and v.Remote:IsA("RemoteEvent") then
		tools[v.Parent.Name.."'s "..v.Name] = v
	end
end
for i,player in pairs(game.Players:GetPlayers()) do
	connectedFunctions[#connectedFunctions+1] = player:WaitForChild("Backpack").ChildAdded:Connect(dPlayer)
	for i,v in pairs(player.Backpack:GetChildren()) do
		dPlayer(v)
	end
end
connectedFunctions[#connectedFunctions+1] = game.Players.PlayerAdded:Connect(function(player)
	connectedFunctions[#connectedFunctions+1] = player:WaitForChild("Backpack").ChildAdded:Connect(dPlayer)
end)
function isnumber(txt)
	if tonumber(txt) ~= nil or txt == "inf" then
		return true
	else
		return false
	end
end
local inGodMode = false
function getDistance(I1,I2)
	if I1 and I2 then
		local function get(I)
			if I:IsA("BasePart") then
				return I.Position
			end
			if I:IsA("Model") then
				return I.WorldPivot.Position
			end
			if I:IsA("Attachment") then
				return I.WorldPosition
			end
			return nil
		end
		if get(I1) and get(I2) then
			return (get(I1)-get(I2)).Magnitude
		end
	end
end
local PathfindingService = game:GetService("PathfindingService")
local LocalPlayer = game.Players.LocalPlayer
local GC = getconnections or get_signal_cons
if GC then
	for i,v in pairs(GC(LocalPlayer.Idled)) do
		if v["Disable"] then
			v["Disable"](v)
		elseif v["Disconnect"] then
			v["Disconnect"](v)
		end
	end
end

function getLocker()
	local Closest

	for i,v in pairs(workspace.CurrentRooms:GetDescendants()) do
		if v.Name == "Rooms_Locker" or v.Name == "Toolshed" or v.Name == "Bed" or v.Name == "Wardrobe" then
			if v:FindFirstChildOfClass("BasePart") and v:FindFirstChild("HiddenPlayer") then
				if v.HiddenPlayer.Value == nil then
					if Closest == nil then
						Closest = v.Door
					else
						if (LocalPlayer.Character.HumanoidRootPart.Position - v:FindFirstChildOfClass("BasePart").Position).Magnitude < (Closest.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
							Closest = v:FindFirstChildOfClass("BasePart")
						end
					end
				end
			end
		end
	end
	return Closest
end
local function findFirstDescendant(where,name)
	if not where or not name then return end
	for i,v in pairs(where:GetDescendants()) do if v and v.Name == name then return v end end return
end
function getPath()
	local Part

	local Entity = workspace:FindFirstChild("A60") or workspace:FindFirstChild("A120") or workspace:FindFirstChild("RushMoving")
	if Entity and (Entity:FindFirstChildOfClass("Part").Position-hrp.Position).Magnitude <= 1000 and bools.AutoHide then
		Part = getLocker()
	else
		char:SetAttribute("Hiding",false)
		Part = workspace.CurrentRooms:GetChildren()[#workspace.CurrentRooms:GetChildren()-1].Door.Door	
		if workspace.CurrentRooms:GetChildren()[#workspace.CurrentRooms:GetChildren()-1].Name == "50" then
			Part = workspace.CurrentRooms:GetChildren()[#workspace.CurrentRooms:GetChildren()].Door.Door
		else
			local key = findFirstDescendant(workspace.CurrentRooms:GetChildren()[#workspace.CurrentRooms:GetChildren()-1],"KeyObtain")
			if key and not char:FindFirstChild("Key") then
				Part = key.Hitbox
			elseif key and char:FindFirstChild("Key") then
				Part = workspace.CurrentRooms:GetChildren()[#workspace.CurrentRooms:GetChildren()-1]:WaitForChild("Door"):WaitForChild("Door")
			end
		end
	end
	return Part
end
connectedFunctions[#connectedFunctions+1] = game:GetService("RunService").RenderStepped:Connect(function()
	local Path = getPath()

	local Entity = workspace:FindFirstChild("A60") or workspace:FindFirstChild("A120") or workspace:FindFirstChild("RushMoving")
	if Entity then
		if Path then
			if Path.Parent.Name == "Rooms_Locker" or Path.Parent.Name == "Wardrobe" or Path.Parent.Name == "Bed" or Path.Parent.Name == "Toolshed" then
				if Entity:FindFirstChildOfClass("Part").Position.Y > -4 then
					if (hrp.Position - Path.Position).Magnitude < 2 then
						if hrp.Anchored == false then
							fireproximityprompt(Path.Parent.HidePrompt)
						end
					end
				end
			end
		end
	else
		if char:GetAttribute("Hiding") then
			char:SetAttribute("Hiding",false)
		end
	end
end)
local fldr = workspace:FindFirstChild("Pathfinding") or Instance.new("Folder",workspace)
fldr.Name = "Pathfinding"
fldr:ClearAllChildren()
coroutine.wrap(function()
	while not closed do
		local Destination = getPath()
		if Destination then
			local path = PathfindingService:CreatePath({ WaypointSpacing = tonumber(waypointSpacing), AgentRadius = 0.3, AgentHeight = 1, AgentCanJump = false, AgentCanClimb = false })
			local suc,err pcall(function()
				path:ComputeAsync(hrp.Position - Vector3.new(0,3,0), Destination.Position + Vector3.new(0,1,0))
			end)
			local Waypoints = path:GetWaypoints()
			if path.Status ~= Enum.PathStatus.NoPath and bools.Autoplay then
				for _,v in pairs(Waypoints) do
					local part = Instance.new("Part",fldr)
					part.Position = v.Position
					part.Size = Vector3.new(1,1,1)
					part.Shape = Enum.PartType.Ball
					part.Material = Enum.Material.Neon
					part.BrickColor = BrickColor.new("Neon orange")
					part.CanCollide = false
					part.Anchored = true
				end
				for _, Waypoint in pairs(Waypoints) do
					if LocalPlayer.Character.HumanoidRootPart.Anchored == false then
						local reached = false
						coroutine.wrap(function()
							coroutine.wrap(function()
								while not closed and not reached and task.wait(0) do
									hum:MoveTo(Waypoint.Position)
									if not bools.Autoplay then
										reached = true
									end
								end
							end)()
							hum.MoveToFinished:Wait()
							reached = true
						end)()
						repeat task.wait(0) until reached or closed
					end
				end
			elseif path.Status == Enum.PathStatus.NoPath and bools.Autoplay then
				hrp.Velocity = CFrame.lookAt(hrp.Position,Destination.Position).LookVector * hum.WalkSpeed
			end
			fldr:ClearAllChildren()
		end
		rs(1)
	end
	task.wait(1)
	fldr:ClearAllChildren()
end)()
local function pplr(player)
	local function pplr()
		if player.Character and plr ~= player then
			rs(1)
			esp(player.Character,player.Character:FindFirstChild("Head") and player.Character:FindFirstChild("Head").Color or Color3.fromRGB(255,255,150),player.Name,"PlayerESP")
			local bg,clear = display(player.Character,"ShowBackpacks")
			local tools = {}
			for i,v in pairs(player.Backpack:GetChildren()) do
				tools[v.Name] = v
			end
			player.Character.ChildAdded:Connect(function(c)
				if c and c:IsA("Tool") then
					tools[c.Name] = c
				end
			end)
			coroutine.wrap(function()
				repeat
					clear()
					bg.StudsOffset = Vector3.new(0,5,0)
					for i,v in pairs(tools) do
						if v then
							local imageLabel = Instance.new("ImageLabel",bg)
							imageLabel.BackgroundTransparency = 1
							imageLabel.Image = v.TextureId
						end
					end
					rs(60)
				until closed
			end)()
		end
	end
	coroutine.wrap(function()
		pplr()
		connectedFunctions[#connectedFunctions+1] = player.CharacterAdded:Connect(function(character)
			pplr()
		end)
	end)()
end
connectedFunctions[#connectedFunctions+1] = game.Players.PlayerAdded:Connect(pplr)
for i,player in pairs(game.Players:GetPlayers()) do
	pplr(player)
end
local loaded = _G.loaded123FireDoors
if not loaded then
	local load = randomString()
	_G.loaded123FireDoors = load
	loaded = load
else
	closed = true
	screenGui:Destroy()
	return error(fullName..":"..[[ 
The script is loaded!]],2)
end
local canJump = true
connectedFunctions[#connectedFunctions+1] = game.UserInputService.JumpRequest:Connect(function()
	if hum.FloorMaterial ~= nil and hum.FloorMaterial ~= Enum.Material.Air and bools.EnableJumping and canJump then
		canJump = false
		hum.JumpPower = 25
		hum:ChangeState(Enum.HumanoidStateType.Jumping)
		wait(0.2)
		canJump = true
	end
end)
close.MouseButton1Click:Connect(function()
	if closed then return end
	closed = true
	if inGodMode then
		collision.Position = collision.Position + Vector3.new(0,8.3,0)
	end
	for i,v in pairs(bools) do
		if i and v then
			bools[i] = false
		end
	end
	for i,v in pairs(ppNames) do
		if i and v then
			ppNames[i] = false
		end
	end
	for i,v in pairs(connectedFunctions) do
		if i and v then
			connectedFunctions[i]:Disconnect()
		end
	end
	_G.loaded123FireDoors = false
	wait(0)
	hum:SetAttribute("SpeedBoost",0)
end)
mainFrame.Visible = false
local hwid
local cant = false
task.spawn(function()
	local http_request = syn and syn.request or request
	local body, decoded
	if http_request then
		body = http_request({Url = 'https://httpbin.org/get'; Method = 'GET'}).Body
		decoded = game:GetService('HttpService'):JSONDecode(body)
		for i, v in pairs(decoded.headers) do
			if string.find(i, 'Fingerprint') then hwid = v; break; end
		end
	else
		cant = true
	end
end)
repeat task.wait(0) until hwid or cant
if not MarketplaceService:UserOwnsGamePassAsync(plr.UserId, 195109922) or not cant and hwidWhitelist[tostring(hwid)] ~= "whitelisted" then
	pagelist.Notify("You dont own FireDoors!",10)
	closed = true
	task.wait(11)
	screenGui:Destroy()
	return
end
local page = pageList.CreatePage("Main")
page.CreateLabel("Exclusive hub for "..fullName)
page.CreateLabel("Hub updated [13.06.23] or [06.13.23]")
page.CreateLabel("Whole script was made in [Still in developement]")
page.CreateLabel(fullName.." was made by GodWorldX - Infernus#0863")
page.CreateTextBox("Custom logo [IMAGE ID]",
	function(id)
		logo.Image = id
	end
)
page.CreateTextBox("Custom name",
	function(id)
		title.Text = id
	end
)
page.CreateTextBox([[Make notification: [Prefix: ";"] [Text,time] ]],
	function(id)
		local split = string.split(id,";")
		if not isnumber(split[2]) or #split ~= 2 then
			return
		end
		pagelist.Notify(split[1],tonumber(split[2]))
	end
)
hum.Died:Connect(function()
	if bools.FlingOnDeath then
		rs(1)
		for i,v in pairs(workspace:GetDescendants()) do
			if v and v:IsA("BasePart") then
				v.CanCollide = true
			end
		end
		for _, child in pairs(plr.Character:GetDescendants()) do
			if child:IsA("BasePart") then
				child.CustomPhysicalProperties = PhysicalProperties.new(math.huge, 0.3, 0.5)
			end
		end
		wait(.1)
		local bambam = Instance.new("BodyAngularVelocity")
		bambam.Name = randomString()
		bambam.Parent = hrp
		bambam.AngularVelocity = Vector3.new(0,99999,0)
		bambam.MaxTorque = Vector3.new(0,math.huge,0)
		bambam.P = math.huge
		local Char = plr.Character:GetChildren()
		for i, v in next, Char do
			if v:IsA("BasePart") then
				v.CanCollide = false
				v.Massless = true
				v.Velocity = Vector3.new(0, 0, 0)
			end
		end
		repeat
			bambam.AngularVelocity = Vector3.new(0,99999,0)
			wait(.2)
			bambam.AngularVelocity = Vector3.new(0,0,0)
			wait(.1)
		until not bambam or not bambam:IsDescendantOf(char) or not bambam:IsDescendantOf(workspace)
	end
end)
local page = pagelist.CreatePage("Character")
page.CreateSwitch("Noclip",
	function(val)
		bools.Noclipping = val
	end
)
local bypassedAC = _G.BAC123FireDoors
local extraSpeed = 0
connectedFunctions[#connectedFunctions+1] = game["Run Service"].Stepped:Connect(function()
	hum:SetAttribute("SpeedBoost",extraSpeed)
end)
local fov = 70
local ex1 = page.CreateSlider("Extra Speed",0,6,1,
	function(val)
		extraSpeed = val
	end
)
local ex2 = page.CreateSlider("Extra Speed",0,100,5,
	function(val)
		extraSpeed = val
	end
)
page.CreateSwitch("Enable jumping",
	function(bool)
		bools.EnableJumping = bool
	end
)
page.CreateSwitch("No Sliding",
	function(bool)
		bools.NoSliding = bool
	end
)
page.CreateSwitch("Massless",
	function(bool)
		collision.Massless = bool
		bools.Massless = bool
	end
)
connectedFunctions[#connectedFunctions+1] = game["Run Service"].Stepped:Connect(function()
	if bools.BrokenNeck then
		game:GetService("ReplicatedStorage").EntityInfo.MotorReplication:FireServer(math.random(-100000,100000),math.random(-100000,100000),math.random(-100000,100000),false)
	end
end)
page.CreateSwitch("Fling on death",
	function(bool)
		bools.FlingOnDeath = bool
	end
)
local moving = false
page.CreateButton("Back to map",
	function()
		if moving then return end
		moving = true
		local best = 0
		for i,v in pairs(workspace.CurrentRooms:GetChildren()) do
			if v and isnumber(v.Name) and tonumber(v.Name) >= best then
				best = tonumber(v.Name)
			end
		end
		local room = workspace.CurrentRooms:FindFirstChild(tostring(best-2))
		local timee = ((room.Door.Door.Position-hrp.Position).Magnitude)/hum.WalkSpeed
		hrp.Anchored = true
		game.TweenService:Create(hrp,TweenInfo.new(timee,Enum.EasingStyle.Linear),{CFrame = room.Door.Door.CFrame}):Play()
		task.wait(timee)
		hrp.Anchored = false
		moving = false
	end
)
page.CreateSwitch("God mode",
	function(bool)
		bools.God = bool
		inGodMode = bool
		if bool then
			collision.Position = collision.Position - Vector3.new(0,8.3,0)
		else
			collision.Position = collision.Position + Vector3.new(0,8.3,0)
		end
	end
)
page.CreateSwitch("Never anchor character",
	function(bool)
		bools.NeverAnchor = bool
	end
)
connectedFunctions[#connectedFunctions+1] = workspace.CurrentCamera.Changed:Connect(function()
	if bools.FOV then
		workspace.CurrentCamera.FieldOfView = fov
	end
end)
page.CreateSwitch("Player untouchable",
	function(bool)
		bools.PlayerUntouchable = bool
		for i,v in pairs(workspace:GetDescendants()) do
			if v and v:IsA("BasePart") then
				v.CanTouch = not bools.PlayerUntouchable
			end
		end
	end
)
page.CreateButton("Reset",
	function()
		hum.Health = -1
	end
)
connectedFunctions[#connectedFunctions+1] = workspace.DescendantAdded:Connect(function(v)
	if v and v:IsA("BasePart") then
		v.CanTouch = not bools.PlayerUntouchable
	end
end)
ex2.Visible = false
local page = pagelist.CreatePage("Interactables")
page.CreateSwitch("Auto interact",
	function(bool)
		bools.AutoInteract = bool
	end
)
page.CreateSlider([[Activation distance
multiplier]],0,1,0.1,
	function(num)
		distanceMult = num
	end
)
page.CreateSwitch("Enable every interactable",
	function(bool)
		bools.EnableAllInteractables = bool
	end
)
page.CreateSwitch("Instant interact",
	function(bool)
		bools.InstantInteract = bool
	end
)
page.CreateSwitch("Auto library code",
	function(bool)
		bools.AutoLibraryCode = bool
	end
)
page.CreateSwitch("Far open doors",
	function(bool)
		bools.FarDoors = bool
	end
)
page.CreateButton("Stop fling",
	function()
		hrp.Velocity = Vector3.new()
		collision.Velocity = Vector3.new()
	end
)
page.CreateSwitch("Auto complete elevator minigame",
	function(bool)
		bools.AutoFixElevator = bool
	end
)
connectedFunctions[#connectedFunctions+1] = game.ProximityPromptService.PromptButtonHoldBegan:Connect(function(pp)
	if bools.InstantInteract then
		pp:InputHoldEnd()
		pp.RequiresLineOfSight = false
		fireproximityprompt(pp,1,true)
	end
end)
local page = pagelist.CreatePage("ESP")
page.CreateSwitch("Door ESP",
	function(bool)
		bools.DoorESP = bool
	end
)
page.CreateSwitch("Entity ESP",
	function(bool)
		bools.EntityESP = bool
	end
)
page.CreateSwitch("Player ESP",
	function(bool)
		bools.PlayerESP = bool
	end
)
page.CreateSwitch("Display player backpack",
	function(bool)
		bools.ShowBackpacks = bool
	end
)
page.CreateSwitch("Item ESP",
	function(bool)
		bools.ItemESP = bool
	end
)
page.CreateSwitch("Looting containers ESP",
	function(bool)
		bools.DrawerESP = bool
	end
)
page.CreateSwitch("Hiding spot ESP",
	function(bool)
		bools.HidingSpotESP = bool
	end
)
local page = pagelist.CreatePage("Notifications")
page.CreateSwitch("Notify entities",
	function(bool)
		bools.NotifyEntities = bool
	end
)
local spawnedMessage = "{mob} has spawned!"
page.CreateSwitch("Notify enteties for others",
	function(bool)
		bools.NotifyEntetiesForOthers = bool
	end
)
local esm = page.CreateTextBox("Entity spawned message",
	function(text)
		spawnedMessage = text
		pagelist.Notify(text,5)
	end
)
page.CreateSwitch([[Notify when player
enters/leaves]],
	function(bool)
		bools.NotifyWhenPlayerEntersOrLeaves = bool
	end
)
connectedFunctions[#connectedFunctions+1] = game.Players.PlayerAdded:Connect(function(plr)
	if bools.NotifyWhenPlayerEntersOrLeaves then
		if plr.DisplayName ~= "" and plr.DisplayName ~= nil and plr.DisplayName ~= plr.Name then
			pagelist.Notify(plr.Name.." ("..plr.DisplayName..") has entered the game!",10)
		else
			pagelist.Notify(plr.Name.." has entered the game!",10)
		end
	end
end)
connectedFunctions[#connectedFunctions+1] = game.Players.PlayerRemoving:Connect(function(plr)
	if bools.NotifyWhenPlayerEntersOrLeaves then
		if plr.DisplayName ~= "" and plr.DisplayName ~= nil and plr.DisplayName ~= plr.Name then
			pagelist.Notify(plr.Name.." ("..plr.DisplayName..") is leaving the game!",10)
		else
			pagelist.Notify(plr.Name.." is leaving the game!",10)
		end
	end
end)
connectedFunctions[#connectedFunctions+1] = game.Players.PlayerRemoving:Connect(function(player)
	if player == plr then
		hum.Health = -1
	end
end)
local page = pagelist.CreatePage("Enteties")
page.CreateSwitch("No seek",
	function(bool)
		bools.NoSeek = bool
	end
)
local novoid = page.CreateSwitch("No void jumpscare",
	function(bool)
		if game:GetService("ReplicatedStorage").ClientModules.EntityModules:FindFirstChild("Void") and bool then
			game:GetService("ReplicatedStorage").ClientModules.EntityModules.Void.Name = "Not Void"
		elseif game:GetService("ReplicatedStorage").ClientModules.EntityModules:FindFirstChild("Not Void") and not bool then
			game:GetService("ReplicatedStorage").ClientModules.EntityModules["Not Void"].Name = "Void"
		end
	end
)
page.CreateSwitch("No timothy jumpscare",
	function(bool)
		if game:GetService("ReplicatedStorage").ClientModules.EntityModules:FindFirstChild("SpiderJumpscare") and bool then
			game:GetService("ReplicatedStorage").ClientModules.EntityModules.SpiderJumpscare.Name = "Not SpiderJumpscare"
		elseif game:GetService("ReplicatedStorage").ClientModules.EntityModules:FindFirstChild("Not SpiderJumpscare") and not bool then
			game:GetService("ReplicatedStorage").ClientModules.EntityModules["Not SpiderJumpscare"].Name = "SpiderJumpscare"
		end
	end
)
page.CreateSwitch("No glitch jumpscare",
	function(bool)
		if game:GetService("ReplicatedStorage").ClientModules.EntityModules:FindFirstChild("Glitch") and bool then
			game:GetService("ReplicatedStorage").ClientModules.EntityModules.Glitch.Name = "Not Glitch"
		elseif game:GetService("ReplicatedStorage").ClientModules.EntityModules:FindFirstChild("Not Glitch") and not bool then
			game:GetService("ReplicatedStorage").ClientModules.EntityModules["Not Glitch"].Name = "Glitch"
		end
	end
)
page.CreateSwitch("No A90",
	function(bool)
		if game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules:FindFirstChild("A90") and bool then
			game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.A90.Name = "Not A90"
		elseif game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules:FindFirstChild("Not A90") and not bool then
			game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules["Not A90"].Name = "A90"
		end
	end
)
page.CreateSwitch("No screech",
	function(bool)
		if game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules:FindFirstChild("Screech") and bool then
			game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.Screech.Name = "Not Screech"
		elseif game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules:FindFirstChild("Not Screech") and not bool then
			game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules["Not Screech"].Name = "Screech"
		end
	end
)
connectedFunctions[#connectedFunctions+1] = event.Event:Connect(function(state,value)
	if state == "Entity" and value then
		value:FindFirstChildOfClass("Part").CanCollide = false
		esp(value,Color3.fromRGB(150,0,0),string.split(value.Name,"Moving")[1],"EntityESP")
		if bools.NotifyEntities then
			pagelist.Notify(string.split(value.Name,"Moving")[1]..[[!]],10)
		end
		if bools.NotifyEntetiesForOthers then
			local message = string.split(spawnedMessage,"{mob}")
			local output = ""
			output = message[1]
			for i,v in pairs(message) do
				if i ~= 1 then
					output = output..string.split(value.Name,"Moving")[1]..v
				end
			end
			sendMessage(output)
		end
	elseif state == "LocalEntity" and value then
		if bools.NotifyEntities then
			pagelist.Notify(value.Name..[[!]],10)
		end
	end
end)
pagelist.Notify("Welcome to "..actualName..[[!
Thank you for using our tool!
Hope, you will enjoy it :)
(Sorry for a bad visual,
it self-made hub!)]],15)
local page = pagelist.CreatePage("Camera")
connectedFunctions[#connectedFunctions] = workspace.DescendantAdded:Connect(descendant)
page.CreateSwitch("Full bright",
	function(bool)
		bools.FullBright = bool
		game.Lighting.Brightness = 1
		game.Lighting.Ambient = Color3.fromRGB(255,255,255)
		game.Lighting.GlobalShadows = false
	end
)
page.CreateSwitch("FOV Enabled",
	function(bool)
		bools.FOV = bool
	end
)
page.CreateSlider("FOV",70,120,1,
	function(val)
		fov = val
	end
)
connectedFunctions[#connectedFunctions+1] = game.Lighting.Changed:Connect(function()
	if bools.FullBright then
		game.Lighting.Brightness = 1
		game.Lighting.Ambient = Color3.fromRGB(255,255,255)
		game.Lighting.GlobalShadows = false
	end
end)
local page = pagelist.CreatePage("Anticheat")
page.CreateSwitch("Speed Bypass",
	function(bool)
		bools.SpeedBypass = bool
		ex1.Visible = not bool
		ex2.Visible = bool
	end
)
page.CreateLabel("To fully bypass anticheat, turn on godmode!")
local page = pagelist.CreatePage("Trolling")
function activateTools()
	coroutine.wrap(function()
		for i,v in pairs(tools) do
			if v and v:FindFirstChild("Remote") and v.Remote:IsA("RemoteEvent") and v.Parent ~= char and v.Parent ~= plr.Backpack and v:GetAttribute("Enabled") == false then
				v.Remote:FireServer()
			end
		end
	end)()
	rs(1)
end
function deactivateTools()
	coroutine.wrap(function()
		for i,v in pairs(tools) do
			if v and v:FindFirstChild("Remote") and v.Remote:IsA("RemoteEvent") and v.Parent ~= char and v.Parent ~= plr.Backpack and v:GetAttribute("Enabled") == true then
				v.Remote:FireServer()
			end
		end
	end)()
	rs(1)
end
function useTools()
	coroutine.wrap(function()
		for i,v in pairs(tools) do
			if v and v:FindFirstChild("Remote") and v.Remote:IsA("RemoteEvent") and v.Parent ~= char and v.Parent ~= plr.Backpack then
				v.Remote:FireServer()
			end
		end
	end)()
	rs(1)
end
page.CreateButton("Activate other's tools",
	function()
		pagelist.Notify("Activated!")
		activateTools()
	end
)
page.CreateButton("Deactivate other's tools",
	function()
		pagelist.Notify("Deactivated!")
		deactivateTools()
	end
)
page.CreateButton("Use other's tools",
	function()
		pagelist.Notify("Used!")
		useTools()
	end
)
page.CreateSwitch([[Make other's tools always
enabled]],
	function(bool)
		bools.MOTAA = bool
		if bool then
			pagelist.Notify("Always on!")
		end
	end
)
page.CreateSwitch([[Make other's tools always
disabled]],
	function(bool)
		bools.MOTANA = bool
		if bool then
			pagelist.Notify("Always off!")
		end
	end
)
page.CreateSwitch("Spam other's tools",
	function(bool)
		bools.SpamOthersTools = bool
		if bool then
			pagelist.Notify("Spamming!")
		end
	end
)
local repeatTime = "5"
coroutine.wrap(function()
	repeat
		if bools.SpamOthersTools then
			useTools()
		end
		task.wait(tonumber(repeatTime))
	until closed
end)()
coroutine.wrap(function()
	repeat
		if bools.MOTAA then
			activateTools()
		end
		if bools.MOTANA then
			deactivateTools()
		end
		rs(5)
	until closed
end)()
coroutine.wrap(function()
	while not closed do
		if bools.SpeedBypass then
			collision.Massless = true
			wait(0.2)
			collision.Massless = false
			wait(0.28)
		else
			collision.Massless = bools.Massless
			rs(10)
		end
	end
end)()
local function computePath(room:Instance)
	local target,pp
	if room then
		target = room.Door.Door
		local key = findFirstDescendant(room.Assets,"KeyObtain") or findFirstDescendant(room,"KeyObtain")
		if key and not char:FindFirstChild("Key") then
			target = key.Hitbox
			pp = key.ModulePrompt
		elseif key and char:FindFirstChild("Key") then
			pp = room.Door.Lock.UnlockPrompt
		end
		for i,v in pairs(workspace:GetChildren()) do
			if v and v:IsA("Model") and v:FindFirstChildOfClass("Part") and not game.Players:GetPlayerFromCharacter(v) then
				if (hrp.Position-v:FindFirstChildOfClass("Part").Position).Magnitude <= 1000 and v.Name ~= "Eyes" then
					target = nil
					pp = nil
				end
			end
		end
		if room.Name == "50" then
			target = workspace.CurrentRooms[tostring(tonumber(room.Name)+1)]:WaitForChild("Door"):WaitForChild("Door")
			hrp.CanTouch = true
		else
			hrp.CanTouch = not bools.PlayerUntouchable
		end
	end
	return target,pp
end
coroutine.wrap(function()
	while not closed and game["Run Service"].Stepped:Wait() do
		if bools.NoSliding then
			hrp.Massless = false
			hrp.CustomPhysicalProperties = PhysicalProperties.new(math.huge,0,0,0,0)
		else
			hrp.CustomPhysicalProperties = nil
		end
		for _, child in pairs(char:GetDescendants()) do
			if child:IsA("BasePart") then
				if child.CanCollide == true then
					child.CanCollide = false
				end
				if child.Anchored == true then
					child.Anchored = not bools.NeverAnchor
				end
			end
		end
		collision.CanCollide = not bools.Noclipping
	end
end)()
local hints = game.Players.LocalPlayer.PlayerGui.PermUI.Hints
function padlock(paper)
	if paper and paper.Name == "LibraryHintPaper" then
		local paper = paper:WaitForChild("UI")
		local code = ""
		local numbers = 0
		for i,v in pairs(paper:GetChildren()) do
			if v and v:IsA("ImageLabel") and isnumber(v.Name) then
				numbers += tonumber(v.Name)
				v.Name = string.format("%02d",v.Name)
			end
		end
		for i=1, numbers do
			if paper:FindFirstChild(string.format("%02d",tostring(i))) then
				local v = paper[string.format("%02d",tostring(i))]
				for i,va in pairs(hints:GetChildren()) do
					if va and va:IsA(v.ClassName) and va.ImageRectOffset == v.ImageRectOffset then
						code = code..va.TextLabel.Text
					end
				end
			end
		end
		if #code == 4 or #code == 9 then
			for i=0, 9 do
				local code = code
				code = code..tostring(i)
				print(code)
				game:GetService("ReplicatedStorage"):WaitForChild("EntityInfo"):WaitForChild("PL"):FireServer(code)
				rs(1)
			end
		end
		if #code == 3 or #code == 8 then
			for i=0, 99 do
				local code = code
				code = code..string.format("%02d", tostring(i))
				print(code)
				game:GetService("ReplicatedStorage"):WaitForChild("EntityInfo"):WaitForChild("PL"):FireServer(code)
				rs(1)
			end
			for i=0, 9 do
				for index=0,9 do
					local code = code
					code = i..code..index
					print(code)
					game:GetService("ReplicatedStorage"):WaitForChild("EntityInfo"):WaitForChild("PL"):FireServer(code)
					rs(1)
				end
			end
		end
		print(tostring(string.format("%05d",code)))
		game:GetService("ReplicatedStorage"):WaitForChild("EntityInfo"):WaitForChild("PL"):FireServer(string.format("%05d",code))
		rs(1)
	end
end
local function enterpadlock()

end
coroutine.wrap(function()
	repeat
		if bools.AutoLibraryCode then
			for i,v in pairs(tools) do
				if v and v.Name == "LibraryHintPaper" then
					coroutine.wrap(function()
						padlock(v)
					end)()
					rs(10)
				end
			end
			if plr.Backpack:FindFirstChild("LibraryHintPaper") then
				coroutine.wrap(function()
					padlock(plr.Backpack.LibraryHintPaper)
				end)()
			elseif char:FindFirstChild("LibraryHintPaper") then
				coroutine.wrap(function()
					padlock(char.LibraryHintPaper)
				end)()
			end
		end
		rs(1)
	until closed
end)()
local flexSpeedAAA = "0"
coroutine.wrap(function()
	repeat
		for i,v in pairs(game.Players.LocalPlayer.PlayerGui.MainUI.LobbyFrame.Achievements.List:GetChildren()) do
			if v and v:IsA("ImageButton") and bools.FlexAchievements then
				game.ReplicatedStorage.EntityInfo.FlexAchievement:FireServer(v.Name)
				task.wait(tonumber(flexSpeedAAA))
			end
		end
		rs(1)
	until closed
end)()
local fixed = false
coroutine.wrap(function()
	repeat
		if bools.SpamWalkSound then
			game:GetService("ReplicatedStorage"):WaitForChild("EntityInfo"):WaitForChild("Footstep"):FireServer()
		end
		if bools.AutoFixElevator then
			game.ReplicatedStorage.EntityInfo.EBF:FireServer()
			game.ReplicatedStorage.Bricks.EBF:FireServer()
		end
		if bools.AutoFixElevator then
			coroutine.wrap(function()
				if workspace.CurrentRooms:FindFirstChild("100") and workspace.CurrentRooms["100"]:FindFirstChild("ElevatorCar") and workspace.CurrentRooms["100"].ElevatorCar:FindFirstChild("ActualCollision") and workspace.CurrentRooms["100"].ElevatorCar.ActualCollision:FindFirstChild("ElevatorPanel") and workspace.CurrentRooms["100"].ElevatorCar.ActualCollision.ElevatorPanel:FindFirstChild("ElevatorLight") and not fixed then
					fixed = true
					local target = workspace.CurrentRooms["100"].ElevatorCar.ActualCollision.ElevatorPanel:FindFirstChild("ElevatorLight")
					repeat
						rs(10)
					until closed or not target or target.Material == Enum.Material.Neon
					if not closed and target and target.Material == Enum.Material.Neon then
						pagelist.Notify([[Elevator has been repaired!
Please, disable god-mode (if it is enabled), and go to elevator!]])
					end
				end
			end)()
		end
		rs(1)
	until closed
end)()
textLabel = page.CreateTextBox("Spam speed (in seconds)",
	function(text)
		if not isnumber(text) or isnumber(text) and tonumber(text) <= -0.01 then
			textLabel.Text = prevText
			pagelist.Notify("Must be a valid number!",5)
		elseif isnumber(text) and tonumber(text) <= 60.01 then
			repeatTime = text
			prevText = text
		elseif isnumber(text) and tonumber(text) >= 60 then
			textLabel.Text = prevText
			pagelist.Notify("The delay must be less than 60!",5)
		end
	end
)
page.CreateSwitch("Flex achievements",
	function(bool)
		bools.FlexAchievements = bool
	end
)
PREVText = "0"
flexSpeed = page.CreateTextBox("Achievement flex speed",
	function(text)
		if not isnumber(text) or isnumber(text) and tonumber(text) <= -0.01 then
			flexSpeed.Text = PREVText
			pagelist.Notify("Must be a valid number!",5)
		elseif isnumber(text) and tonumber(text) <= 10.01 then
			flexSpeedAAA = text
			PREVText = text
		elseif isnumber(text) and tonumber(text) >= 10 then
			flexSpeed.Text = PREVText
			pagelist.Notify("The delay must be less than 10!",5)
		end
	end
)
flexSpeed.Text = PREVText
page.CreateSwitch("Spam walk sound",
	function(bool)
		bools.SpamWalkSound = bool
	end
)
page.CreateSwitch([[Fling loots (Auto interact
must be enabled!)]],
	function(bool)
		bools.FarAutoLoot = bool
	end
)
page.CreateSwitch("Broken neck",
	function(bool)
		bools.BrokenNeck = bool
	end
)
page.CreateButton("Lag other's",
	function()
		for i=1, 25000 do
			game:GetService("ReplicatedStorage"):WaitForChild("EntityInfo"):WaitForChild("Footstep"):FireServer()
		end 
	end
)
page.CreateLabel("Dont spam that button, because when you click it, your ping goes to the sky!")
pText = "1"
page.CreateSwitch("Tornado",
	function(bool)
		bools.Tornado = bool
	end
)
spinSpeedText = page.CreateTextBox("Tornado spin speed",
	function(text)
		if not isnumber(text) or isnumber(text) and tonumber(text) <= -180.001 then
			spinSpeedText.Text = pText
			pagelist.Notify("Must be a valid number or number must be more than -180!",5)
		elseif isnumber(text) and tonumber(text) <= 180.001 then
			spinSpeed = text
			pText = text
		elseif isnumber(text) and tonumber(text) >= 180 then
			spinSpeedText.Text = pText
			pagelist.Notify("The speed must be less than 180!",5)
		end
	end
)
prevText = textLabel.Text
local page = pagelist.CreatePage("Autoplay")
page.CreateLabel("Anticheat bypass is required, but not important")
page.CreateSwitch("Auto play",
	function(bool)
		bools.Autoplay = bool
	end
)
page.CreateSwitch("Auto hide",
	function(bool)
		bools.AutoHide = bool
	end
)
PREVTEXT = "0.5"
waypointSpacingTxt = page.CreateTextBox("Waypoint spacing",
	function(text)
		if not isnumber(text) or isnumber(text) and tonumber(text) <= 0.099 then
			waypointSpacingTxt.Text = PREVTEXT
			pagelist.Notify("Must be a valid number or number must be more than 0.1!",5)
		elseif isnumber(text) and tonumber(text) <= 3.001 then
			waypointSpacing = text
			PREVTEXT = text
		elseif isnumber(text) and tonumber(text) >= 3 then
			waypointSpacingTxt.Text = PREVTEXT
			pagelist.Notify("The spacing must be less than 3!",5)
		end
	end
)
local page = pagelist.CreatePage("Other")
page.CreateButton("Play again",
	function()
		game.ReplicatedStorage.EntityInfo.PlayAgain:FireServer()
	end
)
page.CreateButton("Lobby",
	function()
		game.ReplicatedStorage.EntityInfo.Lobby:FireServer()
	end
)
page.CreateSwitch("Fix mystery lag",
	function(bool)
		game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.PromptService.Disabled = bool
		game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.Updated.Disabled = bool
		if game:GetService("ReplicatedStorage").ClientModules:FindFirstChild("Module_Events") then
			game:GetService("ReplicatedStorage").ClientModules.Module_Events.Name = "Not Module_Events"
		else
			game:GetService("ReplicatedStorage").ClientModules["Not Module_Events"].Name = "Module_Events"
		end
	end
)
for i,d in pairs(workspace:GetDescendants()) do
	descendant(d)
end
screenGui.DescendantAdded:Connect(function(d)
	if d then
		d.Name = randomString()
	end
end)
screenGui.Name = randomString()
for i,v in pairs(screenGui:GetDescendants()) do
	if v then
		v.Name = randomString()
	end
end
task.wait(14.5)
pagelist.Notify([[Made by:
GodWorldX - Infernus#0863
PlayPozitiv_YOUTUBE - LayKad_#3499
Just a person - Bryld#5478
Enjoy :D]],15)
