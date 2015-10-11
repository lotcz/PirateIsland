function table_print (tt, indent, done)
  done = done or {}
  indent = indent or 0
  --local tt = getAllData(t)
  if type(tt) == "table" then
    local sb = {}
    for key, value in pairs (tt) do
      if type (value) == "table" and not done [value] then
        done [value] = true
        print( string.rep(" ", indent) .. "{");
        table_print(value, indent + 2, done)
        print( string.rep(" ", indent) .. "}");
      elseif "number" == type(key) then
        print( string.rep(" ", indent) .. string.format("\"%s\"", tostring(value)))
      else
        print( string.rep(" ", indent) .. string.format("%s = \"%s\"", tostring (key), tostring(value)))
       end
    end
  else
    print( string.rep(" ", indent) .. tt)
  end
end

function deb(n)
	if  "nil" == type( n ) then
        print("nil")
    elseif  "table" == type( n ) then
        print("table:")
		table_print(n, 2)
    elseif  "string" == type( n ) then
        print(n)
    else
        print(tostring(n))
    end
end

function gainExp(xp, msg)	
	if party ~= nil then
		for i=1,4 do
			if party.party:getChampion(i) ~= nil then
 				party.party:getChampion(i):gainExp(xp)
			end
 		end
		playSound("secret")
	end
	if msg then
		hudPrint(msg .. " (+" .. xp .. " EXP)")
	end
end

function setElevation(o, e)
	o:setPosition(o.x, o.y, o.facing, e, o.level)
end

function surfaceContains(surface, name)
   for _,i in surface:contents() do
      if i.go.name == name then return true end
   end
end

function getFirstFromSurface(surface)
	for _,i in surface:contents() do
    	return i
   	end
end

function getFirstTypeFromSurface(surface, name)
	for _,i in surface:contents() do
		if i.go.name == name then
			return i
		end
   	end
end

function _spawn( n, level, x, y, direction, elevation, id)
	return spawn(n, level or 1, x or 0, y or 0 , direction or 1, elevation or 0, id)
end

function spawnAt( n, position, id)
	return _spawn(n, position.level, position.x, position.y, position.facing, position.elevation, id)
end

last_random = 0

function _random(a, b)
	if a==b then
		return a
	else
		local x = math.random(a,b)
		while x == last_random do
			x = math.random(a,b)
		end
		last_random = x
		return x
	end
end

function addToSurface(surface, item)
	n = item.go.name
	s = item:getStackSize()
	item.go:destroy()
	item = _spawn(n)
	if item then
		if item.item:getStackable() then
			item.item:setStackSize(s)
		end
		surface:addItem(item.item)
	end
end

function talk( person, msg)
	hudPrint( person .. ": \"" .. msg .. "\"")
end

function talkRandom( name, msgs)
	hudPrint( name .. ": \"" .. msgs[_random(1,#msgs)] .. "\"")
end

function getFirstChampion()
	if party ~= nil then
		local name, ch
		for i=1,4 do			
			ch = party.party:getChampion(i)
			if ch ~= nil then
				if ch:isAlive() then
					return ch
				end
			end
		end
	end
end

function talkChampion(msgs)
	local ch
	ch = getFirstChampion()
	if ch ~= nil then
		talkRandom( ch:getName(), msgs)
	end
end			

function printRandom(msgs)
	hudPrint(msgs[_random(1,#msgs)])
end

function noSpell( n )
	local msg1 = string.gsub( "nnn: \"Nothing happened. Boo...\"", "nnn", n)
	local msg2 = string.gsub( "nnn cannot cast the good old spell.", "nnn", n)
	
	msgs = {
				"Do you actually believe in magic?",
				"Your old spells are useless in this adventure.",
				"Stop waving those hands you little Gandalf.",
				msg1, msg2
			}
	printRandom( msgs );
end

function turnEast(o)
	if o then
		if o.facing ~= 1 then
			o:setPosition(o.x, o.y, 1, o.elevation, o.level)
		end
	end
end

function turnWest(o)
	if o then
		if o.facing ~= 3 then
			o:setPosition(o.x, o.y, 3, o.elevation, o.level)
		end
	end
end

function turnNorth(o)
	if o then
		if o.facing ~= 0 then
			o:setPosition(o.x, o.y, 0, o.elevation, o.level)
		end
	end
end

function turnSouth(o)
	if o then
		if o.facing ~= 2 then
			o:setPosition(o.x, o.y, 2, o.elevation, o.level)
		end
	end
end

function isAt(a, b)
   return (a.x == b.x and a.y == b.y)
end