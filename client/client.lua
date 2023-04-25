ESX = nil
CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5)
	end
end)

RegisterCommand(Config.Command, function() 
	local year, month, day, hour, minute, second  = GetUtcTime()
    TriggerServerEvent("dailykit", year, month, day)
end, false) 