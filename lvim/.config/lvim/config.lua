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
  t = { "<cmd>Trouble diagnostics toggle<cr>", "Diagnostics" },
  b = { "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Buffer" },
  s = { "<cmd>Trouble symbols toggle focus=false<cr>", "Symbols" },
  r = { "<cmd>Trouble lsp toggle focus=false<cr>", "LSP Def/Ref" },
  l = { "<cmd>Trouble loclist toggle<cr>", "Location List" },
  q = { "<cmd>Trouble qflist toggle<cr>", "Quickfix" },
}
lvim.builtin.which_key.mappings["z"]   = { --- zen mode + twilight
  name = "Zen Mode + Twilight",
  m = { "<cmd>ZenMode<cr>", "toggle zenmode" },
  t = { "<cmd>Twilight<cr>", "toggle twilight" }
}
lvim.builtin.nvimtree.setup.diagnostics = { --- disable nvimtree diagnostics
  enable = false,
}
lvim.builtin.which_key.mappings["Q"]   = {
  "<cmd>qa<cr>", "close all"
}
lvim.builtin.which_key.mappings["a"]   = {
  name = "Arduino",
  v = { "<cmd>ArduinoVerify<CR>", "Verify / Compile" },
  u = { "<cmd>ArduinoUpload<CR>", "Upload Firmware" },
  s = { "<cmd>ArduinoSerial<CR>", "Serial Monitor" },

  b = { "<cmd>ArduinoChooseBoard<CR>", "Choose Board" },
  p = { "<cmd>ArduinoChoosePort<CR>", "Choose Port" },

  c = {
    "<cmd>!arduino-cli compile --fqbn arduino:avr:nano:cpu=atmega328old %:h<CR>",
    "Compile (CLI)"
  },

  f = {
    "<cmd>!arduino-cli upload -p /dev/ttyUSB0 --fqbn arduino:avr:nano:cpu=atmega328old %:h<CR>",
    "Upload (CLI)"
  }
}
lvim.builtin.which_key.mappings["x"]   = {
  name = 'LaTeX',
  c = { ":!latexmk -pdf -lualatex %<CR>", "Compile" },
  m = { ":!latexmk -pdf -lualatex main.tex>", "Compile" },
  o = { ":!zathura %<.pdf<CR>", "Open PDF" }
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
    "nvim-treesitter/nvim-treesitter", --- TreeSitter
    branch = "main",
    build = ":TSUpdate",
  },
  {
    "folke/trouble.nvim", --- Trouble
    opts = {},
    cmd = "Trouble",
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
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
        RGB = true,      -- #RGB hex codes
        RRGGBB = true,   -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true,   -- CSS rgb() and rgba() functions
        hsl_fn = true,   -- CSS hsl() and hsla() functions
        css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  {
    "stevearc/vim-arduino",
    ft = { "arduino" }
  }
}

-- Arduino LSP
local lspconfig = require("lspconfig")

lspconfig.arduino_language_server.setup {
  cmd = {
    "arduino-language-server",
    "-cli", "arduino-cli",
    "-cli-config", "/home/patrick/.arduino15/arduino-cli.yaml",
    "-fqbn", "arduino:avr:nano:cpu=atmega328old"
  },
  filetypes = { "arduino" }
}
vim.filetype.add({
  extension = {
    ino = "arduino"
  }
})

lvim.builtin.nvimtree.setup.diagnostics = { --- disable nvimtree diagnostics
  enable = false,
}
lvim.builtin.indentlines.active = false
