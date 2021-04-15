class 'RMBundles'

function RMBundles:__init()
	print("RMBundles - Init")
	Hooks:Install('Terrain:Load', 999, self, self.OnTerrainLoad)
	Hooks:Install('VisualTerrain:Load', 999, self, self.OnTerrainLoad)
	Hooks:Install('ResourceManager:LoadBundles', 100, self, self.OnLoadBundles)
	Events:Subscribe('Level:RegisterEntityResources', self, self.OnRegisterEntityResources)
	Events:Subscribe('Level:LoadResources', self, self.OnLoadResources)
end

-- example: https://github.com/Powback/Venice-EBX/blob/071473993867cd2297dc662517c61edaff51e8fe/Levels/XP3_LeGrandVal/Terrain/LeGrandVal.StreamingTree.txt#L60
function RMBundles:OnTerrainLoad(p_Hook, p_TerrainName)

	-- WARNING: only comment in the one for the map you're editing:

	local terrainAssetName = 'Levels/XP1_001/XPACK1_001_Terrain' -- Karkand
	--local terrainAssetName = 'Levels/XP1_002/Terrain_2/GulfTerrain_03', -- Oman
	--local terrainAssetName = 'levels/xp3_legrandval/terrain/legrandval', -- Shield
	--local terrainAssetName = 'Levels/XP4_Parliament/Terrain_Parliament/Terrain_Parliament', -- Parl

	if not string.find(p_TerrainName:lower(), terrainAssetName:lower()) then
		print("RMBundles - Preventing load of terrain: " .. p_TerrainName)
		p_Hook:Return(nil)
	end
end

function RMBundles:OnLoadBundles(p_Hook, p_Bundles, p_Compartment)

	if #p_Bundles == 1 and p_Bundles[1] == SharedUtils:GetLevelName() then
		p_Bundles = {
			'Levels/SP_Tank/SP_Tank',
			'Levels/SP_Tank/DesertFort',
			'Levels/Coop_006/Coop_006',
			'Levels/Coop_009/Coop_009',
			'Levels/SP_Bank/SP_Bank',
			'Levels/SP_Bank/Ride_SUB',
			'Levels/XP5_001/XP5_001',
			'Levels/XP5_001/Air_Superiority',
			p_Bundles[1],
		}

		p_Hook:Pass(p_Bundles, p_Compartment)

		print('RMBundles - Injected bundles.')
	end
end

function RMBundles:OnRegisterEntityResources(p_LevelData)
	local spTankDesertFortRegistry = RegistryContainer(ResourceManager:SearchForInstanceByGuid(Guid('4C200C23-43D4-27E3-AC17-EBA1030EE457')))
	ResourceManager:AddRegistry(spTankDesertFortRegistry, ResourceCompartment.ResourceCompartment_Game)

	local XP5_AirSuperiorityRegistry = RegistryContainer(ResourceManager:SearchForInstanceByGuid(Guid('4EE4D634-E451-F395-AFCE-756319ABEA33')))
	ResourceManager:AddRegistry(XP5_AirSuperiorityRegistry, ResourceCompartment.ResourceCompartment_Game)

	local coop6Registry = RegistryContainer(ResourceManager:SearchForInstanceByGuid(Guid('51C54150-0ABF-03BD-EADE-1876AAD3EC8D')))
	ResourceManager:AddRegistry(coop6Registry, ResourceCompartment.ResourceCompartment_Game)

	local coop9Registry = RegistryContainer(ResourceManager:SearchForInstanceByGuid(Guid('F05798B2-31EC-210D-CC1D-0F7535BECA30')))
	ResourceManager:AddRegistry(coop9Registry, ResourceCompartment.ResourceCompartment_Game)

	local spBankRideSubRegistry = RegistryContainer(ResourceManager:SearchForInstanceByGuid(Guid('9F9CABAF-21C2-EF4A-B35D-4358AEBA7565')))
	ResourceManager:AddRegistry(spBankRideSubRegistry, ResourceCompartment.ResourceCompartment_Game)

	print("RMBundles - Added registries")
end

function RMBundles:OnLoadResources(p_MapName, p_GameModeName, p_DedicatedServer)
	ResourceManager:MountSuperBundle('SpChunks')
	ResourceManager:MountSuperBundle('Xp2Chunks')
	ResourceManager:MountSuperBundle('Xp5Chunks')
	ResourceManager:MountSuperBundle('Levels/SP_Tank/SP_Tank')
	ResourceManager:MountSuperBundle('Levels/XP5_001/XP5_001')
	ResourceManager:MountSuperBundle('Levels/Coop_006/Coop_006')
	ResourceManager:MountSuperBundle('Levels/Coop_009/Coop_009')
	ResourceManager:MountSuperBundle('Levels/SP_Bank/SP_Bank')

	print("RMBundles - Mounted SP SuperBundle & Chunks")
end

return RMBundles()

