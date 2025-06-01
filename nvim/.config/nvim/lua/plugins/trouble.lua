return {
    {
        "folke/trouble.nvim",
        config = function()
            local trbl = require("trouble").setup({})

            -- vim.keymap.set("n", "<leader>tt", function()
            --     trbl.toggle()
            -- end)

            vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
            --
            -- vim.keymap.set("n", "[t", function()
            --     require("trouble").next({skip_groups = true, jump = true});
            -- end)
            --
            -- vim.keymap.set("n", "]t", function()
            --     require("trouble").previous({skip_groups = true, jump = true});
            -- end)

        end
    },
}
