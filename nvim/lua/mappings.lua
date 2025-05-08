require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- сохранение + форматтинг на ctrl s
map({ 'i', 'v', 'n' }, "<C-s>", "<Esc><cmd>lua vim.lsp.buf.format()<CR><cmd>w<CR>",
    { noremap = true, silent = true, desc = "Format then save the file then <Esc>" })

-- отключение стрелок
map({ "n", "i", "v" }, "<Up>", "<Nop>", opts)
map({ "n", "i", "v" }, "<Down>", "<Nop>", opts)
map({ "n", "i", "v" }, "<Left>", "<Nop>", opts)
map({ "n", "i", "v" }, "<Right>", "<Nop>", opts)

-- удаление строки без копирования 
map("n", "<leader>d", '"_dd', { desc = "Delete line without copying" })
map("v", "<leader>d", '"_d', { desc = "Delete selection without copying" })

-- сохранить все файлы и закрыть все буферы
map("n", "<leader>bd", function()
    vim.cmd("wa")
  
    local bufs = vim.fn.getbufinfo({ buflisted = 1 })
    for _, buf in ipairs(bufs) do
      local name = buf.name
      if not name:match("NvimTree_") then
        vim.cmd("bdelete " .. buf.bufnr)
      end
    end
  end, { desc = "Save all & close all buffers (except nvim-tree)" })