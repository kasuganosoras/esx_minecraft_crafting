--+==========================================================+--
--|          ESX Minecraft Inspired Crafting System          |--
--|                        by Akkariin                       |--
--+==========================================================+--

ESX = nil
_g  = {
    onCraftTable = {},
    itemsList    = {},
}

-- Register commands and key binds

if Config.enableCmd then
    RegisterCommand("craft", function(source, args, rawCommand)
        SetChestDisplay(true)
    end, false)
end

if Config.enableKey then
    RegisterKeyMapping('craft', _U("COMMAND_DESC"), 'keyboard', Config.keybind)
end

-- Nui events

RegisterNUICallback('event', function(data, cb)
    if data.action == "closeUI" then
        if _g.inventoryDisplay then
            SetInventoryDisplay(false)
        elseif _g.chestDisplay then
            SetChestDisplay(false)
            CleanUpGrid()
        else
            SetInventoryDisplay(false)
            SetChestDisplay(false)
            SetNuiFocus(false, false)
            CleanUpGrid()
        end
    elseif data.action == "putItem" then
        PutItem(data.item, data.amount, data.label)
    elseif data.action == "selectItem" then
        SelectItem(data.posX, data.posY)
    elseif data.action == "removeItem" then
        RemoveGrid(data.posX, data.posY)
    elseif data.action == "getItem" then
        GetItem()
    end
    cb('ok')
end)

-- Main thread

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
    ESX.TriggerServerCallback("esx_minecraft:getItems", function(items)
        _g.itemsList = items
    end)
end)

-- Functions

function SelectItem(x, y)
    DebugPrint(x, y)
    TriggerEvent('esx_minecraft:selectItem', x, y)
    if _g.onCraftTable[x .. "-" .. y] ~= nil then
        RemoveGrid(x, y)
        local craft = CalculateCraft()
        if craft ~= nil then
            _g.currentCraft = craft
            SetResultGrid(craft.item, craft.amount)
        else
            _g.currentCraft = nil
            RemoveResultGrid()
        end
    else
        _g.currentX = x
        _g.currentY = y
        ESX.TriggerServerCallback('esx_minecraft:getInventory', function(inventory)
            if inventory ~= nil then
                local newInventory = {}
                for k, v in pairs(inventory) do
                    for _, item in pairs(_g.onCraftTable) do
                        if item.name == v.name then
                            DebugPrint("found, ", v.amount, item.amount)
                            v.amount = v.amount - item.amount
                            if v.amount <= 0 then
                                break
                            end
                        end
                    end
                    if v.amount > 0 then
                        table.insert(newInventory, v)
                    end
                end
                SetInventory(newInventory)
                SetInventoryDisplay(true)
            end
        end, _g.currentX, _g.currentY)
    end
end

function PutItem(name, amount, label)
    local posX  = _g.currentX
    local posY  = _g.currentY
    TriggerEvent('esx_minecraft:putItem', posX, posY, name, amount, label)
    if posX ~= nil and posY ~= nil then
        if IsPlayerHasEnoughItem(name, amount) then
            local item = {
                name = name,
                amount = amount,
                label = label,
            }
            SetGrid(posX, posY, name, amount, label)
            SetInventoryDisplay(false)
            local craft = CalculateCraft()
            if craft ~= nil then
                _g.currentCraft = craft
                SetResultGrid(craft.item, craft.amount, craft.label)
            else
                _g.currentCraft = nil
                RemoveResultGrid()
            end
            return true
        else
            SwalAlert({
                icon = "error",
                title = _U("ERROR_TITLE"),
                text = _UF("ERROR_NOENOUTH", label)
            })
            return false
        end
    end
    return false
end

function InitLocale()
    _g.localeInitlized = true
    ControlNui("setLocale", {locale = Config.locale})
    ControlNui("setEntryPoint", {entryPoint = string.format("https://%s/event", GetCurrentResourceName())})
end

function SetChestDisplay(status)
    if not _g.localeInitlized then
        InitLocale()
    end
    _g.chestDisplay = status
    ControlNui("setChestDisplay", {status = status})
    SetNuiFocus(status, status)
    TriggerEvent('esx_minecraft:setChestDisplay', status)
end

function SetInventory(inventory)
    _g.playerInventory = inventory
    ControlNui("setInventory", {inventory = inventory})
    TriggerEvent('esx_minecraft:setInventory', inventory)
