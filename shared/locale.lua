--+==========================================================+--
--|          ESX Minecraft Inspired Crafting System          |--
--|                        by Akkariin                       |--
--+==========================================================+--

Locales = {
    ["zh-CN"] = {
        ['COMMAND_DESC']    = '打開合成台',
        ['ERROR_TITLE']     = '发生错误',
        ['ERROR_NOENOUTH']  = '你没有足够的 %s',
        ['CRAFT_SUCCESS']   = '成功合成',
        ['CRAFT_DESC']      = '成功合成了 %s x%d',
        ['CRAFT_FAILED']    = '合成失败',
        ['INV_FULL']        = '你無法再攜帶更多此物品了',
        ['INVALID_CRAFT']   = '你無法這樣製作',
        ['NOT_ENOUGH_ITEM'] = '沒有足夠的材料進行製作',
    },
    ["en-US"] = {
        ['COMMAND_DESC']    = 'Open crafting table',
        ['ERROR_TITLE']     = 'Error',
        ['ERROR_NOENOUTH']  = 'You don\'t have enough %s',
        ['CRAFT_SUCCESS']   = 'Craft Success',
        ['CRAFT_DESC']      = 'Successful crafting %s x%d',
        ['CRAFT_FAILED']    = 'Craft Failed',
        ['INV_FULL']        = 'You cannot carry more of this item',
        ['INVALID_CRAFT']   = 'You crafting is invalid',
        ['NOT_ENOUGH_ITEM'] = 'You don\'t have enough items to craft',
    },
}

function _U(label)
    return Locales[Config.locale][label] or label .. " (missing)"
end

function _UF(label, ...)
    if Locales[Config.locale][label] then
        return string.format(Locales[Config.locale][label], ...)
    else
        return label .. " (missing)"
    end
end
