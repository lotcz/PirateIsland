
defineObject{
	name = "grimtk",
	baseObject = "script_entity",
	components = {
		{
			class = "Null",
			onInit = function(self)
				if ( findEntity("GTK") == nil ) then
					local gtk = spawn("script_entity", 1, 1, 1, 1, 1, "GTK");
					gtk.script:loadFile("mod_assets/grimtk/scripts/hook.lua");
					gtk:createComponent("Script", "Constants"):loadFile("mod_assets/grimtk/scripts/gtk/constants.lua");
					gtk:createComponent("Script", "Input"):loadFile("mod_assets/grimtk/scripts/gtk/input.lua");					
					gtk:createComponent("Script", "Core"):loadFile("mod_assets/grimtk/scripts/gtk/core.lua");
					gtk:createComponent("Script", "Widgets"):loadFile("mod_assets/grimtk/scripts/gtk/widgets.lua");
					
					delayedCall("GTK", 0.01, "emitGtkDidLoad");
				end
				
				if ( findEntity("GTKGui") == nil ) then
					local gtkgui = spawn("script_entity", 1, 1, 1, 1, 1, "GTKGui");
					gtkgui:createComponent("Script", "Basic"):loadFile("mod_assets/grimtk/scripts/gtkgui/basic.lua");
					gtkgui:createComponent("Script", "Dialogue"):loadFile("mod_assets/grimtk/scripts/gtkgui/dialogue.lua");
					gtkgui:createComponent("Script", "Cinematic"):loadFile("mod_assets/grimtk/scripts/gtkgui/cinematic.lua");					
				end
			end
		}
	}
}

defineObject{
	name = "party",
	baseObject = "party",
	components = {
		{
			class = "Party",
			onDrawGui = function(party, g)
				
			end,
			onMove = function(party, direction)
				if ( findEntity("GTK") ) then
					if ( GTK.Core.GUI:isPartyLocked() ) then
						return false;
					end
				end
			end,
			onTurn = function(party, direction)
				if ( findEntity("GTK") ) then
					if ( GTK.Core.GUI:isPartyLocked() ) then
						return false;
					end
				end
			end,
			onRest = function(party)
				if ( findEntity("GTK") ) then
					if ( GTK.Core.GUI:isPartyLocked() ) then
						return false;
					end
				end			
			end,
			onWakeUp = function(party)
				if ( findEntity("GTK") ) then
					if ( GTK.Core.GUI:isPartyLocked() ) then
						return false;
					end
				end
			end
		}
	}
}