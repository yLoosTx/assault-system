config = {
    ["wantedLevel"] = 2, -- Quantida de estrelas que o player vai receber após o assalto
    ["aclPolice"] = "Policia", -- Acl da policia
    ["delayAssault"] = 10000, ["delayRestore"] = 20000, -- [1] Delay que o player fica roubando | [2] Delay para ficar disponivel para assalto novamente
    ["timeWanted"] = 2, -- Tempo que o player fica procurado
    ["rewards"] = {
        ["min"] = 5000, ["max"] = 10000, -- Quantidade minima/maxima que o player recebe no assalto
        ["type"] = false, -- False para dinheiro do jogo | True item no inventario
        ["itemId"] = 4 -- Item dinheiro sujo/dinheiro do seu servidor
    },
}

notify = {
    ["type"] = {
        ["success"] = "success",
        ["error"] = "error",
        ["info"] = "info",
        ["warning"] = "warning",
    },
    ["server"] = function(source, type, message)
        exports["s_infobox"]:addInsInfobox(source, message, type) -- Exports da sua notify
    end,
}

inventory = {
    ['giveItem'] = function(player, item, quantidade)
		return exports['cyber_inventory']:giveItem(player, item, quantidade) -- Exports do inventario
	end,
}

robberyLocation = {
    ["robbery"] = {
        ["name"] = "Loja da marilene", -- Nome da loja
        ["blipId"] = 17, ["blipId2"] = 20, -- [1] Blip quando está liberado o roubo | [2] Blip quando está roubado
        ["vaultId"] = 2332, ["vaultId2"] = 1829, -- [1] Id do cofre fechado | [2] Id do cofre aberto
        ["pos"] = {x=1540.65076, y=726.56012, z=10.82031}, -- Posição do cofre / blip
        ["rotate"] = Vector3(0, 0, 270) -- Rotação do cofre
    },

    --[[
        Exemplo para criar outro local de assalto

        ["robbery2"] = {
        ["name"] = "Loja do claudiao", -- Nome da loja
        ["blipId"] = 17, ["blipId2"] = 20, -- [1] Blip quando está liberado o roubo | [2] Blip quando está roubado
        ["vaultId"] = 2332, ["vaultId2"] = 1829, -- [1] Id do cofre fechado | [2] Id do cofre aberto
        ["pos"] = {x=1450.34082, y=726.43805, z=10.82031}, -- Posição do cofre / blip
        ["rotate"] = Vector3(0, 0, 270) -- Rotação do cofre
    },
    
    ]]
}