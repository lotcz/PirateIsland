-- This file has been generated by Dungeon Editor 2.1.18

-- TODO: place your custom monster definitions here

defineObject{
	baseObject = "crab",
	name = "crab_sens_fire",
	components = {
		{
			hitSound = "crab_hit",
			protection = 30,
			health = 5000,
			class = "Monster",
			evasion = 10,
			meshName = "crab_mesh",
			traits = {
				"animal"
			},
			exp = 1000,
			immunities = {
				"sleep",
				"blinded",
				"physical",
				"water",
				"frozen",
				"critical"
			},
			resistances = { cold="immune", fire="weak", physical="immune"},
			hitEffect = "hit_goo",
			capsuleRadius = 0.6,
			dieSound = "crab_die",
			name = "monster",
			capsuleHeight = 0.4,			
			onDamage = function(self, damage, damageType)
				if damageType == "fire" then
					self.go.brain:startFleeing()
                    self.go.brainScript.counter = 10
					if damage > 20 and self:isAlive() then 
						self:die()
					end
				end
			end
		},
		{
			onThink = function(self)
				if not self.go.brainScript.crab_in_place then
                    if self.go.brainScript.counter == nil then
                        self.go.brainScript.counter = 0
                    end
                    if (self.go.brainScript.counter > 0) then
                        self.go.brainScript.counter = self.go.brainScript.counter - 1;
                        --print(self.go.brainScript.counter)
                    else
                        local x, y = getForward(self.go.facing)
                        if not (party.x == self.go.x + x and party.y == self.go.y + y ) then
                            self:goTo(self.go.brainScript.crab_place)
                        end
                    end
				end
			end,
			allAroundSight = true,
			sight = 2,			
			class = "CrabBrain",
			name = "brain"			
		},
		{
			class = "MonsterAttack",
			name = "basicAttack",
			attackPower = 12,
			accuracy = 10,
			woundChance = 30,
			cooldown = 2.5,
			animationSpeed = 1,
			sound = "crab_attack",
		},
		{
			name = "brainScript",
			class = "Script"
		}		
	}
}

