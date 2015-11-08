defineObject{
	baseObject = "base_item",
	name = "pirate_hat",
	components = {
		{
			model = "assets/models/items/xafi_clothes_small.fbx",
			name = "model",
			class = "Model"
		},
		{
			weight = 0.2,
			traits = {
				"helmet",
				"clothes"
			},
			uiName = "Pirate Headwrap",
            gfxAtlas = "mod_assets/textures/items_2.tga",
			gfxIndex = 50,
			class = "Item",
			name = "item",
			description = "The fabric of the shemagh keeps the all pervasive desert dust out of the mouth and nostrils of Xafi caravan masters.",
			armorSet = "pirate",
		},
		{
			class = "EquipmentItem",
			protection = 2,
			name = "equipmentitem"
		}
	}
}

defineObject{
	baseObject = "base_item",
	name = "pirate_pants",
	components = {
		{
			model = "assets/models/items/lurker_clothes.fbx",
			name = "model",
			class = "Model"
		},
		{
			armorSet = "pirate",
			weight = 0.5,
			traits = {
				"leg_armor",
				"clothes"
			},
			uiName = "Pirate Pants",
			gfxIndex = 39,
			class = "Item",
			name = "item",
			description = "A pair of pirate pants in latest pirate fashion."
		},
		{
			class = "EquipmentItem",
			name = "equipmentitem",
			protection = 5
		}
	}
}

defineObject{
	name = "pirate_vest",
	baseObject = "base_item",
	components = {
		{
			class = "Model",
			model = "assets/models/items/rogue_clothes.fbx",
		},
		{
			class = "Item",
			uiName = "Pirate Vest",
			description = "A vest made from a material that seems to be stolen from a dead body.",
			armorSet = "pirate",
			armorSetPieces = 5,
			gfxIndex = 358,
			weight = 0.75,
			traits = { "chest_armor", "clothes" },
		},
		{
			class = "EquipmentItem",
			protection = 7,
		},
	},
}

defineObject{
	name = "rogue_boots",
	baseObject = "base_item",
	components = {
		{
			class = "Model",
			model = "assets/models/items/rogue_boots.fbx",
		},
		{
			class = "Item",
			uiName = "Pirate Boots",
			description = "Cool pirate boots.",
			armorSet = "pirate",
			gfxIndex = 361,
			weight = 0.25,
			traits = { "boots" },
		},
		{
			class = "EquipmentItem",
			protection = 5,
		},
	},
}

defineObject{
	baseObject = "base_item",
	name = "monk_cape",
	components = {
		{
			model = "assets/models/items/scaled_cloak.fbx",
			name = "model",
			class = "Model"
		},
		{
			weight = 1,
			uiName = "Monk Cape",
            description = "Plain monk cape. Perfect for beggars.",
            gfxAtlas = "mod_assets/textures/items_2.tga",
			gfxIndex = 37,
			class = "Item",
			name = "item",
			traits = {
				"cloak",
				"clothes"
			}
		},
		{
			class = "EquipmentItem",			
			name = "equipmentitem",
            willpower = 5,
		}
	}
}

defineObject{
	baseObject = "base_item",
	name = "tattered_cloak",
	components = {
		{
			model = "assets/models/items/peasant_clothes.fbx",
			name = "model",
			class = "Model"
		},
		{
			weight = 0.4,
			uiName = "Tattered Cloak",
			gfxIndex = 66,
			class = "Item",
			name = "item",
			traits = {
				"cloak",
				"clothes"
			}
		},
		{
			class = "EquipmentItem",
			name = "equipmentitem",
			evasion = 2
		}
	}
}

defineObject{
	baseObject = "base_item",
	name = "doublet",
	components = {
		{
			model = "assets/models/items/purple_clothes.fbx",
			name = "model",
			class = "Model"
		},
		{
			weight = 1,
			uiName = "Doublet",
			gfxIndex = 36,
			class = "Item",
			name = "item",
			traits = {
				"chest_armor",
				"clothes"
			}
		},
		{
			class = "EquipmentItem",
			protection = 2,
			name = "equipmentitem"
		}
	}
}

defineObject{
	baseObject = "base_item",
	name = "tattered_shirt",
	components = {
		{
			model = "assets/models/items/torn_breeches.fbx",
			name = "model",
			class = "Model"
		},
		{
			weight = 0.3,
			uiName = "Tattered Shirt",
			gfxIndex = 270,
			class = "Item",
			name = "item",
			traits = {
				"chest_armor",
				"clothes"
			}
		},
		{
			class = "EquipmentItem",
			protection = 1,
			name = "equipmentitem"
		}
	}
}

