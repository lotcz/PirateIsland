function onDrawGui(sender, g)
	self.go.Core.GUI:update(g);
end

party.party:addConnector("onDrawGui", self.go.id, "onDrawGui");

function emitGtkDidLoad()
	local maxLevel = Dungeon.getMaxLevels();
	
	for level = 1, maxLevel do
		local map = Dungeon.getMap(level);
		
		for e in map:allEntities() do
			if ( e.script and e.script.gtkDidLoad ) then
				e.script:gtkDidLoad();
			end
		end
	end
end