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
