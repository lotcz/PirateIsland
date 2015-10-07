function pullChain( settings )
	local shop_desk = findEntity(settings.name .. "_desk")
	local shop_stock = findEntity(settings.name .. "_stock")
	
	if not settings.trading then
		if helper.script.surfaceContains(shop_desk.surface, settings.currency) and shop_desk.surface:count() == 1 then
			if shop_stock.surface:count() == 0 then
				hudPrint(settings.out_of_stock_message)
			else			
				settings.switching = true
				settings.trading = true
				local item = helper.script.getFirstFromSurface(shop_stock.surface)
				if item then
					helper.script.addToSurface(shop_desk.surface, item)
				end
				settings.switching = false
			end
		else
			helper.script.talk(settings.dealer_name, settings.wrong_items_message)
		end
	else
		settings.switching = true 
		for _,i in shop_desk.surface:contents() do
			if i.go.name ~= settings.currency then   					
				helper.script.addToSurface(shop_stock.surface, i)				
			end
	   	end
		local item = helper.script.getFirstFromSurface(shop_stock.surface)
		if item then			
			helper.script.addToSurface(shop_desk.surface, item)
		end
		settings.switching = false
	end
	
end

function takeItem(settings, alcove, item)
	local shop_desk = findEntity(settings.name .. "_desk")
	local shop_stock = findEntity(settings.name .. "_stock")
	
	if settings.trading and not settings.switching then
		settings.trading = false
		settings.switching = true
		local i = helper.script.getFirstFromSurface(shop_desk.surface)
		if i.go.name == settings.currency then
			i.go:destroy()
			helper.script.talk(settings.dealer_name, settings.deal_message)
		else
			helper.script.addToSurface(shop_stock.surface, i)
			helper.script.talk(settings.dealer_name, settings.no_deal_message)
		end
		settings.switching = false
	end
end

function putItem(settings, alcove, item)
	local shop_desk = findEntity(settings.name .. "_desk")
	local shop_stock = findEntity(settings.name .. "_stock")
	
	if settings.trading and not settings.switching then
		settings.trading = false
		settings.switching = true		
		
		for _,i in shop_desk.surface:contents() do
			if i.go.id ~= item.go.id and i.go.name ~= settings.currency  then   
				helper.script.addToSurface(shop_stock.surface,i)
			end
	   	end
				
		settings.switching = false
		helper.script.talk(settings.dealer_name, settings.no_messing_message)
	end
end