end

function SetInventoryDisplay(status)
    _g.inventoryDisplay = status
    ControlNui("setInventoryDisplay", {status = status})
    TriggerEvent('esx_minecraft:setInventoryDisplay', status)
end

function IsPlayerHasEnoughItem(item, amount)
    for _, v in pairs(_g.playerInventory) do
        if v.name == item then
            if v.amount >= tonumber(amount) then
                return true
            end
        end
    end
    return false
end

function RemoveGrid(x, y)
    if x ~= nil and y ~= nil then
        _g.onCraftTable[x .. "-" .. y] = nil
        ControlNui("removeGrid", {x = x, y = y})
    end
    TriggerEvent('esx_minecraft:removeGrid', x, y)
end

function SetGrid(x, y, item, amount, label)
    _g.onCraftTable[x .. "-" .. y] = {
        name = item,
        amount = tonumber(amount)
    }
    ControlNui("setGrid", {x = x, y = y, item = item, amount = amount, label = label})
    TriggerEvent('esx_minecraft:setGrid', x, y, item, amount, label)
end

function SetResultGrid(item, amount, label)
    ControlNui("setResultGrid", {item = item, amount = amount, label = label})
    TriggerEvent('esx_minecraft:setResultGrid', item, amount, label)
end

function RemoveResultGrid()
    ControlNui("removeResultGrid")
    TriggerEvent('esx_minecraft:removeResultGrid')
end

function CleanUpGrid()
    for k, v in pairs(_g.onCraftTable) do
        local x = string.sub(k, 1, string.find(k, "-") - 1)
        local y = string.sub(k, string.find(k, "-") + 1)
        RemoveGrid(x, y)
    end
    RemoveResultGrid()
end

function GetItem()
    ESX.TriggerServerCallback("esx_minecraft:getItem", function(result)
        if result.success then
            SwalAlert({
                icon = "success",
                title = _U("CRAFT_SUCCESS"),
                text = _UF("CRAFT_DESC", result.label, result.amount)
            })
            CleanUpGrid()
        else
            SwalAlert({
                icon = "error",
                title = _U("CRAFT_FAILED"),
                text = result.message
            })
        end
        TriggerEvent('esx_minecraft:getItem', result)
    end, _g.onCraftTable)
end

function CalculateCraft()
    local matchItems = nil
    local matchAmount = 0
    for _, craft in pairs(Crafts) do
        local allowCraft = Config.maxCraft
        local passSlots  = 0
        local needSlots  = 0
        local wrongSlots = 0
        for i, item in pairs(craft.input) do
            if item ~= nil then
                needSlots = needSlots + 1
            end
            craftItem = _g.onCraftTable[Int2Grid(i)]
            if craftItem ~= nil then
                if craftItem.name == item.name then
                    local canCraft = 0
                    if craftItem.amount >= item.amount then
                        passSlots = passSlots + 1
                        canCraft = math.floor(craftItem.amount / item.amount)
                    end
                    if allowCraft > canCraft then
                        allowCraft = canCraft
                    end
                else
                    wrongSlots = wrongSlots + 1
                end
            end
        end
        DebugPrint("slot-test", passSlots, needSlots, allowCraft, wrongSlots)
        if passSlots == needSlots and wrongSlots == 0 then
            local allowAmount = math.floor(allowCraft * craft.output.amount)
            DebugPrint("match! item:", craft.output.item, "amount:", allowAmount)
            if #craft.input >= matchAmount then
                matchAmount = #craft.input
                matchItems = {
                    item   = craft.output.item,
                    input  = craft.input,
                    amount = allowAmount,
                    label  = GetItemLabel(craft.output.item),
                }
            end
        end
    end
    return matchItems
end

function Int2Grid(int)
    local grid = {"1-1", "1-2", "1-3", "2-1", "2-2", "2-3", "3-1", "3-2", "3-3"}
    DebugPrint("int-grid", int, grid[int])
    return grid[int]
end

function SwalAlert(data)
    ControlNui("swalAlert", data)
end

function ControlNui(action, data)
    SendNUIMessage({
        action = action,
        data = data
    })
end

function GetItemLabel(item)
    if _g.itemsList[item] ~= nil and _g.itemsList[item].label ~= nil then
        return _g.itemsList[item].label
    end
    return item
end

function DebugPrint(text)
    if Config.debug then
        print(text)
    end
end
