usingKeyPress = false
togKey = 38 -- E

function ShowInfo(text)
          BeginTextCOmmandThefeedPost("STRING")
          AddTextComponentSubstringPlayerName(text)
          EndTextCOmmandThefeedPostTicker(false, false)
end

RegisterCommand("trunk", function(source, args raw)
  local ped = GetPlayerPed(-1)
  local veh = GetVehiclePedIsUsing(ped)
  local vehLast = GetPlayersLastVehicle
  local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(vehLast), 1)
  
  if IsPedInAnyVehicle(ped, false) then
   if GetVehicleDoorAngleRatio(veh,door) > 0 then 
   SetVehicleDoorShut(veh, door, false)
   ShowInfo("[Vehicle] ~g~Takalaatikko suljettu.")
   else
   SetVehicleDoorOpen(veh, door, false, false)
   ShowInfo("[Vehicle] ~g~Takalaatikko Avattu.")
   end
   else
      if distanceToVeh < 6 then 
       if GetVehicleDoorAngleRatio(vehLast, door) > 0 then
       SetVehicleDoorShut(vehLast, door, false)
        ShowInfo("[Vehicle]~g~Takalaatikko Suljettu.")
                                                   else
                SetVehicleDoorOpen(vehLast, door, false, false)
                ShowInfo("[Vehicle] ~g~Takaluukku avattu.")
            end
        else
            ShowInfo("[Vehicle] ~y~Olet Liian Kaukana Autosta.")
        end
    end
end)

RegisterCommand("hood", function(source, args, raw)
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsUsing(ped)
    local vehLast = GetPlayersLastVehicle()
    local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(vehLast), 1)
    local door = 4

    if IsPedInAnyVehicle(ped, false) then
        if GetVehicleDoorAngleRatio(veh, door) > 0 then
            SetVehicleDoorShut(veh, door, false)
            ShowInfo("[Vehicle] ~g~Konepelti Suljettu.")
        else	
            SetVehicleDoorOpen(veh, door, false, false)
            ShowInfo("[Vehicle] ~g~Konepelti Avattu")
        end
    else
        if distanceToVeh < 4 then
            if GetVehicleDoorAngleRatio(vehLast, door) > 0 then
                SetVehicleDoorShut(vehLast, door, false)
                ShowInfo("[Vehicle] ~g~Konepelti Suljettu .")
            else	
                SetVehicleDoorOpen(vehLast, door, false, false)
                ShowInfo("[Vehicle] ~g~Konepelti avattu.")
            end
        else
            ShowInfo("[Vehicle] ~y~Olet Liian Kaukana Autosta")
        end
    end
end)

RegisterCommand("door", function(source, args, raw)
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsUsing(ped)
    local vehLast = GetPlayersLastVehicle()
    local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(vehLast), 1)
    
    if args[1] == "1" then -- Etu Vasen ovi
        door = 0
    elseif args[1] == "2" then -- Etu oikea ovi
        door = 1
    elseif args[1] == "3" then -- Taka Vasen ovi
        door = 2
    elseif args[1] == "4" then -- Taka Oikea Ovi
        door = 3
    else
        door = nil
        ShowInfo("Käyttö: ~n~~b~/door [door]")
        ShowInfo("~y~Mahdolliset ovet:")
        ShowInfo("1: Etu Vasen Ovi~n~2: Etu Oikea Ovi")
        ShowInfo("3: Taka Vasen Ovi~n~4: Taka Oikea Ovi")
    end

    if door ~= nil then
        if IsPedInAnyVehicle(ped, false) then
            if GetVehicleDoorAngleRatio(veh, door) > 0 then
                SetVehicleDoorShut(veh, door, false)
                ShowInfo("[Vehicle] ~g~Ovi Suljettu.")
            else	
                SetVehicleDoorOpen(veh, door, false, false)
                ShowInfo("[Vehicle] ~g~Ovi Avattu.")
            end
        else
            if distanceToVeh < 4 then
                if GetVehicleDoorAngleRatio(vehLast, door) > 0 then
                    SetVehicleDoorShut(vehLast, door, false)
                    ShowInfo("[Vehicle] ~g~Ovi Suljettu.")
                else	
                    SetVehicleDoorOpen(vehLast, door, false, false)
                    ShowInfo("[Vehicle] ~g~Ovi Avattu.")
                end
            else
                ShowInfo("[Vehicle] ~y~Olet Liian Kaukana Autosta")
            end
        end
    end
end)

if usingKeyPress then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(10)
            local ped = GetPlayerPed(-1)
            local veh = GetVehiclePedIsUsing(ped)
            local vehLast = GetPlayersLastVehicle()
            local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(vehLast), 1)
            local door = 5
            if IsControlPressed(1, 224) and IsControlJustPressed(1, togKey) then
                if not IsPedInAnyVehicle(ped, false) then
                    if distanceToVeh < 4 then
                        if GetVehicleDoorAngleRatio(vehLast, door) > 0 then
                            SetVehicleDoorShut(vehLast, door, false)
                            ShowInfo("[Vehicle] ~g~Takalaatikko Suljettu.")
                        else	
                            SetVehicleDoorOpen(vehLast, door, false, false)
                            ShowInfo("[Vehicle] ~g~Takalaatikko Avattu.")
                        end
                    else
                        ShowInfo("[Vehicle] ~y~Olet liian kaukana autosta")
                    end
                end
            end
        end
    end)
end

