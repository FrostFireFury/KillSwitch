local vehicleLights = {}

function ToggleLights()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if DoesEntityExist(vehicle) and not IsEntityDead(vehicle) then
        local lightsOn = not vehicleLights[vehicle]
        vehicleLights[vehicle] = lightsOn

        if lightsOn then
            SetVehicleLights(vehicle, 2)
            SetVehicleInteriorlight(vehicle, true)
        else
            SetVehicleLights(vehicle, 1)
            SetVehicleInteriorlight(vehicle, false)
        end

        local brakeLightsDisabled = not lightsOn
        SetVehicleBrakeLights(vehicle, not brakeLightsDisabled)
        SetVehicleReverseLights(vehicle, not brakeLightsDisabled)
    end
end

RegisterCommand("killswitch", function(source, args, rawCommand)
    ToggleLights()
end, false)
