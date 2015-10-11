vincent = {}
vincent.name = "general_shop"
vincent.currency = "coin_copper"
vincent.dealer_name = "Vincent"
vincent.out_of_stock_message = "Nothing on stock at the moment."
vincent.wrong_items_message = "Come back when you have roaches!"
vincent.deal_message = "Come again my friend!"
vincent.no_deal_message = "You can keep your money! I never wanted them anyway."
vincent.no_messing_message = "I will not trade under such conditions!"

function pullChain()
	local shop_desk = findEntity(vincent.name .. "_desk")	
	if helper.script.surfaceContains(shop_desk.surface, vincent.currency) or not pawnshop_script.script.js_quest_started then
		shop.script.pullChain(vincent)		
	else
		_showWelcome()	
	end	
end

function takeItem(alcove, item)
	shop.script.takeItem(vincent, alcove, item)	
end

function putItem(alcove, item)
	shop.script.putItem(vincent, alcove, item)	
end

function resupply()
	local shop_stock = findEntity(vincent.name .. "_stock")
	if not helper.script.surfaceContains(shop_stock.surface, "torch") then
		local i = helper.script._spawn("torch")
		helper.script.addToSurface(shop_stock.surface,i.item)		
	end	
end

-- DIALOGUE

function hideDialogue()
	GTKGui.Dialogue.hideDialogue();
end

function _showWelcome()	
	local page = {
		speakerName = vincent.dealer_name,		
		speakerMessage = "Hello. I am Vincent. John Silver is my brother. Can I help you?",
		onFinish = function (response)
			if (response == 1) then	
				_showTorchInstructions1()
			elseif (response == 2) then
				_showCliffInstructions()
			end
        end,
		responses = {
			{ text = "We need some source of fire! Maybe a spell." },
			{ text = "Do you know how to go to the cliff?" },
			{ text = "Goodbye Vincent." }
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showCliffInstructions()	
	local page = {
		speakerName = vincent.dealer_name,		
		speakerMessage = "Cliff is to the East. You have to solve that stupid lock riddle to go there from Port Ciago. Captain says it is for security, but even a child could figure it out.",
		onFinish = function (response)
			if (response == 1) then	
				_showTorchInstructions1()			
			end
        end,
		responses = {
			{ text = "We need some source of fire! Maybe a spell." },
			{ text = "Goodbye Vincent." }
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showTorchInstructions1()	
	local page = {
		speakerName = vincent.dealer_name,		
		speakerMessage = "There are no spells. Don't be foolish. Why don't you buy a torch from me? For one roach it's yours. You can also make your own torch if you know how.",
		onFinish = function (response)
			if (response == 1) then					
				_showTorchInstructions2()
			elseif (response == 2) then	
				_showCliffInstructions()
			end
        end,
		responses = {
			{ text = "Do you know how to make a torch?" },
			{ text = "Which way to the cliff?" },
			{ text = "Goodbye Vincent." }
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showTorchInstructions2()	
	local page = {
		speakerName = vincent.dealer_name,		
		speakerMessage = "No. I had a slave who was making torches for me, but he fled.",
		onFinish = function (response)
			if (response == 1) then	
				_showCliffInstructions()
			end
        end,
		responses = {
			{ text = "Do you ever go to the cliff?" },
			{ text = "Goodbye Vincent." }
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end