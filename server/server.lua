--+==========================================================+--
--|          ESX Minecraft Inspired Crafting System          |--
--|                        by Akkariin                       |--
--+==========================================================+--

ESX = nil

while ESX == nil do TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) end

-- Callbacks

ESX.RegisterServerCallback("esx_minecraft:getItems", function(source, cb)
    cb(ESX.Items)
end)

ESX.RegisterServerCallback("esx_minecraft:getInventory", function(source, cb, posX, posY)
    local xPlayer   = ESX.GetPlayerFromId(source)
    local items     = {}
    local inventory = xPlayer.getInventory()
    for i, item in ipairs(inventory) do
        if item.count > 0 and item.canRemove then
            if Config.legacyEsx then
                table.insert(items, {
                    label     = item.label,
                    amount    = item.count,
                    limit     = item.limit,
                    name      = item.name,
                    usable    = item.usable,
                    rare      = item.rare,
                })
            else
                table.insert(items, {
                    label     = item.label,
                    amount    = item.count,
                    weight    = item.weight,
                    name      = item.name,
                    usable    = item.usable,
                    rare      = item.rare,
                })
            end
        end
    end
    cb(items)
end)

ESX.RegisterServerCallback("esx_minecraft:getItem", function(source, cb, craftTable)
    local xPlayer   = ESX.GetPlayerFromId(source)
    local canCraft  = true
    local totalItem = {}
    for k, v in pairs(craftTable) do
        if totalItem[v.name] == nil then
            totalItem[v.name] = v.amount
        else
            totalItem[v.name] = totalItem[v.name] + v.amount
        end
    end
    for k, v in pairs(totalItem) do
        local item = xPlayer.getInventoryItem(k)
        if item.count < v then
            canCraft = false
        end
    end
    if canCraft then
        local craft   = CalculateCraft(craftTable)
        if craft ~= nil then
            if not CanPlayerCarryItem(xPlayer, craft.item, craft.amount) then
                cb({
                    success = false,
                    message = _U("INV_FULL")
                })
            else
                for k, v in pairs(craft.craft) do
                    if v ~= nil then
                        DebugPrint("remove item: " .. v.name .. " amount: " .. math.floor(v.amount * craft.amount))
                        xPlayer.removeInventoryItem(v.name, math.floor(v.amount * craft.amount))
                    end
                end
                DebugPrint("add item: " .. craft.item .. " amount: " .. craft.amount)
                xPlayer.addInventoryItem(craft.item, craft.amount)
                local label = xPlayer.getInventoryItem(craft.item).label
                cb({
                    success = true,
                    item    = craft.item,
                    label   = label,
                    amount  = craft.amount
                })
            end
        else
            cb({
                success = false,
                message = _U("INVALID_CRAFT")
            })
        end
    else
        cb({
            success = false,
            message = _U("NOT_ENOUGH_ITEM")
        })
    end
end)

-- Functions

function CanPlayerCarryItem(xPlayer, name, amount)
    if Config.legacyEsx then
        local item = xPlayer.getInventoryItem(name)
        if item.limit ~= -1 and item.count + amount > item.limit then
            return false
        end
        return true
    else
        return xPlayer.canCarryItem(name, amount)
    end
end

function CalculateCraft(craftTable)
    local matchItems = nil
    local matchAmount = 0
    for _, craft in pairs(Crafts) do
        local allowCraft = Config.maxCraft
        local passSlots  = 0
        local needSlots  = 0
        local shouldRemove = {}
        for i, item in pairs(craft.input) do
            if item ~= nil then
                needSlots = needSlots + 1
            end
            craftItem = craftTable[Int2Grid(i)]
            if craftItem ~= nil and craftItem.name == item.name then
                local canCraft = 0
                if craftItem.amount >= item.amount then
                    passSlots = passSlots + 1
                    canCraft = math.floor(craftItem.amount / item.amount)
                end
                if allowCraft > canCraft then
                    allowCraft = canCraft
                end
            end
        end
        DebugPrint("slot-test", passSlots, needSlots, allowCraft, canCraft)
        if passSlots == needSlots then
            local allowAmount = math.floor(allowCraft * craft.output.amount)
            DebugPrint("match! item:", craft.output.item, "amount:", allowAmount)
            if #craft.input >= matchAmount then
                matchAmount = #craft.input
                matchItems = {
                    item   = craft.output.item,
                    amount = allowAmount,
                    craft  = craft.input,
                }
            end
        end
    end
    return matchItems
end

function Int2Grid(int)
    local grid = {"1-1", "1-2", "1-3", "2-1", "2-2", "2-3", "3-1", "3-2", "3-3"}
    return grid[int]
end

function DebugPrint(text)
    if Config.debug then
        print(text)
    end
end
