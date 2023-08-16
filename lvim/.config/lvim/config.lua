-- TODO: Refactoring and clean up
--
-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
-- Custom keybinds
lvim.leader                            = ","  --- Switch leader key from <space> to <,>
lvim.builtin.treesitter.rainbow.enable = true --- enable rainbow parentheses
lvim.builtin.which_key.mappings["t"]   = {    --- trouble
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}
lvim.builtin.which_key.mappings["z"]   = { --- zen mode
  name = "Zen Mode",
  { "<cmd>ZenMode<cr>", "zenmode" }
}
lvim.builtin.which_key.mappings["n"]   = { --- notes (zettelkasten)
  name = "Notes (Zettelkasten)",
  n = { "<cmd>ZkNew { title = vim.fn.input('Title: ') }<cr>", "new note" },
  i = { "<cmd>ZkIndex<cr>", "index notes" },
}
lvim.builtin.which_key.mappings.s["n"] = {
  "<cmd>ZkNotes<cr>", "search notes"
}
lvim.builtin.which_key.mappings["m"]   = { --- markdown preview
  name = "Markdown",
  p = { "<cmd>MarkdownPreview<cr>", "preview markdown" },
  t = { "<cmd>MarkdownToggle<cr>", "toggle markdown preview" },
  s = { "<cmd>MarkdownStop<cr>", "stop markdown preview" }
}
lvim.builtin.which_key.mappings["Q"] = {
  "<cmd>qa<cr>", "close all"
}

-- Plugins
lvim.plugins                           = {
  { --- HTML autotags
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  { --- Rainbow parentheses
    "mrjones2014/nvim-ts-rainbow",
  },
  { --- Trouble
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  { --- Highlight todos
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "folke/zen-mode.nvim", --- Zen mode
    opts = {
    }
  },
  {
    "folke/twilight.nvim", --- Twilight
    opts = {
    }
  },
  {
    "mickael-menu/zk-nvim",
    config = function()
      require("zk").setup({
        picker = "telescope",
      })
    end
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
}
