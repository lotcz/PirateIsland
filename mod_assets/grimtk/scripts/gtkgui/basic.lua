
---------------------------------------------------------------
-- Message Box / Alert Box
---------------------------------------------------------------

GTK.Core.GUI:addImage({ name="log2-messagebox-small", path="assets/textures/gui/gui_items.tga", origin={2032, 0}, size={436, 300} });
GTK.Core.GUI:addImage({ name="log2-messagebox-large", path="assets/textures/gui/gui_items.tga", origin={0, 1436}, size={546, 546} });

kMessageBoxFormName = "gtk_message_box";
kMessageBoxForms = { };

kMessageBoxForms["small"] = {
	name = kMessageBoxFormName,
	type = "GWindow",
	size = {436, 300},
	bgImage = "log2-messagebox-small",
	bgDrawMode = GTK.Constants.ImageDrawMode.Stretched,
	gravity = GTK.Constants.Gravity.Middle,
	draggable = true,
	dimScreen = true,
	children = {
		{
			type = "GLabel",
			name = "title",
			position = {54, 32},
			size = {340, 20},
			font = GTK.Constants.Fonts.Medium
		},
		{
			type = "GLabel",
			name = "message",
			position = {48, 82},
			size = {340, 60},
			font = GTK.Constants.Fonts.Small
		},
		{
			type = "GPushButton",
			name = "cancelButton",
			position = {48, 222},
			size = {128, 24},
			bgColor = {0, 0, 0, 128},
			borders = {2, 2, 2, 2},
			label = {
				padding = {4, 4, 4, 4},
				font = GTK.Constants.Fonts.Small
			}
		},
		{
			type = "GPushButton",
			name = "okButton",
			position = {268, 222},
			size = {128, 24},
			bgColor = {0, 0, 0, 128},
			borders = {2, 2, 2, 2},
			label = {
				padding = {4, 4, 4, 4},
				font = GTK.Constants.Fonts.Small
			}
		}
	}
};

kMessageBoxForms["large"] = {
	name = kMessageBoxFormName,
	type = "GWindow",
	size = {546, 546},
	bgImage = "log2-messagebox-large",
	bgDrawMode = GTK.Constants.ImageDrawMode.Stretched,
	gravity = GTK.Constants.Gravity.Middle,
	draggable = true,
	dimScreen = true,
	children = {
		{
			type = "GLabel",
			name = "title",
			position = {124, 32},
			size = {300, 20},
			font = GTK.Constants.Fonts.Medium
		},
		{
			type = "GLabel",
			name = "message",
			position = {54, 106},
			size = {434, 324},
			font = GTK.Constants.Fonts.Small
		},
		{
			type = "GPushButton",
			name = "cancelButton",
			position = {58, 448},
			size = {128, 24},
			bgColor = {0, 0, 0, 128},
			borders = {2, 2, 2, 2},
			label = {
				padding = {4, 4, 4, 4},
				font = GTK.Constants.Fonts.Small
			}
		},
		{
			type = "GPushButton",
			name = "okButton",
			position = {358, 448},
			size = {128, 24},
			bgColor = {0, 0, 0, 128},
			borders = {2, 2, 2, 2},
			label = {
				padding = {4, 4, 4, 4},
				font = GTK.Constants.Fonts.Small
			}
		}
	}
};


function messageBoxButtonCallback(sender, mouseState)
	local window = sender:rootWidget();
	
	if ( window and window.userdata ) then
		local onDismiss = window.userdata.onDismiss;
		
		if ( onDismiss and type(onDismiss) == "function" ) then
			onDismiss(sender.userdata.index, sender.data.text);
		end
	end
	
	GTK.Core.GUI:destroyWindow(kMessageBoxFormName);
end


