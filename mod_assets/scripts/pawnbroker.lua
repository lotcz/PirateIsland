function turnEast()
	shopkeeper:setPosition(shopkeeper.x, shopkeeper.y, 3 , shopkeeper.elevation, shopkeeper.level)
end

function turnNorth()
	shopkeeper:setPosition(shopkeeper.x, shopkeeper.y, 0 , shopkeeper.elevation, shopkeeper.level)
end

pawnshop = {}
pawnshop.name = "pawnshop"
pawnshop.currency = "coin_silver"
pawnshop.dealer_name = "John Silver"
pawnshop.out_of_stock_message = "I have nothing. Wait until somebody is short of money and come to sell me his pants."
pawnshop.wrong_items_message = "My goods are worth silver."
pawnshop.deal_message = "Just don't try to sell it back to me tomorrow."
pawnshop.no_deal_message = "You'll be back. I am sure."
pawnshop.no_messing_message = "This is a pawnshop, not a Turkish bazaar."

function pullChain()
	shop.script.pullChain(pawnshop)	
end

function takeItem(alcove, item)
	shop.script.takeItem(pawnshop, alcove, item)	
end

function putItem(alcove, item)
	shop.script.putItem(pawnshop, alcove, item)	
end

pawnbroker_signal_sold = false
pawnbroker_switching = false

function pawnbroke()
	if not pawnbroker_switching then
		local pawnshop_sell = findEntity("pawnshop_sell")
		if helper.script.surfaceContains(pawnshop_sell.surface, "spying_glass") then
			pawnbroker_signal_sold = true
			local rod = helper.script.getFirstTypeFromSurface(pawnshop_sell.surface, "spying_glass")
			rod.go:destroy()
			local coin = spawn("coin_copper", shopkeeper.level, shopkeeper.x, shopkeeper.y, shopkeeper.facing, shopkeeper.elevation)
			pawnbroker_switching = true
			pawnshop_sell.surface:addItem(coin.item)
			pawnbroker_switching = false
            broughtSpyglass(sender)
		else
			if math.random() > 0.5 then
				if not pawnbroker_signal_sold then
					helper.script.talk(pawnshop.dealer_name, "Do you have a spyglass? I have a vendor for one.")
				else
					helper.script.talk(pawnshop.dealer_name, "Bring me something special. Like a crystal ball for example.")
				end
			else
				helper.script.talk(pawnshop.dealer_name, "I have already plenty of junk like that.")
			end
		end
	end
end

-- DIALOGUE

js_quest_started = false
js_quest_finished = false
js_quest_crabs_killed = 0
js_quest_crabs_paid = 0
js_quest_bunker_key = false
js_quest_ammo_left = 0

balbuino_quest_started = false

function decreaseAmmo()
	js_quest_ammo_left = js_quest_ammo_left - 1
end

function killedCrab()
	js_quest_crabs_killed = js_quest_crabs_killed + 1
	helper.script.gainExp(600, "Killed a beach crab.")
end

function hideDialogue()
	GTKGui.Dialogue.hideDialogue();
end

function triggeredDialogue()
	if js_quest_started and not js_quest_finished then
		if js_quest_crabs_killed > js_quest_crabs_paid then
			_showCrabReward()
		else
			_showQuestInstructions()
		end
	end
end

function broughtSpyglass(sender)
    _showPage1();
	js_quest_started = true
end