defineObject{
	baseObject = "base_monster",
	name = "butcher",
	components = {
		{
			name = "model",
			class = "Model",
			storeSourceData = true,
			model = "assets/models/monsters/forest_ogre.fbx"
		},
		{
			animations = {
				chargeContinue1 = "assets/animations/monsters/forest_ogre/forest_ogre_rush_continue_right_step.fbx",
				chargeContinue2 = "assets/animations/monsters/forest_ogre/forest_ogre_rush_continue_left_step.fbx",
				chargeBegin = "assets/animations/monsters/forest_ogre/forest_ogre_rush_begin.fbx",
				turnAttackLeft = "assets/animations/monsters/forest_ogre/forest_ogre_attack_left.fbx",
				getHitBack = "assets/animations/monsters/forest_ogre/forest_ogre_get_hit_back.fbx",
				chargeHit1 = "assets/animations/monsters/forest_ogre/forest_ogre_rush_hit_right_step.fbx",
				getHitRight = "assets/animations/monsters/forest_ogre/forest_ogre_get_hit_right.fbx",
				fall = "assets/animations/monsters/forest_ogre/forest_ogre_get_hit_back.fbx",
				attack = "assets/animations/monsters/forest_ogre/forest_ogre_attack.fbx",
				getHitFrontLeft = "assets/animations/monsters/forest_ogre/forest_ogre_get_hit_front_left.fbx",
				attack2 = "assets/animations/monsters/forest_ogre/forest_ogre_attack_stab.fbx",
				turnRight = "assets/animations/monsters/forest_ogre/forest_ogre_turn_right.fbx",
				turnAttackRight = "assets/animations/monsters/forest_ogre/forest_ogre_attack_right.fbx",
				turnLeft = "assets/animations/monsters/forest_ogre/forest_ogre_turn_left.fbx",
				moveForward = "assets/animations/monsters/forest_ogre/forest_ogre_walk.fbx",
				chargeHit2 = "assets/animations/monsters/forest_ogre/forest_ogre_rush_hit_left_step.fbx",
				idle = "assets/animations/monsters/forest_ogre/forest_ogre_idle.fbx",
				getHitLeft = "assets/animations/monsters/forest_ogre/forest_ogre_get_hit_left.fbx",
				getHitFrontRight = "assets/animations/monsters/forest_ogre/forest_ogre_get_hit_front_right.fbx"
			},
			class = "Animation",
			name = "animation",
			currentLevelOnly = true
		},
		{
			hitSound = "ogre_hit",
			protection = 30,
			health = 2000,
			class = "Monster",
			meshName = "forest_ogre_mesh",
			evasion = 0,
			headRotation = {
				90,
				0,
				0,
				0
			},
			footstepSound = "ogre_footstep",
			exp = 3000,
			hitEffect = "hit_blood",
			capsuleRadius = 0.6,
			dieSound = "ogre_die",
			name = "monster",
			capsuleHeight = 0.6
		},
		{
			onThink = function(self)				
				-- nic
			end,
			class = "OgreBrain",
			name = "brain",
			sight = 4
		},
		{
			sound = "ogre_walk",
			class = "MonsterMove",
			name = "move",
			cooldown = 7
		},
		{
			sound = "ogre_walk",
			class = "MonsterTurn",
			name = "turn"
		},
		{
			woundChance = 50,
			class = "MonsterAttack",
			onBeginAction = function() print('Cannot Scrape Functions'); end,
			impactSound = "ogre_impact",
			accuracy = 30,
			cameraShake = true,
			cooldown = 4,
			sound = "ogre_attack",
			screenEffect = "damage_screen",
			name = "basicAttack",
			attackPower = 80
		},
		{
			turnToAttackDirection = true,
			class = "MonsterAttack",
			woundChance = 50,
			impactSound = "ogre_impact",
			accuracy = 30,
			cameraShake = true,
			cooldown = 4,
			sound = "ogre_attack",
			screenEffect = "damage_screen",
			name = "turnAttack",
			attackPower = 80
		},
		{
			cooldown = 30,
			sound = "ogre_rush_begin",
			class = "MonsterCharge",
			name = "charge",
			attackPower = 80
		},
		{
			name = "brainScript",
			class = "Script"
		}
	}
}

