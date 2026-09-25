-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Auto-open Trouble's diagnostics list whenever diagnostics show up in the
-- current buffer, without stealing focus from what you're editing
vim.api.nvim_create_autocmd("DiagnosticChanged", {
  group = vim.api.nvim_create_augroup("trouble_auto_open", { clear = true }),
  callback = function(args)
    if #vim.diagnostic.get(args.buf) > 0 then
      require("trouble").open({ mode = "diagnostics", filter = { buf = args.buf }, focus = false })
    end
  end,
})
