-- This file has been generated by Dungeon Editor 2.1.18

-- TODO: place your custom material definitions here

defineMaterial{
	name = "coinMtrl",
	diffuseMap = "mod_assets/textures/coins_texture.tga",
	specularMap = "mod_assets/textures/coins_texture.tga",
	doubleSided = false,
	lighting = true,
	alphaTest = false,
	blendMode = "Opaque",
	textureAddressMode = "Wrap",
	glossiness = 90,
	depthBias = 0,
}

defineMaterial{
	name = "tentacles",
	diffuseMap = "mod_assets/textures/monsters/drain_tentacles_dif.tga",
	specularMap = "mod_assets/textures/monsters/drain_tentacles_spec.tga",
	normalMap = "mod_assets/textures/monsters/drain_tentacles_normal.tga",
	doubleSided = true,
	lighting = true,
	alphaTest = true,
	blendMode = "Opaque",
	textureAddressMode = "Wrap",
	glossiness = 80,
	depthBias = 0,
}