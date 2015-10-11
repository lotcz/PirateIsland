-- utility spells

defineSpell{
	name = "nospell_shield",
	uiName = "No Spell",
	gesture = 456,
	manaCost = 35,
	skill = "concentration",
	requirements = { "concentration", 1 },
	icon = 102,
	spellIcon = 19,
	description = "There is no magic on Pirate Island. Come on. Do you believe in magic or what?",
	onCast = function(champion, x, y, direction, elevation, skillLevel)
		helper.script.noSpell(champion:getName())
	end
}

defineSpell{
	name = "nospell_light",
	uiName = "No Spell",
	gesture = 25,
	manaCost = 35,
	skill = "concentration",
	requirements = { "concentration", 2 },
	icon = 58,
	spellIcon = 18,
	description = "There is no magic on Pirate Island. Come on. Do you believe in magic or what?",
	onCast = function(champion, x, y, direction, elevation, skillLevel)
		helper.script.noSpell(champion:getName())
	end
}

defineSpell{
	name = "nospell_darkness",
	uiName = "No Spell",
	gesture = 85,
	manaCost = 25,
	skill = "concentration",
	requirements = { "concentration", 2 },
	icon = 59,
	spellIcon = 11,
	description = "There is no magic on Pirate Island. Come on. Do you believe in magic or what?",
	onCast = function(champion, x, y, direction, elevation, skillLevel)
		helper.script.noSpell(champion:getName())
	end
}

defineSpell{
	name = "nospell_darkbolt",
	uiName = "No Spell",
	gesture = 854,
	manaCost = 25,	
	skill = "concentration",
	requirements = { "concentration", 3 },
	icon = 100,
	spellIcon = 20,
	description = "There is no magic on Pirate Island. Come on. Do you believe in magic or what?",
	onCast = function(champion, x, y, direction, elevation, skillLevel)
		helper.script.noSpell(champion:getName())
	end
}

defineSpell{
	name = "nospell_force_field",
	uiName = "No Spell",
	gesture = 123698741,
	manaCost = 35,
	skill = "concentration",
	requirements = { "concentration", 2 },
	icon = 101,
	spellIcon = 5,
	description = "There is no magic on Pirate Island. Come on. Do you believe in magic or what?",
	onCast = function(champion, x, y, direction, elevation, skillLevel)
		helper.script.noSpell(champion:getName())
	end
}

-- fire magic

defineSpell{ 
	name = "nospell_fireburst",
	uiName = "No Spell",
	gesture = 1,
	manaCost = 25,
	skill = "fire_magic",
	requirements = { "fire_magic", 1 },
	icon = 60,
	spellIcon = 1,
	description = "There is no magic on Pirate Island. Come on. Do you believe in magic or what?",
	onCast = function(champion, x, y, direction, elevation, skillLevel)
		helper.script.noSpell(champion:getName())
	end
}

defineSpell{
	name = "nospell_fireball",
	uiName = "No Spell",
	gesture = 1236,
	manaCost = 43,
	skill = "fire_magic",
	requirements = { "fire_magic", 3, "air_magic", 1 },
	icon = 61,
	spellIcon = 7,
	description = "There is no magic on Pirate Island. Come on. Do you believe in magic or what?",
	onCast = function(champion, x, y, direction, elevation, skillLevel)
		helper.script.noSpell(champion:getName())
	end
}

defineSpell{
	name = "nospell_meteor_storm",
	uiName = "No Spell",
	gesture = 14563,
	manaCost = 80,
	skill = "fire_magic",
	requirements = { "fire_magic", 5, "air_magic", 3 },
	icon = 99,
	spellIcon = 8,
	description = "There is no magic on Pirate Island. Come on. Do you believe in magic or what?",
	onCast = function(champion, x, y, direction, elevation, skillLevel)
		helper.script.noSpell(champion:getName())
	end
}

defineSpell{
	name = "nospell_fire_shield",
	uiName = "No Spell",
	gesture = 52145,
	manaCost = 50,
	skill = "fire_magic",
	requirements = { "fire_magic", 3, "concentration", 3 },
	icon = 66,
	spellIcon = 12,
	description = "There is no magic on Pirate Island. Come on. Do you believe in magic or what?",
	onCast = function(champion, x, y, direction, elevation, skillLevel)
		helper.script.noSpell(champion:getName())
	end
}

-- ice magic

defineSpell{
	name = "nospell_ice_shards",
	uiName = "No Spell",
	gesture = 789,
	manaCost = 30,
	skill = "water_magic",
	requirements = { "water_magic", 1, "earth_magic", 1 },
	icon = 70,
	spellIcon = 3,
	description = "There is no magic on Pirate Island. Come on. Do you believe in magic or what?",
	onCast = function(champion, x, y, direction, elevation, skillLevel)
		helper.script.noSpell(champion:getName())
	end
}

