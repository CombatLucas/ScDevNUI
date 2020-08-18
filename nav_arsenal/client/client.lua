
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

inMenu                      = true
local Menu = true
local player = PlayerPedId()

local arsenal = {
	{ 451.44,-979.94,30.69 },
	{ 118.93510437012,-729.29010009766,242.1519317627 },
	{ 108.97888183594,-745.29138183594,242.15213012695 }
}

if Menu then
	Citizen.CreateThread(function()
	while true do
		Wait(0)
		for _,lugares in pairs(arsenal) do
			local x,y,z = table.unpack(lugares)
			local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),x,y,z,true)
			DrawMarker(25,x,y+0.33,z-0.90,0,0,0,0,180.0,130.0,2.0,2.0,1.0,25,25,122,50,0,0,0,0)
			if distance <= 2 then
				if IsControlJustPressed(0, 51) then
					TriggerServerEvent('crz_arsenal:permissao')
				end
			end
		end
	end
		if IsControlJustPressed(1, 3) then
		  inMenu = false
		  SetNuiFocus(false)
		  SendNUIMessage({type = 'close'})
		end
	end)
end

RegisterNetEvent('crz_arsenal:permissao')
AddEventHandler('crz_arsenal:permissao',function()
	inMenu = true
	SetNuiFocus(true, true)
	SendNUIMessage({type = 'openGeneral'})
end)


RegisterNUICallback('NUIFocusOff', function()
  inMenu = false
  SetNuiFocus(false)
  SendNUIMessage({type = 'closeAll'})
end)

RegisterNUICallback('Cerveja', function()
	local ped = PlayerPedId()
		SetPedAmmo(ped,GetHashKey("WEAPON_COMBATPISTOL"),0)
		RemoveWeaponFromPed(ped,GetHashKey("WEAPON_COMBATPISTOL"))
		GiveWeaponToPed(ped,GetHashKey("WEAPON_COMBATPISTOL"),300,0,1)
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_COMBATPISTOL"),GetHashKey("COMPONENT_AT_PI_FLSH"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_COMBATPISTOL"),GetHashKey("COMPONENT_COMBATPISTOL_CLIP_02"))
end)
RegisterNUICallback('Taco', function()
	local ped = PlayerPedId()
	GiveWeaponToPed(ped,GetHashKey("WEAPON_STUNGUN"),0,0,0)
end)
RegisterNUICallback('Vodka', function()
	local ped = PlayerPedId()
	SetPedAmmo(ped,GetHashKey("WEAPON_REVOLVER_MK2"),0)
	RemoveWeaponFromPed(ped,GetHashKey("WEAPON_REVOLVER_MK2"))
	GiveWeaponToPed(ped,GetHashKey("WEAPON_REVOLVER_MK2"),180,0,1)
end)
RegisterNUICallback('Donut', function()
	TriggerServerEvent('crz_arsenal:colete')
	print('a')
end)
RegisterNUICallback('Conhaque', function()
	local ped = PlayerPedId()
		SetPedAmmo(ped,GetHashKey("WEAPON_COMBATPDW"),0)
		RemoveWeaponFromPed(ped,GetHashKey("WEAPON_COMBATPDW"))
		GiveWeaponToPed(ped,GetHashKey("WEAPON_COMBATPDW"),600,0,1)
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_COMBATPDW"),GetHashKey("COMPONENT_COMBATPDW_CLIP_02"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_COMBATPDW"),GetHashKey("COMPONENT_AT_AR_FLSH"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_COMBATPDW"),GetHashKey("COMPONENT_AT_SCOPE_SMALL"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_COMBATPDW"),GetHashKey("COMPONENT_AT_AR_AFGRIP"))
end)
RegisterNUICallback('DonutX', function()
	local ped = PlayerPedId()
	GiveWeaponToPed(ped,GetHashKey("WEAPON_NIGHTSTICK"),0,0,0)
end)
RegisterNUICallback('Whisky', function()
	local ped = PlayerPedId()
		SetPedAmmo(ped,GetHashKey("WEAPON_PUMPSHOTGUN_MK2"),0)
		RemoveWeaponFromPed(ped,GetHashKey("WEAPON_PUMPSHOTGUN_MK2"))
		GiveWeaponToPed(ped,GetHashKey("WEAPON_PUMPSHOTGUN_MK2"),50,0,1)
end)
RegisterNUICallback('Hamburguer', function()
	local ped = PlayerPedId()
	GiveWeaponToPed(ped,GetHashKey("WEAPON_FLASHLIGHT"),0,0,0)
end)
RegisterNUICallback('Tequila', function()
local ped = PlayerPedId()
SetPedAmmo(ped,GetHashKey("WEAPON_CARBINERIFLE"),0)
RemoveWeaponFromPed(ped,GetHashKey("WEAPON_CARBINERIFLE"))
GiveWeaponToPed(ped,GetHashKey("WEAPON_CARBINERIFLE"),600,0,1)
GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_CARBINERIFLE"),GetHashKey("COMPONENT_CARBINERIFLE_CLIP_02"))
GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_CARBINERIFLE"),GetHashKey("COMPONENT_AT_AR_FLSH"))
GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_CARBINERIFLE"),GetHashKey("COMPONENT_AT_SCOPE_MEDIUM"))
GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_CARBINERIFLE"),GetHashKey("COMPONENT_AT_AR_AFGRIP"))
end)
RegisterNUICallback('HotDog', function()
	local ped = PlayerPedId()
	GiveWeaponToPed(ped,GetHashKey("WEAPON_FIREEXTINGUISHER"),25000,0,1)
end)
RegisterNUICallback('Salmao', function()
	local ped = PlayerPedId()
	RemoveAllPedWeapons(ped,true)
end)