defineObject{
	baseObject = "base_monster",
	name = "water_root",
	editorIcon = 4,
	components = {
		{
			name = "model",
			class = "Model",
			storeSourceData = true,
			model = "assets/models/monsters/viper_root.fbx"
		},
		{
			animations = {
				fall = "assets/animations/monsters/viper_root/viper_root_get_hit_front_left.fbx",
				descend = "assets/animations/monsters/viper_root/viper_root_descend.fbx",
				rise = "assets/animations/monsters/viper_root/viper_root_rise.fbx",
				spit = "assets/animations/monsters/viper_root/viper_root_spit.fbx",
				getHitBack = "assets/animations/monsters/viper_root/viper_root_get_hit_back.fbx",
				attackFromBehind = "assets/animations/monsters/viper_root/viper_root_attack_from_behind.fbx",
				attack = "assets/animations/monsters/viper_root/viper_root_attack.fbx",
				getHitFrontLeft = "assets/animations/monsters/viper_root/viper_root_get_hit_front_left.fbx",
				getHitFrontRight = "assets/animations/monsters/viper_root/viper_root_get_hit_front_right.fbx",
				idle = "assets/animations/monsters/viper_root/viper_root_idle.fbx",
				getHitLeft = "assets/animations/monsters/viper_root/viper_root_get_hit_left.fbx",
				getHitRight = "assets/animations/monsters/viper_root/viper_root_get_hit_right.fbx"
			},
			class = "Animation",
			name = "animation",
			currentLevelOnly = true
		},
		{
			meshName = "viper_root_mesh",
			hitSound = "viper_root_hit",
			protection = 0,
			resistances = {
				fire = "weak"
			},
			traits = {
				"aquatic"
			},
			health = 300,
			class = "Monster",
			headRotation = {
				90,
				0,
				0,
				0
			},
			evasion = 0,
			-- onInit = function() print('Cannot Scrape Functions'); end,
			immunities = {
				"sleep",
				"blinded",
				"knockback"
			},
			exp = 500,
			hitEffect = "hit_goo",
			capsuleRadius = 0.7,
			dieSound = "viper_root_die",
			name = "monster",
			capsuleHeight = 0.2
		},
		{
			morale = 100,
			class = "ViperRootBrain",
			name = "brain",
			sight = 5
		},
		{
			enabled = false,
			cameraShakeDuration = 0.8,
			class = "MonsterAttack",
			animation = "rise",
			--onBeginAction = function() print('Cannot Scrape Functions'); end,
			cooldown = 0,
			accuracy = 50,
			cameraShake = true,
			name = "rise",
			attackPower = 17
		},
		{
			enabled = false,
			animation = "descend",
			--onEndAction = function() print('Cannot Scrape Functions'); end,
			class = "MonsterAction",
			name = "descend",
			--onBeginAction = function() print('Cannot Scrape Functions'); end
		},
		{
			cameraShakeDuration = 0.8,
			class = "MonsterAttack",
			attackFromBehindAnimation = "attackFromBehind",
			attackPower = 17,
			cooldown = 5,
			accuracy = 10,
			sound = "viper_root_attack",
			name = "basicAttack",
			cameraShake = true
		},
		{
			shootProjectile = "poison_bolt",
			attackType = "projectile",
			class = "MonsterAttack",
			projectileHeight = 1.3,
			animation = "spit",
			cooldown = 5,
			sound = "viper_root_ranged_attack",
			name = "rangedAttack",
			attackPower = 10
		},
		{
			enabled = false,
			name = "gravity",
			class = "Gravity"
		}
	}	
}

defineObject{
	baseObject = "mimic",
	name = "onigin",
	components = {			
		{
			hitSound = "mimic_hit",
			protection = 20,
			health = 1000,
			class = "Monster",
			evasion = 0,
			meshName = "mimic_wooden_mesh",
			immunities = {
				"sleep",
				"blinded",
				"stunned"
			},
			exp = 1200,
			hitEffect = "hit_dust",
			capsuleRadius = 0.7,
			dieSound = "mimic_die",
			name = "monster",
			capsuleHeight = 0.2
		},
		{
			onThink = function(self)
				if not self.go.brainScript.in_place then
					self:goTo(self.go.brainScript.place)
				end
			end,
			morale = 100,
			class = "MeleeBrain",
			name = "brain",
			sight = 2.5
		},
		{
			name = "brainScript",
			class = "Script"
		},
		{
			class = "MonsterMove",
			name = "move",
			sound = "mimic_walk",
			cooldown = 1.5,
			dashChance = 40,
		},
	}
}

