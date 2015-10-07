function isLoaded(alcove)
	return helper.script.surfaceContains(alcove, "gunpowder") and helper.script.surfaceContains(alcove, "navy_cannon_ball")
end

function insertItem(settings, alcove, item)
	if isLoaded(alcove) then
		local lever = findEntity(settings.name .. "_lever")
		if lever.lever:isActivated() then
			lever.lever:toggle()
		end
	else
		-- lever.controller:activate()
		hudPrint("This cannon only needs gunpowder and a cannon ball")
	end
end

function removeItem(settings, alcove, item)	
	if isLoaded(alcove) then		
		-- lever.controller:activate()
	else
		local lever = findEntity(settings.name .. "_lever")
		if not lever.lever:isActivated() then
			lever.lever:toggle()
		end
	end
end

function shoot(settings, auto)
	local pedestal = findEntity(settings.name .. "_pedestal")
	if isLoaded(pedestal.surface) or auto then
		local spawner = findEntity(settings.name .. "_spawner")
		spawner.spawner:activate()
		local sound = findEntity(settings.name .. "_sound")
		sound.sound:stop()
		sound.controller:activate()
		unloadCannon(pedestal, settings.unloadDirection)
	end
end

function unloadCannon(pedestal, unloadDirection)
	local x, y = getForward(unloadDirection)		
	for _,i in pedestal.surface:contents() do
		if i.go.name ~= "hand_cannon" then
			i.go:setPosition(pedestal.x + x, pedestal.y + y, pedestal.facing, pedestal.elevation, pedestal.level)
		end
	end
end