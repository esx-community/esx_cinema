# esx_cinema

An resource for ESX that adds movie theaters around San Andreas. Plently of shows are available to be enjoyed.

## Credits

- davedumas0, original resource
- Mr Reiben, ported to ESX
- ElPumpo, major improvements & cleanup

## Overlay fixes

Resources drawing 2d text on hud will appear in the cinema screen. To fix the problem, this resources comes with event triggers.. that trigger whenever the player leaves & enters the theater. The two trigger names are the following:

- `esx_cinema:enteredCinema`
- `esx_cinema:exitedCinema`

### esx_voice

Find the following

```lua
if NetworkIsPlayerTalking(PlayerId()) then
	drawLevel(41, 128, 185, 255)
elseif not NetworkIsPlayerTalking(PlayerId()) then
	drawLevel(185, 185, 185, 255)
end
 ```

And replace it with the following:

```lua
if NetworkIsPlayerTalking(PlayerId()) and not inCinema then
	drawLevel(41, 128, 185, 255)
elseif not NetworkIsPlayerTalking(PlayerId()) not inCinema then
	drawLevel(185, 185, 185, 255)
end
```

Then somewhere within the same file, add the following:

```lua
inCinema = false

AddEventHandler('esx_cinema:enteredCinema', function()
	inCinema = true
end)

AddEventHandler('esx_cinema:exitedCinema', function()
	inCinema = false
end)
```
