-- This file has been generated by Dungeon Editor 2.1.18

-- TODO: place your custom dungeon object definitions here

defineObject{
   name = "coin_gold",
   baseObject = "iron_key",
   components = {
		{
			class = "Model",
			model = "mod_assets/models/coin_gold.fbx",
		},
		{
			class ="Item",
			uiName = "Ducat",
			gfxAtlas = "mod_assets/textures/coins.tga",
			gfxIndex = 1,
			weight = 0.1,
			multiple = 1,
			traits = { "coin" },
			description = "A shiny gold ducat. People sometimes kill other people for these."
		},
   }
}

defineObject{
   name = "coin_silver",
   baseObject = "iron_key",
   components = {
		{
			class = "Model",
			model = "mod_assets/models/coin_silver.fbx",
		},
		{
			class ="Item",
			uiName = "Peso",
			gfxAtlas = "mod_assets/textures/coins.tga",
			gfxIndex = 2,
			multiple = 1,
			weight = 0.1,
			traits = { "coin" },
			description = "A silver peso. For thirty or less of them people will sell their own brother to you."
		},
   }
}

defineObject{
   name = "coin_copper",
   baseObject = "iron_key",
   components = {
		{
			class = "Model",
			model = "mod_assets/models/coin_copper.fbx",
		},
		{
			class ="Item",
			uiName = "Roach",
			gfxAtlas = "mod_assets/textures/coins.tga",
			gfxIndex = 0,
			weight = 0.1,
			multiple = 1,
			traits = { "coin" },
			description = "A dull copper roach. Roaches are common currency between pirates and other lowlifes."
		},
   }
}

defineObject{
	baseObject = "base_item",
	name = "signal_rod",
	components = {
		{
			model = "assets/models/items/acolyte_staff.fbx",
			name = "model",
			class = "Model"
		},
		{
			weight = 2.5,
			secondaryAction = "mblob",
			uiName = "Signal Rod",
			class = "Item",
			impactSound = "impact_blunt",
			gfxIndex = 340,
			name = "item",
			description = "Sailors use this rod to send various signals."
		},		
		{
			power = 0,
			uiName = "Signal",
			cooldown = 2,
			class = "CastSpell",			
			name = "mblob",
			spell = "signal"
		}
	}
}

defineObject{
	baseObject = "base_item",
	name = "signal_rod_secret",
	components = {
		{
			model = "assets/models/items/staff_of_fear.fbx",
			name = "model",
			class = "Model"
		},
		{
			weight = 2.5,
			secondaryAction = "signalsecret",
			uiName = "Secret Signal Rod",
			class = "Item",
			impactSound = "impact_blunt",
			gfxIndex = 225,
			gfxIndexPowerAttack = 443,
			name = "item",
			description = "Sends secret signal to a fellow pirate. Only pirates know and understand this signal."
		},		
		{
			power = 0,
			uiName = "Secret Signal",
			cooldown = 2,
			class = "CastSpell",			
			name = "signalsecret",
			spell = "signal_secret"
		}
	}
}

defineObject{
	baseObject = "base_item",
	name = "crystal_ball",
	components = {
		{
			model = "assets/models/items/apprentice_orb.fbx",
			name = "model",
			class = "Model"
		},
		{
			weight = 2,
			secondaryAction = "future",
			uiName = "Crystal Ball",
			class = "Item",
			impactSound = "impact_blunt",
			gfxIndex = 69,
			gfxIndexPowerAttack = 452,
			name = "item",
			description = "Most probably some gipsy lady used this to see future."
		},		
		{
			energy = 5,
			class = "EquipmentItem",
			slot = "Weapon",
			name = "equipmentitem"
		},
		{
			requirements = {
				"concentration",
				2
			},
			power = 3,
			uiName = "See future",
			class = "CastSpell",
			spell = "future",
			name = "future",
			energyCost = 5
		}
	}
}

defineObject{
	baseObject = "base_item",
	name = "remains_bones",
	components = {
		{
			model = "assets/models/items/remains_of_toorum.fbx",
			name = "model",
			class = "Model"
		},
		{
			weight = 5,
			uiName = "Dead Pirate",
			gfxIndex = 212,
			class = "Item",
			name = "item",
			description = "Unknown dead pirate."
		},
		{
			enabled = false,
			particleSystem = "glitter_toorum",
			name = "particle",
			class = "Particle"
		}
	}
}

defineObject{
	baseObject = "base_item",
	name = "remains_of_galena",
	components = {
		{
			model = "assets/models/items/remains_of_toorum.fbx",
			name = "model",
			class = "Model"
		},
		{
			weight = 5,
			uiName = "Remains of Galena",
			gfxIndex = 212,
			class = "Item",
			name = "item",
			description = "Galena was a beautiful gipsy woman. She was also a witch, an alchemist and an excellent fortune teller. One has to wonder if she had foreseen ending as a crab lunch."
		},
		{
			particleSystem = "glitter_toorum",
			name = "particle",
			class = "Particle"
		}
	}
}

defineObject{
	baseObject = "base_item",
	name = "advice",
	components = {
		{
			model = "assets/models/items/note.fbx",
			name = "model",
			class = "Model"
		},
		{
			weight = 0.1,
			uiName = "Hermit's Advice",
			gfxIndex = 114,
			class = "Item",
			name = "item"
		},
		{
			name = "scrollitem",
			class = "ScrollItem",
			textAlignment = "left"
		}
	}
}

defineObject{
	baseObject = "base_item",
	name = "captain_instructions",
	components = {
		{
			model = "assets/models/items/note.fbx",
			name = "model",
			class = "Model"
		},
		{
			weight = 0.1,
			uiName = "Captain's Instructions",
			gfxIndex = 114,
			class = "Item",
			name = "item"		
		},
		{
			name = "scrollitem",
			class = "ScrollItem",
			textAlignment = "left"
		}
	}
}