function _showCrabReward()	
	local message
	if js_quest_crabs_killed >= 4 then
		js_quest_finished = true
		balbuino_quest_started = true
		helper.script.gainExp(2000, "Killed all crabs in the port.")
		message = "You did it, you killed them all! Would you be interested in doing even more important job for me?"
	else
		message = "Good, my little pirates. Nasty creatures these crabs, aren't they? Keep going."
	end
	local coins = js_quest_crabs_killed - js_quest_crabs_paid
	js_quest_crabs_paid = js_quest_crabs_killed
	
	for i=1,coins do
		local coin = spawn("coin_copper", shopkeeper.level, shopkeeper.x, shopkeeper.y, shopkeeper.facing, shopkeeper.elevation)
		pawnbroker_switching = true
		pawnshop_sell.surface:addItem(coin.item)
		pawnbroker_switching = false
	end
	
	local page = {
		speakerName = pawnshop.dealer_name,
		speakerMessage = message,
		onFinish = function (response)
            if ( response == 1 ) then
               _showBalbuinoInstructions()
            end		
			if ( response == 2 ) then
               _showComeBack()
            end		
        end,
		responses = {
			{ text = "Sure, what is it this time?" },
			{ text = "No. Thank you. We want to come back home alive." },
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showPage1()	
	local page = {
		speakerName = pawnshop.dealer_name,
		speakerMessage = "Good work, sailor! You look like a capable pirate. Would you be interested in a little crab hunting job?",
		onFinish = function (response)
            if ( response == 1 ) then
                _showQuestInstructions()
            end
            if ( response == 2 ) then
                _showPage2()
            end	
			if ( response == 3 ) then
                _showPage3()
            end
        end,
		responses = {
			{ text = "Yes. Of course." },
			{ text = "No, sorry. We are only travelling merchants." },
			{ text = "Why don't your men do it?" }
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showPage2()	
	local page = {
		speakerName = pawnshop.dealer_name,
		speakerMessage = "There will be many valuable items in crab nests that you can sell afterwards. Crabs mistake shiny things for dead fish sometimes and take it in their home.",
		onFinish = function (response)
            if ( response == 1 ) then
                _showQuestInstructions()
            end 
			if ( response == 2 ) then
                _showPage3()
            end
        end,
		responses = {
			{ text = "Okay then. Tell us more about it." },
			{ text = "Why don't your men do it?" }
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showPage3()	
	local page = {
		speakerName = pawnshop.dealer_name,
		speakerMessage = "They are just a bunch of lousy ratlings who are scared shitless of few tiny crabs. You can do better I beleive.",
		onFinish = function (response)
            if ( response == 1 ) then
                _showQuestInstructions()
            end
            if ( response == 2 ) then
                _showPage2()
            end	
        end,
		responses = {
			{ text = "Yes, we can!" },
			{ text = "No, sorry. We are only travelling merchants." },
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showQuestInstructions()	
	local page = {
		speakerName = pawnshop.dealer_name,
		speakerMessage = "I need you to kill all crabs in the port. You can use our defense cannons for that. I will give you one copper roach for each dead crab.",
		onFinish = function (response)
            if ( response == 1 ) then
                _showCannonInstructions()
            end
            if ( response == 2 ) then
               _showFlameInstructions()
            end		
			if ( response == 3 ) then
               _showCrabInstructions()
            end
        end,
		responses = {
			{ text = "How do we fire cannon by the Zaeus shrine?" },
			{ text = "Could you give us ammo for magic fire thrower?" },
			{ text = "How can we make crabs stand in a cannon's firing line?" },
			{ text = "Consider it done." }
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showCannonInstructions()
	local page = {
		speakerName = pawnshop.dealer_name,
		speakerMessage = "You will need cannon balls and some gunpowder. Put both in the cannon and light it with torch.",
		onFinish = function (response)
            if ( response == 1 ) then
                _showBallsInstructions()
            end
            if ( response == 2 ) then
               _showFlameInstructions()
            end		
			if ( response == 3 ) then
               _showCrabInstructions()
            end
        end,
		responses = {
			{ text = "Where can we find cannon balls and gunpowder?" },
			{ text = "Could you give us ammo for magic fire thrower?" },
			{ text = "How can we make crabs stand in a cannon's firing line?" },
			{ text = "Mr. Silver, consider it done." }
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showBallsInstructions()
	local message
	if not js_quest_bunker_key then
		js_quest_bunker_key = true
		local key = spawn("mine_key", shopkeeper.level, shopkeeper.x, shopkeeper.y, shopkeeper.facing, shopkeeper.elevation)
		pawnbroker_switching = true
		pawnshop_sell.surface:addItem(key.item)
		pawnbroker_switching = false
		message = "Get some in bunkers on the cliff. Here is the key."
	else
		message = "Get some in bunkers on the cliff. I already gave you the key."
	end
	local page = {
		speakerName = pawnshop.dealer_name,
		speakerMessage = message,
		onFinish = function (response)
            if ( response == 1 ) then
               _showFlameInstructions()
            end		
			if ( response == 2 ) then
               _showCrabInstructions()
            end
        end,
		responses = {
			{ text = "Could you give us ammo for magic fire thrower?" },
			{ text = "How can we make crabs stand in a cannon's firing line?" },
			{ text = "Mr. Silver, consider it done." }
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showCrabInstructions()	
	local page = {
		speakerName = pawnshop.dealer_name,
		speakerMessage = "Crabs are afraid of fire. Hit them with torch and they start running like crazy.",
		onFinish = function (response)
            if ( response == 1 ) then
               _showCannonInstructions()
            end		
			if ( response == 2 ) then
               _showFlameInstructions()
            end
        end,
		responses = {
			{ text = "How do we fire cannon by the Zaeus shrine?" },
			{ text = "Could you give us ammo for magic fire thrower?" },
			{ text = "Thank you for advice." },
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showFlameInstructions()	
	local message
	if js_quest_ammo_left == 0 then
		js_quest_ammo_left = 10
		local ammo = spawn("flame_liquid", shopkeeper.level, shopkeeper.x, shopkeeper.y, shopkeeper.facing, shopkeeper.elevation)
		ammo.item:setStackSize(10)
		pawnbroker_switching = true
		pawnshop_sell.surface:addItem(ammo.item)
		pawnbroker_switching = false
		message = "Here you go. And don't waste, this stuff isn't for free."
	else
		message = "I haven't heard enough explosions. You must still have some with you."
	end
	local page = {
		speakerName = pawnshop.dealer_name,
		speakerMessage = message,
		onFinish = function (response)
            if ( response == 1 ) then
               _showCannonInstructions()
            end		
			if ( response == 2 ) then
               _showCrabInstructions()
            end		
        end,
		responses = {
			{ text = "How do we fire cannon by the Zaeus shrine?" },
			{ text = "How can we make crabs stand in a cannon's firing line?" },
			{ text = "Thank you. Bye." },
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showComeBack()	
	local page = {
		speakerName = pawnshop.dealer_name,
		speakerMessage = "You damned pirates! Come back when you restore your sense for duty.",
		responses = {
			{ text = "Bye." },
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showBalbuinoInstructions()	
	local page = {
		speakerName = pawnshop.dealer_name,
		speakerMessage = "Our alchemist, Balbuino, is gone. Without him, we might run out of flame liquid and other goodies.",
		responses = {
			{ text = "It sounds dangerous, but we go anyway. We are mighty pirates. I mean merchants." },
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showBalbuinoInstructions2()	
	progress_door.door:open()
	local page = {
		speakerName = pawnshop.dealer_name,
		speakerMessage = "You can go through sewers. Jump into the pit betweeen cages in slaughterhouse.",
		responses = {
			{ text = "It sounds dangerous, but we go anyway. We are mighty pirates. I mean merchants." },
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end