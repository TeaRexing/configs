-- TODO: Refactoring and clean up
--
-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
--
-- Custom keybinds
lvim.leader                            = "," --- Switch leader key from <space> to <,>
lvim.keys.normal_mode["<A-h>"]         = ":bprevious<cr>"
lvim.keys.normal_mode["<A-l>"]         = ":bnext<cr>"
-- Custom Settings
lvim.builtin.treesitter.rainbow.enable = true --- enable rainbow parentheses
vim.opt.colorcolumn                    = "80"
-- Autocommands
lvim.autocommands                      = {
  {
    "BufEnter",
    {
      pattern = { "*.md", "*.tex" },
      command = "set colorcolumn=60 | set wrap",
    }
  },
}
-- Whichkey keybinds
lvim.builtin.which_key.mappings["t"]   = { --- trouble
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}
lvim.builtin.which_key.mappings["z"]   = { --- zen mode + twilight
  name = "Zen Mode + Twilight",
  m = { "<cmd>ZenMode<cr>", "toggle zenmode" },
  t = { "<cmd>Twilight<cr>", "toggle twilight" }
}
-- lvim.builtin.which_key.mappings["n"]   = { --- notes (zettelkasten)
--   name = "Notes (Zettelkasten)",
--   n = { "<cmd>ZkNew { title = vim.fn.input('Title: ') }<cr>", "new note" },
--   u = { "<cmd>ZkNew {title = vim.fn.input('Title: '), dir = 'private'}<cr>", "new unshared note" },
--   i = { "<cmd>ZkIndex<cr>", "index notes" },
--   s = { "<cmd>ZkNotes<cr>", "search notes" },
--   t = { "<cmd>ZkTags<cr>", "search tags" },
--   b = { "<cmd>ZkBacklinks<cr>", "show backlinks" },
--   l = { "<cmd>ZkLinks<cr>", "show links" },
--   c = { "<cmd>'<,'>ZkNewFromTitleSelection<cr>", "create new note from visual selection" },
--   o = { "<cmd>lua vim.lsp.buf.definition()<cr>", "open link under caret" },
--   p = { "<cmd>lua vim.lsp.buf.hover()<cr>", "preview note under caret" }
-- }
-- lvim.builtin.which_key.mappings.s["n"] = {
--   "<cmd>ZkNotes<cr>", "search notes"
-- }
lvim.builtin.which_key.mappings["m"]   = { --- markdown preview
  name = "Markdown",
  p = { "<cmd>MarkdownPreview<cr>", "preview markdown" },
  t = { "<cmd>MarkdownPreviewToggle<cr>", "toggle markdown preview" },
  s = { "<cmd>MarkdownPreviewStop<cr>", "stop markdown preview" }
}
lvim.builtin.which_key.mappings["Q"]   = {
  "<cmd>qa<cr>", "close all"
}
lvim.builtin.which_key.mappings["C"]   = {
  name = "Codeium",
  t = { "<cmd>lua require('codeium').toggle()<cr>", "toggle codeium" },
  e = { "<cmd>lua require('codeium').enable()<cr>", "enable codeium" },
  d = { "<cmd>lua require('codeium').disable()<cr>", "disable codeium" }
}

-- Plugins
lvim.plugins                           = {
  {
    "windwp/nvim-ts-autotag", --- HTML autotags
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "folke/trouble.nvim", --- Trouble
    cmd = "TroubleToggle",
  },
  {
    "folke/todo-comments.nvim", --- Highlight todos
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "folke/zen-mode.nvim", --- Zen mode
    opts = {
      window = {
        width = 0.75,
      }
    }
  },
  {
    "folke/twilight.nvim", --- Twilight
    opts = {
    }
  },
  --{
  --  "mickael-menu/zk-nvim", --- Zettelkasten
  --  config = function()
  --    require("zk").setup({
  --      picker = "telescope",
  --    })
  --  end
  --},
  {
    "iamcco/markdown-preview.nvim", --- Markdown Preview
    build = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
        RGB = true,        -- #RGB hex codes
        RRGGBB = true,     -- #RRGGBB hex codes
        RRGGBBAA = true,   -- #RRGGBBAA hex codes
        rgb_fn = true,     -- CSS rgb() and rgba() functions
        hsl_fn = true,     -- CSS hsl() and hsla() functions
        css = true,        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,     -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  --  { TODO
  --    "litoj/colorizer.nvim", --- Colorizer
  --    require 'colorizer'.setup()
  --  },
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
    config = function()
      vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
      vim.keymap.set('i', '<c-k>', function() return vim.fn['codeium#CycleCompletions'](1) end,
        { expr = true, silent = true })
      vim.keymap.set('i', '<c-j>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
        { expr = true, silent = true })
      vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear'](-1) end, { expr = true, silent = true })
    end
  }
}