defineSpell{
	name = "nospell_dispel",
	uiName = "No Spell",
	gesture = 123654789,
	manaCost = 42,
	skill = "water_magic",
	requirements = { "water_magic", 1, "concentration", 1 },
	icon = 72,
	spellIcon = 13,
	description = "There is no magic on Pirate Island. Come on. Do you believe in magic or what?",
	onCast = function(champion, x, y, direction, elevation, skillLevel)
		helper.script.noSpell(champion:getName())
	end
}

defineSpell{
	name = "nospell_frostbolt",
	uiName = "No Spell",
	gesture = 369,
	manaCost = 37,
	skill = "water_magic",
	requirements = { "water_magic", 3, "air_magic", 1 },
	icon = 71,
	spellIcon = 4,
	description = "There is no magic on Pirate Island. Come on. Do you believe in magic or what?",
	onCast = function(champion, x, y, direction, elevation, skillLevel)
		helper.script.noSpell(champion:getName())
	end
}

defineSpell{
	name = "nospell_frost_shield",
	uiName = "No Spell",
	gesture = 58965,
	manaCost = 50,
	skill = "water_magic",
	requirements = { "water_magic", 3, "concentration", 3 },
	icon = 68,
	spellIcon = 14,
	description = "There is no magic on Pirate Island. Come on. Do you believe in magic or what?",
	onCast = function(champion, x, y, direction, elevation, skillLevel)
		helper.script.noSpell(champion:getName())
	end
}

-- air magic		

defineSpell{
	name = "nospell_shock",
	uiName = "No Spell",
	gesture = 3,
	manaCost = 25,
	skill = "air_magic",
	requirements = { "air_magic", 1 },
	icon = 64,
	spellIcon = 6,
	description = "There is no magic on Pirate Island. Come on. Do you believe in magic or what?",
	onCast = function(champion, x, y, direction, elevation, skillLevel)
		helper.script.noSpell(champion:getName())
	end
}

defineSpell{
	name = "nospell_invisibility",
	uiName = "No Spell",
	gesture = 3658,
	manaCost = 45,
	skill = "air_magic",
	requirements = { "air_magic", 3, "concentration", 2 },
	icon = 74,
	spellIcon = 15,
	description = "There is no magic on Pirate Island. Come on. Do you believe in magic or what?",
	onCast = function(champion, x, y, direction, elevation, skillLevel)
		helper.script.noSpell(champion:getName())
	end
}

defineSpell{
	name = "nospell_lightning_bolt",
	uiName = "No Spell",
	gesture = 4523,
	manaCost = 50,
	skill = "air_magic",
	requirements = { "air_magic", 4 },	
	icon = 65,
	spellIcon = 9,
	description = "There is no magic on Pirate Island. Come on. Do you believe in magic or what?",
	onCast = function(champion, x, y, direction, elevation, skillLevel)
		helper.script.noSpell(champion:getName())
	end
}

defineSpell{
	name = "nospell_shock_shield",
	uiName = "No Spell",
	gesture = 52365,
	manaCost = 50,
	skill = "air_magic",
	requirements = { "air_magic", 3, "concentration", 3 },
	icon = 69,
	spellIcon = 16,
	description = "There is no magic on Pirate Island. Come on. Do you believe in magic or what?",
	onCast = function(champion, x, y, direction, elevation, skillLevel)
		helper.script.noSpell(champion:getName())
	end
}

-- earth magic

defineSpell{
	name = "nospell_poison_cloud",
	uiName = "No Spell",
	gesture = 7,
	manaCost = 27,
	skill = "earth_magic",
	requirements = { "earth_magic", 1 },	
	icon = 62,
	spellIcon = 2,
	description = "There is no magic on Pirate Island. Come on. Do you believe in magic or what?",
	onCast = function(champion, x, y, direction, elevation, skillLevel)
		helper.script.noSpell(champion:getName())
	end
}

defineSpell{
	name = "nospell_poison_bolt",
	uiName = "No Spell",
	gesture = 78963,
	manaCost = 32,
	skill = "earth_magic",
	requirements = { "earth_magic", 2 },	
	icon = 63,
	spellIcon = 10,
	description = "There is no magic on Pirate Island. Come on. Do you believe in magic or what?",
	onCast = function(champion, x, y, direction, elevation, skillLevel)
		helper.script.noSpell(champion:getName())
	end
}

defineSpell{
	name = "nospell_poison_shield",
	uiName = "No Spell",
	gesture = 58745,
	manaCost = 50,
	skill = "earth_magic",
	requirements = { "earth_magic", 3, "concentration", 3 },
	icon = 67,
	spellIcon = 17,
	description = "There is no magic on Pirate Island. Come on. Do you believe in magic or what?",
	onCast = function(champion, x, y, direction, elevation, skillLevel)
		helper.script.noSpell(champion:getName())
	end
}