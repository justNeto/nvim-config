return {
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {
            jump = {
                autojump = true,
            },
            modes = {
                char = {
                    jump_labels = true,
                    multi_line = false,
                },
                search = {
                    enabled = true
                },
                remote_op = {
                    restore = true,
                    motion = true,
                },
            }
        },
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        },
    }
}