defineObject{
	baseObject = "base_monster",
	name = "wolf",
	components = {
		{
			name = "model",
			class = "Model",
			storeSourceData = true,
			model = "assets/models/monsters/fjeld_warg.fbx"
		},
		{
			animations = {
				turnRightNormal = "assets/animations/monsters/fjeld_warg/fjeld_warg_turn_right.fbx",
				fall = "assets/animations/monsters/fjeld_warg/fjeld_warg_get_hit_front_left.fbx",
				attack = "assets/animations/monsters/fjeld_warg/fjeld_warg_attack.fbx",
				getHitFrontLeft = "assets/animations/monsters/fjeld_warg/fjeld_warg_get_hit_front_left.fbx",
				turnLeftNormal = "assets/animations/monsters/fjeld_warg/fjeld_warg_turn_left.fbx",
				getHitFrontRight = "assets/animations/monsters/fjeld_warg/fjeld_warg_get_hit_front_right.fbx",
				turnRight = "assets/animations/monsters/fjeld_warg/fjeld_warg_turn_right.fbx",
				getHitBack = "assets/animations/monsters/fjeld_warg/fjeld_warg_get_hit_back.fbx",
				moveForward = "assets/animations/monsters/fjeld_warg/fjeld_warg_walk.fbx",
				turnLeft = "assets/animations/monsters/fjeld_warg/fjeld_warg_turn_left.fbx",
				idle = "assets/animations/monsters/fjeld_warg/fjeld_warg_idle.fbx",
				getHitLeft = "assets/animations/monsters/fjeld_warg/fjeld_warg_get_hit_left.fbx",
				getHitRight = "assets/animations/monsters/fjeld_warg/fjeld_warg_get_hit_right.fbx"
			},
			class = "Animation",
			name = "animation",
			currentLevelOnly = true
		},
		{
			lootDrop = {
				75,
				"warg_meat",
				10,
				"warg_meat"
			},
			hitSound = "warg_hit",
			meshName = "fjeld_warg_mesh",
			resistances = {
				poison = "weak",
				shock = "weak",
				physical = "resist"
			},
			immunities = {
				"physical",
				"water",
				"frozen"				
			},
			health = 300,
			class = "Monster",
			--onUnlinkMonsterGroup = function() print('Cannot Scrape Functions'); end,
			evasion = 0,
			headRotation = {
				90,
				0,
				0,
				0
			},
			traits = {
				"animal"
			},
			exp = 300,
			hitEffect = "hit_blood_black",
			capsuleRadius = 0.7,
			dieSound = "warg_die",
			name = "monster",
			capsuleHeight = 0.2,
			onDamage = function(self, damage, damageType)
				self.go.brainScript.attacking = true
                self.go.brain:stopGuarding()
                self.go.brain:setSight(2.5)
				if damageType == "shock" then
					self.go.brain:startFleeing()					
				end
			end,
            --onPerformAction = function(self, b, c, d, e)	
--                print(self, b, c, d, e)
           --end
		},
		{
            onThink = function(self)				
				if not self.go.brainScript.attacking and not self.go.brainScript.in_place then
                    local x, y = getForward(self.go.facing)
                    if not (party.x == self.go.x + x and party.y == self.go.y + y ) then
                      self:goTo(self.go.brainScript.place)
                    end
				end
			end,
            allAroundSight = true,
			class = "MeleeBrain",
			name = "brain",
			sight = 1
		},        
		{
			name = "brainScript",
			class = "Script"
		},
		{
			animationSpeed = 1.6,
			sound = "warg_attack",
			cooldown = 2,
			woundChance = 10,
			accuracy = 10,
			class = "MonsterAttack",
			name = "basicAttack",
			attackPower = 25
		},
		{
			sound = "warg_walk",
			class = "MonsterMove",
			name = "move",
			cooldown = 1.5
		},
		{
			sound = "warg_walk",
			class = "MonsterTurn",
			name = "turn"
		}
	}
}


