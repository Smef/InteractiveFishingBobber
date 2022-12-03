local frame = CreateFrame("FRAME", "InteractiveBobberFrame");
frame:RegisterEvent("UNIT_SPELLCAST_CHANNEL_START");
frame:RegisterEvent("UNIT_SPELLCAST_CHANNEL_STOP");

local originalArc = GetCVar("SoftTargetInteractArc");
local originalRange = GetCVar("SoftTargetInteractRange");
local originalSfxVolume = GetCVar("Sound_SFXVolume");

local function eventHandler(self, event, unitTarget, castGUID, spellID)
	if spellID ~= 131476 then return end
	if unitTarget ~= "player" then return end

	-- print("Target - " .. unitTarget)
	-- print("Event - " .. event .. " - " .. spellID);

	if (event == "UNIT_SPELLCAST_CHANNEL_START") then
		-- print("Start - " .. event .. " - " .. spellID);

		originalArc = GetCVar("SoftTargetInteractArc");
		originalRange = GetCVar("SoftTargetInteractRange");
		originalSfxVolume = GetCVar("Sound_SFXVolume");

		-- print("Original Arc: " .. originalArc);
		-- print("Original Range: " .. originalRange);
		-- print("Original SFX Volume: " .. originalSfxVolume);

		SetCVar("SoftTargetInteractArc", 2);
		SetCVar("SoftTargetInteractRange", 30);
		SetCVar("Sound_SFXVolume", 1);

		-- print("Updated Arc: " .. 2);
		-- print("Updated Range: " .. 30);
		-- print("Updated SFX Volume: " .. 1);
	end

	if (event == "UNIT_SPELLCAST_CHANNEL_STOP") then
		-- print("Stop - " .. event .. " - " .. spellID);
		-- print("Resetting Arc to: " .. originalArc);
		-- print("Resetting Range to: " .. originalRange);
		-- print("Resetting SFX Volume to: " .. originalSfxVolume);

		SetCVar("SoftTargetInteractArc", originalArc);
		SetCVar("SoftTargetInteractRange", originalRange);
		SetCVar("Sound_SFXVolume", originalSfxVolume);
	end
end

frame:SetScript("OnEvent", eventHandler);