function showMessageBox(title, message, onDismiss, buttons, template)
	if ( GTK.Core.GUI:getWindow(kMessageBoxFormName) ) then
		Console.warn("[GTK] MessageBox is already showing. Cannot show another.");
		return
	end

	if buttons == nil then buttons = { "Okay" }; end	
	if template == nil then template = "small"; end
	
	local form = kMessageBoxForms[template];
	
	if ( form == nil ) then
		Console.warn("[GTK] No MessageBox template '" .. template .. "'");
		return
	end
	
	local window = GTK.Core.GUI:createWindow(form);
	
	if ( window == nil ) then
		return
	end
	
	window.userdata.onDismiss = onDismiss;

	local titleLabel = window:findChild("title");
	local messageLabel = window:findChild("message");
	local okButton = window:findChild("okButton");
	local cancelButton = window:findChild("cancelButton");

	if ( titleLabel ~= nil ) then
		titleLabel.data.text = title;
	end

	if ( messageLabel ~= nil ) then
		messageLabel.data.text = message;
	end

	if ( okButton ~= nil ) then		
		okButton.userdata.index = 1;
		okButton.label.data.text = iff((#buttons < 1), "Okay", buttons[1]);
		okButton:setHook("onPressed", messageBoxButtonCallback);
	end	
	
	if ( cancelButton ~= nil ) then
		if (#buttons < 2) then
			cancelButton:setVisible(false);
		else 
			cancelButton.userdata.index = 2;
			cancelButton.label.data.text = buttons[2];
			cancelButton:setHook("onPressed", messageBoxButtonCallback);
		end
	end

end

function dismissMessageBox()
	GTK.Core.GUI:destroyWindow(kMessageBoxFormName);
end

---------------------------------------------------------------
-- Show an Info Message in the middle of the screen
---------------------------------------------------------------

GTK.Core.GUI:addImage({ name="gtk-info-message-box", path="mod_assets/grimtk/textures/info_message_box.tga", origin={0, 0}, size={512, 88} });

infoMessageForm = {
	name = "gtk_info_message",
	type = "GWindow",
	size = {512, 88},
	bgImage = "gtk-info-message-box",
	bgDrawMode = GTK.Constants.ImageDrawMode.Stretched,
	gravity = GTK.Constants.Gravity.Middle,
	draggable = false,
	dimScreen = false,	
	children = {
		{
			type = "GLabel",
			name = "message",
			position = {36, 11},
			size = {440, 66},
			text = "Example",
			textColor = {255, 255, 255, 255},
			font = GTK.Constants.Fonts.Medium
		}	
	}
}

function showInfoMessage(text, duration)
	if ( duration == nil ) then duration = 3.0; end
	local window = GTK.Core.GUI:getWindow(infoMessageForm.name);

	if ( window == nil ) then
		window = GTK.Core.GUI:createWindow(infoMessageForm);
	end

	if ( window == nil ) then
		Console.warn("[GTK] InfoMessage Failed: " .. text);
		return;
	end
	
	local messageLabel = window:findChild("message");

	if ( messageLabel ~= nil ) then
		messageLabel.data.text = text;
	end
	
	window:setOpacity(1.0);
	window:setVisible(true);

	local actionSequence = GTK.Widgets.GSequenceAction.create({
		GTK.Widgets.GWaitAction.create(duration),
		GTK.Widgets.GFadeToAction.create(0.0, 1.0)
	});
	
	window:stopAllActions();
	window:runAction(actionSequence);
	
end

function hideInfoMessage()
	local window = GTK.Core.GUI:getWindow(infoMessageForm.name);
	
	if ( window ) then
		window:setVisible(false);
	end
end



------------------------------------------------------------------------
-- Present the player with up to about 10-15 options and allow them to pick one
------------------------------------------------------------------------

GTK.Core.GUI:addImage({ name="gtk-select-menu", path="assets/textures/gui/gui_items.tga", origin={1484, 0}, size={546, 760} });
GTK.Core.GUI:addImage({ name="gtk-select-menu-option", path="assets/textures/gui/gui_items.tga", origin={1970, 1893}, size={231, 27} });

selectMenuForm = {
	name = "gtk_select_menu",
	type = "GWindow",
	size = {518, 720},
	bgImage = "gtk-select-menu",
	bgDrawMode = GTK.Constants.ImageDrawMode.Stretched,
	gravity = GTK.Constants.Gravity.Middle,
	draggable = false,
	dimScreen = false,	
	children = {
		{
			type = "GLabel",
			name = "title",
			position = {120, 31},
			size = {340, 66},
			textColor = {255, 255, 255, 255},
			font = GTK.Constants.Fonts.Medium
		},
		{
			type = "GLabel",
			name = "message",
			position = {50, 96},
			size = {430, 66},
			textColor = {255, 255, 255, 255},
			font = GTK.Constants.Fonts.Small
		},
		{
			type = "GWidget",
			name = "container",
			position = {140, 160},
			size = {240, 320},
			layout = {
				type = "GFlowLayout",
				direction = GTK.Constants.Direction.Vertical,
				hideOverflow = true,
				spacing = {4, 4},
				margin = {4, 4, 4, 4}
			},
		},
		{
			type = "GLabel",
			name = "detail",
			position = {60, 504},
			size = {400, 66},
			textColor = {255, 255, 255, 255},
			font = GTK.Constants.Fonts.Small,
			text = "";
		},
		{
			type = "GPushButton",
			name = "cancelButton",
			position = {48, 636},
			size = {128, 24},
			bgColor = {0, 0, 0, 128},
			borders = {2, 2, 2, 2},
			label = {
				padding = {4, 4, 4, 4},
				font = GTK.Constants.Fonts.Small
			}
		},
		{
			type = "GPushButton",
			name = "okButton",
			position = {344, 636},
			size = {128, 24},
			bgColor = {0, 0, 0, 128},
			borders = {2, 2, 2, 2},
			label = {
				padding = {4, 4, 4, 4},
				font = GTK.Constants.Fonts.Small
			}
		}
	}
}

selectMenuOptionForm = {
	type = "GPushButton",
	bgImage = "gtk-select-menu-option",
	size = {231, 27},
	isCheckable = true,
	isExclusiveCheck = true,
	label = {
		padding = {14, 6, 6, 6}
	}
}


function selectMenuCheckedCallback(sender)
	local window = sender:rootWidget();

	if ( not window or not window.userdata.options ) then
		Console.warn("[GTK] Could not find option data on select menu callback.");
		return false;
	end

	local detailLabel = window:findChild("detail");	
	local options = window.userdata.options;

	if ( sender.userdata.index and options[sender.userdata.index] ) then
		detailLabel.data.text = options[sender.userdata.index].detail;
	end		
end


function selectMenuButtonCallback(sender, mouseState)
	local window = sender:rootWidget();

	if ( not window or not window.userdata.options ) then
		Console.warn("[GTK] Could not find option data on select menu callback.");
		return false;
	end

	local options = window.userdata.options;
	local selectedButton = nil;
	local buttonIndex = nil;
	local buttonText = nil;
	
	if ( sender.userdata.index == 1 ) then
		local container = window:findChild("container");
	
		for _,widget in ipairs(container._children) do
			if ( widget.data.isChecked ) then
				selectedButton = widget;
			end
		end
	end
	
	if ( selectedButton ) then
		buttonIndex = selectedButton.userdata.index;
		buttonText = options[selectedButton.userdata.index].title;
	end

	local onDismiss = window.userdata.onDismiss;
	
	if ( onDismiss and type(onDismiss) == "function" ) then
		onDismiss(buttonIndex, buttonText);
	end
	
	GTK.Core.GUI:destroyWindow(selectMenuForm.name);
end


function showSelectMenu(title, message, options, onDismiss, buttons)
	if ( GTK.Core.GUI:getWindow(selectMenuForm.name) ) then
		Console.warn("[GTK] Only one selectMenu can exist at one time.");
		return
	end

	if buttons == nil then buttons = { "Okay" }; end	
	
	local window = GTK.Core.GUI:createWindow(selectMenuForm);
	window.userdata.options = options;
	window.userdata.onDismiss = onDismiss;

	if ( window == nil ) then
		Console.warn("[GTK] SelectMenu Creation Failed: " .. title);
		return;
	end
	
	local titleLabel = window:findChild("title");
	local messageLabel = window:findChild("message");
	local container = window:findChild("container");
	local detailLabel = window:findChild("detail");
	local okButton = window:findChild("okButton");
	local cancelButton = window:findChild("cancelButton");
	
	if ( titleLabel ~= nil ) then
		titleLabel.data.text = title;
	end
	
	if ( messageLabel ~= nil ) then
		messageLabel.data.text = message;
	end
	
	if ( okButton ~= nil ) then		
		okButton.userdata.index = 1;
		okButton.label.data.text = iff((#buttons < 1), "Okay", buttons[1]);
		okButton:setHook("onPressed", selectMenuButtonCallback);
	end	
	
	if ( cancelButton ~= nil ) then
		if (#buttons < 2) then
			cancelButton:setVisible(false);
		else 
			cancelButton.userdata.index = 2;
			cancelButton.label.data.text = buttons[2];
			cancelButton:setHook("onPressed", selectMenuButtonCallback);
		end
	end
	
	if ( container and options ) then	
		for i,opt in ipairs(options) do
			local widget = GTK.Widgets.GWidget.createGeneric(selectMenuOptionForm);
			widget.userdata.index = i;
			widget.label.data.text = opt.title;
			widget:setHook("onChecked", selectMenuCheckedCallback);
			container:addChild(widget);
		end
	end
end

function dismissSelectMenu()
	GTK.Core.GUI:destroyWindow(selectMenuForm.name);
end