defineObject{
	name = "tentacles",
	baseObject = "base_monster",
	components = {
		{
			class = "Model",
			model = "mod_assets/models/monsters/drainage_tentacles.fbx",
			storeSourceData = true,
		},
		{
			class = "Animation",
			animations = {
				idle = "mod_assets/animations/monsters/drainage_tentacles/drainage_tentacles_idle.fbx",
				turnLeft = "mod_assets/animations/monsters/drainage_tentacles/drainage_tentacles_turn_left.fbx",
				turnRight = "mod_assets/animations/monsters/drainage_tentacles/drainage_tentacles_turn_right.fbx",
				hide = "mod_assets/animations/monsters/drainage_tentacles/drainage_tentacles_hide.fbx",
				reveal = "mod_assets/animations/monsters/drainage_tentacles/drainage_tentacles_raise.fbx",
				attack = "mod_assets/animations/monsters/drainage_tentacles/drainage_tentacles_attack.fbx",
				attackBack = "mod_assets/animations/monsters/drainage_tentacles/drainage_tentacles_attack_back.fbx",
				attackLeft = "mod_assets/animations/monsters/drainage_tentacles/drainage_tentacles_attack_left.fbx",
				attackRight = "mod_assets/animations/monsters/drainage_tentacles/drainage_tentacles_attack_right.fbx",
				getHitFrontLeft = "mod_assets/animations/monsters/drainage_tentacles/drainage_tentacles_get_hit_front_left.fbx",
				getHitFrontRight = "mod_assets/animations/monsters/drainage_tentacles/drainage_tentacles_get_hit_front_right.fbx",
				getHitBack = "mod_assets/animations/monsters/drainage_tentacles/drainage_tentacles_get_hit_front_left.fbx",
				getHitLeft = "mod_assets/animations/monsters/drainage_tentacles/drainage_tentacles_get_hit_front_right.fbx",
				getHitRight = "mod_assets/animations/monsters/drainage_tentacles/drainage_tentacles_get_hit_front_left.fbx",
				fall = "mod_assets/animations/monsters/drainage_tentacles/drainage_tentacles_get_hit_front_left.fbx",
			},
			currentLevelOnly = true,
		},
		{
			class = "Monster",
			meshName = "drainage_tentacles_mesh",
			hitSound = "viper_root_hit",
			dieSound = "viper_root_die",
			hitEffect = "hit_goo",
			capsuleHeight = 1,
			capsuleRadius = 0.1,
			health = 420,
			immunities = { "assassination", "backstab", "sleep", "blinded", "knockback" },
			resistances = {
				["cold"] = "resist",
				["shock"] = "weak",
			},
			exp = 320,
			headRotation = vec(90, 0, 0),
		    onPerformAction = function(self, b, c, d, e)	
                --print(self, b, c, d, e)
          	end
		},
		{
			class = "MeleeBrain",
			name = "brain",
			sight = 7,
			allAroundSight = true,
			onThink = function(self) 
				local script = self.go.brainScript
				if script then
					if script.hide then 
						script.hide = false
						self:performAction("hide")
					elseif script.attack then
						script.attack = false
						self:performAction("basicAttack")
					end
				end
			end
		},		
		{
			class = "Script",
			name = "brainScript",
		},
		{
			class = "MonsterTurn",
			name = "turn",
			sound = "tentacles_walk",
		},
		{
			class = "MonsterTurn",
			name = "hide",
			animation = "hide",
		},
		{
			class = "MonsterTurn",
			name = "reveal",
			animation = "reveal",					
			animationSpeed = 2.5,
		},
		{
			class = "MonsterAttack",
			name = "basicAttack",
			attackPower = 25,
			accuracy = 15,
			cooldown = 4,
			sound = "viper_root_attack",
			causeCondition = "paralyzed",
			conditionChance = 20,
		},
	},
}

defineSound{
	name = "tentacles_walk",
	filename = "assets/samples/monsters/tentacles_walk_01.wav",
	loop = false,
	volume = 1,
	minDistance = 1,
	maxDistance = 10,
}

defineSound{
	name = "tentacles_rise",
	filename = "assets/samples/monsters/tentacles_rise_01.wav",
	loop = false,
	volume = 1,
	minDistance = 1,
	maxDistance = 10,
}

defineSound{
	name = "tentacles_retreat",
	filename = "assets/samples/monsters/tentacles_retreat_01.wav",
	loop = false,
	volume = 1,
	minDistance = 1,
	maxDistance = 10,
}

