defineObject{
	baseObject = "base_item",
	name = "food_water_flask",
	tags = {
		"food"
	},
	components = {
		{
			model = "assets/models/items/flask.fbx",
			name = "model",
			class = "Model"
		},
		{
			weight = 0.3,
			uiName = "Water Flask",
			description = "Drinking water is an essential ingredient of life. It is especially valuable for sailors on the sea.",
			gfxIndex = 144,
			class = "Item",
			name = "item",
			traits = {
				"potion"
			}
		},
		{
			class = "UsableItem",
			sound = "consume_potion",
			nutritionValue = 200,
			-- emptyItem = "user_food_water_empty",
			onUseItem = function(self,champion)
				local mult = iff(champion:hasTrait("fast_metabolism"), 2, 1)
				champion:regainHealth(25*mult)
				champion:removeCondition("head_wound")
				champion:removeCondition("chest_wound")
				champion:removeCondition("leg_wound")
				champion:removeCondition("feet_wound")
				champion:removeCondition("right_hand_wound")
				champion:removeCondition("left_hand_wound")
				champion:playHealingIndicator()
			end
    },
	}
}

defineObject{
	baseObject = "base_item",
	tags = {
		"food"
	},
	name = "food_fruit",
	components = {
		{
			model = "assets/models/items/horned_fruit.fbx",
			name = "model",
			class = "Model"
		},
		{
			weight = 0.7,
			uiName = "Sweet Fruit",
			projectileRotationSpeed = 10,
			traits = {
				"consumable"
			},
			class = "Item",
			gfxIndex = 280,
			projectileRotationZ = -30,
			name = "item",
			description = "This fruit has a very strong stinging taste and is commonly found in the southern islands."
		},
		{
			class = "UsableItem",
			nutritionValue = 300,
			name = "usableitem",
			onUseItem = function(self,champion)
				local mult = iff(champion:hasTrait("fast_metabolism"), 2, 1)
				champion:regainHealth(40*mult)
				champion:removeCondition("head_wound")
				champion:removeCondition("chest_wound")
				champion:removeCondition("leg_wound")
				champion:removeCondition("feet_wound")
				champion:removeCondition("right_hand_wound")
				champion:removeCondition("left_hand_wound")
				champion:playHealingIndicator()
			end
		}
	}
}

defineObject{
	baseObject = "base_item",
	tags = {
		"food"
	},
	name = "food_mushroom",
	components = {
		{
			model = "assets/models/items/grimcap.fbx",
			name = "model",
			class = "Model"
		},
		{
			weight = 0.1,
			traits = {
				"consumable"
			},
			uiName = "Magic Mushroom",
			gfxIndex = 105,
			class = "Item",
			name = "item",
			description = "A delicious mushroom, just waiting to be eaten fresh or dried."
		},
		{
			class = "UsableItem",
			nutritionValue = 250,
			name = "usableitem",
			onUseItem = function(self,champion)
				local mult = iff(champion:hasTrait("fast_metabolism"), 2, 1)
				champion:regainHealth(20*mult)
				champion:regainEnergy(50)
				champion:removeCondition("head_wound")
				champion:removeCondition("chest_wound")
				champion:removeCondition("leg_wound")
				champion:removeCondition("feet_wound")
				champion:removeCondition("right_hand_wound")
				champion:removeCondition("left_hand_wound")
				champion:playHealingIndicator()
			end
		}
	}
}

defineObject{
	baseObject = "base_item",
	tags = {
		"food"
	},
	name = "silver_roach",
	components = {
		{
			model = "assets/models/items/small_fish.fbx",
			name = "model",
			class = "Model"
		},
		{
			weight = 1,
			uiName = "Small Fish",
			gfxIndex = 355,
			class = "Item",
			name = "item",
			traits = {
				"consumable"
			}
		},
		{
			class = "UsableItem",
			nutritionValue = 300,
			name = "usableitem"
		}
	}
}

defineObject{
	baseObject = "base_item",
	tags = {
		"food"
	},
	name = "food_sausage",
	components = {
		{
			model = "assets/models/items/sausage.fbx",
			name = "model",
			class = "Model"
		},
		{
			weight = 1,
			uiName = "Salted Sausage",
			description = "A heavy snack. After eating this you will need to sit down and rest for a while. But it will restore great amount of your health.",
			gfxIndex = 276,
			class = "Item",
			name = "item",
			traits = {
				"consumable"
			}
		},
		{
			class = "UsableItem",
			nutritionValue = 600,
			name = "usableitem",
			onUseItem = function(self,champion)				
				local mult = iff(champion:hasTrait("fast_metabolism"), 2, 1)
                champion:regainEnergy(-26/mult)
				champion:regainHealth(100*mult)
				champion:removeCondition("head_wound")
				champion:removeCondition("chest_wound")
				champion:removeCondition("leg_wound")
				champion:removeCondition("feet_wound")
				champion:removeCondition("right_hand_wound")
				champion:removeCondition("left_hand_wound")
				champion:playHealingIndicator()
			end
		}
	}
}

defineObject{
	baseObject = "crystal_shard_healing",
	name = "pirate_crystal",
	components = {		
		{
			weight = 0.3,
			stackable = true,
			uiName = "Pirate Crystal",
			gfxIndex = 437,
			gameEffect = "Heals all wounds and raises dead champions back to life. In some countries it is illegal, but you are okay to use it freely on Pirate Island.",
			name = "item",
			class = "Item"
		}		
	}
}