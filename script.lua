local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua"))()

local Window = Rayfield:CreateWindow({
	Name = "Playbreak",
	LoadingTitle = "xxx",
	LoadingSubtitle = "by Finalelele",
	ConfigurationSaving = {
		Enabled = false,
		FolderName = nil, -- Create a custom folder for your hub/game
		FileName = "Big Hub"
	},

	ToggleUIKeybind = "k", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

	Discord = {
		Enabled = false,
		Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
		RememberJoins = true -- Set this to false to make them join the discord every time they load it up
	},
	KeySystem = false, -- Set this to true to use our key system
	KeySettings = {
		Title = "Untitled",
		Subtitle = "Key System",
		Note = "No method of obtaining the key is provided",
		FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
		SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
		GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
		Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local chr = game.Players.LocalPlayer.Character
local autoGood = false
local autoComplete = false
local espMonster = false
local espPlayer = false
local currentCFrame = nil

local Tab = Window:CreateTab("Misc", 4483362458) -- Title, Image
local Toggle = Tab:CreateToggle({
	Name = "Auto Escape",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		if Value then
			autoGood = true
			while autoGood == true do	
				if chr:FindFirstChild("CarriedSystem") then
					game.Workspace.TErryfulle559.CarriedSystem.Remote:FireServer("Good")
				end
				task.wait(0.1)
			end
		else
			autoGood = false
		end
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Auto Complete",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		if Value then
			autoComplete = true
			while autoComplete == true do	
				if workspace.Game.Map:FindFirstChild("GametimeTheater") then
					if workspace.Game.Map.GametimeTheater:FindFirstChild("Pillars") then
						for _, v in ipairs (workspace.Game.Map.GametimeTheater.Pillars.PuzzlePillars:GetChildren()) do
							if v:FindFirstChild("Memory") then
								for _, v in ipairs (v.Memory.Keys:GetDescendants()) do
									if v:IsA("BoolValue") and v.Value == true and not v.Parent:FindFirstChild("EspKey") then
										local hg = Instance.new("Highlight")
										hg.Parent = v.Parent
										hg.FillColor = Color3.fromRGB(0, 0, 255)
										hg.Name = "EspKey"
										hg.DepthMode = "Occluded"
									elseif v:IsA("BoolValue") and v.Value == false and v.Parent:FindFirstChild("EspKey") then
										v.Parent.EspKey:Destroy()
									end
								end
							end
						end
					end
				elseif workspace.Game.Map:FindFirstChild("GametimeFactory") then
					if workspace.Game.Map.GametimeFactory:FindFirstChild("Pillars") then
						for _, v in ipairs (workspace.Game.Map.GametimeFactory.Pillars.PuzzlePillars:GetChildren()) do
							if v:FindFirstChild("Memory") then
								for _, v in ipairs (v.Memory.Keys:GetDescendants()) do
									if v:IsA("BoolValue") and v.Value == true and not v.Parent:FindFirstChild("EspKey") then
										local hg = Instance.new("Highlight")
										hg.Parent = v.Parent
										hg.FillColor = Color3.fromRGB(0, 0, 255)
										hg.Name = "EspKey"
										hg.DepthMode = "Occluded"
									elseif v:IsA("BoolValue") and v.Value == false and v.Parent:FindFirstChild("EspKey") then
										v.Parent.EspKey:Destroy()
									end
								end
							end
						end
					end
				end
				task.wait(2)
			end
		else
			autoComplete = false
		end
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Esp Monster",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		if Value then
			espMonster = true
			while espMonster == true do		
				for _, v in ipairs(workspace:GetChildren()) do
					if v:FindFirstChild("Attack") and not v:FindFirstChild("EspMonster") and v.Name ~= game.Players.LocalPlayer.Name then
						local hg = Instance.new("Highlight")
						hg.Parent = v
						hg.FillColor = Color3.fromRGB(255, 0, 0)
						hg.Name = "EspMonster"
					end
				end
				task.wait(1)
			end
		else
			espMonster = false
		end
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Esp Player",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		if Value then
			espMonster = true
			while espMonster == true do		
				for _, v in ipairs(workspace:GetChildren()) do
					if v:FindFirstChild("BHopLogger") and not v:FindFirstChild("EspPlayer") and v.Name ~= game.Players.LocalPlayer.Name then
						local hg = Instance.new("Highlight")
						hg.Parent = v
						hg.FillColor = Color3.fromRGB(0, 255, 0)
						hg.Name = "EspPlayer"
					end
				end
				task.wait(1)
			end
		else
			espMonster = false
		end
	end,
})

local Tab = Window:CreateTab("Spawn", 4483362458) -- Title, Image
local Button = Tab:CreateButton({
	Name = "Spawn As Huggy",
	Callback = function()
		currentCFrame = chr.HumanoidRootPart.CFrame
		game.ReplicatedStorage.KillerSpawn:FireServer("Huggy")
		task.wait(0.5)
		chr.HumanoidRootPart.CFrame = currentCFrame
	end,
})
local Button = Tab:CreateButton({
	Name = "Spawn As BoxyBoo",
	Callback = function()
		currentCFrame = chr.HumanoidRootPart.CFrame
		game.ReplicatedStorage.KillerSpawn:FireServer("Boxy")
		task.wait(0.5)
		chr.HumanoidRootPart.CFrame = currentCFrame
	end,
})
local Button = Tab:CreateButton({
	Name = "Spawn As Mommy",
	Callback = function()
		currentCFrame = chr.HumanoidRootPart.CFrame
		game.ReplicatedStorage.KillerSpawn:FireServer("Mommy")
		task.wait(0.5)
		chr.HumanoidRootPart.CFrame = currentCFrame
	end,
})
local Button = Tab:CreateButton({
	Name = "Spawn As Stalker",
	Callback = function()
		currentCFrame = chr.HumanoidRootPart.CFrame
		game.ReplicatedStorage.KillerSpawn:FireServer("Stalky")
		task.wait(0.5)
		chr.HumanoidRootPart.CFrame = currentCFrame
	end,
})