defineObject{
	name = "mosquito_annoy",
	baseObject = "base_monster",
	components = {
		{
			class = "Model",
			model = "assets/models/monsters/mosquito_swarm.fbx",
			storeSourceData = true, -- must be enabled for mesh particles to work
		},
		{
			class = "Animation",
			animations = {
				idle = "assets/animations/monsters/mosquito_swarm/mosquito_swarm_idle.fbx",
				moveForward = "assets/animations/monsters/mosquito_swarm/mosquito_swarm_fly.fbx",
				turnLeft = "assets/animations/monsters/mosquito_swarm/mosquito_swarm_turn_left.fbx",
				turnRight = "assets/animations/monsters/mosquito_swarm/mosquito_swarm_turn_right.fbx",
				moveForwardTurnLeft = "assets/animations/monsters/mosquito_swarm/mosquito_swarm_fly_turn_left.fbx",
				moveForwardTurnRight = "assets/animations/monsters/mosquito_swarm/mosquito_swarm_fly_turn_right.fbx",
				attack = "assets/animations/monsters/mosquito_swarm/mosquito_swarm_attack.fbx",
				attackFromBehind = "assets/animations/monsters/mosquito_swarm/mosquito_swarm_attack_from_behind.fbx",
				--moveAttack = "assets/animations/monsters/mosquito_swarm/mosquito_swarm_move_attack.fbx",
				getHitFrontLeft = "assets/animations/monsters/mosquito_swarm/mosquito_swarm_get_hit_front_left.fbx",
				getHitFrontRight = "assets/animations/monsters/mosquito_swarm/mosquito_swarm_get_hit_front_right.fbx",
				getHitBack = "assets/animations/monsters/mosquito_swarm/mosquito_swarm_get_hit_back.fbx",
				getHitLeft = "assets/animations/monsters/mosquito_swarm/mosquito_swarm_get_hit_left.fbx",
				getHitRight = "assets/animations/monsters/mosquito_swarm/mosquito_swarm_get_hit_right.fbx",
				fall = "assets/animations/monsters/mosquito_swarm/mosquito_swarm_get_hit_front_left.fbx",
			},
			currentLevelOnly = true,
		},
		{
			class = "Monster",
			meshName = "mosquito_swarm_mesh",
			hitSound = "mosquito_swarm_hit",
			dieSound = "mosquito_swarm_die",
			hitEffect = "hit_goo",
			capsuleHeight = 0.2,
			capsuleRadius = 0.7,
			health = 10,
			evasion = 35,
			flying = true,
			exp = 100,
            swarm = true,
			immunities = { "sleep", "blinded" },
			traits = { "animal" },
			resistances = { fire = "vulnerable" },
		},
		{
			class = "MosquitoSwarmBrain",
			name = "brain",
			sight = 2,
			morale = 100,
		},
		{
			class = "MonsterMove",
			name = "move",
			sound = "mosquito_swarm_walk",
			cooldown = 0.25,
			animationSpeed = 1.5,
		},
		{
			class = "MonsterTurn",
			name = "turn",
			sound = "mosquito_swarm_walk",
			animationSpeed = 1.5,
		},
		{
			class = "MonsterMove",
			name = "moveForwardAndTurnRight",
			animations = { forward="moveForwardTurnRight" },
			sound = "mosquito_swarm_walk",
			turnDir = 1,
			cooldown = 0.25,
			resetBasicAttack = true,
			animationSpeed = 1.5,
		},
		{
			class = "MonsterMove",
			name = "moveForwardAndTurnLeft",
			animations = { forward="moveForwardTurnLeft" },
			sound = "mosquito_swarm_walk",
			turnDir = -1,
			cooldown = 0.25,
			resetBasicAttack = true,
			animationSpeed = 1.5,
		},
		{
			class = "MonsterAttack",
			name = "basicAttack",
			attackFromBehindAnimation = "attackFromBehind",
			attackPower = 2,
			pierce = 10,
			cooldown = 1.5,
			repeatChance = 55,
			sound = "mosquito_swarm_attack",
			animationSpeed = 1.4,
		},
		{
			class = "MonsterChangeAltitude",
			name = "changeAltitude",
			sound = "mosquito_swarm_walk",
		}
	},
}

