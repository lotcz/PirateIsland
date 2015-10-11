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
	local shop_desk = findEntity(pawnshop.name .. "_desk")
	if helper.script.surfaceContains(shop_desk.surface, pawnshop.currency) then
		shop.script.pullChain(pawnshop)		
	else
		triggeredDialogue()
	end	
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
			local coin = spawn("coin_silver", shopkeeper.level, shopkeeper.x, shopkeeper.y, shopkeeper.facing, shopkeeper.elevation)
			pawnbroker_switching = true
			pawnshop_sell.surface:addItem(coin.item)
			pawnbroker_switching = false
            helper.script.gainExp(400,"Sold spyglass to John Silver.")
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

cedrick_friend = false
balbuino_quest_started = false

function decreaseAmmo()
	js_quest_ammo_left = js_quest_ammo_left - 1
end

function killedCrab()
	js_quest_crabs_killed = js_quest_crabs_killed + 1
	helper.script.gainExp(600, "Killed a beach crab.")
	--helper.script.talk("Debug", "crabs killed: " .. js_quest_crabs_killed)
end

function hideDialogue()
	GTKGui.Dialogue.hideDialogue();
end

function triggeredDialogue()	
	if js_quest_finished then
		_showWelcome()
	else
		if js_quest_started then		
			if (js_quest_crabs_killed > js_quest_crabs_paid) then
				_showCrabReward()
			else
				_showWelcome()
			end
		else
			_showPage1()
		end
	end	
end

