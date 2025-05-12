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
  callback = function(args)
    local win = vim.api.nvim_get_current_win()
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].filetype ~= "NvimTree" then
      vim.wo[win].relativenumber = false
    end
  end,
})

-- Включаем относительную нумерацию при выходе из Insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function(args)
    local win = vim.api.nvim_get_current_win()
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].filetype ~= "NvimTree" then
      vim.wo[win].relativenumber = true
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