defineObject{
	baseObject = "base_item",
	name = "peasant_breeches",
	components = {
		{
			model = "assets/models/items/peasant_clothes.fbx",
			name = "model",
			class = "Model"
		},
		{
			weight = 0.5,
			uiName = "Peasant's Breeches",
			gfxIndex = 6,
			class = "Item",
			name = "item",
			traits = {
				"leg_armor",
				"clothes"
			}
		},
		{
			class = "EquipmentItem",
			protection = 2,
			name = "equipmentitem"
		}
	}
}

defineObject{
	baseObject = "base_item",
	name = "peasant_tunic",
	components = {
		{
			model = "assets/models/items/peasant_clothes.fbx",
			name = "model",
			class = "Model"
		},
		{
			weight = 0.5,
			uiName = "Peasant's Tunic",
			gfxIndex = 7,
			class = "Item",
			name = "item",
			traits = {
				"chest_armor",
				"clothes"
			}
		},
		{
			class = "EquipmentItem",
			protection = 2,
			name = "equipmentitem"
		}
	}
}

defineObject{
	baseObject = "base_item",
	name = "peasant_cap",
	components = {
		{
			model = "assets/models/items/peasant_clothes_small.fbx",
			name = "model",
			class = "Model"
		},
		{
			weight = 0.2,
			uiName = "Peasant's Cap",
			gfxIndex = 8,
			class = "Item",
			name = "item",
			traits = {
				"helmet",
				"clothes"
			}
		},
		{
			class = "EquipmentItem",
			protection = 1,
			name = "equipmentitem"
		}
	}
}

defineObject{
	baseObject = "base_item",
	name = "loincloth",
	components = {
		{
			model = "assets/models/items/blue_clothes.fbx",
			name = "model",
			class = "Model"
		},
		{
			weight = 0.4,
			traits = {
				"leg_armor",
				"clothes"
			},
			uiName = "Loincloth",
			gfxIndex = 32,
			class = "Item",
			name = "item",
			description = "Only the most self confident of warriors can be seen on the battlefield wearing nothing but this garment."
		},
		{
			willpower = -1,
			class = "EquipmentItem",
			protection = 1,
			name = "equipmentitem"
		}
	}
}

defineObject{
	baseObject = "base_item",
	name = "leather_pants",
	components = {
		{
			model = "assets/models/items/leather_clothes.fbx",
			name = "model",
			class = "Model"
		},
		{
			weight = 2,
			uiName = "Leather Pants",
			gfxIndex = 54,
			class = "Item",
			name = "item",
			traits = {
				"leg_armor",
				"clothes"
			}
		},
		{
			class = "EquipmentItem",
			protection = 3,
			name = "equipmentitem"
		}
	}
}

defineObject{
	baseObject = "base_item",
	name = "torn_breeches",
	components = {
		{
			model = "assets/models/items/torn_breeches.fbx",
			name = "model",
			class = "Model"
		},
		{
			weight = 0.3,
			uiName = "Torn Breeches",
			gfxIndex = 271,
			class = "Item",
			name = "item",
			traits = {
				"leg_armor",
				"clothes"
			}
		},
		{
			class = "EquipmentItem",
			protection = 1,
			name = "equipmentitem"
		}
	}
}
defineObject{
	baseObject = "base_item",
	name = "hermit_necklace",
	components = {
		{
			model = "assets/models/items/string_and_ring.fbx",
			name = "model",
			class = "Model"
		},
		{
			weight = 2,
			traits = {
				"necklace"
			},
			uiName = "Hermit's Necklace",
			gfxIndex = 300,
			class = "Item",
			name = "item",
			gameEffect = "Wearer gains immunity to poison, disease, paralysis, slow, blindness and petrify conditions.",			
			description = "What use is a protection necklace to hermit? Meditating all day and talking to himself, he can hardly find any use for a protective necklace. I doubt it even has any effect. These are all just superstitions anyway."
		},
		{
			particleSystem = "glitter_gold",
			name = "particle",
			class = "Particle"
		},
		{
			class = "EquipmentItem",
			name = "equipmentitem",
			immunities = {
				"poison",
				"diseased",
				"paralyzed",
				"slow",
				"blind",
				"petrified"
			}
		}
	}
}

defineObject{
	baseObject = "base_item",
	name = "sleeping_robe",
	components = {
		{
			model = "assets/models/items/archmage_mantle.fbx",
			name = "model",
			class = "Model"
		},
		{
			weight = 1,
			uiName = "Sleeping Robe",
            description = "Dreams are especially refreshing when sleeping in this comfortable robe made from the most delicate materials. It smells of perfume.",
            gfxAtlas = "mod_assets/textures/items_2.tga",
			gfxIndex = 49,
			class = "Item",
			name = "item",
			traits = {
				"chest_armor",
				"clothes"
			}
		},
		{
			class = "EquipmentItem",			
			name = "equipmentitem",
            healthRegenerationRate = 50,
            energyRegenerationRate = 25
		}
	}
}