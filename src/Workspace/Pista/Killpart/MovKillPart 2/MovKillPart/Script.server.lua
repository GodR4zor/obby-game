local Parent:Part = script.Parent
local Players = game:GetService("Players")
local debouncing = {}

Parent.Touched:Connect(function(hit)
	local PlayerName = hit.Parent.Name
	
	if debouncing[PlayerName] then
		return
	end
	
	debouncing[PlayerName] = true
	
	local character:Player = hit.Parent
	if not character then
		return
	end
	
	local Humanoid:Humanoid = character:FindFirstChild("Humanoid")
	if not Humanoid then
		return 
	end
	
	Humanoid.Health -= 100
	delay(2, function()
		debouncing[PlayerName] = false
	end)
	
	
end)