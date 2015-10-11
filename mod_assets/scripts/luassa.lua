luassa_name = "Luassa"
luassa_on_stage = false

function spawn()
	local e = findEntity("luassa")
	if e == nil and not luassa_on_stage then
		luassa_timer.timer:stop()
		luassa_on_stage = true
		luassa_pedestal.door:enable()
		e = helper.script.spawnAt( "zarchton_ambush", self.go, "luassa")
		e.brain:disable()
		e.monster:setDeathEffect("stunned_monster")
		e.monster:setDieSound("water_hit_large")
		
		helper.script.talkRandom(luassa_name, 
			{ 
			"Wait! Don't be afraid.",
			"Wait! I will not hurt you!",
			"I am your friend, strangers.",
			}
		)
	end
	
	if luassa_on_stage then	
		if snake_dealer_script.script.learned then
			helper.script.talk(luassa_name, "You know Luassa.")
		else
			helper.script.talk(luassa_name, "You don't know Luassa.")
		end		
	end
	
end

function destroy()
	if luassa_on_stage then
		luassa_on_stage = false
		luassa_pedestal.door:disable()
		local e = findEntity("luassa")
		if e ~= nil then
		
			helper.script.talkRandom(luassa_name, 
				{ 
				"Good bye strangers.",
				"Come visit again strangers.",
				}
			)
			
			luassa_timer.timer:start()
			--e.monster:disable()
		end
	end
end

function goHome()
	local e = findEntity("luassa")
	if e ~= nil then
		e.brain:goTo("luassa_home")
	end
end