--+==========================================================+--
--|          ESX Minecraft Inspired Crafting System          |--
--|                        by Akkariin                       |--
--+==========================================================+--

fx_version  "cerulean"
games       { 'gta5' }
author      "Akkariin"
description "ESX Minecraft inspired crafting system"
version     "1.0.3"
ui_page     "client/html/index.html"

files {
    'client/html/index.html',
    'client/html/js/*.js',
    'client/html/css/*.css',
    'client/html/fonts/*.eot',
    'client/html/fonts/*.svg',
    'client/html/fonts/*.ttf',
    'client/html/fonts/*.woff',
    'client/html/fonts/*.woff2',
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
