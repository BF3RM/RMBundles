class 'RMBundles'

require "__shared/DC"
require "__shared/Logger"

local m_BundleLoader = require "__shared/BundleLoader/BundleLoader"
local m_Logger = Logger("RMBundles", false)

function RMBundles:__init()
	m_Logger:Write("init")

	Hooks:Install('EntityFactory:CreateFromBlueprint', 901, self, self.OnEntityCreateFromBlueprint)
	Hooks:Install('ResourceManager:LoadBundles', 901, self, self.OnLoadBundles)
end

function RMBundles:OnEntityCreateFromBlueprint(p_Hook, p_Blueprint, p_Transform, p_Variation, p_ParentRepresentative)
	m_BundleLoader:OnEntityCreateFromBlueprint(p_Hook, p_Blueprint, p_Transform, p_Variation, p_ParentRepresentative)
end

function string:split(sep)
	local sep, fields = sep or ":", {}
	local pattern = string.format("([^%s]+)", sep)
	self:gsub(pattern, function(c) fields[#fields+1] = c end)
	return fields
end

function RMBundles:OnLoadBundles(p_Hook, p_Bundles, p_Compartment)
	m_Logger:Write("OnLoadBundles")
	m_BundleLoader:OnLoadBundles(p_Hook, p_Bundles, p_Compartment)
end

function RMBundles:OnLoadBundles(p_Hook, p_Bundles, p_Compartment)
	m_Logger:Write("OnLoadBundles")
	m_BundleLoader:OnLoadBundles(p_Hook, p_Bundles, p_Compartment)
end
return RMBundles()