function _showWelcome()	
	local msgs = {
			"Ahoy sailors!",
			"Hello pirates.",
			"Welcome to the famous John Silver's Pirate Lighthouse Pawnshop.",
			"Ahoy pirates! Don't stand there like ladies and do some work!"
		}
	local page = {
		speakerName = pawnshop.dealer_name,		
		speakerMessage = msgs[math.random(1,#msgs)],
		onFinish = function (response)
			if js_quest_finished then	
				_showQuestInstructions()
			else
				_showQuestInstructions()
			end
        end,
		responses = {
			{ text = "Hello John Silver." },
			{ text = "Ahoy!" },
			{ text = "Greetings noble sir." }
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showCrabReward()	
	local message
	if js_quest_crabs_killed >= 2 then
		js_quest_finished = true
		balbuino_quest_started = true
		helper.script.gainExp(2000, "Killed crabs at Port Ciago.")
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
			{ text = "No. Thank you. We want to return back home alive." },
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showPage1()	
	local page = {
		speakerName = pawnshop.dealer_name,
		speakerMessage = "Hello sailor! I am John Silver. You look like a capable pirate. Would you be interested in a little crab hunting job?",
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
			if ( response == 3 ) then
                _showComeBack()
            end
        end,
		responses = {
			{ text = "Okay then. Tell me more about it." },
			{ text = "Why don't your men do it?" },
			{ text = "No. Do your dirty crab job yourself." }
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
			if ( response == 3 ) then
                _showComeBack()
            end
        end,
		responses = {
			{ text = "Yes, we can!" },
			{ text = "No, sorry. We are only travelling merchants." },
			{ text = "No. Do your dirty crab job yourself." }
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showQuestInstructions()
	if not js_quest_started then
		js_quest_started = true
		helper.script.gainExp(200, "Started \"Kill the Crabs\" quest.")
	end
	local page = {
		speakerName = pawnshop.dealer_name,
		speakerMessage = "I need you to kill all crabs in the port. You will have to use our cannon at Zaeus shrine. I will give you one copper roach for each dead crab.",
		onFinish = function (response)
            if ( response == 1 ) then
                _showCannonInstructions()
            end
            if ( response == 2 ) then
               _showZaeusInstructions()
            end		
			if ( response == 3 ) then
               _showCrabInstructions()
            end
        end,
		responses = {
			{ text = "How can one fire that cannon sir?" },
			{ text = "Where is Zaeus shrine?" },
			{ text = "Is there anything that could help us with crabs?" },
			{ text = "Consider it done." }
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showCannonInstructions()
	local page = {
		speakerName = pawnshop.dealer_name,
		speakerMessage = "You will need cannon balls and some gunpowder. Put both in the cannon and light it up with torch.",
		onFinish = function (response)
            if ( response == 1 ) then
                _showBallsInstructions()
            end
            if ( response == 2 ) then
               _showTorchInstructions()
            end		
        end,
		responses = {
			{ text = "Where can we find cannon balls and gunpowder?" },
			{ text = "Is there any shop with torches nearby?" },
			{ text = "Mr. Silver, consider it done." }
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showBallsInstructions()
	local message
	if not js_quest_bunker_key then
		js_quest_bunker_key = true
		local key = spawn("bunker_key", shopkeeper.level, shopkeeper.x, shopkeeper.y, shopkeeper.facing, shopkeeper.elevation)
		pawnbroker_switching = true
		pawnshop_desk.surface:addItem(key.item)
		pawnbroker_switching = false
		message = "Get some in bunkers on the cliff. Here is one key. That idiot Dorgul lost second key and blamed it on crows! What a sloppiness!"
	else
		message = "Get some in bunkers on the cliff. And try to find the other bunker key! Ask that idiot Dorgul where he lost it."
	end
	local page = {
		speakerName = pawnshop.dealer_name,
		speakerMessage = message,
		onFinish = function (response)
            if ( response == 1 ) then
               _showBunkersInstructions()
            end		
			if ( response == 2 ) then
               _showCrabInstructions()
            end
        end,
		responses = {
			{ text = "Which way are bunkers, sir?" },
			{ text = "Could somebody or something help us fighting those crabs?" },
			{ text = "Mr. Silver, consider it done." }
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showBunkersInstructions()
	cedrick_friend = true
	local page = {
		speakerName = pawnshop.dealer_name,
		speakerMessage = "Bunkers are at top of the cliff. Go east and you hit them. I will tell Cedrick to let you go.",
		onFinish = function (response)
			if ( response == 1 ) then
               _showQuestInstructions()
            end
        end,
		responses = {
			{ text = "Tell me what was that crab job about again?" },
			{ text = "Thank you. Let's go get some balls." }
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showZaeusInstructions()
	local page = {
		speakerName = pawnshop.dealer_name,
		speakerMessage = "At Port Ciago. Right next to my brother Vincent's shop.",
		onFinish = function (response)
			if ( response == 1 ) then
               _showQuestInstructions()
            end
        end,
		responses = {
			{ text = "I don't remember what was that whole crab mission about." },
			{ text = "Okay. Let's go shoot the cannon." }
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showTorchInstructions()
	local page = {
		speakerName = pawnshop.dealer_name,
		speakerMessage = "See my brother Vincent at Port Ciago. He can help you obtaining equipment you need.",
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
			{ text = "Do crabs have any weakness?" },
			{ text = "Mr. Silver, consider it done." }
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showCrabInstructions()	
	local page = {
		speakerName = pawnshop.dealer_name,
		speakerMessage = "Those crabs are impossible to kill with a sword. Don't even try. Those beasts are only afraid of fire. When they are hit with a fire they start running like crazy.",
		onFinish = function (response)
            if ( response == 1 ) then
               _showQuestInstructions()
            end		
        end,
		responses = {
			{ text = "Good to know that. What did you want me to do again?" },
			{ text = "Thank you for your advice Mr. Silver. Good bye." },
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
		pawnshop_desk.surface:addItem(ammo.item)
		pawnbroker_switching = false
		message = "Here you go. And don't waste, this stuff isn't for free."
	else
		message = "I already did and I haven't heard enough explosions yet. You must still have some with you."
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
		speakerMessage = "Our alchemist, Balbuino, is gone. Without him, we might soon run out of flame liquid and other goodies.",
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