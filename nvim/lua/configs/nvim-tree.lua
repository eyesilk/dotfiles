return function()
    local config = require "nvchad.configs.nvimtree"
    config.git = { ignore = false }
    config.on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        local function opts(desc)
            return {
                desc = "nvim-tree: " .. desc,
                buffer = bufnr,
                noremap = true,
                silent = true,
                nowait = true,
            }
        end

        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set({ 'n', 'x', 'o' }, 'f', '<Plug>(leap-forward)', opts("Leap forward"))
        vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap-backward)', opts("Leap backward"))
        vim.keymap.set("n", "<leader>s", api.node.run.system, opts("Run System"))
        vim.keymap.set("n", "<leader>f", api.live_filter.start, opts("Live Filter: Start"))
        vim.keymap.set('n', "<leader>o", function()
            api.node.open.edit()
            api.tree.close()
        end, opts("Open file and close file tree"))
    end
    return config
end
