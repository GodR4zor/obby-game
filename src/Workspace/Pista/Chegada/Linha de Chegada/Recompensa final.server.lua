local parent = script.Parent
local SpawnLocation = workspace.Lobby.SpawnLocation
local Debouncing = {}
local Players = game:GetService("Players")
local confetes = parent.confetes


parent.Touched:Connect(function(hit)
	local PlayerName = hit.parent.Name
	
	if Debouncing[PlayerName] then
		return
	end
	
	--Inicia o Debouncing
	Debouncing[PlayerName] = true
	
	local character:Model = hit.parent
	if not character then
		return nil
	end
	
	local player = Players:GetPlayerFromCharacter(character)
	if not player then
		return nil
	end
	
	local leaderstats = player:FindFirstChild("leaderstats")
	if leaderstats then
		local score:IntValue = leaderstats:FindFirstChild("Score")
		score.Value += 1
	end

	local primaryParty = character.PrimaryPart
	
	--Adiciona Confetes
	for _, confete in confetes:GetChildren() do
		local particleEmiter = Instance.new("ParticleEmitter")
		particleEmiter.Parent = confete
		
		delay(2, function()
			particleEmiter.Enabled = false
		end)
		
		delay(4, function()
			particleEmiter:Destroy()
		end)
	end
	
	--Teleporta o jogador e reseta o debouncing
	delay(6, function()
		primaryParty.CFrame = SpawnLocation.CFrame * CFrame.new(0, 15, 0)
		Debouncing[PlayerName] = false
	end)
	
end)
