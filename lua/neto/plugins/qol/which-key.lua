return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            preset = "modern",
            delay = "1000"
        },
        plugins = {
            marks = false,
            registers = false,
            spelling = {
                enabled = true,
                suggestions = 10,
            },
            presets = {
                operators = true,
                motions = true,
                text_objects = true,
                windows = true,
                nav = true,
                z = true,
                g = true,
            }
        }
    },
}
