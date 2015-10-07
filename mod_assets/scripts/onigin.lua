function talkToOnigin()
	if juan_script.script.found_juan then
		_showPageGeneral()
	else
		_showPage1()	
	end    
end

function _showPage1()	
	local page = {
		speakerName = "Onigin",
		speakerMessage = "Hello folks. Thank you saving me from that hole again. I was literally starting to rot in there. Just look at my lid, look!",
		onFinish = function (response)
            if ( response == 1 ) then
                _showPage5()
            end
            if ( response == 2 ) then
                _showPage2()
            end			
        end,
		responses = {
			{ text = "Do you know someone by the name of Juan the Hermit?" },
			{ text = "How did you become a chest?" },
			{ text = "Let's talk later." }
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showPage2()	
	local page = {
		speakerName = "Onigin",
		speakerMessage = "It is a sad story. I wasn't born like that. I was put in this chest by cruel master Derondan right after I was born.",
		onFinish = function (response)
            if ( response == 1 ) then
                _showPage3()
            end
			if ( response == 2 ) then
                _showPage4()
            end
			if ( response == 3 ) then
                _showPage5()
            end
        end,
		responses = {
			{ text = "Why don't you get out of the chest now?" },
			{ text = "Why did your master put you in the chest?" },
			{ text = "Do you know someone by the name of Juan the Hermit?" },
			{ text = "Let's talk later." }
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showPage3()	
	local page = {
		speakerName = "Onigin",
		speakerMessage = "My body has grown tight into the wood. It is hard to tell now where the chest ends and where I begin. Also I am afraid I couldn't handle it outside anyway.",
		onFinish = function (response)
            if ( response == 1 ) then
                _showPage4()
            end
			 if ( response == 2 ) then
                _showPage5()
            end
        end,
		responses = {
			{ text = "Why did your master put you in the chest?" },
			{ text = "Do you know someone by the name of Juan the Hermit?" },
			{ text = "Let's talk more later." }
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showPage4()	
	local page = {
		speakerName = "Onigin",
		speakerMessage = "My mother was his wife, but I wasn't his son. My mother begged him to spare my life so he put me in this chest for amusement of all. Sometimes I wish he rather killed me.",
		onFinish = function (response)
            if ( response == 1 ) then
                _showPage3()
            end
			if ( response == 2 ) then
                _showPage5()
            end
        end,
		responses = {
			{ text = "Why don't you get out of the chest now?" },
			{ text = "Do you know someone by the name of Juan the Hermit?" },
			{ text = "Let's talk more later." }
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showPage5()	
	local page = {
		speakerName = "Onigin",
		speakerMessage = "Of course I do. Very nice man this Juan. He lives in a cave in the middle of Blue Lagoon. He doesn't like visitors though. He only likes his animals.",
		onFinish = function (response)
            if ( response == 1 ) then
                _showPage6()
            end
			if ( response == 2 ) then
                _showPage7()
            end
			if ( response == 3 ) then
                _showPage2()
            end
        end,
		responses = {
			{ text = "Where is this Blue Lagoon?" },
			{ text = "How can we get to his cave?" },
			{ text = "How did you become a chest?" },
			{ text = "Okay. Bye." }
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showPage6()	
	local page = {
		speakerName = "Onigin",
		speakerMessage = "South of the cliff and East of the lighthouse. There are some wild animals living in Blue Lagoon, so watch out. I am personally most afraid of wood-worms.",
		onFinish = function (response)
            if ( response == 1 ) then
                _showPage7()
            end
			if ( response == 2 ) then
                _showPage2()
            end
        end,
		responses = {
			{ text = "How can we get to his cave?" },
			{ text = "How did you become a chest?" },
			{ text = "Okay. Bye." }
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showPage7()	
	local page = {
		speakerName = "Onigin",
		speakerMessage = "I am afraid you will have to swim. That will be dangerous as there are some really nasty creatures living in the lake.",
		onFinish = function (response)
            if ( response == 1 ) then
                _showPage6()
            end
			if ( response == 2 ) then
                _showPage2()
            end
        end,
		responses = {
			{ text = "Where is this Blue Lagoon?" },
			{ text = "How did you become a chest?" },
			{ text = "Okay. Bye." }
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end

function _showPageGeneral()	
	local page = {
		speakerName = "Onigin",
		speakerMessage = "How is it going today? Would you like to have something stored in myself?",
		onFinish = function (response)
            if ( response == 1 ) then
                _showPage1()
            end
        end,
		responses = {
			{ text = "What do you think we should do now?" },
			{ text = "What do you think we should do now?" },
			{ text = "I will talk to you later." }
		}
	}

	GTKGui.Dialogue.showDialoguePage(page);
end