defineObject{
	baseObject = "base_item",
	name = "gunpowder",
	components = {
		{
			model = "assets/models/items/blackmoss.fbx",
			name = "model",
			class = "Model"
		},
		{			
			weight = 0.05,
			stackable = false,
			uiName = "Gunpowder",
			gfxIndex = 79,
			class = "Item",
			name = "item",
			description = "This makes cannon shoot and is a base for all bombs. Some people believe there is magic in it, some people say it's simply nature. No matter which is true, only the most reckless killers dare to use it."
		}
	}
}

defineObject{
	baseObject = "base_item",
	name = "navy_cannon_ball",
	components = {
		{
			model = "assets/models/items/cannon_ball.fbx",
			name = "model",
			class = "Model"
		},
		{
			weight = 1,
			stackable = false,
			uiName = "Navy Cannon Ball",
			projectileRotationSpeed = 10,
			projectileRotationZ = -30,
			impactSound = "impact_blunt",
			gfxIndex = 339,
			name = "item",
			class = "Item"
		}
	}
}

defineObject{
	name = "snake_flute",
	baseObject = "base_item",
	components = {
		{
			class = "Model",
			model = "assets/models/items/flute.fbx",
		},
		{
			class = "Item",
			uiName = "Snake Flute",
			gfxIndex = 316,
			impactSound = "impact_blunt",
			weight = 0.3,
		},
	},
}

defineObject{
	baseObject = "base_item",
	tags = {
		"item",
	},
	name = "spying_glass",
	components = {
		{
			model = "assets/models/items/scope.fbx",
			name = "model",
			class = "Model"
		},
		{
			weight = 1.5,
			uiName = "Pirate Spyglass",
			projectileRotationSpeed = 10,
			projectileRotationZ = -30,
			impactSound = "impact_blunt",
            gfxAtlas = "mod_assets/textures/items_2.tga",
			gfxIndex = 51,
			name = "item",
			class = "Item"
		}
	}
}

defineObject{
	baseObject = "wooden_box",
	name = "onigin_box",
	components = {
		{
			weight = 1,
			primaryAction = "talk",
			uiName = "Onigin the Chest",
            description = "Onigin is your new friend. You can store your equipment in him or debate your latest adventures on Pirate Island. (Hold him in hand and activate attack to talk) Despite his terrible fate, he still has good sense humour and is a funny companion.",
            gfxAtlas = "mod_assets/textures/items_2.tga",
			gfxIndex = 38,
			class = "Item",
			name = "item"
		},
		{
			class = "ItemAction",
			name = "talk",
			uiName = "Talk to Onigin",
			cooldown = 4,
			onAttack = function(self)
				onigin_talk.script.talkToOnigin()
			end,
		},
	}
}

defineObject{
	baseObject = "base_item",
	name = "flame_liquid",
	components = {
		{
			model = "assets/models/items/flask.fbx",
			name = "model",
			class = "Model"
		},
		{
			weight = 0.3,
			uiName = "Flame Liquid",
			description = "Smells little bit like Rum. Maybe there is no magic in it after all.",
			gfxAtlas = "mod_assets/textures/items_2.tga",
			gfxIndex = 35,
			stackable = true,
			class = "Item",
			name = "item"
		}
	}
}

defineObject{
	baseObject = "branch",
	name = "branch",
	components = {
		{
			impactSound = "impact_blunt",
			secondaryAction = "torch",
			weight = 1.2,
			uiName = "Branch",
			gfxIndex = 273,
			class = "Item",
			name = "item",
			traits = {
				"light_weapon",
				"mace"
			}
		},
		{
			requirements = {
				"fire_magic",
				1
			},
			uiName = "Make Torch",
			class = "ItemAction",
			name = "torch",
			energyCost = 15,
			onAttack = function(self, champion, slot1, chainindex)
				local slot2
				if slot1 == 1 then
					slot2 = 2
				else
					slot2 = 1
				end
				local item = champion:getItem(slot2)
				if item ~= nil and item.go.name == "torn_cloth" then
					champion:removeItemFromSlot(slot1)
					if item:getStackSize() > 1 then
						item:setStackSize(item:getStackSize()-1)
					else
						champion:removeItemFromSlot(slot2)
					end
					item = helper.script._spawn("torch")
					champion:insertItem(slot1, item.item)
					champion:gainExp(100)
					helper.script.talk(champion:getName(), "Here we go. One fine torch.")
				else
					helper.script.talk(champion:getName(), "I need to hold some torn cloth.")
				end
					
			end
		}
	}
}

defineObject{
	baseObject = "tattered_cloak",
	name = "torn_cloth",
	components = {
		{
			impactSound = "impact_blunt",
			weight = 0.3,
			uiName = "Torn Cloth",
			gfxAtlas = "mod_assets/textures/items_2.tga",
			gfxIndex = 71,
			stackable = true,
			class = "Item",
			name = "item",			
		},		
		{
			class = "EquipmentItem",
			name = "equipmentitem",
			enabled = false
		}
	}
}

defineObject{
	baseObject = "base_item",
	name = "bunker_key",
	components = {
		{
			model = "assets/models/items/key_mine_storage.fbx",
			name = "model",
			class = "Model"
		},
		{
			weight = 0.2,
			uiName = "Bunker Key",
			gfxIndex = 237,
			class = "Item",
			name = "item",
			traits = {
				"key"
			}
		},
		{
			particleSystem = "glitter_gold",
			name = "particle",
			class = "Particle"
		}
	}
}