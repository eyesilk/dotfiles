return {
    ["javascript,typescript"] = function()
        local cmd = "node " .. vim.fn.expand("%") .. ";exit"
        vim.keymap.set('n', '<leader>xi', function()
            vim.cmd('w')
            require("nvchad.term").new { pos = "float", id = "floatTerm", cmd = cmd }
        end, { buffer = true, desc = "Execute current file in full screen terminal" })
        vim.keymap.set('n', '<leader>xv', function()
            vim.cmd('w')
            require("nvchad.term").new { pos = "vsp", id = "vtoggleTerm", cmd = cmd }
        end, { buffer = true, desc = "Execute current file in vertical terminal" })
        vim.keymap.set('n', '<leader>xh', function()
            vim.cmd('w')
            require("nvchad.term").new { pos = "sp", id = "htoggleTerm", cmd = cmd }
        end, { buffer = true, desc = "Execute current file in horizontal terminal" })
    end,
}