--Services
local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")

--Carrega o banco de dados
local database = DataStoreService:GetDataStore("Score")


local function onPlayerAdded (player:Player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player
	
	local success, playerData = pcall(function()
		return database:GetAsync(player.UserId)
	end)
	
	if success then
		local score = Instance.new("IntValue")
		score.Name = "Score"
		score.Value = playerData and playerData or 0
		score.Parent = leaderstats
	end

	
end

Players.PlayerAdded:Connect(onPlayerAdded)
