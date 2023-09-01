local frame = CreateFrame("FRAME", "InteractiveBobberFrame");
frame:RegisterEvent("UNIT_SPELLCAST_CHANNEL_START");
frame:RegisterEvent("UNIT_SPELLCAST_CHANNEL_STOP");

local originalArc = GetCVar("SoftTargetInteractArc");
local originalRange = GetCVar("SoftTargetInteractRange");


local function eventHandler(self, event, unitTarget, castGUID, spellID)
	if spellID ~= 131476 then return end
	if unitTarget ~= "player" then return end


	-- print ("Target - " .. unitTarget)

	-- print("Event - " .. event .. " - " .. spellID);
	 if (event == "UNIT_SPELLCAST_CHANNEL_START") then
		-- print("Start - " .. event .. " - " .. spellID);
		originalArc = GetCVar("SoftTargetInteractArc");
		originalRange = GetCVar("SoftTargetInteractRange");

		-- print("Original Arc: " .. originalArc);
		-- print("Original Range: " .. originalArc);

		SetCVar( "SoftTargetInteractArc", 2 );
		SetCVar( "SoftTargetInteractRange", 30 );
		-- print("Updated Arc: " .. 2);
		-- print("Updated Range: " .. 30);

	end

	if (event == "UNIT_SPELLCAST_CHANNEL_STOP") then
		-- print("Stop - " .. event .. " - " .. spellID);
		-- print("Resetting Arc to: " .. originalArc);
		-- print("Resetting Arc to: " .. originalRange);

		SetCVar( "SoftTargetInteractArc", originalArc );
		SetCVar( "SoftTargetInteractRange", originalRange );
	end
end
frame:SetScript("OnEvent", eventHandler);
