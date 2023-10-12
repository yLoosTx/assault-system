for i, robberyItem in pairs(robberyLocation) do
    robberyLocation[i]["blip"] = createBlip(robberyItem["pos"].x, robberyItem["pos"].y, robberyItem["pos"].z, robberyItem["blipId"])
    robberyLocation[i]["blip2"] = createBlip(robberyItem["pos"].x, robberyItem["pos"].y, robberyItem["pos"].z, robberyItem["blipId2"])

    robberyLocation[i]["vault"] = createObject(robberyItem["vaultId"], robberyItem["pos"].x, robberyItem["pos"].y, robberyItem["pos"].z, robberyItem["rotate"])
    robberyLocation[i]["vault2"] = createObject(robberyItem["vaultId2"], robberyItem["pos"].x, robberyItem["pos"].y, robberyItem["pos"].z, robberyItem["rotate"])

    robberyLocation[i]["marker"] = createMarker(robberyItem["pos"].x, robberyItem["pos"].y, robberyItem["pos"].z, "cylinder", 2, 0, 0, 0, 255)

    setElementVisibleTo(robberyLocation[i]["blip2"], root, false)

    setElementAlpha(robberyLocation[i]["vault2"], 0)
end

function isRoubed(robbery, roubed)
    if roubed then
        setElementAlpha(robberyLocation[robbery]["vault"], 0)
        setElementAlpha(robberyLocation[robbery]["vault2"], 255)

        setElementVisibleTo(robberyLocation[robbery]["blip"], root, false)
        setElementVisibleTo(robberyLocation[robbery]["blip2"], root, true)

        setMarkerSize(robberyLocation[robbery]["marker"], 0)

    else
        setElementAlpha(robberyLocation[robbery]["vault2"], 0)
        setElementAlpha(robberyLocation[robbery]["vault"], 255)

        setElementVisibleTo(robberyLocation[robbery]["blip2"], root, false)
        setElementVisibleTo(robberyLocation[robbery]["blip"], root, true)

        setMarkerSize(robberyLocation[robbery]["marker"], 2)
    end
end

function assaultNotification(source)
    notify["server"](source, notify["type"]["info"], 'Para iniciar o assalto digite /roubar')
end
for p, robberyMsg in pairs(robberyLocation) do
    addEventHandler("onMarkerHit", robberyLocation[p]["marker"], assaultNotification)
end

function startRobbery(source)
    if source then
        for r, robbery in pairs(robberyLocation) do
            if isElementWithinMarker(source, robberyLocation[r]["marker"]) then
                local weapon = getPedWeapon(source)
                if weapon == 0 then
                    notify["server"](source, notify["type"]["error"], 'Você está desarmado, e necessario uma arma para assaltar')
                    return
                elseif isPedInVehicle(source) then
                    notify["server"](source, notify["type"]["error"], 'Você não pode roubar estando em um veículo')
                    return
                elseif getPlayerWantedLevel(source) >= 1 then
                    notify["server"](source, notify["type"]["error"], 'Você não pode roubar uma loja enquanto estiver procurado')
                    return
                else
                    isRoubed(r, true)

                    local bag = createObject(1550, 0, 0, -1000)

                    notify["server"](source, notify["type"]["success"], 'Você está iniciando o assalto. Aguarde')
                    
                    toggleAllControls(source, false)
                    setElementFrozen(source, true)
                    setPedAnimation(source, "ROB_BANK", "CAT_Safe_Rob", -1, true, false, false, false)
                
                    for police, player in ipairs(getElementsByType("player")) do
                        if isObjectInACLGroup("user." ..getAccountName(getPlayerAccount(player)), aclGetGroup(config["aclPolice"])) then
                            notify["server"](source, notify["type"]["warning"], 'Atenção assalto em andamento na '..robbery["name"]..', blip vermelho no mapa!!')
                        end
                    end

                    setTimer(function(source)
                        local reward = math.random(config["rewards"]["min"], config["rewards"]["max"])
                        local rewardType = config["rewards"]["type"]

                        if rewardType then
                            inventory["giveItem"](source, config["rewards"]["itemId"], reward)
                            notify["server"](source, notify["type"]["success"], 'Roubo concluido com sucesso total ganho R$'..reward)
                        else
                            setPlayerMoney(source, getPlayerMoney(source) + reward)
                            notify["server"](source, notify["type"]["success"], 'Roubo concluido com sucesso total ganho R$'..reward)
                        end

                        triggerClientEvent(source, "onClientStartCountDown", source)
                        setPlayerWantedLevel(source, config["wantedLevel"])
                        setElementFrozen(source, false)
                        setPedAnimation(source)
                        toggleAllControls(source, true)

                        exports.bone_attach:attachElementToBone(bag, source, 2, 0, -0.25, -0.2, 20, 0, 0)
                    end, config["delayAssault"], 1, source)

                    setTimer(function(source)
                        if isElement(bag) then
                            destroyElement(bag)
                        end
                        isRoubed(r, false)
                    end, config["delayRestore"], 1, source)
                end
            end
        end
    end
end
addCommandHandler("roubar", startRobbery)

function removeWanted(source)
    setPlayerWantedLevel(source, 0)
    notify["server"](source, notify["type"]["success"], 'Roubo concluido com sucesso, você não esta mais procurado')
end
addEvent("onServerRemoveWanted", true)
addEventHandler("onServerRemoveWanted", root, removeWanted)

addCommandHandler("reset", function(source)
    setPlayerWantedLevel(source, 0)
    setPlayerMoney(source, 0)
end)