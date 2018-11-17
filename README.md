# esx_cinema

Cette ressource provient à l'origine de :
https://github.com/davedumas0/fiveM-movies

Merci à Daviddumas0. Cette ressource doit être améliorée encore.

Modifiée par Mr Reiben pour ESX avec sélection du film à l'entrée, repop à la sortie du cinéma d'entrée et paiement du prix de la place.

si vous utilisez ESX_Voice, modifier le client\main.lua avec :
- ajoutez en haut :
local inCinema = false

- et remplacer :

```lua
if NetworkIsPlayerTalking(PlayerId()) then
	drawLevel(41, 128, 185, 255)
elseif not NetworkIsPlayerTalking(PlayerId()) then
	drawLevel(185, 185, 185, 255)
end
 ```

par : 

```lua
if NetworkIsPlayerTalking(PlayerId()) and not inCinema then
	drawLevel(41, 128, 185, 255)
elseif not NetworkIsPlayerTalking(PlayerId()) not inCinema then
	drawLevel(185, 185, 185, 255)
end
```
- Pour terminer, à la fin, ajoutez :

```lua
RegisterNetEvent('GetOutCinema')
AddEventHandler('GetOutCinema', function()
	if inCinema == true then
		inCinema = false
	end
end)
```
