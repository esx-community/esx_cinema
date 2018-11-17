ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_cinema:payPrice',function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getMoney() >= Config.CinemaPrice then
		xPlayer.removeMoney(Config.CinemaPrice)
		cb(true)
	else
		cb(false)
	end
end)
