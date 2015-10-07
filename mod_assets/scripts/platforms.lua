active_platform = 3
platform_weight_up = true

moving_platform = ""
moving_to = 0
moving_by = -0.01
weight_to = 0
weight_by = 0.01

platform_1_data = {}
platform_1_data.name = "pit_platform_1"
platform_1_data.min = -2
platform_1_data.max = 1

platform_2_data = {}
platform_2_data.name = "pit_platform_2"
platform_2_data.min = -2
platform_2_data.max = 1

platform_3_data = {}
platform_3_data.name = "pit_platform_3"
platform_3_data.min = 0
platform_3_data.max = 1

platforms = { platform_1_data, platform_2_data, platform_3_data }

function _canMove(p, e, up)	
	return (up and e.elevation < p.max) or (e.elevation > p.min and not up)
end

function _startMove(p, e, up)	
	moving_platform = p.name	
	if up then
		moving_to = e.elevation + 1
		moving_by = 0.02
		weight_to = -1
		weight_by = -0.02
	else
		moving_to = e.elevation - 1
		moving_by = - 0.02
		weight_to = 0
		weight_by = 0.02
	end
	platform_weight_up = not platform_weight_up
	platform_timer.timer:start()
end

function doMove()	
	local e = findEntity(moving_platform)
	if e ~= nil then
		local elevation = e.elevation + moving_by
		local upper = findEntity(moving_platform .. "_upper")
		if (elevation <= moving_to and moving_by < 0) or (elevation >= moving_to and moving_by > 0) then			
			elevation = moving_to
			moving_platform = ""
			platform_timer.timer:stop()
			helper.script.setElevation(pit_platform_0, weight_to)
		else
			helper.script.setElevation(pit_platform_0, pit_platform_0.elevation + weight_by)
		end
		helper.script.setElevation(e, elevation)
			
		if upper ~= nil then
			helper.script.setElevation(upper, elevation+2)
		end
	end
end

function pullLever()
	if moving_platform == "" then
		local p = platforms[active_platform]
		local e = findEntity(p.name)
		if _canMove(p, e, platform_weight_up) then
			_startMove(p, e, platform_weight_up)
		else
			playSound("gate_lock")
		end
	else
		playSound("key_lock")		
	end
end

function switchPlatform()
	active_platform = active_platform + 1
	if active_platform > 3 then
		active_platform = 1
	end
end


