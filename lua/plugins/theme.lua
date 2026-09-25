return {
  -- Set LazyVim to use TokyoNight
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },

  -- Make Neovim transparent (so WezTerm's Mica shows through)
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function()
      require("transparent").setup({
        -- Groups to make transparent
        extra_groups = {
          "NormalFloat", 
          "NvimTreeNormal",
          "NeoTreeNormal",
          "NeoTreeNormalNC",
          "TelescopeNormal",
          "TelescopeBorder",
          "TelescopePromptBorder",
          "WhichKeyFloat",
          "FloatBorder",
          "LazyNormal",
          "MasonNormal",
        },
        -- Exclude groups that should keep their background
        exclude_groups = {
          "CursorLine",
          "NeoTreeCursorLine",
        },
      })
      
      -- Enable it by default
      vim.cmd("TransparentEnable")

      -- Give floating window borders (Lazy, Mason, LSP hover, etc.) a
      -- visible accent color instead of the default gray that blends in
      local function set_float_border()
        vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#7aa2f7", bg = "NONE" })
      end
      set_float_border()
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = set_float_border,
      })
    end,
  },
}