--+==========================================================+--
--|          ESX Minecraft Inspired Crafting System          |--
--|                        by Akkariin                       |--
--+==========================================================+--

fx_version  "cerulean"
games       { 'gta5' }
author      "Akkariin"
description "ESX Minecraft inspired crafting system"
version     "1.0.0"
ui_page     "client/html/index.html"

files {
    'client/html/index.html',
    'client/html/main.js',
    'client/html/main.css',
    'client/html/items/*.png',
    'client/html/items/*.jpg',
    'client/html/items/*.gif',
}

shared_scripts {
    'config.lua',
    'shared/locale.lua',
    'shared/crafts.lua',
}

client_scripts {
    'client/client.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/server.lua',
}

exports {
    'SetChestDisplay',
    'SetInventory',
    'SetInventoryDisplay',
    'SetGrid',
    'RemoveGrid',
    'SetResultGrid',
    'RemoveResultGrid',
    'CleanUpGrid',
    'GetItem',
}
