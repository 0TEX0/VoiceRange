---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by 0TEX0.
--- DateTime: 09/06/2023 23:35
---

local voiceMarkerActive = false
local newSize = 0

local function voiceRangeMarker(markerSize)
    if not voiceMarkerActive then 
        voiceMarkerActive = true 
        newSize = markerSize
        Citizen.SetTimeout(2000, function()
            voiceMarkerActive = false
        end)
    else
        newSize = markerSize
        return 
    end 
    while voiceMarkerActive do 
        local playerCoords = GetEntityCoords(PlayerPedId())
        DrawMarker(1, playerCoords.x, playerCoords.y, playerCoords.z -1.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, newSize, newSize, 1.0, 255, 255, 255, 200, false, false, 2, nil, nil, false)
        Wait(0)
    end
end

AddEventHandler("pma-voice:setTalkingMode", function(voiceRange)
    if voiceRange == 1 then 
        ESX.ShowNotification("Vous êtes en train de ~b~chuchoter~s~")
        voiceRangeMarker(2.5)
    elseif voiceRange == 2 then 
        ESX.ShowNotification("Vous êtes en train de ~b~parler~s~")
        voiceRangeMarker(7.0)
    elseif voiceRange == 3 then 
        ESX.ShowNotification("Vous êtes en train de ~b~crier~s~")
        voiceRangeMarker(15.0)
    end
end)
