return {
  -- SynthWave '84 Theme
  {
    "LunarVim/synthwave84.nvim",
    name = "synthwave84",
    lazy = false,
    priority = 1000,
    config = function()
      require("synthwave84").setup({
        glow = {
          error_msg = true,
          type2 = true,
          func = true,
          keyword = true,
        }
      })
    end,
  },

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
    end,
  },
}