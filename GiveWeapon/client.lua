ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(100)
    end
end)


RegisterCommand(Config.ADD, function(source, args, rawCommand)
	for _, v in pairs (Config) do
		ESX.TriggerServerCallback("Get:UserGroup",function(group)
    		if (group) == v.Name then
    			TriggerServerEvent('Weapon:GiveAllWeapons')
    		else
    			if (group) == 'user' then
    				ESX.ShowNotification("Vous n'avez pas la permissions pour faire cette commande !")
    			end
    		end
		end)
	end
end)

RegisterCommand(Config.Remove, function(source, args, rawCommand)
	for _, v in pairs (Config) do
		ESX.TriggerServerCallback("Get:UserGroup",function(group)
    		if (group) == v.Name then
				RemoveAllPedWeapons(PlayerPedId(), true)
                ESX.ShowNotification("Supression de toutes les armes ~b~effectué avec succès~s~ !")
    		else
    			if (group) == 'user' then
    				ESX.ShowNotification("Vous n'avez pas la permissions pour faire cette commande !")
    			end
    		end
		end)
	end
end)


print('-------------------------------------')
print("Script GiveAllWeapon By DeaDTriX#9193")
print('-------------------------------------')
