--Services
local DataStoreService = game:GetService("DataStoreService")
local Players:Players = game:GetService("Players")

local database = DataStoreService:GetDataStore("Score")

local function onPlayerRemoing(player:Player)
	
	local score:IntValue = 0
	
	local leaderstats = player:FindFirstChild("leaderstats")
	if leaderstats then
		score = leaderstats:FindFirstChild("Score")
		
	end
	
	local success, message = pcall(function()
		database:SetAsync(player.UserId, score.Value)
	end)
	
	if success then
		print("Dados salvos com sucesso")
	end
	
	
end

Players.PlayerRemoving:Connect(onPlayerRemoing)