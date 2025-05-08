require("nvchad.configs.lspconfig").defaults()
local base = require("nvchad.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")

local setup_arg = {
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {
        maxTsServerMemory = 4096
    }
}

lspconfig.ts_ls.setup(setup_arg)
lspconfig.html.setup(setup_arg)
lspconfig.cssls.setup(setup_arg)
lspconfig.prismals.setup(setup_arg)
lspconfig.jsonls.setup {
    settings = {
        json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
        },
    },
}
