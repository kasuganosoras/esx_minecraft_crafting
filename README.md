# ESX Minecraft Crafting
A Minecraft inspired crafting system for FiveM ESX framework

![image](https://user-images.githubusercontent.com/34357771/169701979-2f193285-c4af-45ee-b94f-3873ba208740.png)

## Features

- Crafting items
- Custom crafting recipe
- Optimized

## Installation

### Using YumV
```bash
yum install esx_minecraft_crafting
```

### Using Git
```bash
git clone https://github.com/kasuganosoras/esx_minecraft_crafting
```

### Manually

- Download from [Github Releases](https://github.com/kasuganosoras/esx_minecraft_crafting/releases)
- Extract the file to your server `resources` directory
- Add `ensure esx_minecraft_crafting` to your `server.cfg` file.
- Restart your FiveM server

## Using

For default configuration, you can press <kbd>F10</kbd> to open the crafting table.

You can change the key in the `config.lua`.

## Configuration

- Common: [config.lua](https://github.com/kasuganosoras/esx_minecraft_crafting/blob/main/config.lua)
- Crafting recipe: [shared/crafts.lua](https://github.com/kasuganosoras/esx_minecraft_crafting/blob/main/shared/crafts.lua)
- Locales: [shared/locale.lua](https://github.com/kasuganosoras/esx_minecraft_crafting/blob/main/shared/locale.lua)
- NUI Locales: [client/html/main.js](https://github.com/kasuganosoras/esx_minecraft_crafting/blob/main/client/html/main.js)

## Crafting recipe

Example recipe:
```lua
{
    -- Items to input
    input = {
        nil,                          -- Grid 1-1, use nil for no item
        {name = "scrap", amount = 1}, -- Grid 1-2, item name and amount
        nil,                          -- Grid 1-3
        {name = "scrap", amount = 1}, -- Grid 2-1
        {name = "scrap", amount = 1}, -- Grid 2-2
        {name = "scrap", amount = 1}, -- Grid 2-3
        nil,                          -- Grid 3-1
        {name = "scrap", amount = 1}, -- Grid 3-2
        nil,                          -- Grid 3-3
    },
    -- Crafting result
    output = {
        item = "fixkit", -- Item name
        amount = 1,      -- Item amount
    }
}
```

## Legal

License

esx_minecraft_crafting - A Minecraft inspired crafting system for FiveM ESX framework

Copyright (C) 2022 Akkariin

This program Is free software: you can redistribute it And/Or modify it under the terms Of the GNU General Public License As published by the Free Software Foundation, either version 3 Of the License, Or (at your option) any later version.

This program Is distributed In the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty Of MERCHANTABILITY Or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License For more details.

You should have received a copy Of the GNU General Public License along with this program. If Not, see http://www.gnu.org/licenses/.
