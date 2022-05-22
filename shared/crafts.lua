--+==========================================================+--
--|          ESX Minecraft Inspired Crafting System          |--
--|                        by Akkariin                       |--
--+==========================================================+--

-- Example crafting recipe
Crafts = {
    -- 修车包
    {
        input = {
            nil,                          -- 1
            {name = "scrap", amount = 1}, -- 2
            nil,                          -- 3
            {name = "scrap", amount = 1}, -- 4
            {name = "scrap", amount = 1}, -- 5
            {name = "scrap", amount = 1}, -- 6
            nil,                          -- 7
            {name = "scrap", amount = 1}, -- 8
            nil,                          -- 9
        },
        output = {
            item = "fixkit",
            amount = 1,
        }
    },
    -- 低级引擎缸体
    {
        input = {
            nil,                          -- 1
            {name = "scrap", amount = 5}, -- 2
            nil,                          -- 3
            {name = "metal_fragment", amount = 10}, -- 4
            nil, -- 5
            {name = "metal_fragment", amount = 10}, -- 6
            nil,                          -- 7
            {name = "advanced_metal", amount = 1}, -- 8
            nil,                          -- 9
        },
        output = {
            item = "engine_block_lv1",
            amount = 1,
        }
    },
    -- 普通引擎缸体
    {
        input = {
            nil,                          -- 1
            {name = "scrap", amount = 10}, -- 2
            nil,                          -- 3
            {name = "metal_fragment", amount = 20}, -- 4
            nil, -- 5
            {name = "metal_fragment", amount = 20}, -- 6
            nil,                          -- 7
            {name = "advanced_metal", amount = 3}, -- 8
            nil,                          -- 9
        },
        output = {
            item = "engine_block_lv2",
            amount = 1,
        }
    },
    -- 高级引擎缸体
    {
        input = {
            nil,                                    -- 1
            {name = "metal_fragment", amount = 30}, -- 2
            nil,                                    -- 3
            {name = "advanced_metal", amount = 3},  -- 4
            nil,                                    -- 5
            {name = "advanced_metal", amount = 3},  -- 6
            nil,                                    -- 7
            {name = "advanced_metal", amount = 10}, -- 8
            nil,                                    -- 9
        },
        output = {
            item = "engine_block_lv3",
            amount = 1,
        }
    },
    -- 低级活塞
    {
        input = {
            nil,                                    -- 1
            {name = "scrap", amount = 3}, -- 2
            nil,                                    -- 3
            nil,  -- 4
            {name = "metal_fragment", amount = 5},                                    -- 5
            nil,  -- 6
            nil,                                    -- 7
            {name = "scrap", amount = 10},          -- 8
            nil,                                    -- 9
        },
        output = {
            item = "piston_lv1",
            amount = 1,
        }
    },
    -- 普通活塞
    {
        input = {
            nil,                                    -- 1
            {name = "advanced_metal", amount = 1}, -- 2
            nil,                                    -- 3
            nil,  -- 4
            {name = "metal_fragment", amount = 5},                                    -- 5
            nil,  -- 6
            nil,                                    -- 7
            {name = "scrap", amount = 10},          -- 8
            nil,                                    -- 9
        },
        output = {
            item = "piston_lv2",
            amount = 1,
        }
    },
    -- 高级活塞
    {
        input = {
            nil,                                    -- 1
            {name = "advanced_metal", amount = 2}, -- 2
            nil,                                    -- 3
            nil,  -- 4
            {name = "metal_fragment", amount = 8},                                    -- 5
            nil,  -- 6
            nil,                                    -- 7
            {name = "scrap", amount = 12},          -- 8
            nil,                                    -- 9
        },
        output = {
            item = "piston_lv3",
            amount = 1,
        }
    },
    -- 低级火花塞
    {
        input = {
            nil,                                    -- 1
            {name = "scrap", amount = 1}, -- 2
            nil,                                    -- 3
            nil,  -- 4
            {name = "metal_fragment", amount = 2},                                    -- 5
            nil,  -- 6
            nil,                                    -- 7
            nil,          -- 8
            nil,                                    -- 9
        },
        output = {
            item = "spark_lv1",
            amount = 1,
        }
    },
    -- 普通火花塞
    {
        input = {
            nil,                                    -- 1
            {name = "scrap", amount = 3}, -- 2
            nil,                                    -- 3
            nil,  -- 4
            {name = "metal_fragment", amount = 3},                                    -- 5
            nil,  -- 6
            nil,                                    -- 7
            nil,          -- 8
            nil,                                    -- 9
        },
        output = {
            item = "spark_lv2",
            amount = 1,
        }
    },
    -- 高级火花塞
    {
        input = {
            nil,                                    -- 1
            {name = "scrap", amount = 5}, -- 2
            nil,                                    -- 3
            nil,  -- 4
            {name = "metal_fragment", amount = 5},                                    -- 5
            nil,  -- 6
            nil,                                    -- 7
            nil,          -- 8
            nil,                                    -- 9
        },
        output = {
            item = "spark_lv3",
            amount = 1,
        }
    },
    -- 低级化油器
    {
        input = {
            {name = "metal_fragment", amount = 1},                                    -- 1
            {name = "metal_fragment", amount = 2}, -- 2
            {name = "scrap", amount = 2},                                    -- 3
            {name = "metal_fragment", amount = 2},  -- 4
            nil,                                    -- 5
            {name = "metal_fragment", amount = 2},  -- 6
            {name = "scrap", amount = 2},                                    -- 7
            {name = "metal_fragment", amount = 1},          -- 8
            {name = "scrap", amount = 2},                                    -- 9
        },
        output = {
            item = "carburetor_lv1",
            amount = 1,
        }
    },
    -- 普通化油器
    {
        input = {
            {name = "scrap", amount = 2},                                    -- 1
            {name = "metal_fragment", amount = 4}, -- 2
            {name = "scrap", amount = 4},                                    -- 3
            {name = "metal_fragment", amount = 4},  -- 4
            nil,                                    -- 5
            {name = "metal_fragment", amount = 4},  -- 6
            {name = "scrap", amount = 2},                                    -- 7
            {name = "advanced_metal", amount = 2},          -- 8
            {name = "scrap", amount = 2},                                    -- 9
        },
        output = {
            item = "carburetor_lv2",
            amount = 1,
        }
    },
    -- 高级化油器
    {
        input = {
            {name = "scrap", amount = 3},                                    -- 1
            {name = "advanced_metal", amount = 4}, -- 2
            {name = "scrap", amount = 5},                                    -- 3
            {name = "metal_fragment", amount = 4},  -- 4
            nil,                                    -- 5
            {name = "metal_fragment", amount = 4},  -- 6
            {name = "scrap", amount = 5},                                    -- 7
            {name = "advanced_metal", amount = 4},          -- 8
            {name = "scrap", amount = 3},                                    -- 9
        },
        output = {
            item = "carburetor_lv3",
            amount = 1,
        }
    },
    -- 低级曲轴
    {
        input = {
            nil,                                    -- 1
            nil, -- 2
            nil,                                    -- 3
            {name = "metal_fragment", amount = 3},  -- 4
            {name = "scrap", amount = 5},                                    -- 5
            {name = "metal_fragment", amount = 3},  -- 6
            nil,                                    -- 7
            nil,          -- 8
            nil,                                    -- 9
        },
        output = {
            item = "crankshaft_lv1",
            amount = 1,
        }
    },
    -- 普通曲轴
    {
        input = {
            nil,                                    -- 1
            nil, -- 2
            nil,                                    -- 3
            {name = "metal_fragment", amount = 3},  -- 4
            {name = "advanced_metal", amount = 1},                                    -- 5
            {name = "metal_fragment", amount = 3},  -- 6
            nil,                                    -- 7
            nil,          -- 8
            nil,                                    -- 9
        },
        output = {
            item = "crankshaft_lv2",
            amount = 1,
        }
    },
    -- 高级曲轴
    {
        input = {
            nil,                                    -- 1
            nil, -- 2
            nil,                                    -- 3
            {name = "advanced_metal", amount = 1},  -- 4
            {name = "advanced_metal", amount = 3},                                    -- 5
            {name = "advanced_metal", amount = 1},  -- 6
            nil,                                    -- 7
            nil,          -- 8
            nil,                                    -- 9
        },
        output = {
            item = "crankshaft_lv3",
            amount = 1,
        }
    },
    -- 低级气门
    {
        input = {
            nil,                                    -- 1
            {name = "metal_fragment", amount = 1},  -- 2
            nil,                                    -- 3
            nil,  -- 4
            {name = "scrap", amount = 2},                                    -- 5
            nil,  -- 6
            nil,                                    -- 7
            nil,          -- 8
            nil,                                    -- 9
        },
        output = {
            item = "valve_lv1",
            amount = 1,
        }
    },
    -- 普通气门
    {
        input = {
            nil,                                    -- 1
            {name = "scrap", amount = 3},  -- 2
            nil,                                    -- 3
            nil,  -- 4
            {name = "scrap", amount = 3},                                    -- 5
            nil,  -- 6
            nil,                                    -- 7
            nil,          -- 8
            nil,                                    -- 9
        },
        output = {
            item = "valve_lv2",
            amount = 1,
        }
    },
    -- 高级气门
    {
        input = {
            nil,                                    -- 1
            {name = "advanced_metal", amount = 1},  -- 2
            nil,                                    -- 3
            nil,  -- 4
            {name = "scrap", amount = 5},                                    -- 5
            nil,  -- 6
            nil,                                    -- 7
            nil,          -- 8
            nil,                                    -- 9
        },
        output = {
            item = "valve_lv3",
            amount = 1,
        }
    },
    -- 破旧的引擎
    {
        input = {
            {name = "scrap", amount = 3},                                    -- 1
            {name = "valve_lv1", amount = 4}, -- 2
            {name = "spark_lv1", amount = 4},                                    -- 3
            {name = "engine_block_lv1", amount = 1},  -- 4
            {name = "piston_lv1", amount = 4},                                    -- 5
            {name = "carburetor_lv1", amount = 1},  -- 6
            {name = "scrap", amount = 5},                                    -- 7
            {name = "crankshaft_lv1", amount = 1},          -- 8
            {name = "scrap", amount = 1},                                    -- 9
        },
        output = {
            item = "engine_lv1",
            amount = 1,
        }
    },
    -- 普通的引擎
    {
        input = {
            {name = "scrap", amount = 5},                                    -- 1
            {name = "valve_lv2", amount = 4}, -- 2
            {name = "spark_lv2", amount = 4},                                    -- 3
            {name = "engine_block_lv2", amount = 1},  -- 4
            {name = "piston_lv2", amount = 4},                                    -- 5
            {name = "carburetor_lv2", amount = 1},  -- 6
            {name = "scrap", amount = 8},                                    -- 7
            {name = "crankshaft_lv2", amount = 1},          -- 8
            {name = "advanced_metal", amount = 3},                                    -- 9
        },
        output = {
            item = "engine_lv2",
            amount = 1,
        }
    },
    -- 崭新的引擎
    {
        input = {
            {name = "metal_fragment", amount = 5},                                    -- 1
            {name = "valve_lv3", amount = 8}, -- 2
            {name = "spark_lv3", amount = 8},                                    -- 3
            {name = "engine_block_lv3", amount = 1},  -- 4
            {name = "piston_lv3", amount = 8},                                    -- 5
            {name = "carburetor_lv3", amount = 1},  -- 6
            {name = "metal_fragment", amount = 5},                                    -- 7
            {name = "crankshaft_lv3", amount = 1},          -- 8
            {name = "advanced_metal", amount = 8},                                    -- 9
        },
        output = {
            item = "engine_lv3",
            amount = 1,
        }
    },
    -- 轮子
    {
        input = {
            nil,                                    -- 1
            {name = "rubber", amount = 1}, -- 2
            nil,                                    -- 3
            {name = "rubber", amount = 1},  -- 4
            {name = "metal_fragment", amount = 3},                                    -- 5
            {name = "rubber", amount = 1},  -- 6
            nil,                                    -- 7
            {name = "rubber", amount = 1},          -- 8
            nil,                                    -- 9
        },
        output = {
            item = "wheel",
            amount = 1,
        }
    },
    -- 房车车体
    {
        input = {
            {name = "wood", amount = 2},                                    -- 1
            {name = "wood", amount = 2}, -- 2
            {name = "wood", amount = 2},                                    -- 3
            {name = "wood", amount = 1},  -- 4
            {name = "metal_fragment", amount = 3},                                    -- 5
            {name = "wood", amount = 1},  -- 6
            {name = "advanced_metal", amount = 1},                                    -- 7
            {name = "advanced_metal", amount = 1},          -- 8
            {name = "metal_fragment", amount = 5},                                    -- 9
        },
        output = {
            item = "caravan_chassis",
            amount = 1,
        }
    },
}