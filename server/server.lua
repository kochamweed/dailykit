ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('dailykit')
AddEventHandler('dailykit', function(year, month, day)

    local name = GetPlayerName(source)

    if string.find(name, Config.ServerTag) then

        i, j = string.find(name, Config.ServerTag)
        local playerNick = string.sub(name, i, j)

        if playerNick == nil then
            playerNick = "nic" 
        end
        
        if playerNick == Config.ServerTag then
            dajitemy(source, year, month , day)
        end
    else
        TriggerClientEvent("dopeNotify:SendNotification", source, {		
            text = '<b><i class="fas fa-exclamation-triangle"></i> ERROR</span></b></br><span style="color: #a9a29f;">Nie masz w nazwie steam: <span style="color: #ff0000;">'..Config.ServerTag,
            type = "error",
            timeout = 2000,
            layout = "centerRight"
        })
    end
end)

function dajitemy(source, year, month, day)
	local xPlayer = ESX.GetPlayerFromId(source)


	local test = MySQL.Sync.fetchAll('SELECT * FROM dailykit_pumba WHERE owner = @owner',
	{
		['@owner'] = xPlayer.identifier
	})

	while test == nil do
		Citizen.Wait(100)
	end


	if test[1] == nil then

        xPlayer.addInventoryItem("apple", "10")
        xPlayer.addInventoryItem("water", "10")
        xPlayer.addInventoryItem("pistol", "1")
        xPlayer.addInventoryItem("pistol_ammo", "100")
        xPlayer.addInventoryItem("redbull", "20")

        local date = year.."-"..month.."-"..day
        MySQL.Async.execute('INSERT INTO dailykit_pumba (owner, date) VALUES (@owner, @date)',
        {
    
            ['@owner']  = xPlayer.identifier,
            ['@date']  = date	
        })
        TriggerClientEvent('esx:showNotification', source, "Pomyślnie otworzyłeś /dailykit, zapraszamy do kupna czegoś na questrp.pl/donate")
	else
		
		if test[1].owner == xPlayer.identifier then
            local date = year.."-"..month.."-"..day
            if date == test[1].date then
                TriggerClientEvent('esx:showNotification', source, "Zestaw można odbierać co 24h")
            else
                
                xPlayer.addInventoryItem("apple", "10")
                xPlayer.addInventoryItem("water", "10")
                xPlayer.addInventoryItem("vintagepistol", "1")
                xPlayer.addInventoryItem("pistol_ammo", "100")
                xPlayer.addInventoryItem("redbull", "20")
        

                TriggerClientEvent('esx:showNotification', source, "Dzieki ze wspierasz nasz server")
            end
		end
	end
	


end