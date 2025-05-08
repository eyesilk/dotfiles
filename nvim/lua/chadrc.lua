-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

vim.opt.number = true
vim.opt.relativenumber = true

M.nvdash = { load_on_startup = true,

header = {
    "███████╗██╗   ██╗███████╗███████╗██╗██╗     ██╗  ██╗",     
    "██╔════╝╚██╗ ██╔╝██╔════╝██╔════╝██║██║     ██║ ██╔╝",    
    "█████╗   ╚████╔╝ █████╗  ███████╗██║██║     █████╔╝ ",    
    "██╔══╝    ╚██╔╝  ██╔══╝  ╚════██║██║██║     ██╔═██╗ ",    
    "███████╗   ██║   ███████╗███████║██║███████╗██║  ██╗",    
    "╚══════╝   ╚═╝   ╚══════╝╚══════╝╚═╝╚══════╝╚═╝  ╚═╝", 
    "                                                    ",
    "                Powered By  eovim                 ",
    "                                                    ",
  },
}

M.term = {
    float = {
        relative = "editor",
        row = 0,
        col = 0,
        width = vim.o.columns,
        height = vim.o.lines,
    },
    sizes = {
        vsp = 0.5
    }
}

-- Отключаем относительную нумерацию при входе в Insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype ~= "NvimTree" then
      vim.opt.relativenumber = false
    end
  end,
})

-- Включаем относительную нумерацию при выходе из Insert mode
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "*",
  callback = function()
    if vim.fn.mode() == "n" and vim.bo.filetype ~= "NvimTree" then
      vim.opt.relativenumber = true
    end
  end,
})

M.base46 = {
	theme = "doomchad",

    hl_override = {
        Comment = { italic = true },
        LineNr = { fg = "#777777" },
        CursorLineNr = { fg = "#ffffff" },
    },
}

return M
