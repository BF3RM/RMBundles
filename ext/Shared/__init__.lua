class 'RMBundles'

local m_BundleLoader = require "__shared/BundleLoader/BundleLoader"

function RMBundles:__init()
	Hooks:Install('ResourceManager:LoadBundles', 100, self, self.OnLoadBundles)
	Events:Subscribe('Level:RegisterEntityResources', self, self.OnRegisterEntityResources)
	Events:Subscribe('Level:LoadResources', self, self.OnLoadResources)
end

function RMBundles:OnLoadBundles(p_Hook, p_Bundles, p_Compartment)
	m_BundleLoader:OnLoadBundles(p_Hook, p_Bundles, p_Compartment)
end

function RMBundles:OnRegisterEntityResources(p_LevelData)
	m_BundleLoader:OnRegisterEntityResources(p_LevelData)
end

function RMBundles:OnLoadResources(p_MapName, p_GameModeName, p_DedicatedServer)
	m_BundleLoader:OnLoadResources(p_MapName, p_GameModeName, p_DedicatedServer)
end

return RMBundles()