defineObject{
	name = "the_beast",
	baseObject = "base_monster",
	components = {
		{
			class = "Model",
			model = "assets/models/monsters/swamp_toad.fbx",
			storeSourceData = true, -- must be enabled for mesh particles to work
		},
		{
			class = "Animation",
			animations = {
				idle = "assets/animations/monsters/swamp_toad/swamp_toad_idle.fbx",
				moveForward = "assets/animations/monsters/swamp_toad/swamp_toad_walk.fbx",
				turnLeft = "assets/animations/monsters/swamp_toad/swamp_toad_turn_left.fbx",
				turnRight = "assets/animations/monsters/swamp_toad/swamp_toad_turn_right.fbx",
				attack = "assets/animations/monsters/swamp_toad/swamp_toad_attack.fbx",
				attackFromBehind = "assets/animations/monsters/swamp_toad/swamp_toad_attack_from_behind.fbx",
				tongueAttack = "assets/animations/monsters/swamp_toad/swamp_toad_tongue_attack.fbx",
				jumpAttack = "assets/animations/monsters/swamp_toad/swamp_toad_jump_attack.fbx",
				getHitFrontLeft = "assets/animations/monsters/swamp_toad/swamp_toad_get_hit_front_left.fbx",
				getHitFrontRight = "assets/animations/monsters/swamp_toad/swamp_toad_get_hit_front_right.fbx",
				getHitBack = "assets/animations/monsters/swamp_toad/swamp_toad_get_hit_back.fbx",
				getHitLeft = "assets/animations/monsters/swamp_toad/swamp_toad_get_hit_left.fbx",
				getHitRight = "assets/animations/monsters/swamp_toad/swamp_toad_get_hit_right.fbx",
				eatBomb = "assets/animations/monsters/swamp_toad/swamp_toad_eat_bomb.fbx",
				fall = "assets/animations/monsters/swamp_toad/swamp_toad_get_hit_front_left.fbx",
				longJump = "assets/animations/monsters/swamp_toad/swamp_toad_jump_up.fbx",
			},
			currentLevelOnly = true,
		},
		{
			class = "Monster",
			meshName = "swamp_toad_mesh",
			hitSound = "swamp_toad_hit",
			dieSound = "swamp_toad_die",
			hitEffect = "hit_goo",
			capsuleHeight = 0.2,
			capsuleRadius = 0.7,
			health = 5000,
			evasion = 10,
			exp = 2000,
			lootDrop = { 90, "toad_tongue",},
			resistances = { ["shock"] = "weak" },
			traits = { "animal" },
		},
		{
			class = "ToadBrain",
			name = "brain",
			sight = 4,
		},
		{
			class = "MonsterMove",
			name = "move",
			sound = "swamp_toad_walk",
			cooldown = 4,
		},
		{
			class = "MonsterTurn",
			name = "turn",
			sound = "swamp_toad_walk",
		},
		{
			class = "MonsterAttack",
			name = "basicAttack",
			attackFromBehindAnimation = "attackFromBehind",
			attackPower = 25,
			cooldown = 5,
			animation = "attack",
			sound = "swamp_toad_attack",
		},
		{
			class = "MonsterStealWeapon",
			name = "steal",
			cooldown = 20,
			animation = "tongueAttack",
			sound = "swamp_toad_tongue_attack",
		},
		{
			class = "MonsterAction",
			name = "eatBomb",
			animation = "eatBomb",
		},
		{
			class = "MonsterMoveAttack",
			name = "leapAttack",
			attackPower = 32,
			accuracy = 50,
			cooldown = 10,
			animation = "jumpAttack",
			sound = "swamp_toad_attack",
		},
		{
			class = "MonsterJump",
			name = "jump",
			animation = "longJump",
			animDurationBeforeJump = 0.22,
			animDurationAfterJump = 0.44,
			cooldown = 0.1,
			sound = "swamp_toad_long_jump",
		},
	},
}