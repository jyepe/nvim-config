return {
  -- Mason: ensure additional tools are installed
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Lua/Shell
        "stylua",
        "shellcheck",
        "shfmt",
        -- HTML/CSS LSPs (not covered by extras)
        "html-lsp",
        "cssls",
        -- JS/TS formatting daemon (extras configure it, but ensure it's installed)
        "prettierd",
      },
    },
  },

  -- Format-on-save: add CSS/HTML/SCSS formatters
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        css = { "prettierd" },
        html = { "prettierd" },
        scss = { "prettierd" },
      },
    },
  },

  -- Treesitter: add parsers not covered by extras
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "html",
        "css",
      },
    },
  },

  -- Neotest: add JavaScript/TypeScript test adapter (jest)
  -- Requires jest to be installed at the project level (in node_modules)
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "thenbe/neotest-jest",
    },
    opts = {
      adapters = {
        ["neotest-jest"] = {},
      },
    },
  },
}
