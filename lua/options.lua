require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

vim.wo.relativenumber = true

vim.opt.viewoptions = "folds,cursor,curdir"
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
  pattern = { "*" },
  desc = "Save view (folds), when closing file",
  callback = function()
    if vim.bo.buftype == "" then
      pcall(vim.cmd, "mkview")
    end
  end,
})
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "*" },
  desc = "Load view (folds), when opening file",
  callback = function()
    if vim.bo.buftype == "" then
      pcall(vim.cmd, "silent! loadview")
    end
  end,
})
