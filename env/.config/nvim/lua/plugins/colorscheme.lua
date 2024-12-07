return {

    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme("tokyonight-night")
            -- vim.cmd.hi("Comment gui=none")
        end,
    },

    -- Highlight todo, notes, etc in comments
    {
        "folke/todo-comments.nvim",
        event = "VimEnter",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = { signs = false },
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            vim.cmd.colorscheme("rose-pine")
        end,
    },
}
