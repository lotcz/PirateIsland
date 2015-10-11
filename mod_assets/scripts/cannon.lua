function isLoaded(surface)
	return surface:count() == 3 and helper.script.surfaceContains(surface, "gunpowder") and helper.script.surfaceContains(surface, "navy_cannon_ball")
end

function insertItem(settings, surface, item)
	if isLoaded(surface) then
		local lever = findEntity(settings.name .. "_lever")
		if lever and lever.lever:isActivated() then
			lever.lever:toggle()
		end
		hudPrint("Cannon is loaded.")
		local sound = findEntity(settings.name .. "_sound")
		if sound then
			sound.controller:deactivate()	
		end
		local rsound = findEntity(settings.name .. "_reload_sound")		
		if rsound then
			rsound.controller:activate()		
		end
	else
		if surface:count() > 3 then
			hudPrint("Cannon is overloaded.")
		else
			hudPrint("This cannon needs gunpowder and a cannon ball.")
		end
	end
end

function removeItem(settings, surface, item)	
	if isLoaded(surface) then		
		-- lever.controller:activate()
	else
		local lever = findEntity(settings.name .. "_lever")
		if lever and not lever.lever:isActivated() then
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
		if sound then
			sound.controller:activate()
		end
		local rsound = findEntity(settings.name .. "_reload_sound")		
		if rsound then
			rsound.controller:deactivate()	
		end
		unloadCannon(pedestal.surface)
	else 
		if pedestal.surface:count() > 3 then
			hudPrint("Cannon is overloaded.")
		else
			helper.script.talkChampion({"Cannon is not loaded."})
		end
	end
end

function unloadCannon(surface)
	local ball = helper.script.getFirstTypeFromSurface(surface,"navy_cannon_ball")
	if ball then 
		ball.go:destroy()
	end
	local gunpowder = helper.script.getFirstTypeFromSurface(surface,"gunpowder")
	if gunpowder then 
		gunpowder.go:destroy()
	end	
end