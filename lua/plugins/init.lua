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
        "css-lsp",
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
      "nvim-neotest/neotest-jest",
    },
    opts = {
      adapters = {
        ["neotest-jest"] = {},
      },
    },
  },

  -- Yazi: terminal file manager integration (open yazi in a floating window)
  -- Requires yazi installed on the system (already installed via Chocolatey)
  {
    "mikavilpas/yazi.nvim",
    event = "LazyFile",
    keys = {
      { "<leader>-", "<cmd>Yazi<cr>", desc = "Open Yazi file manager" },
      { "<leader>cw", "<cmd>Yazi cwd<cr>", desc = "Open Yazi in cwd" },
    },
    opts = {
      open_for_directories = false,
    },
  },

  -- Yanky: improved yank/paste ring (cycle through yank history with [y / ]y)
  {
    "gbprod/yanky.nvim",
    event = "LazyFile",
    opts = {},
    keys = {
      { "<leader>p", function() require("telescope").extensions.yank_history.yank_history() end, desc = "Open Yank History" },
      { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after cursor" },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before cursor" },
      { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after selection" },
      { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before selection" },
      { "[y", "<Plug>(YankyCycleForward)", desc = "Cycle forward through yank history" },
      { "]y", "<Plug>(YankyCycleBackward)", desc = "Cycle backward through yank history" },
    },
  },
}
