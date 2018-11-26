ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_cinema:payPrice',function(source, cb, showName)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = GetPriceFromShowName(showName)

	if not price then
		print(('esx_cinema: %s parsed invalid show'):format(xPlayer.identifier))
		cb(false)
	end

	if xPlayer.getMoney() >= price then
		xPlayer.removeMoney(price)
		cb(true)
	else
		cb(false)
	end
end)

function GetPriceFromShowName(showName)
	for k, v in pairs(Config.AvailableCinemaShows) do
		if v.showName == showName then
			return v.price
		end
	end

	return nil
end