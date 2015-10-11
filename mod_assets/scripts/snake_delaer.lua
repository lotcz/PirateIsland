learned = false

snake_dealer = {}
snake_dealer.name = "snake_dealer"
snake_dealer.currency = "coin_gold"
snake_dealer.dealer_name = "Snake Dealer"
snake_dealer.out_of_stock_message = "I have no more snakes."
snake_dealer.wrong_items_message = "My snake is worth more than that."
snake_dealer.deal_message = "Snake is yours. Treat him well."
snake_dealer.no_deal_message = "No snakes for you then."
snake_dealer.no_messing_message = "Stop messing around!"

function pullChain()
	local shop_desk = findEntity(snake_dealer.name .. "_desk")
	if not helper.script.surfaceContains(shop_desk.surface, snake_dealer.currency) then
		showDialogue()
	else
		shop.script.pullChain(snake_dealer)	
	end
end

function takeItem(alcove, item)
	shop.script.takeItem(snake_dealer, alcove, item)	
end

function putItem(alcove, item)
	shop.script.putItem(snake_dealer, alcove, item)	
end

function hideDialogue()
	GTKGui.Dialogue.hideDialogue();
end

function showDialogue()
	_showPage1()
end

function _showPage1()	
	local page = {
		speakerName = snake_dealer.dealer_name,
		speakerMessage = "Greeeeetingsss tuaveller. Want to buy a ssssnake?",
		onFinish = function (response)
            if ( response == 1 ) then
                _showSnakePrice()
            end
            if ( response == 2 ) then
                _showSnakeDescription()
            end			
        end,
		responses = {
			{ text = "Yes. Of course." },
			{ text = "A snake?" },
			{ text = "No. Thank you." }
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showSnakePrice()	
	local page = {
		speakerName = snake_dealer.dealer_name,
		speakerMessage = "One sssssnake is one Ducat, tuaveller.",
		onFinish = function (response)
            if ( response == 1 ) then
                _showSnakeGoSeeIt()
            end
            if ( response == 2 ) then
                _showSnakeDescription()
            end	
        end,
		responses = {
			{ text = "Can I see the snake first?" },
			{ text = "Oh my god! A Ducat? For an ordinary snake?" },
			{ text = "Good bye." }
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showSnakeDescription()	
	local page = {
		speakerName = snake_dealer.dealer_name,
		speakerMessage = "Sssssnake is ssssspecial. Sssssnake will do you good.",
		onFinish = function (response)
            if ( response == 1 ) then
                _showSnakePrice()
            end
            if ( response == 2 ) then
                _showSnakeDescription2()
            end	
        end,
		responses = {
			{ text = "How much for your snake?" },
			{ text = "What is so special about this snake?" },
			{ text = "Good bye." }
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showSnakeDescription2()	
	local page = {
		speakerName = snake_dealer.dealer_name,
		speakerMessage = "Sssssnakes like brothers. Ssssnakes like friends for our people. Sssssnakes are good.",
		onFinish = function (response)
            if ( response == 1 ) then
                _showSnakeDescription3()
            end
            if ( response == 2 ) then
                _showPeople()
            end	
        end,
		responses = {
			{ text = "If snakes are your friends, then how can you sell them like things?" },
			{ text = "Can you tell me more about your people?" },
			{ text = "I have to go." }
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showSnakeDescription3()	
	local page = {
		speakerName = snake_dealer.dealer_name,
		speakerMessage = "You pink meat people have dogsssss right? We have sssnakesss. Snakesss much better friendsss.",
		onFinish = function (response)
            if ( response == 1 ) then
                _showSnakePrice()
            end
            if ( response == 2 ) then
                _showPeople()
            end	
        end,
		responses = {
			{ text = "Snakes are cool. I'd like to buy one." },
			{ text = "Can you tell me more about your people?" },
			{ text = "I have to go." }
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showPeople()
	helper.script.gainExp(200, "Learned about Luassa people.")
	learned = true
	local page = {
		speakerName = snake_dealer.dealer_name,
		speakerMessage = "We are Luassa people. We lived on thisss island long before those pirate ratsss comessss. In the passsst, Luassa people build templesssss and rulesss the ocean.",
		onFinish = function (response)
            if ( response == 1 ) then
                _showPirates()
            end
			 if ( response == 2 ) then
                _showSnakePrice()
            end
        end,
		responses = {
			{ text = "Do you like pirates?" },
			{ text = "Can you tell me more about the snake?" },
			{ text = "I have to go." }
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showPirates()	
	local page = {
		speakerName = snake_dealer.dealer_name,
		speakerMessage = "Piratessss are ratsssss! Don't trusssst piratessss. Trust Luassa.",
		onFinish = function (response)
			if ( response == 1 ) then
                _showSnakePrice()
            end
        end,
		responses = {
			{ text = "Can you tell me more about the snake?" },
			{ text = "I have to go." }
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showSnakeGoSeeIt()
	snake_door.door:open()
	local page = {
		speakerName = snake_dealer.dealer_name,
		speakerMessage = "Go see the ssssnake. But don't touch the ssssnake. It Bitesss!",
		responses = {
			{ text = "Let me see." },
			{ text = "I am actually afraid of snakes." }
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end